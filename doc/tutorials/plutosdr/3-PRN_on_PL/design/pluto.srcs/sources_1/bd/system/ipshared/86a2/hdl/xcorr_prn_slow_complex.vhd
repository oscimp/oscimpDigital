library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity xcorr_prn_slow_complex is
	generic (
		NB_BLK : natural := 25;
		LENGTH : natural := 1023;
		IN_SIZE : natural := 16;
		OUT_SIZE : natural := 32
	);
    port (
        ext_rst_i : in std_logic := '0';
        -- data in
        data_clk_i : in std_logic;
        data_rst_i : in std_logic;
        data_en_i : in std_logic;
		data_i_i : in std_logic_vector(IN_SIZE-1 downto 0);
		data_q_i : in std_logic_vector(IN_SIZE-1 downto 0);
		-- prn in
		prn_i : in std_logic;
		prn_sync_o : out std_logic;
		-- data out
		data_en_o : out std_logic;
		data_i_o : out std_logic_vector(OUT_SIZE-1 downto 0);
		data_q_o : out std_logic_vector(OUT_SIZE-1 downto 0);
		data_clk_o : out std_logic;
		data_rst_o : out std_logic
    );
end entity;

architecture rtl of xcorr_prn_slow_complex is
	constant V1 : natural := LENGTH/NB_BLK;
	constant V2 : natural := LENGTH - (V1 * NB_BLK);

	constant ALL_ZERO : std_logic_vector(NB_BLK downto 0) := (others => '0');
	-- control
	signal delay_s, delay_next_s : std_logic_vector(LENGTH-1 downto 0);
	signal delay2_s : std_logic_vector(LENGTH-1 downto 0);
	signal prn_s, prn_next_s : std_logic_vector(LENGTH-1 downto 0);
	signal prn2_s : std_logic_vector(LENGTH-1 downto 0);
	-- cpt
	constant CPT_SIZE : natural := natural(ceil(log2(real(LENGTH))));
	signal cpt_s, cpt_next_s : unsigned(CPT_SIZE-1 downto 0);
	signal delay_end_s, delay_end_next_s : std_logic_vector(LENGTH-1 downto 0);
	signal delay2_end_s : std_logic_vector(LENGTH-1 downto 0);
	signal end_cross_s : std_logic;
	-- xcorr
	signal data_en_s : std_logic_vector(NB_BLK downto 0);
	type data_tab is array (natural range <>) of std_logic_vector(OUT_SIZE-1 downto 0);
	signal data_i_s, data_q_s : data_tab(NB_BLK downto 0);
	-- last
	signal cpt_store_s, cpt_store_next_s : unsigned(CPT_SIZE-1 downto 0);
	signal data_en_next : std_logic;
	signal data_out_i_next_s, data_out_i_s : std_logic_vector(OUT_SIZE-1 downto 0);
	signal data_out_q_next_s, data_out_q_s : std_logic_vector(OUT_SIZE-1 downto 0);

	signal prn_in_s : std_logic;
	signal data_in_i_s, data_in_q_s : std_logic_vector(IN_SIZE-1 downto 0);
	signal data_in_en_s : std_logic;
