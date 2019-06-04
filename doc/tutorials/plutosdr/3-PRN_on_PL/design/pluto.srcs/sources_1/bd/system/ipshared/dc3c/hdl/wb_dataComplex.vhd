---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

Entity wb_dataComplex_to_ram is 
	generic(
		wb_size       : natural := 16
	);
	port (
		-- Syscon signals
		reset	           : in std_logic ;
		clk	               : in std_logic ;
		-- signals
		wbs_add	           : in std_logic_vector(1 downto 0);
		wbs_writedata      : in std_logic_vector(wb_size-1 downto 0);
		wbs_readdata       : out std_logic_vector(wb_size-1 downto 0);
		wbs_read	       : in std_logic ;
		wbs_read_ack       : out std_logic;
		wbs_write	       : in std_logic ;
		-- results
		ram_data_i 	   	   : in std_logic_vector(wb_size-1 downto 0);
		ram_incr_o          : out std_logic;
		ram_reinit_o       : out std_logic;
		busy_i             : in std_logic;
		start_o            : out std_logic
	);
end entity wb_dataComplex_to_ram;

-----------------------------------------------------------------------
Architecture bhv of wb_dataComplex_to_ram is
-----------------------------------------------------------------------
	constant REG_START : std_logic_vector(1 downto 0) := "00";
	constant REG_STAT  : std_logic_vector(1 downto 0) := "01";
	constant REG_DATA  : std_logic_vector(1 downto 0) := "10";
	
	signal readdata_s  : std_logic_vector(wb_size-1 downto 0);
begin
	wbs_readdata <= readdata_s;
	-- manage register
	ram_incr_o <= '1' when wbs_read = '1' and wbs_add = REG_DATA else '0';
	ram_reinit_o <= '1' when wbs_write = '1' and wbs_add = REG_START else '0';

	write_bloc : process(clk)
	begin
		if rising_edge(clk) then
			if (wbs_write = '1' and wbs_add = REG_START) then
				start_o <= '1';
			else
				start_o <= '0';
			end if;
		end if;
	end process write_bloc;

	read_bloc : process(clk)
	begin
		 if rising_edge(clk) then
			wbs_read_ack <= '0';
			if reset = '1' then
				readdata_s <= (others => '0');
			else
				readdata_s <= readdata_s;
				if (wbs_read = '1') then
					wbs_read_ack <= '1';
					case wbs_add is
					when REG_STAT =>			
						readdata_s(wb_size-1 downto 1) <= (wb_size-1 downto 1 => '0');
						readdata_s(0) <= busy_i;
					when REG_DATA =>
						readdata_s <= ram_data_i;
					when others =>
						readdata_s <= x"4433AA55";
					end case;
				end if;
			end if;
		 end if;
	end process read_bloc;
end architecture bhv;

