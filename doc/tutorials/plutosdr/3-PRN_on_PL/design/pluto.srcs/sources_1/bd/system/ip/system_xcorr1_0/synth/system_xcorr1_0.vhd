-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: ggm:cogen:xcorr_prn_slow_complex:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_xcorr1_0 IS
  PORT (
    ext_rst_i : IN STD_LOGIC;
    data_clk_i : IN STD_LOGIC;
    data_rst_i : IN STD_LOGIC;
    data_en_i : IN STD_LOGIC;
    data_i_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    data_q_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    prn_i : IN STD_LOGIC;
    prn_sync_o : OUT STD_LOGIC;
    data_en_o : OUT STD_LOGIC;
    data_i_o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    data_q_o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    data_clk_o : OUT STD_LOGIC;
    data_rst_o : OUT STD_LOGIC
  );
END system_xcorr1_0;

ARCHITECTURE system_xcorr1_0_arch OF system_xcorr1_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_xcorr1_0_arch: ARCHITECTURE IS "yes";
  COMPONENT xcorr_prn_slow_complex IS
    GENERIC (
      NB_BLK : INTEGER;
      LENGTH : INTEGER;
      IN_SIZE : INTEGER;
      OUT_SIZE : INTEGER
    );
    PORT (
      ext_rst_i : IN STD_LOGIC;
      data_clk_i : IN STD_LOGIC;
      data_rst_i : IN STD_LOGIC;
      data_en_i : IN STD_LOGIC;
      data_i_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      data_q_i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      prn_i : IN STD_LOGIC;
      prn_sync_o : OUT STD_LOGIC;
      data_en_o : OUT STD_LOGIC;
      data_i_o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_q_o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_clk_o : OUT STD_LOGIC;
      data_rst_o : OUT STD_LOGIC
    );
  END COMPONENT xcorr_prn_slow_complex;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_xcorr1_0_arch: ARCHITECTURE IS "xcorr_prn_slow_complex,Vivado 2018.3";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_xcorr1_0_arch : ARCHITECTURE IS "system_xcorr1_0,xcorr_prn_slow_complex,{}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF system_xcorr1_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF data_rst_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_RST";
  ATTRIBUTE X_INTERFACE_INFO OF data_clk_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_CLK";
  ATTRIBUTE X_INTERFACE_INFO OF data_q_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_Q";
  ATTRIBUTE X_INTERFACE_INFO OF data_i_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_I";
  ATTRIBUTE X_INTERFACE_INFO OF data_en_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_EN";
  ATTRIBUTE X_INTERFACE_INFO OF data_q_i: SIGNAL IS "xilinx.com:interface:complex:1.0 data_in DATA_Q";
  ATTRIBUTE X_INTERFACE_INFO OF data_i_i: SIGNAL IS "xilinx.com:interface:complex:1.0 data_in DATA_I";
  ATTRIBUTE X_INTERFACE_INFO OF data_en_i: SIGNAL IS "xilinx.com:interface:complex:1.0 data_in DATA_EN";
  ATTRIBUTE X_INTERFACE_INFO OF data_rst_i: SIGNAL IS "xilinx.com:interface:complex:1.0 data_in DATA_RST";
  ATTRIBUTE X_INTERFACE_INFO OF data_clk_i: SIGNAL IS "xilinx.com:interface:complex:1.0 data_in DATA_CLK";
BEGIN
  U0 : xcorr_prn_slow_complex
    GENERIC MAP (
      NB_BLK => 1,
      LENGTH => 127,
      IN_SIZE => 16,
      OUT_SIZE => 32
    )
    PORT MAP (
      ext_rst_i => ext_rst_i,
      data_clk_i => data_clk_i,
      data_rst_i => data_rst_i,
      data_en_i => data_en_i,
      data_i_i => data_i_i,
      data_q_i => data_q_i,
      prn_i => prn_i,
      prn_sync_o => prn_sync_o,
      data_en_o => data_en_o,
      data_i_o => data_i_o,
      data_q_o => data_q_o,
      data_clk_o => data_clk_o,
      data_rst_o => data_rst_o
    );
END system_xcorr1_0_arch;
