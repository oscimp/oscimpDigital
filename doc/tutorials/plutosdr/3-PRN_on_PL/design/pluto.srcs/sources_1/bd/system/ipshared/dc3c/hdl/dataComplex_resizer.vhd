---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity dataComplex_resizer is
	generic (
		IN_SZ : natural := 32;
		OUT_SZ : natural := 32;
		DATA_FORMAT : string := "signed"
	);
	port (
		data_i_i : in std_logic_vector(IN_SZ-1 downto 0);
		data_q_i : in std_logic_vector(IN_SZ-1 downto 0);
		data_o : out std_logic_vector((2*OUT_SZ)-1 downto 0)
	);
end dataComplex_resizer;

architecture bhv of dataComplex_resizer is
begin

	same_size_gen : if IN_SZ = OUT_SZ generate
		data_o <= data_q_i & data_i_i;
	end generate same_size_gen;
	diff_size_gen : if IN_SZ < OUT_SZ generate
		data_signed : if DATA_FORMAT = "signed" generate
			data_o <= (OUT_SZ-1 downto IN_SZ => data_q_i(IN_SZ-1)) & data_q_i
						&
						(OUT_SZ-1 downto IN_SZ => data_i_i(IN_SZ-1)) & data_i_i;
		end generate data_signed;
		data_unsigned : if DATA_FORMAT = "unsigned" generate
			data_o <= (OUT_SZ-1 downto IN_SZ => '0') & data_q_i
						&
						(OUT_SZ-1 downto IN_SZ => '0') & data_i_i;
		end generate data_unsigned;
	end generate diff_size_gen;
end architecture bhv;
