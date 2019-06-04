library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity xcorr_prn_slow_complex_mux is
	generic (
		NB_BLK : natural := 8;
		IN_SIZE : natural := 16;
		OUT_SIZE : natural := 32
	);
    port (
        clk : in std_logic;
        reset : in std_logic;
        clear_accum_i: in std_logic;
        -- input
        data_en_i : in std_logic;
        data_ready_i : in std_logic_vector(NB_BLK-1 downto 0);
		end_cross_i : in std_logic_vector(NB_BLK-1 downto 0);
		data_i_i : in std_logic_vector(IN_SIZE-1 downto 0);
		data_q_i : in std_logic_vector(IN_SIZE-1 downto 0);
		prn_i : in std_logic_vector(NB_BLK-1 downto 0);
		-- output
		data_en_o : out std_logic;
		data_i_o : out std_logic_vector(OUT_SIZE-1 downto 0);
		data_q_o : out std_logic_vector(OUT_SIZE-1 downto 0)
    );
end entity;

architecture rtl of xcorr_prn_slow_complex_mux is
	constant ALL_ZERO : std_logic_vector := (NB_BLK -1 downto 0 => '0');
	constant CPT_SZ : natural := natural(ceil(log2(real(NB_BLK))));
	-- accum
	signal accum_next_i_s, accum_next_q_s : std_logic_vector(OUT_SIZE-1 downto 0);
	signal accum_i_s, accum_q_s : std_logic_vector(OUT_SIZE-1 downto 0);
	signal accum_mux_i_s, accum_mux_q_s : std_logic_vector(OUT_SIZE-1 downto 0);
	signal ext_rst_s, ext_rst_next_s : std_logic_vector(NB_BLK-1 downto 0);
	signal clear_accum_s : std_logic;
	-- end
	signal data_end_i_s, data_end_q_s : std_logic;

	signal prn_s : std_logic_vector(NB_BLK-1 downto 0);
	signal prn2_s, prn2_next_s : std_logic;

	-- new
	signal wr_addr_s, rd_addr_s: std_logic_vector(CPT_SZ-1 downto 0);
	signal prn_addr_s : std_logic_vector(CPT_SZ-1 downto 0);
	signal mux_prn_s : std_logic;
	signal mux_data_ready_s : std_logic;
	signal mux_end_cross_s: std_logic;
	signal data_i_s, data_q_s : std_logic_vector(OUT_SIZE-1 downto 0);
	signal wr_en_i_s, wr_en_q_s : std_logic;
	-- new new
	signal data_en_s : std_logic;
	signal compute_en_s : std_logic;
	signal global_end_s : std_logic;
	signal ram_wr_data_i_s, ram_wr_data_q_s : std_logic_vector(OUT_SIZE-1 downto 0);
	signal data_in_i_s, data_in_q_s : std_logic_vector(IN_SIZE-1 downto 0);
	signal data_in_i_pos_s, data_in_i_neg_s : std_logic_vector(IN_SIZE-1 downto 0);
	signal data_in_q_pos_s, data_in_q_neg_s : std_logic_vector(IN_SIZE-1 downto 0);
	signal delay_en_s : std_logic;
