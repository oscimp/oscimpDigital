---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity dataComplex_to_ram_top is
	generic (
		DATA_FORMAT : string := "signed";
		USE_EOF : boolean := true;
		NB_WAY : natural := 4;
		NB_SAMPLE : natural := 1024;
		INPUT_SIZE : natural := 32;
		DATA_SIZE : natural := 32;
		AXI_SIZE : natural := 32;
		ADDR_SIZE : natural := 12;
		RD_ADDR_SIZE : natural := 12;
		CHAN_MUX_SZ  : natural := 12;
		PKT_MUX_SZ   : natural := 12
	);
	port (
		cpu_clk_i : in std_logic;
		rst_i : in std_logic;
		-- Syscon signals
		data_clk_i			: in std_logic_vector(NB_WAY-1 downto 0);
		data_rst_i			: in std_logic_vector(NB_WAY-1 downto 0);
		--communication signals
		--config
		start_acquisition_i : std_logic;
		busy_o 				: out std_logic;
		-- results
		res_o 			    : out std_logic_vector(AXI_SIZE-1 downto 0);
		--result_addr_i 	   : in std_logic_vector(RD_ADDR_SIZE-1 downto 0);
		ram_incr_i           : in std_logic;
		ram_reinit_i        : in std_logic;
		-- input
		data_i_i			: in std_logic_vector((NB_WAY*INPUT_SIZE)-1 downto 0);
		data_q_i			: in std_logic_vector((NB_WAY*INPUT_SIZE)-1 downto 0);
		data_en_i			: in std_logic_vector(NB_WAY-1 downto 0);
		data_eof_i			: in std_logic_vector(NB_WAY-1 downto 0)
	);
end dataComplex_to_ram_top;

architecture Behavioral of dataComplex_to_ram_top is
	signal busy_s            : std_logic_vector(NB_WAY-1 downto 0);
	signal busy_out_s        : std_logic;
	signal start_s           : std_logic;
	type res_tab is array (natural range <>) of std_logic_vector(AXI_SIZE-1 downto 0);
	signal res_s             : res_tab(NB_WAY-1 downto 0);

	-- address manipulation
	constant NB_PKT_PER_SAMP : natural := 2**PKT_MUX_SZ;

	-- ram_addr + way select + word select
	--constant RAM_H         : natural := RD_ADDR_SIZE;
	--constant RAM_L         : natural := RD_ADDR_SIZE - ADDR_SIZE;
	--constant MUX_CHAN_H    : natural := RAM_L;
	--constant MUX_CHAN_L    : natural := MUX_CHAN_H - CHAN_MUX_SZ;
	--constant MUX_PKT_H     : natural := PKT_MUX_SZ;
	--constant MUX_PKT_L     : natural := 0;

	signal incr_chan_s     : std_logic;
	signal incr_addr_s     : std_logic;
	signal ram_addr_s      : std_logic_vector(ADDR_SIZE-1 downto 0);
	signal ram_addr_next_s : std_logic_vector(ADDR_SIZE-1 downto 0);
	signal select_chan_s   : std_logic_vector(CHAN_MUX_SZ-1 downto 0);
	signal select_chan_next_s   : std_logic_vector(CHAN_MUX_SZ-1 downto 0);
	signal select_s        : std_logic_vector(PKT_MUX_SZ-1 downto 0);
	signal select_next_s   : std_logic_vector(PKT_MUX_SZ-1 downto 0);
begin


	-- select channel addr part
	mux_1chan: if NB_WAY = 1 generate
		select_chan_next_s <= "0";
		incr_addr_s <= incr_chan_s;
	end generate mux_1chan;

	mux_chan: if NB_WAY /= 1 generate
 		incr_addr_s <= '1' when incr_chan_s = '1' and unsigned(select_chan_s) >= NB_WAY-1 else '0';
		process(incr_chan_s, select_chan_s) begin
			select_chan_next_s <= select_chan_s;
			if incr_chan_s = '1' then
				if unsigned(select_chan_s) >= NB_WAY-1 then
					select_chan_next_s <= (others => '0');
				else
					select_chan_next_s <=
						std_logic_vector(unsigned(select_chan_s) + 1);
				end if;
			end if;
		end process;
	end generate mux_chan;

	-- select ram addr part
	--ram_addr_s <= result_addr_i(RAM_H-1 downto RAM_L);
	process(ram_addr_s, incr_addr_s) begin
		if incr_addr_s = '1' then
			ram_addr_next_s <= std_logic_vector(unsigned(ram_addr_s) + 1);
		else
			ram_addr_next_s <= ram_addr_s;
		end if;
	end process;

	-- select sub slv part
	mux_1word: if NB_PKT_PER_SAMP = 1 generate
		select_next_s <= "0";
		incr_chan_s <= '1';
	end generate mux_1word;
	mux_manyWord: if NB_PKT_PER_SAMP /= 1 generate
		select_next_s <= std_logic_vector(unsigned(select_s) + 1);
		incr_chan_s <= '1' when unsigned(select_s) >= NB_PKT_PER_SAMP - 1 else '0';
	end generate mux_manyWord;

	process(cpu_clk_i) begin
        if rising_edge(cpu_clk_i) then
            if rst_i = '1' then
                ram_addr_s <= (others => '0');
                select_chan_s <= (others => '0');
                select_s <= (others => '0');
			else
                ram_addr_s <= ram_addr_s;
                select_chan_s <= select_chan_s;
                select_s <= select_s;
            	if ram_reinit_i = '1' then
                	ram_addr_s <= (others => '0');
                	select_chan_s <= (others => '0');
                	select_s <= (others => '0');
            	elsif (ram_incr_i = '1') then
            	    ram_addr_s <= ram_addr_next_s;
            	    select_chan_s <= select_chan_next_s;
            	    select_s <= select_next_s;
            	end if;
            end if;
        end if;
    end process;

	busy_o <= busy_out_s or start_s;
	busy_out_s <= '0' when busy_s = (NB_WAY-1 downto 0 => '0') else '1';

	process(cpu_clk_i) begin
		if rising_edge(cpu_clk_i) then
			if (busy_out_s or rst_i) = '1' then
				start_s <= '0';
			elsif start_acquisition_i = '1' then
				start_s <= '1';
			else
				start_s <= start_s;
			end if;
		end if;
	end process;
	
	subtop_loop : for i in 0 to NB_WAY-1 generate
		data_subtop_inst : entity work.dataComplex_to_ram_subtop
		generic map(USE_EOF => USE_EOF, DATA_FORMAT => DATA_FORMAT,
			DATA_SIZE => DATA_SIZE, INPUT_SIZE => INPUT_SIZE,
			AXI_SIZE => AXI_SIZE, NB_SAMPLE => NB_SAMPLE,
			SELECT_SZ => PKT_MUX_SZ, ADDR_SIZE => ADDR_SIZE)
		port map (data_clk_i => data_clk_i(i), cpu_clk_i => cpu_clk_i,
			cpu_rst_i => rst_i, data_rst_i => data_rst_i(i),
			start_acq_i => start_acquisition_i, busy_o => busy_s(i),
			-- output
			result_addr_i => ram_addr_s, select_word_i => select_s,
			data_o => res_s(i),
			-- results
			data_i_i => data_i_i(((i+1)*INPUT_SIZE)-1 downto i*INPUT_SIZE),
			data_q_i => data_q_i(((i+1)*INPUT_SIZE)-1 downto i*INPUT_SIZE),
			data_en_i => data_en_i(i), data_eof_i => data_eof_i(i));
	end generate subtop_loop;

	res_o <= res_s(to_integer(unsigned(select_chan_s)));

end Behavioral;

