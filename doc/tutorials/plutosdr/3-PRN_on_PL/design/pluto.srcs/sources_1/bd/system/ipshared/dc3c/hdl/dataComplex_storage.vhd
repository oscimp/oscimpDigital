---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity dataComplex_to_ram_storage is
generic (
    DATA    : integer := 72;
    ADDR    : integer := 10
);
  port (
    clk_a : in std_logic;
	clk_b : in std_logic;
	rst_b : in std_logic;
     -- state machine interface
    we_a  : in std_logic;
    addr_a: in std_logic_vector(ADDR-1 downto 0);
    din_a : in std_logic_vector(DATA-1 downto 0); 
    addr_b: in std_logic_vector(ADDR-1 downto 0);
    dout_b: out std_logic_vector(DATA-1 downto 0)   
    );
end entity;
architecture rtl of dataComplex_to_ram_storage is
    -- Shared memory
    type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
    shared variable mem : mem_type;
	signal rd_addr_s : std_logic_vector(ADDR-1 downto 0);
begin
 
-- Port A
process(clk_a)
begin
    if(rising_edge(clk_a)) then
        if(we_a='1') then
            mem(to_integer(unsigned(addr_a))) := din_a;
        end if;
    end if;
end process;
 
-- Port B
process(clk_b)
begin
    if(rising_edge(clk_b)) then
		if (rst_b = '1') then
			dout_b <= (others => '0');
		else
        	dout_b <= mem(to_integer(unsigned(addr_b)));
		end if;
    end if;
end process;
 
end architecture rtl;