begin
	data_rst_o <= data_rst_i;
	data_clk_o <= data_clk_i;
	prn_sync_o <= data_en_i;

	process(data_clk_i) begin
		if rising_edge(data_clk_i) then
			if data_rst_i = '1' then
				data_in_i_s <= (others => '0');
				data_in_q_s <= (others => '0');
				data_in_en_s <= '0';
				prn_in_s <= '0';
			else
				data_in_i_s <= data_i_i;
				data_in_q_s <= data_q_i;
				data_in_en_s <= data_en_i;
				prn_in_s <= prn_i;
			end if;
		end if;
	end process;

	xcorr_loop: for i in 0 to NB_BLK-1 generate
		xcorr_i_inst : entity work.xcorr_prn_slow_complex_mux
		generic map (NB_BLK=> V1, IN_SIZE => IN_SIZE, OUT_SIZE => OUT_SIZE)
		port map (clk => data_clk_i, reset => data_rst_i,
			clear_accum_i => ext_rst_i,
			data_en_i => data_in_en_s,
			data_ready_i => delay2_s(V1+(V1*i)-1 downto V1*i),
			end_cross_i => delay2_end_s(V1+(V1*i)-1 downto V1*i),
			data_i_i => data_in_i_s, data_q_i => data_in_q_s, 
			prn_i => prn2_s(V1+(V1*i)-1 downto V1*i),
			data_en_o => data_en_s(i), 
			data_i_o => data_i_s(i), data_q_o => data_q_s(i)
		);
	end generate xcorr_loop;

	xcorr_last_inst : entity work.xcorr_prn_slow_complex_mux
	generic map (NB_BLK=> V2, IN_SIZE => IN_SIZE, OUT_SIZE => OUT_SIZE)
	port map (clk => data_clk_i, reset => data_rst_i,
		clear_accum_i => ext_rst_i,
		data_en_i => data_in_en_s,
		data_ready_i => delay2_s(V2+(V1*NB_BLK)-1 downto V1*NB_BLK),
		end_cross_i => delay2_end_s(V2+(V1*NB_BLK)-1 downto V1*NB_BLK),
		data_i_i => data_in_i_s, data_q_i => data_in_q_s, 
		prn_i => prn2_s(V2+(V1*NB_BLK)-1 downto V1*NB_BLK),
		data_en_o => data_en_s(NB_BLK),
		data_i_o => data_i_s(NB_BLK), data_q_o => data_q_s(NB_BLK)
	);

	prn_next_s <= prn_s(LENGTH-2 downto 0)&prn_i;
	prn2_s <= prn_s;
	delay_next_s <= delay_s(LENGTH-2 downto 0) &'1';
	delay_end_next_s <= delay_end_s(LENGTH-2 downto 0) & end_cross_s;

	delay2_s <= delay_s;
	delay2_end_s <= delay_end_s;

	process(data_clk_i)
	begin
		if rising_edge(data_clk_i) then
			if data_rst_i = '1' then
				prn_s <= (others => '0');
			elsif data_en_i = '1' then
				prn_s <= prn_next_s;
			else
				prn_s <= prn_s;
			end if;
		end if;
	end process;

	process(data_clk_i)
	begin
		if rising_edge(data_clk_i) then
			if data_rst_i = '1' then
				delay_s <= (others => '0');
				delay_end_s <= (others => '0');
			elsif data_in_en_s = '1' then
				delay_s <= delay_next_s;
				delay_end_s <= delay_end_next_s;
			else
				delay_s <= delay_s;
				delay_end_s <= delay_end_s;
			end if;
		end if;
	end process;

	data_en_next <= '1' when data_en_s /= ALL_ZERO else '0';

	cpt_store_next_s <= cpt_store_s + 1;

	process(data_clk_i)
	begin
		if rising_edge(data_clk_i) then
			if data_rst_i = '1' then
				cpt_store_s <= (others => '0');
			else
				cpt_store_s <= cpt_store_s;
				if data_en_next = '1' then
					if cpt_store_s = LENGTH -1 then
						cpt_store_s <= (others => '0');
					else
						cpt_store_s <= cpt_store_next_s;
					end if;
				end if;
			end if;
		end if;
	end process;

    process(data_out_i_s, data_i_s, data_en_s)
        variable tmp : std_logic_vector(OUT_SIZE-1 downto 0);
    begin
        tmp := data_out_i_s;
        boucle_test :for i in 0 to NB_BLK loop
            if data_en_s(i) = '1' then
                tmp := data_i_s(i);
            end if;
        end loop;
        data_out_i_next_s <= tmp;
    end process;

    process(data_out_q_s, data_q_s, data_en_s)
        variable tmp : std_logic_vector(OUT_SIZE-1 downto 0);
    begin
        tmp := data_out_q_s;
        boucle_test :for i in 0 to NB_BLK loop
            if data_en_s(i) = '1' then
                tmp := data_q_s(i);
            end if;
        end loop;
        data_out_q_next_s <= tmp;
    end process;

	process(data_clk_i)
	begin
		if rising_edge(data_clk_i) then
			data_en_o <= data_en_next;
			if data_rst_i = '1' then
				data_out_i_s <= (others => '0');
				data_out_q_s <= (others => '0');
			elsif data_en_next = '1' then
				data_out_i_s <= data_out_i_next_s;
				data_out_q_s <= data_out_q_next_s;
			else
				data_out_i_s <= data_out_i_s;
				data_out_q_s <= data_out_q_s;
			end if;
		end if;
	end process;
	data_i_o <= data_out_i_s;
	data_q_o <= data_out_q_s;

	end_cross_s <= '1' when cpt_s = LENGTH -1 else '0';
	cpt_next_s <= cpt_s + 1;

	process(data_clk_i)
	begin
		if rising_edge(data_clk_i) then
			if data_rst_i = '1' then
				cpt_s <= (others => '0');
			else
				cpt_s <= cpt_s;
				if data_in_en_s = '1' then
					if end_cross_s = '1' then
						cpt_s <= (others => '0');
					else
						cpt_s <= cpt_next_s;
					end if;
				end if;
			end if;
		end if;
	end process;
end architecture rtl;
