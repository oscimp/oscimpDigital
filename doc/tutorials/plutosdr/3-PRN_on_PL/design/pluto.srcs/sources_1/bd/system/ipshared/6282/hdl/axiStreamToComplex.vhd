---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2016/09/22
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

Entity axiStreamToComplex is 
	generic (
		DATA_SIZE : natural := 32
	);
	port (
		-- output data
		data_i_o : out std_logic_vector(DATA_SIZE-1 downto 0);
		data_q_o : out std_logic_vector(DATA_SIZE-1 downto 0);
		data_en_o: out std_logic;
		data_clk_o: out std_logic;
		data_rst_o: out std_logic;
		-- input data
		s00_axis_aclk	: in std_logic;
		s00_axis_reset  : in std_logic;
		s00_axis_tdata  : in std_logic_vector((2*DATA_SIZE)-1 downto 0);
		s00_axis_tready : out std_logic;
		s00_axis_tvalid : in std_logic
	);
end entity;

---------------------------------------------------------------------------
Architecture axiStreamToComplex_1 of axiStreamToComplex is
begin
	data_q_o <= s00_axis_tdata((2*DATA_SIZE)-1 downto DATA_SIZE);
	data_i_o <= s00_axis_tdata(DATA_SIZE-1 downto 0);
	data_en_o <= s00_axis_tvalid;
	data_clk_o <= s00_axis_aclk;
	s00_axis_tready <= '1';
	data_rst_o <= s00_axis_reset;
end architecture axiStreamToComplex_1;

