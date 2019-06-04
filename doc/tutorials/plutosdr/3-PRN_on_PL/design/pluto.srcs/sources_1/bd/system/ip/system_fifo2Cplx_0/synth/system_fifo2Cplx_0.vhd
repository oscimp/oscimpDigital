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

-- IP VLNV: ggm:cogen:axiStreamToComplex:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_fifo2Cplx_0 IS
  PORT (
    data_i_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    data_q_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    data_en_o : OUT STD_LOGIC;
    data_clk_o : OUT STD_LOGIC;
    data_rst_o : OUT STD_LOGIC;
    s00_axis_aclk : IN STD_LOGIC;
    s00_axis_reset : IN STD_LOGIC;
    s00_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s00_axis_tready : OUT STD_LOGIC;
    s00_axis_tvalid : IN STD_LOGIC
  );
END system_fifo2Cplx_0;

ARCHITECTURE system_fifo2Cplx_0_arch OF system_fifo2Cplx_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_fifo2Cplx_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axiStreamToComplex IS
    GENERIC (
      DATA_SIZE : INTEGER
    );
    PORT (
      data_i_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      data_q_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      data_en_o : OUT STD_LOGIC;
      data_clk_o : OUT STD_LOGIC;
      data_rst_o : OUT STD_LOGIC;
      s00_axis_aclk : IN STD_LOGIC;
      s00_axis_reset : IN STD_LOGIC;
      s00_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s00_axis_tready : OUT STD_LOGIC;
      s00_axis_tvalid : IN STD_LOGIC
    );
  END COMPONENT axiStreamToComplex;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_fifo2Cplx_0_arch: ARCHITECTURE IS "axiStreamToComplex,Vivado 2018.3";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_fifo2Cplx_0_arch : ARCHITECTURE IS "system_fifo2Cplx_0,axiStreamToComplex,{}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF system_fifo2Cplx_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 s00_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 s00_axis TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axis_tdata: SIGNAL IS "XIL_INTERFACENAME s00_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 s00_axis TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axis_reset: SIGNAL IS "XIL_INTERFACENAME s00_axis_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_reset: SIGNAL IS "xilinx.com:signal:reset:1.0 s00_axis_reset RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s00_axis_aclk: SIGNAL IS "XIL_INTERFACENAME s00_axis_aclk, ASSOCIATED_BUSIF s00_axis, ASSOCIATED_RESET s00_axis_reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s00_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 s00_axis_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF data_rst_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_RST";
  ATTRIBUTE X_INTERFACE_INFO OF data_clk_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_CLK";
  ATTRIBUTE X_INTERFACE_INFO OF data_en_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_EN";
  ATTRIBUTE X_INTERFACE_INFO OF data_q_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_Q";
  ATTRIBUTE X_INTERFACE_INFO OF data_i_o: SIGNAL IS "xilinx.com:interface:complex:1.0 data_out DATA_I";
BEGIN
  U0 : axiStreamToComplex
    GENERIC MAP (
      DATA_SIZE => 16
    )
    PORT MAP (
      data_i_o => data_i_o,
      data_q_o => data_q_o,
      data_en_o => data_en_o,
      data_clk_o => data_clk_o,
      data_rst_o => data_rst_o,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_reset => s00_axis_reset,
      s00_axis_tdata => s00_axis_tdata,
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid
    );
END system_fifo2Cplx_0_arch;