begin

	process(clk) begin
		if rising_edge(clk) then
			if (clear_accum_i or reset) = '1' then
				ext_rst_s <= (others => '1');
			elsif wr_en_i_s = '1' then
				ext_rst_s <= ext_rst_next_s;
			else
				ext_rst_s <= ext_rst_s;
			end if;
		end if;
	end process;
	process(ext_rst_s, wr_addr_s) begin
		ext_rst_next_s <= ext_rst_s;
		ext_rst_next_s(to_integer(unsigned(wr_addr_s))) <= '0';
	end process;


	process(clk) begin
		if rising_edge(clk) then
			if reset = '1' then
				compute_en_s <= '0';
			elsif global_end_s = '1' then
				compute_en_s <= '0';
			elsif data_en_i = '1' then
				compute_en_s <= '1';
			else
				compute_en_s <= compute_en_s;
			end if;
		end if;
	end process;

	process(clk) begin
		if rising_edge(clk) then
			if reset = '1' then
				prn_s <= (others => '0');
			elsif data_en_i = '1' then
				prn_s <= prn_i;
			else
				prn_s <= prn_s;
			end if;
		end if;
	end process;

	process(clk) begin
		if rising_edge(clk) then
			data_in_i_pos_s <= data_in_i_s;
			data_in_i_neg_s <= std_logic_vector(-signed(data_in_i_s));
			data_in_q_pos_s <= data_in_q_s;
			data_in_q_neg_s <= std_logic_vector(-signed(data_in_q_s));
			if reset = '1' then
				data_in_i_s <= (others => '0');
				data_in_q_s <= (others => '0');
			elsif data_en_i = '1' then
				data_in_i_s <= data_i_i;
				data_in_q_s <= data_q_i;
			else
				data_in_i_s <= data_in_i_s;
				data_in_q_s <= data_in_q_s;
			end if;
		end if;
	end process;

	accum_mux_i_s <= accum_i_s when clear_accum_s = '0'
		else (OUT_SIZE-1 downto 0 => '0');
	accum_mux_q_s <= accum_q_s when clear_accum_s = '0'
		else (OUT_SIZE-1 downto 0 => '0');

	correl_i_inst: entity work.xcorr_prn_slow_complex_correl
	generic map (IN_SIZE => IN_SIZE, OUT_SIZE => OUT_SIZE)
	port map (end_cross_i => mux_end_cross_s,
		data_en_i => data_en_s, accum_i => accum_mux_i_s,
		data_pos_i => data_in_i_pos_s, data_neg_i => data_in_i_neg_s,
		prn_i => prn2_s,
		data_end_o => data_end_i_s,
		data_en_o => wr_en_i_s, data_o => accum_next_i_s
	);
	correl_q_inst: entity work.xcorr_prn_slow_complex_correl
	generic map (IN_SIZE => IN_SIZE, OUT_SIZE => OUT_SIZE)
	port map (end_cross_i => mux_end_cross_s,
		data_en_i => data_en_s, accum_i => accum_mux_q_s,
		data_pos_i => data_in_q_pos_s, data_neg_i => data_in_q_neg_s,
		prn_i => prn2_s,
		data_end_o => data_end_q_s,
		data_en_o => wr_en_q_s, data_o => accum_next_q_s
	);

	mux_prn_s <= prn_s(to_integer(unsigned(prn_addr_s)));
	mux_end_cross_s <= end_cross_i(to_integer(unsigned(wr_addr_s)));
	mux_data_ready_s <= data_ready_i(to_integer(unsigned(wr_addr_s)));
	clear_accum_s <= ext_rst_s(to_integer(unsigned(wr_addr_s)));
	data_en_s <= mux_data_ready_s and delay_en_s;

	-------------------------------------------------------
	-- GGM : accum doit etre adapte pour etre la sortie de 
	-- la RAM
	-- un registre intermediaire pour la sortie
	-------------------------------------------------------
	data_i_o <= data_i_s;
	data_q_o <= data_q_s;

	ram_wr_data_i_s <= accum_next_i_s when data_end_i_s = '0' else (others => '0');
	ram_wr_data_q_s <= accum_next_q_s when data_end_q_s = '0' else (others => '0');

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				data_en_o <= '0';
				prn2_s <= '0';
			else
				data_en_o <= data_end_i_s;
				prn2_s <= mux_prn_s;
			end if;
			if reset = '1' then
				data_i_s <= (others => '0');
			elsif data_end_i_s = '1' then
				data_i_s <= accum_next_i_s;
			else
				data_i_s <= data_i_s;
			end if;
			if reset = '1' then
				data_q_s <= (others => '0');
			elsif data_end_q_s = '1' then
				data_q_s <= accum_next_q_s;
			else
				data_q_s <= data_q_s;
			end if;
		end if;
	end process;

	global_end_s <= '1' when unsigned(rd_addr_s) = NB_BLK-1 else '0';

	-- compteur d'adresse pour la RAM
	-- wr est en retard d'une valeur sur read pour precharger
	-- la sortie alors que le wr est en direct
	-- le wr est également utilise pour le mux sur les infos en entrees
	process(clk) begin
		if rising_edge(clk) then
			if reset = '1' then
				delay_en_s <= '0';
			else
				delay_en_s <= compute_en_s;
			end if;
			if reset = '1' then
				wr_addr_s <= (others => '0');
				rd_addr_s <= (others => '0');
			elsif compute_en_s = '0' then
				wr_addr_s <= (others => '0');
				rd_addr_s <= (others => '0');
			else
				wr_addr_s <= rd_addr_s;
				rd_addr_s <= std_logic_vector(unsigned(rd_addr_s) + 1);
			end if;
		end if;
	end process;

	process(clk) begin
		if rising_edge(clk) then
			if reset = '1' then
				prn_addr_s <= (others => '0');
			elsif compute_en_s = '0' then
				prn_addr_s <= (others => '0');
			else
				if (unsigned(prn_addr_s) < NB_BLK-1) then
					prn_addr_s <= std_logic_vector(unsigned(prn_addr_s) + 1);
				else
					prn_addr_s <= prn_addr_s;
				end if;
			end if;
		end if;
	end process;

	ram_i_inst : entity work.xcorr_prn_slow_complex_ram
	generic map (DATA => OUT_SIZE, ADDR => CPT_SZ)
  	port map(
    	clk_a => clk, clk_b => clk,
    	we_a => wr_en_i_s, addr_a => wr_addr_s,
		din_a => ram_wr_data_i_s,
    	addr_b => rd_addr_s, dout_b => accum_i_s
    );

	ram_q_inst : entity work.xcorr_prn_slow_complex_ram
	generic map (DATA => OUT_SIZE, ADDR => CPT_SZ)
  	port map(
    	clk_a => clk, clk_b => clk,
    	we_a => wr_en_q_s, addr_a => wr_addr_s,
		din_a => ram_wr_data_q_s,
    	addr_b => rd_addr_s, dout_b => accum_q_s
    );
				
end architecture rtl;
