---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dataComplex_sync is
	generic (stages : natural := 3);
	port (
		ref_clk_i : in std_logic;
		clk_i : in std_logic;
		bit_i : in std_logic;
		bit_o : out std_logic
	);
end entity dataComplex_sync;

architecture bhv of dataComplex_sync is
	signal sync_stage0_s, sync_stage1_s: std_logic;
	signal sync_stage2_s, sync_stage3_s: std_logic;
	attribute ASYNC_REG : string;
	attribute ASYNC_REG of sync_stage1_s: signal is "true";
	attribute ASYNC_REG of sync_stage2_s: signal is "true";
begin
	ref_proc: process(ref_clk_i) begin
		if rising_edge(ref_clk_i) then
			sync_stage0_s <= bit_i;
		end if;
	end process;

	sync_proc: process(clk_i)
	begin
		if rising_edge(clk_i) then
			sync_stage1_s <= sync_stage0_s;
			sync_stage2_s <= sync_stage1_s;
			sync_stage3_s <= sync_stage2_s;
		end if;
	end process;
	bit_o <= sync_stage3_s;
end bhv;
