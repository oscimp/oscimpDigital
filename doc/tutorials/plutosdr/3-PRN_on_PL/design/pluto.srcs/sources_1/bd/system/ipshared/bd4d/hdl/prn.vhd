---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2019/05/18
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity prn is
	generic (
		BIT_LEN    : natural := 7;
		PRN_NUM    : natural := 1;
		PERIOD_LEN : natural := 1
	);
 	port (
		clk    : in std_logic;
		reset  : in std_logic;
		tick_i : in std_logic;
		prn_o  : out std_logic
	);
end entity;
 
architecture rtl of prn is
	constant PERIOD_WIDTH      : natural := natural(ceil(log2(real(PERIOD_LEN))));
	signal period_s            : unsigned(PERIOD_WIDTH-1 downto 0);
	signal tick_int_s          : std_logic;
	signal lfsr_s, lfsr_next_s : std_logic_vector(BIT_LEN-1 downto 0) := (others => '1');
	signal xorM_N 	           : std_logic;
begin
	
	prescaler_gen : if (PERIOD_LEN > 1) generate
		process(clk) begin
			if rising_edge(clk) then
				if (reset or tick_int_s) = '1' then
					period_s <= to_unsigned(PERIOD_LEN-1, PERIOD_WIDTH);
				elsif (tick_i = '1') then
					period_s <= period_s - 1;
				else
					period_s <= period_s;
				end if;
			end if;
		end process;

	tick_int_s <= tick_i when (period_s = 0) else '0';
	end generate prescaler_gen;

	no_prescaler: if (PERIOD_LEN = 1) generate
		tick_int_s <= tick_i;
	end generate no_prescaler;


	prn_7: if (BIT_LEN = 7) generate
		--http://users.ece.cmu.edu/~koopman/lfsr/7.txt
		prn_7_1: if (PRN_NUM = 1) generate -- 0x41
			xorM_N      <= lfsr_s(0) xor lfsr_s(6);
		end generate prn_7_1;
		prn_7_2: if (PRN_NUM = 2) generate -- 0x44
			xorM_N      <= lfsr_s(2) xor lfsr_s(6);
		end generate prn_7_2;
		prn_7_3: if (PRN_NUM = 3) generate -- 0x47
			xorM_N      <= lfsr_s(0) xor lfsr_s(1) xor lfsr_s(2) xor lfsr_s(6);
		end generate prn_7_3;
		prn_7_4: if (PRN_NUM = 4) generate -- 0x48
			xorM_N      <= lfsr_s(3) xor lfsr_s(6);
		end generate prn_7_4;
		prn_7_5: if (PRN_NUM = 5) generate -- 0x4E
			xorM_N      <= lfsr_s(1) xor lfsr_s(2) xor lfsr_s(3) xor lfsr_s(6);
		end generate prn_7_5;
		prn_7_6: if (PRN_NUM = 6) generate -- 0x53
			xorM_N      <= lfsr_s(0) xor lfsr_s(1) xor lfsr_s(4) xor lfsr_s(6);
		end generate prn_7_6;
		prn_7_7: if (PRN_NUM = 7) generate -- 0x55
			xorM_N      <= lfsr_s(0) xor lfsr_s(2) xor lfsr_s(4) xor lfsr_s(6);
		end generate prn_7_7;
		prn_7_8: if (PRN_NUM = 8) generate -- 0x5c
			xorM_N      <= lfsr_s(2) xor lfsr_s(3) xor lfsr_s(4) xor lfsr_s(6);
		end generate prn_7_8;
		prn_7_9: if (PRN_NUM = 9) generate -- 0x5f
			xorM_N      <= lfsr_s(0) xor lfsr_s(1) xor lfsr_s(2) xor lfsr_s(3) xor lfsr_s(4) xor lfsr_s(6);
		end generate prn_7_9;
		prn_7_10: if (PRN_NUM = 10) generate -- 0x60
			xorM_N      <= lfsr_s(5) xor lfsr_s(6);
		end generate prn_7_10;
	end generate prn_7;
	lfsr_next_s <= lfsr_s(BIT_LEN-2 downto 0) & xorM_N;

	process(clk) begin
		if rising_edge(clk) then
			if (tick_int_s = '1') then
				lfsr_s <= lfsr_next_s;
			else
				lfsr_s <= lfsr_s;
			end if;
		end if;
	end process;

	prn_o <= lfsr_s(0);

end architecture rtl;
