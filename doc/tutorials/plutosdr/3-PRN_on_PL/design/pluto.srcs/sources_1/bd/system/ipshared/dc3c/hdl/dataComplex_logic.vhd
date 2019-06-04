---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.all;

entity dataComplex_to_ram_subtop is
	generic (
		USE_EOF     : boolean := true;
		DATA_FORMAT : string := "signed";
		NB_SAMPLE   : natural := 1024;
		INPUT_SIZE  : natural := 32;
		DATA_SIZE   : natural := 16;
		AXI_SIZE    : natural := 32;
		SELECT_SZ   : natural := 1;
		ADDR_SIZE   : natural := 12
	);
	port (
		cpu_clk_i     : in std_logic;
		cpu_rst_i     : in std_logic;
		-- Syscon signals
		data_clk_i    : in std_logic ;
		data_rst_i    : in std_logic ;
		--communication signals
		--config
		start_acq_i   : std_logic;
		busy_o        : out std_logic;
		-- results
		data_o        : out std_logic_vector((AXI_SIZE)-1 downto 0);
		result_addr_i : in std_logic_vector(ADDR_SIZE-1 downto 0);
		select_word_i : in std_logic_vector(SELECT_SZ-1 downto 0);
		-- in
		data_i_i      : in std_logic_vector(INPUT_SIZE-1 downto 0);
		data_q_i      : in std_logic_vector(INPUT_SIZE-1 downto 0);
		data_en_i     : in std_logic;
		data_eof_i    : in std_logic
	);
end dataComplex_to_ram_subtop;

architecture Behavioral of dataComplex_to_ram_subtop is
	constant RAM_SIZE                : natural := 2*DATA_SIZE;
	signal start_acq2_s              : std_logic;
	signal start_acq4_s, start_acq_s : std_logic;
	signal busy_s, busy_sync_s       : std_logic;
	-- ram write
	-- data resized and merged
	signal data_s                    : std_logic_vector(RAM_SIZE-1 downto 0);

	signal data_en_s, must_stop_s    : std_logic;
	signal sample_cpt_s              : std_logic_vector(ADDR_SIZE-1 downto 0);

	-- ram read
	signal ram_data_s                : std_logic_vector(RAM_SIZE-1 downto 0);
	constant NB_PKT                  : natural := 2**SELECT_SZ;
	type mux_array is array (natural range 0 to NB_PKT-1) of
                std_logic_vector(AXI_SIZE-1 downto 0);
    signal array_val: mux_array;

begin
	busy_o <= busy_sync_s;

	data_resizer : entity work.dataComplex_resizer
		generic map (IN_SZ => INPUT_SIZE,
			OUT_SZ => DATA_SIZE, DATA_FORMAT => DATA_FORMAT)
		port map (data_i_i => data_i_i, data_q_i => data_q_i,
			data_o => data_s);
	
	busy_sync: entity work.dataComplex_sync
	port map (ref_clk_i => data_clk_i, clk_i => cpu_clk_i,
		bit_i => busy_s, bit_o => busy_sync_s
	);

	process(cpu_clk_i)
	begin
		if rising_edge(cpu_clk_i) then
			if (busy_sync_s or cpu_rst_i) = '1' then
				start_acq2_s <= '0';
			elsif start_acq_i = '1' then
				start_acq2_s <= '1';
			else
				start_acq2_s <= start_acq2_s;
			end if;
		end if;
	end process;

	sync_start: entity work.dataComplex_sync
	port map (ref_clk_i => cpu_clk_i, clk_i => data_clk_i,
		bit_i => start_acq2_s, bit_o => start_acq4_s
	);
	with_eof: if USE_EOF = true generate
		start_acq_s <= '1' when (start_acq4_s and data_eof_i) = '1' else '0';
	end generate with_eof;
	without_eof: if USE_EOF /= true generate
		start_acq_s <= start_acq4_s;
	end generate without_eof;

	process(data_clk_i) begin
		if rising_edge(data_clk_i) then
			if (data_rst_i = '1') or ((data_en_s and must_stop_s) = '1') then
				busy_s <= '0';
			elsif start_acq_s = '1' then
				busy_s <= '1';
			else
				busy_s <= busy_s;
			end if;
		end if;
	end process;

	data_en_s <= '1' when (data_en_i and busy_s) = '1' else '0';
	must_stop_s <= '1' when unsigned(sample_cpt_s) = (NB_SAMPLE)-1 else '0';

	process(data_clk_i) begin
		if rising_edge(data_clk_i) then
			if busy_s = '0' or data_rst_i = '1' then
				sample_cpt_s <= (others => '0');
			elsif data_en_s = '1' then
				sample_cpt_s <= std_logic_vector(unsigned(sample_cpt_s) + 1);
			else
				sample_cpt_s <= sample_cpt_s;
			end if;
		end if;
	end process;

	-------------------------
	-- RAM access for READ --
	-------------------------
	direct_addr: if NB_PKT = 1 generate
		data_o <= ram_data_s;
	end generate direct_addr;
	shift_addr: if NB_PKT /= 1 generate
	    mux_loop : for i in 0 to NB_PKT-1 generate
        	array_val(i) <= ram_data_s(((i + 1) * AXI_SIZE) - 1 downto AXI_SIZE * i);
    	end generate mux_loop;
    	data_o <= array_val(to_integer(unsigned(select_word_i)));
	end generate shift_addr;

	---------
	-- RAM --
	---------
	ram_msb: entity work.dataComplex_to_ram_storage
	generic map (DATA => RAM_SIZE, ADDR => ADDR_SIZE)
	port map (clk_a => data_clk_i, clk_b => cpu_clk_i,
		rst_b => cpu_rst_i,
		-- state machine interface
		we_a   => data_en_s, addr_a => sample_cpt_s, din_a => data_s,
		addr_b => result_addr_i, dout_b => ram_data_s);

end Behavioral;

