library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity xcorr_prn_slow_complex_correl is
	generic (
		IN_SIZE : natural := 16;
		OUT_SIZE : natural := 32
	);
    port (
        -- input
		end_cross_i : in std_logic;
        data_en_i : in std_logic;
		accum_i : in std_logic_vector(OUT_SIZE-1 downto 0);
		--data_i : in std_logic_vector(IN_SIZE-1 downto 0);
		data_pos_i : in std_logic_vector(IN_SIZE-1 downto 0);
		data_neg_i : in std_logic_vector(IN_SIZE-1 downto 0);
		prn_i : in std_logic;
		-- output
		data_en_o : out std_logic;
		data_end_o : out std_logic;
		data_o : out std_logic_vector(OUT_SIZE-1 downto 0)
    );
end entity;

architecture rtl of xcorr_prn_slow_complex_correl is
	-- add/sub
	signal val_sub_s, val_add_s, val_s : signed(IN_SIZE-1 downto 0);
begin
	val_add_s <= signed(data_pos_i); --signed(data_i);
	val_sub_s <= signed(data_neg_i); ---signed(data_i);
	val_s <= val_add_s when prn_i = '1' else val_sub_s;

	data_o <= std_logic_vector(signed(accum_i) + val_s);
	data_end_o <= data_en_i and end_cross_i;
	data_en_o <= data_en_i;

end architecture rtl;
