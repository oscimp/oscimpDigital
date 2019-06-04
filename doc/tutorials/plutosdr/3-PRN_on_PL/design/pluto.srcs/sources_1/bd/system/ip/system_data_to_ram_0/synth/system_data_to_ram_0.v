// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: ggm:cogen:dataComplex_to_ram:1.0
// IP Revision: 1

(* X_CORE_INFO = "dataComplex_to_ram,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "system_data_to_ram_0,dataComplex_to_ram,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_data_to_ram_0 (
  data1_i_i,
  data1_q_i,
  data1_en_i,
  data1_clk_i,
  data1_rst_i,
  data1_eof_i,
  data2_i_i,
  data2_q_i,
  data2_en_i,
  data2_clk_i,
  data2_rst_i,
  data2_eof_i,
  s00_axi_aclk,
  s00_axi_reset,
  s00_axi_awaddr,
  s00_axi_awprot,
  s00_axi_awvalid,
  s00_axi_awready,
  s00_axi_wdata,
  s00_axi_wstrb,
  s00_axi_wvalid,
  s00_axi_wready,
  s00_axi_bresp,
  s00_axi_bvalid,
  s00_axi_bready,
  s00_axi_araddr,
  s00_axi_arprot,
  s00_axi_arvalid,
  s00_axi_arready,
  s00_axi_rdata,
  s00_axi_rresp,
  s00_axi_rvalid,
  s00_axi_rready
);

(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data1_in DATA_I" *)
input wire [31 : 0] data1_i_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data1_in DATA_Q" *)
input wire [31 : 0] data1_q_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data1_in DATA_EN" *)
input wire data1_en_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data1_in DATA_CLK" *)
input wire data1_clk_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data1_in DATA_RST" *)
input wire data1_rst_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data1_in DATA_EOF" *)
input wire data1_eof_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data2_in DATA_I" *)
input wire [31 : 0] data2_i_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data2_in DATA_Q" *)
input wire [31 : 0] data2_q_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data2_in DATA_EN" *)
input wire data2_en_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data2_in DATA_CLK" *)
input wire data2_clk_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data2_in DATA_RST" *)
input wire data2_rst_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:complex:1.0 data2_in DATA_EOF" *)
input wire data2_eof_i;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_signal_clock, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_signal_clock CLK" *)
input wire s00_axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_signal_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_signal_reset RST" *)
input wire s00_axi_reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *)
input wire [3 : 0] s00_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *)
input wire [2 : 0] s00_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *)
input wire s00_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *)
output wire s00_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *)
input wire [31 : 0] s00_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *)
input wire [3 : 0] s00_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *)
input wire s00_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *)
output wire s00_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *)
output wire [1 : 0] s00_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *)
output wire s00_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *)
input wire s00_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *)
input wire [3 : 0] s00_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *)
input wire [2 : 0] s00_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *)
input wire s00_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *)
output wire s00_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *)
output wire [31 : 0] s00_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *)
output wire [1 : 0] s00_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *)
output wire s00_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_sys_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE\
_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *)
input wire s00_axi_rready;

  dataComplex_to_ram #(
    .USE_EOF(1'B0),
    .NB_INPUT(2),
    .DATA_FORMAT("signed"),
    .DATA_SIZE(32),
    .NB_SAMPLE(2048),
    .C_S00_AXI_DATA_WIDTH(32),
    .C_S00_AXI_ADDR_WIDTH(4)
  ) inst (
    .data1_i_i(data1_i_i),
    .data1_q_i(data1_q_i),
    .data1_en_i(data1_en_i),
    .data1_clk_i(data1_clk_i),
    .data1_rst_i(data1_rst_i),
    .data1_eof_i(data1_eof_i),
    .data2_i_i(data2_i_i),
    .data2_q_i(data2_q_i),
    .data2_en_i(data2_en_i),
    .data2_clk_i(data2_clk_i),
    .data2_rst_i(data2_rst_i),
    .data2_eof_i(data2_eof_i),
    .data3_i_i(32'B0),
    .data3_q_i(32'B0),
    .data3_en_i(1'H0),
    .data3_clk_i(1'H0),
    .data3_rst_i(1'H0),
    .data3_eof_i(1'H0),
    .data4_i_i(32'B0),
    .data4_q_i(32'B0),
    .data4_en_i(1'H0),
    .data4_clk_i(1'H0),
    .data4_rst_i(1'H0),
    .data4_eof_i(1'H0),
    .data5_i_i(32'B0),
    .data5_q_i(32'B0),
    .data5_en_i(1'H0),
    .data5_clk_i(1'H0),
    .data5_rst_i(1'H0),
    .data5_eof_i(1'H0),
    .data6_i_i(32'B0),
    .data6_q_i(32'B0),
    .data6_en_i(1'H0),
    .data6_clk_i(1'H0),
    .data6_rst_i(1'H0),
    .data6_eof_i(1'H0),
    .data7_i_i(32'B0),
    .data7_q_i(32'B0),
    .data7_en_i(1'H0),
    .data7_clk_i(1'H0),
    .data7_rst_i(1'H0),
    .data7_eof_i(1'H0),
    .data8_i_i(32'B0),
    .data8_q_i(32'B0),
    .data8_en_i(1'H0),
    .data8_clk_i(1'H0),
    .data8_rst_i(1'H0),
    .data8_eof_i(1'H0),
    .data9_i_i(32'B0),
    .data9_q_i(32'B0),
    .data9_en_i(1'H0),
    .data9_clk_i(1'H0),
    .data9_rst_i(1'H0),
    .data9_eof_i(1'H0),
    .data10_i_i(32'B0),
    .data10_q_i(32'B0),
    .data10_en_i(1'H0),
    .data10_clk_i(1'H0),
    .data10_rst_i(1'H0),
    .data10_eof_i(1'H0),
    .data11_i_i(32'B0),
    .data11_q_i(32'B0),
    .data11_en_i(1'H0),
    .data11_clk_i(1'H0),
    .data11_rst_i(1'H0),
    .data11_eof_i(1'H0),
    .data12_i_i(32'B0),
    .data12_q_i(32'B0),
    .data12_en_i(1'H0),
    .data12_clk_i(1'H0),
    .data12_rst_i(1'H0),
    .data12_eof_i(1'H0),
    .s00_axi_aclk(s00_axi_aclk),
    .s00_axi_reset(s00_axi_reset),
    .s00_axi_awaddr(s00_axi_awaddr),
    .s00_axi_awprot(s00_axi_awprot),
    .s00_axi_awvalid(s00_axi_awvalid),
    .s00_axi_awready(s00_axi_awready),
    .s00_axi_wdata(s00_axi_wdata),
    .s00_axi_wstrb(s00_axi_wstrb),
    .s00_axi_wvalid(s00_axi_wvalid),
    .s00_axi_wready(s00_axi_wready),
    .s00_axi_bresp(s00_axi_bresp),
    .s00_axi_bvalid(s00_axi_bvalid),
    .s00_axi_bready(s00_axi_bready),
    .s00_axi_araddr(s00_axi_araddr),
    .s00_axi_arprot(s00_axi_arprot),
    .s00_axi_arvalid(s00_axi_arvalid),
    .s00_axi_arready(s00_axi_arready),
    .s00_axi_rdata(s00_axi_rdata),
    .s00_axi_rresp(s00_axi_rresp),
    .s00_axi_rvalid(s00_axi_rvalid),
    .s00_axi_rready(s00_axi_rready)
  );
endmodule
