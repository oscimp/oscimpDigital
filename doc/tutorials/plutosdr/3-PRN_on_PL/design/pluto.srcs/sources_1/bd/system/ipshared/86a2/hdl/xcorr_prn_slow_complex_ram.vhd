library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity xcorr_prn_slow_complex_ram is
generic (
    DATA    : integer := 72;
    ADDR    : integer := 10
);
  port (
    clk_a : in std_logic;
	clk_b : in std_logic;
     -- state machine interface
    we_a  : in std_logic;
    addr_a: in std_logic_vector(ADDR-1 downto 0);
    din_a : in std_logic_vector(DATA-1 downto 0); 
    addr_b: in std_logic_vector(ADDR-1 downto 0);
    dout_b: out std_logic_vector(DATA-1 downto 0)   
    );
end entity;
 
architecture rtl of xcorr_prn_slow_complex_ram is
    -- Shared memory
    type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
    signal mem : mem_type := (others => (others => '0'));
	attribute ram_style        : string;
	attribute ram_style of mem : signal is "block";
begin
 
-- Port A
process(clk_a)
begin
    if(clk_a'event and clk_a='1') then
        if(we_a='1') then
            mem(to_integer(unsigned(addr_a))) <= din_a;
        end if;
    end if;
end process;
 
-- Port B
process(clk_b)
begin
    if(clk_b'event and clk_b='1') then
        dout_b <= mem(to_integer(unsigned(addr_b)));
    end if;
end process;
 
end architecture rtl;
