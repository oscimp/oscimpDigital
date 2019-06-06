//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Mon Jun  3 11:23:22 2019
//Host        : rugged running 64-bit Debian GNU/Linux unstable (sid)
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_I5GH1N
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_1UBGIXM
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [2:0]m01_couplers_to_m01_couplers_ARPROT;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [2:0]m01_couplers_to_m01_couplers_AWPROT;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m01_couplers_to_m01_couplers_ARPROT;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m01_couplers_to_m01_couplers_AWPROT;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_1J5P44O
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [2:0]m02_couplers_to_m02_couplers_ARPROT;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [2:0]m02_couplers_to_m02_couplers_AWPROT;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m02_couplers_to_m02_couplers_ARPROT;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m02_couplers_to_m02_couplers_AWPROT;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module m03_couplers_imp_T17W6X
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire [2:0]m03_couplers_to_m03_couplers_ARPROT;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire [2:0]m03_couplers_to_m03_couplers_AWPROT;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m03_couplers_to_m03_couplers_ARPROT;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m03_couplers_to_m03_couplers_AWPROT;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_15FU5SC
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire [2:0]m04_couplers_to_m04_couplers_ARPROT;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire [2:0]m04_couplers_to_m04_couplers_AWPROT;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m04_couplers_to_m04_couplers_ARPROT;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m04_couplers_to_m04_couplers_AWPROT;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module m05_couplers_imp_GFBASD
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wvalid;

  wire [31:0]m05_couplers_to_m05_couplers_ARADDR;
  wire m05_couplers_to_m05_couplers_ARREADY;
  wire m05_couplers_to_m05_couplers_ARVALID;
  wire [31:0]m05_couplers_to_m05_couplers_AWADDR;
  wire m05_couplers_to_m05_couplers_AWREADY;
  wire m05_couplers_to_m05_couplers_AWVALID;
  wire m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire m05_couplers_to_m05_couplers_WREADY;
  wire m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arvalid = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awvalid = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wvalid = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready;
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready;
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready;
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready;
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready;
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid;
endmodule

module m06_couplers_imp_59JXRJ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m06_couplers_to_m06_couplers_ARADDR;
  wire [2:0]m06_couplers_to_m06_couplers_ARPROT;
  wire m06_couplers_to_m06_couplers_ARREADY;
  wire m06_couplers_to_m06_couplers_ARVALID;
  wire [31:0]m06_couplers_to_m06_couplers_AWADDR;
  wire [2:0]m06_couplers_to_m06_couplers_AWPROT;
  wire m06_couplers_to_m06_couplers_AWREADY;
  wire m06_couplers_to_m06_couplers_AWVALID;
  wire m06_couplers_to_m06_couplers_BREADY;
  wire [1:0]m06_couplers_to_m06_couplers_BRESP;
  wire m06_couplers_to_m06_couplers_BVALID;
  wire [31:0]m06_couplers_to_m06_couplers_RDATA;
  wire m06_couplers_to_m06_couplers_RREADY;
  wire [1:0]m06_couplers_to_m06_couplers_RRESP;
  wire m06_couplers_to_m06_couplers_RVALID;
  wire [31:0]m06_couplers_to_m06_couplers_WDATA;
  wire m06_couplers_to_m06_couplers_WREADY;
  wire [3:0]m06_couplers_to_m06_couplers_WSTRB;
  wire m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m06_couplers_to_m06_couplers_ARPROT;
  assign M_AXI_arvalid = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m06_couplers_to_m06_couplers_AWPROT;
  assign M_AXI_awvalid = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m06_couplers_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m06_couplers_to_m06_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready;
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid;
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m06_couplers_to_m06_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready;
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid;
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready;
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid;
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready;
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid;
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready;
  assign m06_couplers_to_m06_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_H1ZQRK
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [28:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awlen;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [28:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [3:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [28:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [3:0]s00_couplers_to_s00_couplers_AWLEN;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [63:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [7:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_awaddr[28:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awlen[3:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_wdata[63:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[28:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[63:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[7:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_SELTG5
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [28:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [28:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [3:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [63:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire [28:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [3:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [63:0]s00_couplers_to_s00_couplers_RDATA;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;

  assign M_AXI_araddr[28:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_rdata[63:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[28:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
endmodule

module s00_couplers_imp_WZLZH6
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=42,numReposBlks=29,numNonXlnxBlks=18,numHierBlks=13,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (cos_fake_o,
    ddr_addr,
    ddr_ba,
    ddr_cas_n,
    ddr_ck_n,
    ddr_ck_p,
    ddr_cke,
    ddr_cs_n,
    ddr_dm,
    ddr_dq,
    ddr_dqs_n,
    ddr_dqs_p,
    ddr_odt,
    ddr_ras_n,
    ddr_reset_n,
    ddr_we_n,
    enable,
    fixed_io_ddr_vrn,
    fixed_io_ddr_vrp,
    fixed_io_mio,
    fixed_io_ps_clk,
    fixed_io_ps_porb,
    fixed_io_ps_srstb,
    gpio_i,
    gpio_o,
    gpio_t,
    iic_main_scl_i,
    iic_main_scl_o,
    iic_main_scl_t,
    iic_main_sda_i,
    iic_main_sda_o,
    iic_main_sda_t,
    ps_intr_00,
    ps_intr_01,
    ps_intr_02,
    ps_intr_03,
    ps_intr_04,
    ps_intr_05,
    ps_intr_06,
    ps_intr_07,
    ps_intr_08,
    ps_intr_09,
    ps_intr_10,
    ps_intr_11,
    ps_intr_12,
    ps_intr_13,
    ps_intr_14,
    ps_intr_15,
    rx_clk_in,
    rx_data_in,
    rx_frame_in,
    spi0_clk_i,
    spi0_clk_o,
    spi0_csn_0_o,
    spi0_csn_1_o,
    spi0_csn_2_o,
    spi0_csn_i,
    spi0_sdi_i,
    spi0_sdo_i,
    spi0_sdo_o,
    tx_clk_out,
    tx_data_out,
    tx_frame_out,
    txnrx,
    up_enable,
    up_txnrx);
  output cos_fake_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]ddr_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr BA" *) inout [2:0]ddr_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr CAS_N" *) inout ddr_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr CK_N" *) inout ddr_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr CK_P" *) inout ddr_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr CKE" *) inout ddr_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr CS_N" *) inout ddr_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr DM" *) inout [1:0]ddr_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr DQ" *) inout [15:0]ddr_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr DQS_N" *) inout [1:0]ddr_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr DQS_P" *) inout [1:0]ddr_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr ODT" *) inout ddr_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr RAS_N" *) inout ddr_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr RESET_N" *) inout ddr_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr WE_N" *) inout ddr_we_n;
  output enable;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 fixed_io DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fixed_io, CAN_DEBUG false" *) inout fixed_io_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 fixed_io DDR_VRP" *) inout fixed_io_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 fixed_io MIO" *) inout [31:0]fixed_io_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 fixed_io PS_CLK" *) inout fixed_io_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 fixed_io PS_PORB" *) inout fixed_io_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 fixed_io PS_SRSTB" *) inout fixed_io_ps_srstb;
  input [16:0]gpio_i;
  output [16:0]gpio_o;
  output [16:0]gpio_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_main SCL_I" *) input iic_main_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_main SCL_O" *) output iic_main_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_main SCL_T" *) output iic_main_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_main SDA_I" *) input iic_main_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_main SDA_O" *) output iic_main_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_main SDA_T" *) output iic_main_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_00 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_00, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_00;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_01 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_01, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_01;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_02 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_02, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_02;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_03 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_03, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_03;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_04 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_04, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_04;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_05 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_05, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_05;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_06 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_06, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_06;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_07 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_07, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_07;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_08 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_08, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_08;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_09 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_09, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_09;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_10 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_10, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_10;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_11 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_11, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_11;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_12 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_12, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_12;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_13 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_13, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_13;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_14 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_14, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_14;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PS_INTR_15 INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PS_INTR_15, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) input ps_intr_15;
  input rx_clk_in;
  input [11:0]rx_data_in;
  input rx_frame_in;
  input spi0_clk_i;
  output spi0_clk_o;
  output spi0_csn_0_o;
  output spi0_csn_1_o;
  output spi0_csn_2_o;
  input spi0_csn_i;
  input spi0_sdi_i;
  input spi0_sdo_i;
  output spi0_sdo_o;
  output tx_clk_out;
  output [11:0]tx_data_out;
  output tx_frame_out;
  output txnrx;
  input up_enable;
  input up_txnrx;

  wire [15:0]GND_16_dout;
  wire [0:0]GND_1_dout;
  wire [31:0]S00_AXI_1_ARADDR;
  wire [1:0]S00_AXI_1_ARBURST;
  wire [3:0]S00_AXI_1_ARCACHE;
  wire [11:0]S00_AXI_1_ARID;
  wire [3:0]S00_AXI_1_ARLEN;
  wire [1:0]S00_AXI_1_ARLOCK;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [3:0]S00_AXI_1_ARQOS;
  wire S00_AXI_1_ARREADY;
  wire [2:0]S00_AXI_1_ARSIZE;
  wire S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [1:0]S00_AXI_1_AWBURST;
  wire [3:0]S00_AXI_1_AWCACHE;
  wire [11:0]S00_AXI_1_AWID;
  wire [3:0]S00_AXI_1_AWLEN;
  wire [1:0]S00_AXI_1_AWLOCK;
  wire [2:0]S00_AXI_1_AWPROT;
  wire [3:0]S00_AXI_1_AWQOS;
  wire S00_AXI_1_AWREADY;
  wire [2:0]S00_AXI_1_AWSIZE;
  wire S00_AXI_1_AWVALID;
  wire [11:0]S00_AXI_1_BID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [11:0]S00_AXI_1_RID;
  wire S00_AXI_1_RLAST;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire [11:0]S00_AXI_1_WID;
  wire S00_AXI_1_WLAST;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire [28:0]S00_AXI_2_AWADDR;
  wire [1:0]S00_AXI_2_AWBURST;
  wire [3:0]S00_AXI_2_AWCACHE;
  wire [3:0]S00_AXI_2_AWLEN;
  wire [2:0]S00_AXI_2_AWPROT;
  wire S00_AXI_2_AWREADY;
  wire [2:0]S00_AXI_2_AWSIZE;
  wire S00_AXI_2_AWVALID;
  wire S00_AXI_2_BREADY;
  wire [1:0]S00_AXI_2_BRESP;
  wire S00_AXI_2_BVALID;
  wire [63:0]S00_AXI_2_WDATA;
  wire S00_AXI_2_WLAST;
  wire S00_AXI_2_WREADY;
  wire [7:0]S00_AXI_2_WSTRB;
  wire S00_AXI_2_WVALID;
  wire [28:0]S00_AXI_3_ARADDR;
  wire [1:0]S00_AXI_3_ARBURST;
  wire [3:0]S00_AXI_3_ARCACHE;
  wire [3:0]S00_AXI_3_ARLEN;
  wire [2:0]S00_AXI_3_ARPROT;
  wire S00_AXI_3_ARREADY;
  wire [2:0]S00_AXI_3_ARSIZE;
  wire S00_AXI_3_ARVALID;
  wire [63:0]S00_AXI_3_RDATA;
  wire S00_AXI_3_RLAST;
  wire S00_AXI_3_RREADY;
  wire [1:0]S00_AXI_3_RRESP;
  wire S00_AXI_3_RVALID;
  wire [15:0]axi_ad9361_adc_data_i0;
  wire [15:0]axi_ad9361_adc_data_q0;
  wire axi_ad9361_adc_dma_fifo_wr_overflow;
  wire axi_ad9361_adc_dma_irq;
  wire axi_ad9361_adc_valid_i0;
  wire [31:0]axi_ad9361_dac_dma_fifo_rd_dout;
  wire axi_ad9361_dac_dma_fifo_rd_underflow;
  wire axi_ad9361_dac_dma_fifo_rd_valid;
  wire axi_ad9361_dac_dma_irq;
  wire axi_ad9361_dac_valid_i0;
  wire axi_ad9361_enable;
  wire axi_ad9361_l_clk;
  wire axi_ad9361_rst;
  wire axi_ad9361_tx_clk_out;
  wire [11:0]axi_ad9361_tx_data_out;
  wire axi_ad9361_tx_frame_out;
  wire axi_ad9361_txnrx;
  wire [31:0]axi_ad9361_up_adc_gpio_out;
  wire [31:0]axi_ad9361_up_dac_gpio_out;
  wire [31:0]axi_cpu_interconnect_M00_AXI_ARADDR;
  wire axi_cpu_interconnect_M00_AXI_ARREADY;
  wire [0:0]axi_cpu_interconnect_M00_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M00_AXI_AWADDR;
  wire axi_cpu_interconnect_M00_AXI_AWREADY;
  wire [0:0]axi_cpu_interconnect_M00_AXI_AWVALID;
  wire [0:0]axi_cpu_interconnect_M00_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M00_AXI_BRESP;
  wire axi_cpu_interconnect_M00_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M00_AXI_RDATA;
  wire [0:0]axi_cpu_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M00_AXI_RRESP;
  wire axi_cpu_interconnect_M00_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M00_AXI_WDATA;
  wire axi_cpu_interconnect_M00_AXI_WREADY;
  wire [3:0]axi_cpu_interconnect_M00_AXI_WSTRB;
  wire [0:0]axi_cpu_interconnect_M00_AXI_WVALID;
  wire [31:0]axi_cpu_interconnect_M01_AXI_ARADDR;
  wire [2:0]axi_cpu_interconnect_M01_AXI_ARPROT;
  wire axi_cpu_interconnect_M01_AXI_ARREADY;
  wire axi_cpu_interconnect_M01_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M01_AXI_AWADDR;
  wire [2:0]axi_cpu_interconnect_M01_AXI_AWPROT;
  wire axi_cpu_interconnect_M01_AXI_AWREADY;
  wire axi_cpu_interconnect_M01_AXI_AWVALID;
  wire axi_cpu_interconnect_M01_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M01_AXI_BRESP;
  wire axi_cpu_interconnect_M01_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M01_AXI_RDATA;
  wire axi_cpu_interconnect_M01_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M01_AXI_RRESP;
  wire axi_cpu_interconnect_M01_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M01_AXI_WDATA;
  wire axi_cpu_interconnect_M01_AXI_WREADY;
  wire [3:0]axi_cpu_interconnect_M01_AXI_WSTRB;
  wire axi_cpu_interconnect_M01_AXI_WVALID;
  wire [31:0]axi_cpu_interconnect_M02_AXI_ARADDR;
  wire [2:0]axi_cpu_interconnect_M02_AXI_ARPROT;
  wire axi_cpu_interconnect_M02_AXI_ARREADY;
  wire axi_cpu_interconnect_M02_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M02_AXI_AWADDR;
  wire [2:0]axi_cpu_interconnect_M02_AXI_AWPROT;
  wire axi_cpu_interconnect_M02_AXI_AWREADY;
  wire axi_cpu_interconnect_M02_AXI_AWVALID;
  wire axi_cpu_interconnect_M02_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M02_AXI_BRESP;
  wire axi_cpu_interconnect_M02_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M02_AXI_RDATA;
  wire axi_cpu_interconnect_M02_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M02_AXI_RRESP;
  wire axi_cpu_interconnect_M02_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M02_AXI_WDATA;
  wire axi_cpu_interconnect_M02_AXI_WREADY;
  wire [3:0]axi_cpu_interconnect_M02_AXI_WSTRB;
  wire axi_cpu_interconnect_M02_AXI_WVALID;
  wire [31:0]axi_cpu_interconnect_M03_AXI_ARADDR;
  wire [2:0]axi_cpu_interconnect_M03_AXI_ARPROT;
  wire axi_cpu_interconnect_M03_AXI_ARREADY;
  wire axi_cpu_interconnect_M03_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M03_AXI_AWADDR;
  wire [2:0]axi_cpu_interconnect_M03_AXI_AWPROT;
  wire axi_cpu_interconnect_M03_AXI_AWREADY;
  wire axi_cpu_interconnect_M03_AXI_AWVALID;
  wire axi_cpu_interconnect_M03_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M03_AXI_BRESP;
  wire axi_cpu_interconnect_M03_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M03_AXI_RDATA;
  wire axi_cpu_interconnect_M03_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M03_AXI_RRESP;
  wire axi_cpu_interconnect_M03_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M03_AXI_WDATA;
  wire axi_cpu_interconnect_M03_AXI_WREADY;
  wire [3:0]axi_cpu_interconnect_M03_AXI_WSTRB;
  wire axi_cpu_interconnect_M03_AXI_WVALID;
  wire [31:0]axi_cpu_interconnect_M04_AXI_ARADDR;
  wire [2:0]axi_cpu_interconnect_M04_AXI_ARPROT;
  wire axi_cpu_interconnect_M04_AXI_ARREADY;
  wire axi_cpu_interconnect_M04_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M04_AXI_AWADDR;
  wire [2:0]axi_cpu_interconnect_M04_AXI_AWPROT;
  wire axi_cpu_interconnect_M04_AXI_AWREADY;
  wire axi_cpu_interconnect_M04_AXI_AWVALID;
  wire axi_cpu_interconnect_M04_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M04_AXI_BRESP;
  wire axi_cpu_interconnect_M04_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M04_AXI_RDATA;
  wire axi_cpu_interconnect_M04_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M04_AXI_RRESP;
  wire axi_cpu_interconnect_M04_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M04_AXI_WDATA;
  wire axi_cpu_interconnect_M04_AXI_WREADY;
  wire [3:0]axi_cpu_interconnect_M04_AXI_WSTRB;
  wire axi_cpu_interconnect_M04_AXI_WVALID;
  wire [31:0]axi_cpu_interconnect_M05_AXI_ARADDR;
  wire axi_cpu_interconnect_M05_AXI_ARREADY;
  wire axi_cpu_interconnect_M05_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M05_AXI_AWADDR;
  wire axi_cpu_interconnect_M05_AXI_AWREADY;
  wire axi_cpu_interconnect_M05_AXI_AWVALID;
  wire axi_cpu_interconnect_M05_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M05_AXI_BRESP;
  wire axi_cpu_interconnect_M05_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M05_AXI_RDATA;
  wire axi_cpu_interconnect_M05_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M05_AXI_RRESP;
  wire axi_cpu_interconnect_M05_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M05_AXI_WDATA;
  wire axi_cpu_interconnect_M05_AXI_WREADY;
  wire axi_cpu_interconnect_M05_AXI_WVALID;
  wire [31:0]axi_cpu_interconnect_M06_AXI_ARADDR;
  wire [2:0]axi_cpu_interconnect_M06_AXI_ARPROT;
  wire axi_cpu_interconnect_M06_AXI_ARREADY;
  wire axi_cpu_interconnect_M06_AXI_ARVALID;
  wire [31:0]axi_cpu_interconnect_M06_AXI_AWADDR;
  wire [2:0]axi_cpu_interconnect_M06_AXI_AWPROT;
  wire axi_cpu_interconnect_M06_AXI_AWREADY;
  wire axi_cpu_interconnect_M06_AXI_AWVALID;
  wire axi_cpu_interconnect_M06_AXI_BREADY;
  wire [1:0]axi_cpu_interconnect_M06_AXI_BRESP;
  wire axi_cpu_interconnect_M06_AXI_BVALID;
  wire [31:0]axi_cpu_interconnect_M06_AXI_RDATA;
  wire axi_cpu_interconnect_M06_AXI_RREADY;
  wire [1:0]axi_cpu_interconnect_M06_AXI_RRESP;
  wire axi_cpu_interconnect_M06_AXI_RVALID;
  wire [31:0]axi_cpu_interconnect_M06_AXI_WDATA;
  wire axi_cpu_interconnect_M06_AXI_WREADY;
  wire [3:0]axi_cpu_interconnect_M06_AXI_WSTRB;
  wire axi_cpu_interconnect_M06_AXI_WVALID;
  wire [28:0]axi_hp1_interconnect_M00_AXI_AWADDR;
  wire [1:0]axi_hp1_interconnect_M00_AXI_AWBURST;
  wire [3:0]axi_hp1_interconnect_M00_AXI_AWCACHE;
  wire [3:0]axi_hp1_interconnect_M00_AXI_AWLEN;
  wire [2:0]axi_hp1_interconnect_M00_AXI_AWPROT;
  wire axi_hp1_interconnect_M00_AXI_AWREADY;
  wire [2:0]axi_hp1_interconnect_M00_AXI_AWSIZE;
  wire axi_hp1_interconnect_M00_AXI_AWVALID;
  wire axi_hp1_interconnect_M00_AXI_BREADY;
  wire [1:0]axi_hp1_interconnect_M00_AXI_BRESP;
  wire axi_hp1_interconnect_M00_AXI_BVALID;
  wire [63:0]axi_hp1_interconnect_M00_AXI_WDATA;
  wire axi_hp1_interconnect_M00_AXI_WLAST;
  wire axi_hp1_interconnect_M00_AXI_WREADY;
  wire [7:0]axi_hp1_interconnect_M00_AXI_WSTRB;
  wire axi_hp1_interconnect_M00_AXI_WVALID;
  wire [28:0]axi_hp2_interconnect_M00_AXI_ARADDR;
  wire [1:0]axi_hp2_interconnect_M00_AXI_ARBURST;
  wire [3:0]axi_hp2_interconnect_M00_AXI_ARCACHE;
  wire [3:0]axi_hp2_interconnect_M00_AXI_ARLEN;
  wire [2:0]axi_hp2_interconnect_M00_AXI_ARPROT;
  wire axi_hp2_interconnect_M00_AXI_ARREADY;
  wire [2:0]axi_hp2_interconnect_M00_AXI_ARSIZE;
  wire axi_hp2_interconnect_M00_AXI_ARVALID;
  wire [63:0]axi_hp2_interconnect_M00_AXI_RDATA;
  wire axi_hp2_interconnect_M00_AXI_RLAST;
  wire axi_hp2_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_hp2_interconnect_M00_AXI_RRESP;
  wire axi_hp2_interconnect_M00_AXI_RVALID;
  wire axi_iic_main_IIC_SCL_I;
  wire axi_iic_main_IIC_SCL_O;
  wire axi_iic_main_IIC_SCL_T;
  wire axi_iic_main_IIC_SDA_I;
  wire axi_iic_main_IIC_SDA_O;
  wire axi_iic_main_IIC_SDA_T;
  wire axi_iic_main_iic2intc_irpt;
  wire axis2Complex_data_out_DATA_CLK;
  wire axis2Complex_data_out_DATA_EN;
  wire [15:0]axis2Complex_data_out_DATA_I;
  wire [15:0]axis2Complex_data_out_DATA_Q;
  wire axis2Complex_data_out_DATA_RST;
  wire [31:0]cplx_to_axis_m00_axis_TDATA;
  wire cplx_to_axis_m00_axis_TREADY;
  wire cplx_to_axis_m00_axis_TVALID;
  wire [0:0]decim_slice_Dout;
  wire duppl_data1_out_DATA_CLK;
  wire duppl_data1_out_DATA_EN;
  wire [15:0]duppl_data1_out_DATA_I;
  wire [15:0]duppl_data1_out_DATA_Q;
  wire duppl_data1_out_DATA_RST;
  wire duppl_data2_out_DATA_CLK;
  wire duppl_data2_out_DATA_EN;
  wire duppl_data2_out_DATA_EOF;
  wire [15:0]duppl_data2_out_DATA_I;
  wire [15:0]duppl_data2_out_DATA_Q;
  wire duppl_data2_out_DATA_RST;
  wire duppl_xcorr_data1_out_DATA_CLK;
  wire duppl_xcorr_data1_out_DATA_EN;
  wire [15:0]duppl_xcorr_data1_out_DATA_I;
  wire [15:0]duppl_xcorr_data1_out_DATA_Q;
  wire duppl_xcorr_data1_out_DATA_RST;
  wire duppl_xcorr_data2_out_DATA_CLK;
  wire duppl_xcorr_data2_out_DATA_EN;
  wire [15:0]duppl_xcorr_data2_out_DATA_I;
  wire [15:0]duppl_xcorr_data2_out_DATA_Q;
  wire duppl_xcorr_data2_out_DATA_RST;
  wire fifo2Cplx_data_out_DATA_CLK;
  wire fifo2Cplx_data_out_DATA_EN;
  wire [15:0]fifo2Cplx_data_out_DATA_I;
  wire [15:0]fifo2Cplx_data_out_DATA_Q;
  wire fifo2Cplx_data_out_DATA_RST;
  wire [31:0]fifo_clk_x_M_AXIS_TDATA;
  wire fifo_clk_x_M_AXIS_TREADY;
  wire fifo_clk_x_M_AXIS_TVALID;
  wire [31:0]fir_decimator_m_axis_data_tdata;
  wire fir_decimator_m_axis_data_tvalid;
  wire [15:0]fir_interpolator_channel_0;
  wire [15:0]fir_interpolator_channel_1;
  wire fir_interpolator_s_axis_data_tready;
  wire [16:0]gpio_i_1;
  wire [0:0]interp_slice_Dout;
  wire mixer_data_out_DATA_CLK;
  wire mixer_data_out_DATA_EN;
  wire [15:0]mixer_data_out_DATA_I;
  wire [15:0]mixer_data_out_DATA_Q;
  wire mixer_data_out_DATA_RST;
  wire nco_cos_fake_o;
  wire nco_sine_out_DATA_CLK;
  wire nco_sine_out_DATA_EN;
  wire [15:0]nco_sine_out_DATA_I;
  wire [15:0]nco_sine_out_DATA_Q;
  wire nco_sine_out_DATA_RST;
  wire prn1_gen_prn_o;
  wire prn4_gen_prn_o;
  wire ps_intr_00_1;
  wire ps_intr_01_1;
  wire ps_intr_02_1;
  wire ps_intr_03_1;
  wire ps_intr_04_1;
  wire ps_intr_05_1;
  wire ps_intr_06_1;
  wire ps_intr_07_1;
  wire ps_intr_08_1;
  wire ps_intr_09_1;
  wire ps_intr_10_1;
  wire ps_intr_11_1;
  wire ps_intr_12_1;
  wire ps_intr_13_1;
  wire ps_intr_14_1;
  wire ps_intr_15_1;
  wire rx_clk_in_1;
  wire [11:0]rx_data_in_1;
  wire rx_frame_in_1;
  wire spi0_clk_i_1;
  wire spi0_csn_i_1;
  wire spi0_sdi_i_1;
  wire spi0_sdo_i_1;
  wire sys_200m_clk;
  wire [15:0]sys_concat_intc_dout;
  wire sys_cpu_clk;
  wire [0:0]sys_cpu_reset;
  wire [0:0]sys_cpu_resetn;
  wire [14:0]sys_ps7_DDR_ADDR;
  wire [2:0]sys_ps7_DDR_BA;
  wire sys_ps7_DDR_CAS_N;
  wire sys_ps7_DDR_CKE;
  wire sys_ps7_DDR_CK_N;
  wire sys_ps7_DDR_CK_P;
  wire sys_ps7_DDR_CS_N;
  wire [1:0]sys_ps7_DDR_DM;
  wire [15:0]sys_ps7_DDR_DQ;
  wire [1:0]sys_ps7_DDR_DQS_N;
  wire [1:0]sys_ps7_DDR_DQS_P;
  wire sys_ps7_DDR_ODT;
  wire sys_ps7_DDR_RAS_N;
  wire sys_ps7_DDR_RESET_N;
  wire sys_ps7_DDR_WE_N;
  wire sys_ps7_FCLK_RESET0_N;
  wire sys_ps7_FIXED_IO_DDR_VRN;
  wire sys_ps7_FIXED_IO_DDR_VRP;
  wire [31:0]sys_ps7_FIXED_IO_MIO;
  wire sys_ps7_FIXED_IO_PS_CLK;
  wire sys_ps7_FIXED_IO_PS_PORB;
  wire sys_ps7_FIXED_IO_PS_SRSTB;
  wire [16:0]sys_ps7_GPIO_O;
  wire [16:0]sys_ps7_GPIO_T;
  wire sys_ps7_SPI0_MOSI_O;
  wire sys_ps7_SPI0_SCLK_O;
  wire sys_ps7_SPI0_SS1_O;
  wire sys_ps7_SPI0_SS2_O;
  wire sys_ps7_SPI0_SS_O;
  wire up_enable_1;
  wire up_txnrx_1;
  wire use_nco_data_out_DATA_CLK;
  wire use_nco_data_out_DATA_EN;
  wire [15:0]use_nco_data_out_DATA_I;
  wire [15:0]use_nco_data_out_DATA_Q;
  wire use_nco_data_out_DATA_RST;
  wire xcorr1_data_out_DATA_CLK;
  wire xcorr1_data_out_DATA_EN;
  wire [31:0]xcorr1_data_out_DATA_I;
  wire [31:0]xcorr1_data_out_DATA_Q;
  wire xcorr1_data_out_DATA_RST;
  wire xcorr1_prn_sync_o;
  wire xcorr4_data_out_DATA_CLK;
  wire xcorr4_data_out_DATA_EN;
  wire [31:0]xcorr4_data_out_DATA_I;
  wire [31:0]xcorr4_data_out_DATA_Q;
  wire xcorr4_data_out_DATA_RST;
  wire xcorr4_prn_sync_o;

  assign axi_iic_main_IIC_SCL_I = iic_main_scl_i;
  assign axi_iic_main_IIC_SDA_I = iic_main_sda_i;
  assign cos_fake_o = nco_cos_fake_o;
  assign enable = axi_ad9361_enable;
  assign gpio_i_1 = gpio_i[16:0];
  assign gpio_o[16:0] = sys_ps7_GPIO_O;
  assign gpio_t[16:0] = sys_ps7_GPIO_T;
  assign iic_main_scl_o = axi_iic_main_IIC_SCL_O;
  assign iic_main_scl_t = axi_iic_main_IIC_SCL_T;
  assign iic_main_sda_o = axi_iic_main_IIC_SDA_O;
  assign iic_main_sda_t = axi_iic_main_IIC_SDA_T;
  assign ps_intr_00_1 = ps_intr_00;
  assign ps_intr_01_1 = ps_intr_01;
  assign ps_intr_02_1 = ps_intr_02;
  assign ps_intr_03_1 = ps_intr_03;
  assign ps_intr_04_1 = ps_intr_04;
  assign ps_intr_05_1 = ps_intr_05;
  assign ps_intr_06_1 = ps_intr_06;
  assign ps_intr_07_1 = ps_intr_07;
  assign ps_intr_08_1 = ps_intr_08;
  assign ps_intr_09_1 = ps_intr_09;
  assign ps_intr_10_1 = ps_intr_10;
  assign ps_intr_11_1 = ps_intr_11;
  assign ps_intr_12_1 = ps_intr_12;
  assign ps_intr_13_1 = ps_intr_13;
  assign ps_intr_14_1 = ps_intr_14;
  assign ps_intr_15_1 = ps_intr_15;
  assign rx_clk_in_1 = rx_clk_in;
  assign rx_data_in_1 = rx_data_in[11:0];
  assign rx_frame_in_1 = rx_frame_in;
  assign spi0_clk_i_1 = spi0_clk_i;
  assign spi0_clk_o = sys_ps7_SPI0_SCLK_O;
  assign spi0_csn_0_o = sys_ps7_SPI0_SS_O;
  assign spi0_csn_1_o = sys_ps7_SPI0_SS1_O;
  assign spi0_csn_2_o = sys_ps7_SPI0_SS2_O;
  assign spi0_csn_i_1 = spi0_csn_i;
  assign spi0_sdi_i_1 = spi0_sdi_i;
  assign spi0_sdo_i_1 = spi0_sdo_i;
  assign spi0_sdo_o = sys_ps7_SPI0_MOSI_O;
  assign tx_clk_out = axi_ad9361_tx_clk_out;
  assign tx_data_out[11:0] = axi_ad9361_tx_data_out;
  assign tx_frame_out = axi_ad9361_tx_frame_out;
  assign txnrx = axi_ad9361_txnrx;
  assign up_enable_1 = up_enable;
  assign up_txnrx_1 = up_txnrx;
  system_GND_1_0 GND_1
       (.dout(GND_1_dout));
  system_GND_16_0 GND_16
       (.dout(GND_16_dout));
  system_axi_ad9361_0 axi_ad9361
       (.adc_data_i0(axi_ad9361_adc_data_i0),
        .adc_data_q0(axi_ad9361_adc_data_q0),
        .adc_dovf(axi_ad9361_adc_dma_fifo_wr_overflow),
        .adc_valid_i0(axi_ad9361_adc_valid_i0),
        .clk(axi_ad9361_l_clk),
        .dac_data_i0(fir_interpolator_channel_0),
        .dac_data_i1(GND_16_dout),
        .dac_data_q0(fir_interpolator_channel_1),
        .dac_data_q1(GND_16_dout),
        .dac_dunf(axi_ad9361_dac_dma_fifo_rd_underflow),
        .dac_sync_in(1'b0),
        .dac_valid_i0(axi_ad9361_dac_valid_i0),
        .delay_clk(sys_200m_clk),
        .enable(axi_ad9361_enable),
        .gps_pps(1'b0),
        .l_clk(axi_ad9361_l_clk),
        .rst(axi_ad9361_rst),
        .rx_clk_in(rx_clk_in_1),
        .rx_data_in(rx_data_in_1),
        .rx_frame_in(rx_frame_in_1),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_cpu_interconnect_M01_AXI_ARADDR[15:0]),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_cpu_interconnect_M01_AXI_ARPROT),
        .s_axi_arready(axi_cpu_interconnect_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_cpu_interconnect_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_cpu_interconnect_M01_AXI_AWADDR[15:0]),
        .s_axi_awprot(axi_cpu_interconnect_M01_AXI_AWPROT),
        .s_axi_awready(axi_cpu_interconnect_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_cpu_interconnect_M01_AXI_AWVALID),
        .s_axi_bready(axi_cpu_interconnect_M01_AXI_BREADY),
        .s_axi_bresp(axi_cpu_interconnect_M01_AXI_BRESP),
        .s_axi_bvalid(axi_cpu_interconnect_M01_AXI_BVALID),
        .s_axi_rdata(axi_cpu_interconnect_M01_AXI_RDATA),
        .s_axi_rready(axi_cpu_interconnect_M01_AXI_RREADY),
        .s_axi_rresp(axi_cpu_interconnect_M01_AXI_RRESP),
        .s_axi_rvalid(axi_cpu_interconnect_M01_AXI_RVALID),
        .s_axi_wdata(axi_cpu_interconnect_M01_AXI_WDATA),
        .s_axi_wready(axi_cpu_interconnect_M01_AXI_WREADY),
        .s_axi_wstrb(axi_cpu_interconnect_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_cpu_interconnect_M01_AXI_WVALID),
        .tdd_sync(GND_1_dout),
        .tx_clk_out(axi_ad9361_tx_clk_out),
        .tx_data_out(axi_ad9361_tx_data_out),
        .tx_frame_out(axi_ad9361_tx_frame_out),
        .txnrx(axi_ad9361_txnrx),
        .up_adc_gpio_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .up_adc_gpio_out(axi_ad9361_up_adc_gpio_out),
        .up_dac_gpio_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .up_dac_gpio_out(axi_ad9361_up_dac_gpio_out),
        .up_enable(up_enable_1),
        .up_txnrx(up_txnrx_1));
  system_axi_ad9361_adc_dma_0 axi_ad9361_adc_dma
       (.fifo_wr_clk(axi_ad9361_l_clk),
        .fifo_wr_din(fir_decimator_m_axis_data_tdata),
        .fifo_wr_en(fir_decimator_m_axis_data_tvalid),
        .fifo_wr_overflow(axi_ad9361_adc_dma_fifo_wr_overflow),
        .fifo_wr_sync(1'b0),
        .irq(axi_ad9361_adc_dma_irq),
        .m_dest_axi_aclk(sys_cpu_clk),
        .m_dest_axi_aresetn(sys_cpu_resetn),
        .m_dest_axi_awaddr(S00_AXI_2_AWADDR),
        .m_dest_axi_awburst(S00_AXI_2_AWBURST),
        .m_dest_axi_awcache(S00_AXI_2_AWCACHE),
        .m_dest_axi_awlen(S00_AXI_2_AWLEN),
        .m_dest_axi_awprot(S00_AXI_2_AWPROT),
        .m_dest_axi_awready(S00_AXI_2_AWREADY),
        .m_dest_axi_awsize(S00_AXI_2_AWSIZE),
        .m_dest_axi_awvalid(S00_AXI_2_AWVALID),
        .m_dest_axi_bready(S00_AXI_2_BREADY),
        .m_dest_axi_bresp(S00_AXI_2_BRESP),
        .m_dest_axi_bvalid(S00_AXI_2_BVALID),
        .m_dest_axi_wdata(S00_AXI_2_WDATA),
        .m_dest_axi_wlast(S00_AXI_2_WLAST),
        .m_dest_axi_wready(S00_AXI_2_WREADY),
        .m_dest_axi_wstrb(S00_AXI_2_WSTRB),
        .m_dest_axi_wvalid(S00_AXI_2_WVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_cpu_interconnect_M02_AXI_ARADDR[11:0]),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_cpu_interconnect_M02_AXI_ARPROT),
        .s_axi_arready(axi_cpu_interconnect_M02_AXI_ARREADY),
        .s_axi_arvalid(axi_cpu_interconnect_M02_AXI_ARVALID),
        .s_axi_awaddr(axi_cpu_interconnect_M02_AXI_AWADDR[11:0]),
        .s_axi_awprot(axi_cpu_interconnect_M02_AXI_AWPROT),
        .s_axi_awready(axi_cpu_interconnect_M02_AXI_AWREADY),
        .s_axi_awvalid(axi_cpu_interconnect_M02_AXI_AWVALID),
        .s_axi_bready(axi_cpu_interconnect_M02_AXI_BREADY),
        .s_axi_bresp(axi_cpu_interconnect_M02_AXI_BRESP),
        .s_axi_bvalid(axi_cpu_interconnect_M02_AXI_BVALID),
        .s_axi_rdata(axi_cpu_interconnect_M02_AXI_RDATA),
        .s_axi_rready(axi_cpu_interconnect_M02_AXI_RREADY),
        .s_axi_rresp(axi_cpu_interconnect_M02_AXI_RRESP),
        .s_axi_rvalid(axi_cpu_interconnect_M02_AXI_RVALID),
        .s_axi_wdata(axi_cpu_interconnect_M02_AXI_WDATA),
        .s_axi_wready(axi_cpu_interconnect_M02_AXI_WREADY),
        .s_axi_wstrb(axi_cpu_interconnect_M02_AXI_WSTRB),
        .s_axi_wvalid(axi_cpu_interconnect_M02_AXI_WVALID));
  system_axi_ad9361_dac_dma_0 axi_ad9361_dac_dma
       (.fifo_rd_clk(axi_ad9361_l_clk),
        .fifo_rd_dout(axi_ad9361_dac_dma_fifo_rd_dout),
        .fifo_rd_en(fir_interpolator_s_axis_data_tready),
        .fifo_rd_underflow(axi_ad9361_dac_dma_fifo_rd_underflow),
        .fifo_rd_valid(axi_ad9361_dac_dma_fifo_rd_valid),
        .irq(axi_ad9361_dac_dma_irq),
        .m_src_axi_aclk(sys_cpu_clk),
        .m_src_axi_araddr(S00_AXI_3_ARADDR),
        .m_src_axi_arburst(S00_AXI_3_ARBURST),
        .m_src_axi_arcache(S00_AXI_3_ARCACHE),
        .m_src_axi_aresetn(sys_cpu_resetn),
        .m_src_axi_arlen(S00_AXI_3_ARLEN),
        .m_src_axi_arprot(S00_AXI_3_ARPROT),
        .m_src_axi_arready(S00_AXI_3_ARREADY),
        .m_src_axi_arsize(S00_AXI_3_ARSIZE),
        .m_src_axi_arvalid(S00_AXI_3_ARVALID),
        .m_src_axi_rdata(S00_AXI_3_RDATA),
        .m_src_axi_rlast(S00_AXI_3_RLAST),
        .m_src_axi_rready(S00_AXI_3_RREADY),
        .m_src_axi_rresp(S00_AXI_3_RRESP),
        .m_src_axi_rvalid(S00_AXI_3_RVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_cpu_interconnect_M03_AXI_ARADDR[11:0]),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(axi_cpu_interconnect_M03_AXI_ARPROT),
        .s_axi_arready(axi_cpu_interconnect_M03_AXI_ARREADY),
        .s_axi_arvalid(axi_cpu_interconnect_M03_AXI_ARVALID),
        .s_axi_awaddr(axi_cpu_interconnect_M03_AXI_AWADDR[11:0]),
        .s_axi_awprot(axi_cpu_interconnect_M03_AXI_AWPROT),
        .s_axi_awready(axi_cpu_interconnect_M03_AXI_AWREADY),
        .s_axi_awvalid(axi_cpu_interconnect_M03_AXI_AWVALID),
        .s_axi_bready(axi_cpu_interconnect_M03_AXI_BREADY),
        .s_axi_bresp(axi_cpu_interconnect_M03_AXI_BRESP),
        .s_axi_bvalid(axi_cpu_interconnect_M03_AXI_BVALID),
        .s_axi_rdata(axi_cpu_interconnect_M03_AXI_RDATA),
        .s_axi_rready(axi_cpu_interconnect_M03_AXI_RREADY),
        .s_axi_rresp(axi_cpu_interconnect_M03_AXI_RRESP),
        .s_axi_rvalid(axi_cpu_interconnect_M03_AXI_RVALID),
        .s_axi_wdata(axi_cpu_interconnect_M03_AXI_WDATA),
        .s_axi_wready(axi_cpu_interconnect_M03_AXI_WREADY),
        .s_axi_wstrb(axi_cpu_interconnect_M03_AXI_WSTRB),
        .s_axi_wvalid(axi_cpu_interconnect_M03_AXI_WVALID));
  system_axi_cpu_interconnect_0 axi_cpu_interconnect
       (.ACLK(sys_cpu_clk),
        .ARESETN(sys_cpu_resetn),
        .M00_ACLK(sys_cpu_clk),
        .M00_ARESETN(sys_cpu_resetn),
        .M00_AXI_araddr(axi_cpu_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_cpu_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_cpu_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_cpu_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_cpu_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_cpu_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_cpu_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_cpu_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_cpu_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_cpu_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(axi_cpu_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_cpu_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_cpu_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_cpu_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(axi_cpu_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_cpu_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_cpu_interconnect_M00_AXI_WVALID),
        .M01_ACLK(sys_cpu_clk),
        .M01_ARESETN(sys_cpu_resetn),
        .M01_AXI_araddr(axi_cpu_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(axi_cpu_interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(axi_cpu_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_cpu_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_cpu_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(axi_cpu_interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(axi_cpu_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_cpu_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_cpu_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_cpu_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_cpu_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_cpu_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(axi_cpu_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_cpu_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_cpu_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_cpu_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(axi_cpu_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_cpu_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_cpu_interconnect_M01_AXI_WVALID),
        .M02_ACLK(sys_cpu_clk),
        .M02_ARESETN(sys_cpu_resetn),
        .M02_AXI_araddr(axi_cpu_interconnect_M02_AXI_ARADDR),
        .M02_AXI_arprot(axi_cpu_interconnect_M02_AXI_ARPROT),
        .M02_AXI_arready(axi_cpu_interconnect_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_cpu_interconnect_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_cpu_interconnect_M02_AXI_AWADDR),
        .M02_AXI_awprot(axi_cpu_interconnect_M02_AXI_AWPROT),
        .M02_AXI_awready(axi_cpu_interconnect_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_cpu_interconnect_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_cpu_interconnect_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_cpu_interconnect_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_cpu_interconnect_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_cpu_interconnect_M02_AXI_RDATA),
        .M02_AXI_rready(axi_cpu_interconnect_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_cpu_interconnect_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_cpu_interconnect_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_cpu_interconnect_M02_AXI_WDATA),
        .M02_AXI_wready(axi_cpu_interconnect_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_cpu_interconnect_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_cpu_interconnect_M02_AXI_WVALID),
        .M03_ACLK(sys_cpu_clk),
        .M03_ARESETN(sys_cpu_resetn),
        .M03_AXI_araddr(axi_cpu_interconnect_M03_AXI_ARADDR),
        .M03_AXI_arprot(axi_cpu_interconnect_M03_AXI_ARPROT),
        .M03_AXI_arready(axi_cpu_interconnect_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_cpu_interconnect_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_cpu_interconnect_M03_AXI_AWADDR),
        .M03_AXI_awprot(axi_cpu_interconnect_M03_AXI_AWPROT),
        .M03_AXI_awready(axi_cpu_interconnect_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_cpu_interconnect_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_cpu_interconnect_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_cpu_interconnect_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_cpu_interconnect_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_cpu_interconnect_M03_AXI_RDATA),
        .M03_AXI_rready(axi_cpu_interconnect_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_cpu_interconnect_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_cpu_interconnect_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_cpu_interconnect_M03_AXI_WDATA),
        .M03_AXI_wready(axi_cpu_interconnect_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_cpu_interconnect_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_cpu_interconnect_M03_AXI_WVALID),
        .M04_ACLK(sys_cpu_clk),
        .M04_ARESETN(sys_cpu_resetn),
        .M04_AXI_araddr(axi_cpu_interconnect_M04_AXI_ARADDR),
        .M04_AXI_arprot(axi_cpu_interconnect_M04_AXI_ARPROT),
        .M04_AXI_arready(axi_cpu_interconnect_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi_cpu_interconnect_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_cpu_interconnect_M04_AXI_AWADDR),
        .M04_AXI_awprot(axi_cpu_interconnect_M04_AXI_AWPROT),
        .M04_AXI_awready(axi_cpu_interconnect_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi_cpu_interconnect_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_cpu_interconnect_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_cpu_interconnect_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_cpu_interconnect_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_cpu_interconnect_M04_AXI_RDATA),
        .M04_AXI_rready(axi_cpu_interconnect_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_cpu_interconnect_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_cpu_interconnect_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_cpu_interconnect_M04_AXI_WDATA),
        .M04_AXI_wready(axi_cpu_interconnect_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi_cpu_interconnect_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi_cpu_interconnect_M04_AXI_WVALID),
        .M05_ACLK(sys_cpu_clk),
        .M05_ARESETN(sys_cpu_resetn),
        .M05_AXI_araddr(axi_cpu_interconnect_M05_AXI_ARADDR),
        .M05_AXI_arready(axi_cpu_interconnect_M05_AXI_ARREADY),
        .M05_AXI_arvalid(axi_cpu_interconnect_M05_AXI_ARVALID),
        .M05_AXI_awaddr(axi_cpu_interconnect_M05_AXI_AWADDR),
        .M05_AXI_awready(axi_cpu_interconnect_M05_AXI_AWREADY),
        .M05_AXI_awvalid(axi_cpu_interconnect_M05_AXI_AWVALID),
        .M05_AXI_bready(axi_cpu_interconnect_M05_AXI_BREADY),
        .M05_AXI_bresp(axi_cpu_interconnect_M05_AXI_BRESP),
        .M05_AXI_bvalid(axi_cpu_interconnect_M05_AXI_BVALID),
        .M05_AXI_rdata(axi_cpu_interconnect_M05_AXI_RDATA),
        .M05_AXI_rready(axi_cpu_interconnect_M05_AXI_RREADY),
        .M05_AXI_rresp(axi_cpu_interconnect_M05_AXI_RRESP),
        .M05_AXI_rvalid(axi_cpu_interconnect_M05_AXI_RVALID),
        .M05_AXI_wdata(axi_cpu_interconnect_M05_AXI_WDATA),
        .M05_AXI_wready(axi_cpu_interconnect_M05_AXI_WREADY),
        .M05_AXI_wvalid(axi_cpu_interconnect_M05_AXI_WVALID),
        .M06_ACLK(sys_cpu_clk),
        .M06_ARESETN(sys_cpu_resetn),
        .M06_AXI_araddr(axi_cpu_interconnect_M06_AXI_ARADDR),
        .M06_AXI_arprot(axi_cpu_interconnect_M06_AXI_ARPROT),
        .M06_AXI_arready(axi_cpu_interconnect_M06_AXI_ARREADY),
        .M06_AXI_arvalid(axi_cpu_interconnect_M06_AXI_ARVALID),
        .M06_AXI_awaddr(axi_cpu_interconnect_M06_AXI_AWADDR),
        .M06_AXI_awprot(axi_cpu_interconnect_M06_AXI_AWPROT),
        .M06_AXI_awready(axi_cpu_interconnect_M06_AXI_AWREADY),
        .M06_AXI_awvalid(axi_cpu_interconnect_M06_AXI_AWVALID),
        .M06_AXI_bready(axi_cpu_interconnect_M06_AXI_BREADY),
        .M06_AXI_bresp(axi_cpu_interconnect_M06_AXI_BRESP),
        .M06_AXI_bvalid(axi_cpu_interconnect_M06_AXI_BVALID),
        .M06_AXI_rdata(axi_cpu_interconnect_M06_AXI_RDATA),
        .M06_AXI_rready(axi_cpu_interconnect_M06_AXI_RREADY),
        .M06_AXI_rresp(axi_cpu_interconnect_M06_AXI_RRESP),
        .M06_AXI_rvalid(axi_cpu_interconnect_M06_AXI_RVALID),
        .M06_AXI_wdata(axi_cpu_interconnect_M06_AXI_WDATA),
        .M06_AXI_wready(axi_cpu_interconnect_M06_AXI_WREADY),
        .M06_AXI_wstrb(axi_cpu_interconnect_M06_AXI_WSTRB),
        .M06_AXI_wvalid(axi_cpu_interconnect_M06_AXI_WVALID),
        .S00_ACLK(sys_cpu_clk),
        .S00_ARESETN(sys_cpu_resetn),
        .S00_AXI_araddr(S00_AXI_1_ARADDR),
        .S00_AXI_arburst(S00_AXI_1_ARBURST),
        .S00_AXI_arcache(S00_AXI_1_ARCACHE),
        .S00_AXI_arid(S00_AXI_1_ARID),
        .S00_AXI_arlen(S00_AXI_1_ARLEN),
        .S00_AXI_arlock(S00_AXI_1_ARLOCK),
        .S00_AXI_arprot(S00_AXI_1_ARPROT),
        .S00_AXI_arqos(S00_AXI_1_ARQOS),
        .S00_AXI_arready(S00_AXI_1_ARREADY),
        .S00_AXI_arsize(S00_AXI_1_ARSIZE),
        .S00_AXI_arvalid(S00_AXI_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_1_AWADDR),
        .S00_AXI_awburst(S00_AXI_1_AWBURST),
        .S00_AXI_awcache(S00_AXI_1_AWCACHE),
        .S00_AXI_awid(S00_AXI_1_AWID),
        .S00_AXI_awlen(S00_AXI_1_AWLEN),
        .S00_AXI_awlock(S00_AXI_1_AWLOCK),
        .S00_AXI_awprot(S00_AXI_1_AWPROT),
        .S00_AXI_awqos(S00_AXI_1_AWQOS),
        .S00_AXI_awready(S00_AXI_1_AWREADY),
        .S00_AXI_awsize(S00_AXI_1_AWSIZE),
        .S00_AXI_awvalid(S00_AXI_1_AWVALID),
        .S00_AXI_bid(S00_AXI_1_BID),
        .S00_AXI_bready(S00_AXI_1_BREADY),
        .S00_AXI_bresp(S00_AXI_1_BRESP),
        .S00_AXI_bvalid(S00_AXI_1_BVALID),
        .S00_AXI_rdata(S00_AXI_1_RDATA),
        .S00_AXI_rid(S00_AXI_1_RID),
        .S00_AXI_rlast(S00_AXI_1_RLAST),
        .S00_AXI_rready(S00_AXI_1_RREADY),
        .S00_AXI_rresp(S00_AXI_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_1_RVALID),
        .S00_AXI_wdata(S00_AXI_1_WDATA),
        .S00_AXI_wid(S00_AXI_1_WID),
        .S00_AXI_wlast(S00_AXI_1_WLAST),
        .S00_AXI_wready(S00_AXI_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_1_WSTRB),
        .S00_AXI_wvalid(S00_AXI_1_WVALID));
  system_axi_hp1_interconnect_0 axi_hp1_interconnect
       (.ACLK(sys_cpu_clk),
        .ARESETN(sys_cpu_resetn),
        .M00_ACLK(sys_cpu_clk),
        .M00_ARESETN(sys_cpu_resetn),
        .M00_AXI_awaddr(axi_hp1_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_hp1_interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_hp1_interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_hp1_interconnect_M00_AXI_AWLEN),
        .M00_AXI_awprot(axi_hp1_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(axi_hp1_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_hp1_interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_hp1_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_hp1_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_hp1_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_hp1_interconnect_M00_AXI_BVALID),
        .M00_AXI_wdata(axi_hp1_interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_hp1_interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(axi_hp1_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_hp1_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_hp1_interconnect_M00_AXI_WVALID),
        .S00_ACLK(sys_cpu_clk),
        .S00_ARESETN(sys_cpu_resetn),
        .S00_AXI_awaddr(S00_AXI_2_AWADDR),
        .S00_AXI_awburst(S00_AXI_2_AWBURST),
        .S00_AXI_awcache(S00_AXI_2_AWCACHE),
        .S00_AXI_awlen(S00_AXI_2_AWLEN),
        .S00_AXI_awprot(S00_AXI_2_AWPROT),
        .S00_AXI_awready(S00_AXI_2_AWREADY),
        .S00_AXI_awsize(S00_AXI_2_AWSIZE),
        .S00_AXI_awvalid(S00_AXI_2_AWVALID),
        .S00_AXI_bready(S00_AXI_2_BREADY),
        .S00_AXI_bresp(S00_AXI_2_BRESP),
        .S00_AXI_bvalid(S00_AXI_2_BVALID),
        .S00_AXI_wdata(S00_AXI_2_WDATA),
        .S00_AXI_wlast(S00_AXI_2_WLAST),
        .S00_AXI_wready(S00_AXI_2_WREADY),
        .S00_AXI_wstrb(S00_AXI_2_WSTRB),
        .S00_AXI_wvalid(S00_AXI_2_WVALID));
  system_axi_hp2_interconnect_0 axi_hp2_interconnect
       (.ACLK(sys_cpu_clk),
        .ARESETN(sys_cpu_resetn),
        .M00_ACLK(sys_cpu_clk),
        .M00_ARESETN(sys_cpu_resetn),
        .M00_AXI_araddr(axi_hp2_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_hp2_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_hp2_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_hp2_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arprot(axi_hp2_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(axi_hp2_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_hp2_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_hp2_interconnect_M00_AXI_ARVALID),
        .M00_AXI_rdata(axi_hp2_interconnect_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_hp2_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(axi_hp2_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_hp2_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_hp2_interconnect_M00_AXI_RVALID),
        .S00_ACLK(sys_cpu_clk),
        .S00_ARESETN(sys_cpu_resetn),
        .S00_AXI_araddr(S00_AXI_3_ARADDR),
        .S00_AXI_arburst(S00_AXI_3_ARBURST),
        .S00_AXI_arcache(S00_AXI_3_ARCACHE),
        .S00_AXI_arlen(S00_AXI_3_ARLEN),
        .S00_AXI_arprot(S00_AXI_3_ARPROT),
        .S00_AXI_arready(S00_AXI_3_ARREADY),
        .S00_AXI_arsize(S00_AXI_3_ARSIZE),
        .S00_AXI_arvalid(S00_AXI_3_ARVALID),
        .S00_AXI_rdata(S00_AXI_3_RDATA),
        .S00_AXI_rlast(S00_AXI_3_RLAST),
        .S00_AXI_rready(S00_AXI_3_RREADY),
        .S00_AXI_rresp(S00_AXI_3_RRESP),
        .S00_AXI_rvalid(S00_AXI_3_RVALID));
  system_axi_iic_main_0 axi_iic_main
       (.iic2intc_irpt(axi_iic_main_iic2intc_irpt),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(axi_cpu_interconnect_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arready(axi_cpu_interconnect_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_cpu_interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_cpu_interconnect_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(axi_cpu_interconnect_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_cpu_interconnect_M00_AXI_AWVALID),
        .s_axi_bready(axi_cpu_interconnect_M00_AXI_BREADY),
        .s_axi_bresp(axi_cpu_interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(axi_cpu_interconnect_M00_AXI_BVALID),
        .s_axi_rdata(axi_cpu_interconnect_M00_AXI_RDATA),
        .s_axi_rready(axi_cpu_interconnect_M00_AXI_RREADY),
        .s_axi_rresp(axi_cpu_interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(axi_cpu_interconnect_M00_AXI_RVALID),
        .s_axi_wdata(axi_cpu_interconnect_M00_AXI_WDATA),
        .s_axi_wready(axi_cpu_interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(axi_cpu_interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_cpu_interconnect_M00_AXI_WVALID),
        .scl_i(axi_iic_main_IIC_SCL_I),
        .scl_o(axi_iic_main_IIC_SCL_O),
        .scl_t(axi_iic_main_IIC_SCL_T),
        .sda_i(axi_iic_main_IIC_SDA_I),
        .sda_o(axi_iic_main_IIC_SDA_O),
        .sda_t(axi_iic_main_IIC_SDA_T));
  system_axis2Complex_0 axis2Complex
       (.data_clk_o(axis2Complex_data_out_DATA_CLK),
        .data_en_o(axis2Complex_data_out_DATA_EN),
        .data_i_o(axis2Complex_data_out_DATA_I),
        .data_q_o(axis2Complex_data_out_DATA_Q),
        .data_rst_o(axis2Complex_data_out_DATA_RST),
        .s00_axis_aclk(axi_ad9361_l_clk),
        .s00_axis_reset(axi_ad9361_rst),
        .s00_axis_tdata(fir_decimator_m_axis_data_tdata),
        .s00_axis_tvalid(fir_decimator_m_axis_data_tvalid));
  system_cplx_to_axis_0 cplx_to_axis
       (.data_clk_i(use_nco_data_out_DATA_CLK),
        .data_en_i(use_nco_data_out_DATA_EN),
        .data_i_i(use_nco_data_out_DATA_I),
        .data_q_i(use_nco_data_out_DATA_Q),
        .data_rst_i(use_nco_data_out_DATA_RST),
        .m00_axis_aclk(axi_ad9361_l_clk),
        .m00_axis_tdata(cplx_to_axis_m00_axis_TDATA),
        .m00_axis_tready(cplx_to_axis_m00_axis_TREADY),
        .m00_axis_tvalid(cplx_to_axis_m00_axis_TVALID));
  system_data_to_ram_0 data_to_ram
       (.data1_clk_i(xcorr1_data_out_DATA_CLK),
        .data1_en_i(xcorr1_data_out_DATA_EN),
        .data1_eof_i(1'b0),
        .data1_i_i(xcorr1_data_out_DATA_I),
        .data1_q_i(xcorr1_data_out_DATA_Q),
        .data1_rst_i(xcorr1_data_out_DATA_RST),
        .data2_clk_i(xcorr4_data_out_DATA_CLK),
        .data2_en_i(xcorr4_data_out_DATA_EN),
        .data2_eof_i(1'b0),
        .data2_i_i(xcorr4_data_out_DATA_I),
        .data2_q_i(xcorr4_data_out_DATA_Q),
        .data2_rst_i(xcorr4_data_out_DATA_RST),
        .s00_axi_aclk(sys_cpu_clk),
        .s00_axi_araddr(axi_cpu_interconnect_M06_AXI_ARADDR[3:0]),
        .s00_axi_arprot(axi_cpu_interconnect_M06_AXI_ARPROT),
        .s00_axi_arready(axi_cpu_interconnect_M06_AXI_ARREADY),
        .s00_axi_arvalid(axi_cpu_interconnect_M06_AXI_ARVALID),
        .s00_axi_awaddr(axi_cpu_interconnect_M06_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_cpu_interconnect_M06_AXI_AWPROT),
        .s00_axi_awready(axi_cpu_interconnect_M06_AXI_AWREADY),
        .s00_axi_awvalid(axi_cpu_interconnect_M06_AXI_AWVALID),
        .s00_axi_bready(axi_cpu_interconnect_M06_AXI_BREADY),
        .s00_axi_bresp(axi_cpu_interconnect_M06_AXI_BRESP),
        .s00_axi_bvalid(axi_cpu_interconnect_M06_AXI_BVALID),
        .s00_axi_rdata(axi_cpu_interconnect_M06_AXI_RDATA),
        .s00_axi_reset(sys_cpu_reset),
        .s00_axi_rready(axi_cpu_interconnect_M06_AXI_RREADY),
        .s00_axi_rresp(axi_cpu_interconnect_M06_AXI_RRESP),
        .s00_axi_rvalid(axi_cpu_interconnect_M06_AXI_RVALID),
        .s00_axi_wdata(axi_cpu_interconnect_M06_AXI_WDATA),
        .s00_axi_wready(axi_cpu_interconnect_M06_AXI_WREADY),
        .s00_axi_wstrb(axi_cpu_interconnect_M06_AXI_WSTRB),
        .s00_axi_wvalid(axi_cpu_interconnect_M06_AXI_WVALID));
  system_decim_slice_0 decim_slice
       (.Din(axi_ad9361_up_adc_gpio_out),
        .Dout(decim_slice_Dout));
  system_duppl_0 duppl
       (.data1_clk_o(duppl_data1_out_DATA_CLK),
        .data1_en_o(duppl_data1_out_DATA_EN),
        .data1_i_o(duppl_data1_out_DATA_I),
        .data1_q_o(duppl_data1_out_DATA_Q),
        .data1_rst_o(duppl_data1_out_DATA_RST),
        .data2_clk_o(duppl_data2_out_DATA_CLK),
        .data2_en_o(duppl_data2_out_DATA_EN),
        .data2_eof_o(duppl_data2_out_DATA_EOF),
        .data2_i_o(duppl_data2_out_DATA_I),
        .data2_q_o(duppl_data2_out_DATA_Q),
        .data2_rst_o(duppl_data2_out_DATA_RST),
        .data_clk_i(axis2Complex_data_out_DATA_CLK),
        .data_en_i(axis2Complex_data_out_DATA_EN),
        .data_eof_i(1'b0),
        .data_i_i(axis2Complex_data_out_DATA_I),
        .data_q_i(axis2Complex_data_out_DATA_Q),
        .data_rst_i(axis2Complex_data_out_DATA_RST));
  system_duppl_xcorr_0 duppl_xcorr
       (.data1_clk_o(duppl_xcorr_data1_out_DATA_CLK),
        .data1_en_o(duppl_xcorr_data1_out_DATA_EN),
        .data1_i_o(duppl_xcorr_data1_out_DATA_I),
        .data1_q_o(duppl_xcorr_data1_out_DATA_Q),
        .data1_rst_o(duppl_xcorr_data1_out_DATA_RST),
        .data2_clk_o(duppl_xcorr_data2_out_DATA_CLK),
        .data2_en_o(duppl_xcorr_data2_out_DATA_EN),
        .data2_i_o(duppl_xcorr_data2_out_DATA_I),
        .data2_q_o(duppl_xcorr_data2_out_DATA_Q),
        .data2_rst_o(duppl_xcorr_data2_out_DATA_RST),
        .data_clk_i(fifo2Cplx_data_out_DATA_CLK),
        .data_en_i(fifo2Cplx_data_out_DATA_EN),
        .data_eof_i(1'b0),
        .data_i_i(fifo2Cplx_data_out_DATA_I),
        .data_q_i(fifo2Cplx_data_out_DATA_Q),
        .data_rst_i(fifo2Cplx_data_out_DATA_RST));
  system_fifo2Cplx_0 fifo2Cplx
       (.data_clk_o(fifo2Cplx_data_out_DATA_CLK),
        .data_en_o(fifo2Cplx_data_out_DATA_EN),
        .data_i_o(fifo2Cplx_data_out_DATA_I),
        .data_q_o(fifo2Cplx_data_out_DATA_Q),
        .data_rst_o(fifo2Cplx_data_out_DATA_RST),
        .s00_axis_aclk(sys_cpu_clk),
        .s00_axis_reset(sys_cpu_reset),
        .s00_axis_tdata(fifo_clk_x_M_AXIS_TDATA),
        .s00_axis_tready(fifo_clk_x_M_AXIS_TREADY),
        .s00_axis_tvalid(fifo_clk_x_M_AXIS_TVALID));
  system_fifo_clk_x_0 fifo_clk_x
       (.m_aclk(sys_cpu_clk),
        .m_axis_tdata(fifo_clk_x_M_AXIS_TDATA),
        .m_axis_tready(fifo_clk_x_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_clk_x_M_AXIS_TVALID),
        .s_aclk(axi_ad9361_l_clk),
        .s_aresetn(sys_cpu_resetn),
        .s_axis_tdata(cplx_to_axis_m00_axis_TDATA),
        .s_axis_tready(cplx_to_axis_m00_axis_TREADY),
        .s_axis_tvalid(cplx_to_axis_m00_axis_TVALID));
  system_fir_decimator_0 fir_decimator
       (.aclk(axi_ad9361_l_clk),
        .channel_0(axi_ad9361_adc_data_i0),
        .channel_1(axi_ad9361_adc_data_q0),
        .decimate(decim_slice_Dout),
        .m_axis_data_tdata(fir_decimator_m_axis_data_tdata),
        .m_axis_data_tvalid(fir_decimator_m_axis_data_tvalid),
        .s_axis_data_tvalid(axi_ad9361_adc_valid_i0));
  system_fir_interpolator_0 fir_interpolator
       (.aclk(axi_ad9361_l_clk),
        .channel_0(fir_interpolator_channel_0),
        .channel_1(fir_interpolator_channel_1),
        .dac_read(axi_ad9361_dac_valid_i0),
        .interpolate(interp_slice_Dout),
        .s_axis_data_tdata(axi_ad9361_dac_dma_fifo_rd_dout),
        .s_axis_data_tready(fir_interpolator_s_axis_data_tready),
        .s_axis_data_tvalid(axi_ad9361_dac_dma_fifo_rd_valid));
  system_interp_slice_0 interp_slice
       (.Din(axi_ad9361_up_dac_gpio_out),
        .Dout(interp_slice_Dout));
  system_mixer_0 mixer
       (.data_clk_i(duppl_data1_out_DATA_CLK),
        .data_clk_o(mixer_data_out_DATA_CLK),
        .data_en_i(duppl_data1_out_DATA_EN),
        .data_en_o(mixer_data_out_DATA_EN),
        .data_i_i(duppl_data1_out_DATA_I),
        .data_i_o(mixer_data_out_DATA_I),
        .data_q_i(duppl_data1_out_DATA_Q),
        .data_q_o(mixer_data_out_DATA_Q),
        .data_rst_i(duppl_data1_out_DATA_RST),
        .data_rst_o(mixer_data_out_DATA_RST),
        .nco_clk_i(nco_sine_out_DATA_CLK),
        .nco_en_i(nco_sine_out_DATA_EN),
        .nco_i_i(nco_sine_out_DATA_I),
        .nco_q_i(nco_sine_out_DATA_Q),
        .nco_rst_i(nco_sine_out_DATA_RST));
  system_nco_0 nco
       (.cos_fake_o(nco_cos_fake_o),
        .dds_clk_o(nco_sine_out_DATA_CLK),
        .dds_cos_o(nco_sine_out_DATA_I),
        .dds_en_o(nco_sine_out_DATA_EN),
        .dds_rst_o(nco_sine_out_DATA_RST),
        .dds_sin_o(nco_sine_out_DATA_Q),
        .pinc_clk_i(1'b0),
        .pinc_en_i(1'b0),
        .pinc_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .pinc_rst_i(1'b0),
        .poff_clk_i(1'b0),
        .poff_en_i(1'b0),
        .poff_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .poff_rst_i(1'b0),
        .ref_clk_i(axi_ad9361_l_clk),
        .ref_rst_i(axi_ad9361_rst),
        .s00_axi_aclk(sys_cpu_clk),
        .s00_axi_araddr(axi_cpu_interconnect_M04_AXI_ARADDR[4:0]),
        .s00_axi_arprot(axi_cpu_interconnect_M04_AXI_ARPROT),
        .s00_axi_arready(axi_cpu_interconnect_M04_AXI_ARREADY),
        .s00_axi_arvalid(axi_cpu_interconnect_M04_AXI_ARVALID),
        .s00_axi_awaddr(axi_cpu_interconnect_M04_AXI_AWADDR[4:0]),
        .s00_axi_awprot(axi_cpu_interconnect_M04_AXI_AWPROT),
        .s00_axi_awready(axi_cpu_interconnect_M04_AXI_AWREADY),
        .s00_axi_awvalid(axi_cpu_interconnect_M04_AXI_AWVALID),
        .s00_axi_bready(axi_cpu_interconnect_M04_AXI_BREADY),
        .s00_axi_bresp(axi_cpu_interconnect_M04_AXI_BRESP),
        .s00_axi_bvalid(axi_cpu_interconnect_M04_AXI_BVALID),
        .s00_axi_rdata(axi_cpu_interconnect_M04_AXI_RDATA),
        .s00_axi_reset(sys_cpu_reset),
        .s00_axi_rready(axi_cpu_interconnect_M04_AXI_RREADY),
        .s00_axi_rresp(axi_cpu_interconnect_M04_AXI_RRESP),
        .s00_axi_rvalid(axi_cpu_interconnect_M04_AXI_RVALID),
        .s00_axi_wdata(axi_cpu_interconnect_M04_AXI_WDATA),
        .s00_axi_wready(axi_cpu_interconnect_M04_AXI_WREADY),
        .s00_axi_wstrb(axi_cpu_interconnect_M04_AXI_WSTRB),
        .s00_axi_wvalid(axi_cpu_interconnect_M04_AXI_WVALID));
  system_prn1_gen_0 prn1_gen
       (.clk(sys_cpu_clk),
        .prn_o(prn1_gen_prn_o),
        .reset(sys_cpu_reset),
        .tick_i(xcorr1_prn_sync_o));
  system_prn4_gen_0 prn4_gen
       (.clk(sys_cpu_clk),
        .prn_o(prn4_gen_prn_o),
        .reset(sys_cpu_reset),
        .tick_i(xcorr4_prn_sync_o));
  system_sys_concat_intc_0 sys_concat_intc
       (.In0(ps_intr_00_1),
        .In1(ps_intr_01_1),
        .In10(ps_intr_10_1),
        .In11(ps_intr_11_1),
        .In12(axi_ad9361_dac_dma_irq),
        .In13(axi_ad9361_adc_dma_irq),
        .In14(ps_intr_14_1),
        .In15(axi_iic_main_iic2intc_irpt),
        .In2(ps_intr_02_1),
        .In3(ps_intr_03_1),
        .In4(ps_intr_04_1),
        .In5(ps_intr_05_1),
        .In6(ps_intr_06_1),
        .In7(ps_intr_07_1),
        .In8(ps_intr_08_1),
        .In9(ps_intr_09_1),
        .dout(sys_concat_intc_dout));
  system_sys_ps7_0 sys_ps7
       (.DDR_Addr(ddr_addr[14:0]),
        .DDR_BankAddr(ddr_ba[2:0]),
        .DDR_CAS_n(ddr_cas_n),
        .DDR_CKE(ddr_cke),
        .DDR_CS_n(ddr_cs_n),
        .DDR_Clk(ddr_ck_p),
        .DDR_Clk_n(ddr_ck_n),
        .DDR_DM(ddr_dm[1:0]),
        .DDR_DQ(ddr_dq[15:0]),
        .DDR_DQS(ddr_dqs_p[1:0]),
        .DDR_DQS_n(ddr_dqs_n[1:0]),
        .DDR_DRSTB(ddr_reset_n),
        .DDR_ODT(ddr_odt),
        .DDR_RAS_n(ddr_ras_n),
        .DDR_VRN(fixed_io_ddr_vrn),
        .DDR_VRP(fixed_io_ddr_vrp),
        .DDR_WEB(ddr_we_n),
        .FCLK_CLK0(sys_cpu_clk),
        .FCLK_CLK1(sys_200m_clk),
        .FCLK_RESET0_N(sys_ps7_FCLK_RESET0_N),
        .GPIO_I(gpio_i_1),
        .GPIO_O(sys_ps7_GPIO_O),
        .GPIO_T(sys_ps7_GPIO_T),
        .IRQ_F2P(sys_concat_intc_dout),
        .MIO(fixed_io_mio[31:0]),
        .M_AXI_GP0_ACLK(sys_cpu_clk),
        .M_AXI_GP0_ARADDR(S00_AXI_1_ARADDR),
        .M_AXI_GP0_ARBURST(S00_AXI_1_ARBURST),
        .M_AXI_GP0_ARCACHE(S00_AXI_1_ARCACHE),
        .M_AXI_GP0_ARID(S00_AXI_1_ARID),
        .M_AXI_GP0_ARLEN(S00_AXI_1_ARLEN),
        .M_AXI_GP0_ARLOCK(S00_AXI_1_ARLOCK),
        .M_AXI_GP0_ARPROT(S00_AXI_1_ARPROT),
        .M_AXI_GP0_ARQOS(S00_AXI_1_ARQOS),
        .M_AXI_GP0_ARREADY(S00_AXI_1_ARREADY),
        .M_AXI_GP0_ARSIZE(S00_AXI_1_ARSIZE),
        .M_AXI_GP0_ARVALID(S00_AXI_1_ARVALID),
        .M_AXI_GP0_AWADDR(S00_AXI_1_AWADDR),
        .M_AXI_GP0_AWBURST(S00_AXI_1_AWBURST),
        .M_AXI_GP0_AWCACHE(S00_AXI_1_AWCACHE),
        .M_AXI_GP0_AWID(S00_AXI_1_AWID),
        .M_AXI_GP0_AWLEN(S00_AXI_1_AWLEN),
        .M_AXI_GP0_AWLOCK(S00_AXI_1_AWLOCK),
        .M_AXI_GP0_AWPROT(S00_AXI_1_AWPROT),
        .M_AXI_GP0_AWQOS(S00_AXI_1_AWQOS),
        .M_AXI_GP0_AWREADY(S00_AXI_1_AWREADY),
        .M_AXI_GP0_AWSIZE(S00_AXI_1_AWSIZE),
        .M_AXI_GP0_AWVALID(S00_AXI_1_AWVALID),
        .M_AXI_GP0_BID(S00_AXI_1_BID),
        .M_AXI_GP0_BREADY(S00_AXI_1_BREADY),
        .M_AXI_GP0_BRESP(S00_AXI_1_BRESP),
        .M_AXI_GP0_BVALID(S00_AXI_1_BVALID),
        .M_AXI_GP0_RDATA(S00_AXI_1_RDATA),
        .M_AXI_GP0_RID(S00_AXI_1_RID),
        .M_AXI_GP0_RLAST(S00_AXI_1_RLAST),
        .M_AXI_GP0_RREADY(S00_AXI_1_RREADY),
        .M_AXI_GP0_RRESP(S00_AXI_1_RRESP),
        .M_AXI_GP0_RVALID(S00_AXI_1_RVALID),
        .M_AXI_GP0_WDATA(S00_AXI_1_WDATA),
        .M_AXI_GP0_WID(S00_AXI_1_WID),
        .M_AXI_GP0_WLAST(S00_AXI_1_WLAST),
        .M_AXI_GP0_WREADY(S00_AXI_1_WREADY),
        .M_AXI_GP0_WSTRB(S00_AXI_1_WSTRB),
        .M_AXI_GP0_WVALID(S00_AXI_1_WVALID),
        .PS_CLK(fixed_io_ps_clk),
        .PS_PORB(fixed_io_ps_porb),
        .PS_SRSTB(fixed_io_ps_srstb),
        .SPI0_MISO_I(spi0_sdi_i_1),
        .SPI0_MOSI_I(spi0_sdo_i_1),
        .SPI0_MOSI_O(sys_ps7_SPI0_MOSI_O),
        .SPI0_SCLK_I(spi0_clk_i_1),
        .SPI0_SCLK_O(sys_ps7_SPI0_SCLK_O),
        .SPI0_SS1_O(sys_ps7_SPI0_SS1_O),
        .SPI0_SS2_O(sys_ps7_SPI0_SS2_O),
        .SPI0_SS_I(spi0_csn_i_1),
        .SPI0_SS_O(sys_ps7_SPI0_SS_O),
        .S_AXI_HP1_ACLK(sys_cpu_clk),
        .S_AXI_HP1_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARBURST({1'b0,1'b1}),
        .S_AXI_HP1_ARCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP1_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP1_ARVALID(1'b0),
        .S_AXI_HP1_AWADDR({1'b0,1'b0,1'b0,axi_hp1_interconnect_M00_AXI_AWADDR}),
        .S_AXI_HP1_AWBURST(axi_hp1_interconnect_M00_AXI_AWBURST),
        .S_AXI_HP1_AWCACHE(axi_hp1_interconnect_M00_AXI_AWCACHE),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLEN(axi_hp1_interconnect_M00_AXI_AWLEN),
        .S_AXI_HP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP1_AWPROT(axi_hp1_interconnect_M00_AXI_AWPROT),
        .S_AXI_HP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWREADY(axi_hp1_interconnect_M00_AXI_AWREADY),
        .S_AXI_HP1_AWSIZE(axi_hp1_interconnect_M00_AXI_AWSIZE),
        .S_AXI_HP1_AWVALID(axi_hp1_interconnect_M00_AXI_AWVALID),
        .S_AXI_HP1_BREADY(axi_hp1_interconnect_M00_AXI_BREADY),
        .S_AXI_HP1_BRESP(axi_hp1_interconnect_M00_AXI_BRESP),
        .S_AXI_HP1_BVALID(axi_hp1_interconnect_M00_AXI_BVALID),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RREADY(1'b0),
        .S_AXI_HP1_WDATA(axi_hp1_interconnect_M00_AXI_WDATA),
        .S_AXI_HP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WLAST(axi_hp1_interconnect_M00_AXI_WLAST),
        .S_AXI_HP1_WREADY(axi_hp1_interconnect_M00_AXI_WREADY),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB(axi_hp1_interconnect_M00_AXI_WSTRB),
        .S_AXI_HP1_WVALID(axi_hp1_interconnect_M00_AXI_WVALID),
        .S_AXI_HP2_ACLK(sys_cpu_clk),
        .S_AXI_HP2_ARADDR({1'b0,1'b0,1'b0,axi_hp2_interconnect_M00_AXI_ARADDR}),
        .S_AXI_HP2_ARBURST(axi_hp2_interconnect_M00_AXI_ARBURST),
        .S_AXI_HP2_ARCACHE(axi_hp2_interconnect_M00_AXI_ARCACHE),
        .S_AXI_HP2_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARLEN(axi_hp2_interconnect_M00_AXI_ARLEN),
        .S_AXI_HP2_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP2_ARPROT(axi_hp2_interconnect_M00_AXI_ARPROT),
        .S_AXI_HP2_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_ARREADY(axi_hp2_interconnect_M00_AXI_ARREADY),
        .S_AXI_HP2_ARSIZE(axi_hp2_interconnect_M00_AXI_ARSIZE),
        .S_AXI_HP2_ARVALID(axi_hp2_interconnect_M00_AXI_ARVALID),
        .S_AXI_HP2_AWADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWBURST({1'b0,1'b1}),
        .S_AXI_HP2_AWCACHE({1'b0,1'b0,1'b1,1'b1}),
        .S_AXI_HP2_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP2_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_AWSIZE({1'b0,1'b1,1'b1}),
        .S_AXI_HP2_AWVALID(1'b0),
        .S_AXI_HP2_BREADY(1'b0),
        .S_AXI_HP2_RDATA(axi_hp2_interconnect_M00_AXI_RDATA),
        .S_AXI_HP2_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP2_RLAST(axi_hp2_interconnect_M00_AXI_RLAST),
        .S_AXI_HP2_RREADY(axi_hp2_interconnect_M00_AXI_RREADY),
        .S_AXI_HP2_RRESP(axi_hp2_interconnect_M00_AXI_RRESP),
        .S_AXI_HP2_RVALID(axi_hp2_interconnect_M00_AXI_RVALID),
        .S_AXI_HP2_WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP2_WLAST(1'b0),
        .S_AXI_HP2_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP2_WSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .S_AXI_HP2_WVALID(1'b0),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_sys_rstgen_0 sys_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(sys_ps7_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(sys_cpu_resetn),
        .peripheral_reset(sys_cpu_reset),
        .slowest_sync_clk(sys_cpu_clk));
  system_use_nco_0 use_nco
       (.data1_clk_i(duppl_data2_out_DATA_CLK),
        .data1_en_i(duppl_data2_out_DATA_EN),
        .data1_eof_i(duppl_data2_out_DATA_EOF),
        .data1_i_i(duppl_data2_out_DATA_I),
        .data1_q_i(duppl_data2_out_DATA_Q),
        .data1_rst_i(duppl_data2_out_DATA_RST),
        .data2_clk_i(mixer_data_out_DATA_CLK),
        .data2_en_i(mixer_data_out_DATA_EN),
        .data2_eof_i(1'b0),
        .data2_i_i(mixer_data_out_DATA_I),
        .data2_q_i(mixer_data_out_DATA_Q),
        .data2_rst_i(mixer_data_out_DATA_RST),
        .data_clk_o(use_nco_data_out_DATA_CLK),
        .data_en_o(use_nco_data_out_DATA_EN),
        .data_i_o(use_nco_data_out_DATA_I),
        .data_q_o(use_nco_data_out_DATA_Q),
        .data_rst_o(use_nco_data_out_DATA_RST),
        .s00_axi_aclk(sys_cpu_clk),
        .s00_axi_araddr(axi_cpu_interconnect_M05_AXI_ARADDR[3:0]),
        .s00_axi_arready(axi_cpu_interconnect_M05_AXI_ARREADY),
        .s00_axi_arvalid(axi_cpu_interconnect_M05_AXI_ARVALID),
        .s00_axi_awaddr(axi_cpu_interconnect_M05_AXI_AWADDR[3:0]),
        .s00_axi_awready(axi_cpu_interconnect_M05_AXI_AWREADY),
        .s00_axi_awvalid(axi_cpu_interconnect_M05_AXI_AWVALID),
        .s00_axi_bready(axi_cpu_interconnect_M05_AXI_BREADY),
        .s00_axi_bresp(axi_cpu_interconnect_M05_AXI_BRESP),
        .s00_axi_bvalid(axi_cpu_interconnect_M05_AXI_BVALID),
        .s00_axi_rdata(axi_cpu_interconnect_M05_AXI_RDATA),
        .s00_axi_reset(sys_cpu_reset),
        .s00_axi_rready(axi_cpu_interconnect_M05_AXI_RREADY),
        .s00_axi_rresp(axi_cpu_interconnect_M05_AXI_RRESP),
        .s00_axi_rvalid(axi_cpu_interconnect_M05_AXI_RVALID),
        .s00_axi_wdata(axi_cpu_interconnect_M05_AXI_WDATA),
        .s00_axi_wready(axi_cpu_interconnect_M05_AXI_WREADY),
        .s00_axi_wvalid(axi_cpu_interconnect_M05_AXI_WVALID));
  system_xcorr1_0 xcorr1
       (.data_clk_i(duppl_xcorr_data1_out_DATA_CLK),
        .data_clk_o(xcorr1_data_out_DATA_CLK),
        .data_en_i(duppl_xcorr_data1_out_DATA_EN),
        .data_en_o(xcorr1_data_out_DATA_EN),
        .data_i_i(duppl_xcorr_data1_out_DATA_I),
        .data_i_o(xcorr1_data_out_DATA_I),
        .data_q_i(duppl_xcorr_data1_out_DATA_Q),
        .data_q_o(xcorr1_data_out_DATA_Q),
        .data_rst_i(duppl_xcorr_data1_out_DATA_RST),
        .data_rst_o(xcorr1_data_out_DATA_RST),
        .ext_rst_i(1'b0),
        .prn_i(prn1_gen_prn_o),
        .prn_sync_o(xcorr1_prn_sync_o));
  system_xcorr4_0 xcorr4
       (.data_clk_i(duppl_xcorr_data2_out_DATA_CLK),
        .data_clk_o(xcorr4_data_out_DATA_CLK),
        .data_en_i(duppl_xcorr_data2_out_DATA_EN),
        .data_en_o(xcorr4_data_out_DATA_EN),
        .data_i_i(duppl_xcorr_data2_out_DATA_I),
        .data_i_o(xcorr4_data_out_DATA_I),
        .data_q_i(duppl_xcorr_data2_out_DATA_Q),
        .data_q_o(xcorr4_data_out_DATA_Q),
        .data_rst_i(duppl_xcorr_data2_out_DATA_RST),
        .data_rst_o(xcorr4_data_out_DATA_RST),
        .ext_rst_i(1'b0),
        .prn_i(prn4_gen_prn_o),
        .prn_sync_o(xcorr4_prn_sync_o));
endmodule

module system_axi_cpu_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arprot,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awprot,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arprot,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awprot,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  output [2:0]M03_AXI_arprot;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  output [2:0]M03_AXI_awprot;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [31:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [31:0]M06_AXI_araddr;
  output [2:0]M06_AXI_arprot;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  output [2:0]M06_AXI_awprot;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire axi_cpu_interconnect_ACLK_net;
  wire axi_cpu_interconnect_ARESETN_net;
  wire [31:0]axi_cpu_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_cpu_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_ARCACHE;
  wire [11:0]axi_cpu_interconnect_to_s00_couplers_ARID;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_ARLEN;
  wire [1:0]axi_cpu_interconnect_to_s00_couplers_ARLOCK;
  wire [2:0]axi_cpu_interconnect_to_s00_couplers_ARPROT;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_ARQOS;
  wire axi_cpu_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]axi_cpu_interconnect_to_s00_couplers_ARSIZE;
  wire axi_cpu_interconnect_to_s00_couplers_ARVALID;
  wire [31:0]axi_cpu_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]axi_cpu_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_AWCACHE;
  wire [11:0]axi_cpu_interconnect_to_s00_couplers_AWID;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_AWLEN;
  wire [1:0]axi_cpu_interconnect_to_s00_couplers_AWLOCK;
  wire [2:0]axi_cpu_interconnect_to_s00_couplers_AWPROT;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_AWQOS;
  wire axi_cpu_interconnect_to_s00_couplers_AWREADY;
  wire [2:0]axi_cpu_interconnect_to_s00_couplers_AWSIZE;
  wire axi_cpu_interconnect_to_s00_couplers_AWVALID;
  wire [11:0]axi_cpu_interconnect_to_s00_couplers_BID;
  wire axi_cpu_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_cpu_interconnect_to_s00_couplers_BRESP;
  wire axi_cpu_interconnect_to_s00_couplers_BVALID;
  wire [31:0]axi_cpu_interconnect_to_s00_couplers_RDATA;
  wire [11:0]axi_cpu_interconnect_to_s00_couplers_RID;
  wire axi_cpu_interconnect_to_s00_couplers_RLAST;
  wire axi_cpu_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_cpu_interconnect_to_s00_couplers_RRESP;
  wire axi_cpu_interconnect_to_s00_couplers_RVALID;
  wire [31:0]axi_cpu_interconnect_to_s00_couplers_WDATA;
  wire [11:0]axi_cpu_interconnect_to_s00_couplers_WID;
  wire axi_cpu_interconnect_to_s00_couplers_WLAST;
  wire axi_cpu_interconnect_to_s00_couplers_WREADY;
  wire [3:0]axi_cpu_interconnect_to_s00_couplers_WSTRB;
  wire axi_cpu_interconnect_to_s00_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_cpu_interconnect_ARADDR;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_ARREADY;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m00_couplers_to_axi_cpu_interconnect_AWADDR;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_AWREADY;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_AWVALID;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m00_couplers_to_axi_cpu_interconnect_BRESP;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m00_couplers_to_axi_cpu_interconnect_RDATA;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m00_couplers_to_axi_cpu_interconnect_RRESP;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m00_couplers_to_axi_cpu_interconnect_WDATA;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_WREADY;
  wire [3:0]m00_couplers_to_axi_cpu_interconnect_WSTRB;
  wire [0:0]m00_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]m01_couplers_to_axi_cpu_interconnect_ARADDR;
  wire [2:0]m01_couplers_to_axi_cpu_interconnect_ARPROT;
  wire m01_couplers_to_axi_cpu_interconnect_ARREADY;
  wire m01_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m01_couplers_to_axi_cpu_interconnect_AWADDR;
  wire [2:0]m01_couplers_to_axi_cpu_interconnect_AWPROT;
  wire m01_couplers_to_axi_cpu_interconnect_AWREADY;
  wire m01_couplers_to_axi_cpu_interconnect_AWVALID;
  wire m01_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m01_couplers_to_axi_cpu_interconnect_BRESP;
  wire m01_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m01_couplers_to_axi_cpu_interconnect_RDATA;
  wire m01_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m01_couplers_to_axi_cpu_interconnect_RRESP;
  wire m01_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m01_couplers_to_axi_cpu_interconnect_WDATA;
  wire m01_couplers_to_axi_cpu_interconnect_WREADY;
  wire [3:0]m01_couplers_to_axi_cpu_interconnect_WSTRB;
  wire m01_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]m02_couplers_to_axi_cpu_interconnect_ARADDR;
  wire [2:0]m02_couplers_to_axi_cpu_interconnect_ARPROT;
  wire m02_couplers_to_axi_cpu_interconnect_ARREADY;
  wire m02_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m02_couplers_to_axi_cpu_interconnect_AWADDR;
  wire [2:0]m02_couplers_to_axi_cpu_interconnect_AWPROT;
  wire m02_couplers_to_axi_cpu_interconnect_AWREADY;
  wire m02_couplers_to_axi_cpu_interconnect_AWVALID;
  wire m02_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m02_couplers_to_axi_cpu_interconnect_BRESP;
  wire m02_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m02_couplers_to_axi_cpu_interconnect_RDATA;
  wire m02_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m02_couplers_to_axi_cpu_interconnect_RRESP;
  wire m02_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m02_couplers_to_axi_cpu_interconnect_WDATA;
  wire m02_couplers_to_axi_cpu_interconnect_WREADY;
  wire [3:0]m02_couplers_to_axi_cpu_interconnect_WSTRB;
  wire m02_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]m03_couplers_to_axi_cpu_interconnect_ARADDR;
  wire [2:0]m03_couplers_to_axi_cpu_interconnect_ARPROT;
  wire m03_couplers_to_axi_cpu_interconnect_ARREADY;
  wire m03_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m03_couplers_to_axi_cpu_interconnect_AWADDR;
  wire [2:0]m03_couplers_to_axi_cpu_interconnect_AWPROT;
  wire m03_couplers_to_axi_cpu_interconnect_AWREADY;
  wire m03_couplers_to_axi_cpu_interconnect_AWVALID;
  wire m03_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m03_couplers_to_axi_cpu_interconnect_BRESP;
  wire m03_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m03_couplers_to_axi_cpu_interconnect_RDATA;
  wire m03_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m03_couplers_to_axi_cpu_interconnect_RRESP;
  wire m03_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m03_couplers_to_axi_cpu_interconnect_WDATA;
  wire m03_couplers_to_axi_cpu_interconnect_WREADY;
  wire [3:0]m03_couplers_to_axi_cpu_interconnect_WSTRB;
  wire m03_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]m04_couplers_to_axi_cpu_interconnect_ARADDR;
  wire [2:0]m04_couplers_to_axi_cpu_interconnect_ARPROT;
  wire m04_couplers_to_axi_cpu_interconnect_ARREADY;
  wire m04_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m04_couplers_to_axi_cpu_interconnect_AWADDR;
  wire [2:0]m04_couplers_to_axi_cpu_interconnect_AWPROT;
  wire m04_couplers_to_axi_cpu_interconnect_AWREADY;
  wire m04_couplers_to_axi_cpu_interconnect_AWVALID;
  wire m04_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m04_couplers_to_axi_cpu_interconnect_BRESP;
  wire m04_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m04_couplers_to_axi_cpu_interconnect_RDATA;
  wire m04_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m04_couplers_to_axi_cpu_interconnect_RRESP;
  wire m04_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m04_couplers_to_axi_cpu_interconnect_WDATA;
  wire m04_couplers_to_axi_cpu_interconnect_WREADY;
  wire [3:0]m04_couplers_to_axi_cpu_interconnect_WSTRB;
  wire m04_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]m05_couplers_to_axi_cpu_interconnect_ARADDR;
  wire m05_couplers_to_axi_cpu_interconnect_ARREADY;
  wire m05_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m05_couplers_to_axi_cpu_interconnect_AWADDR;
  wire m05_couplers_to_axi_cpu_interconnect_AWREADY;
  wire m05_couplers_to_axi_cpu_interconnect_AWVALID;
  wire m05_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m05_couplers_to_axi_cpu_interconnect_BRESP;
  wire m05_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m05_couplers_to_axi_cpu_interconnect_RDATA;
  wire m05_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m05_couplers_to_axi_cpu_interconnect_RRESP;
  wire m05_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m05_couplers_to_axi_cpu_interconnect_WDATA;
  wire m05_couplers_to_axi_cpu_interconnect_WREADY;
  wire m05_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]m06_couplers_to_axi_cpu_interconnect_ARADDR;
  wire [2:0]m06_couplers_to_axi_cpu_interconnect_ARPROT;
  wire m06_couplers_to_axi_cpu_interconnect_ARREADY;
  wire m06_couplers_to_axi_cpu_interconnect_ARVALID;
  wire [31:0]m06_couplers_to_axi_cpu_interconnect_AWADDR;
  wire [2:0]m06_couplers_to_axi_cpu_interconnect_AWPROT;
  wire m06_couplers_to_axi_cpu_interconnect_AWREADY;
  wire m06_couplers_to_axi_cpu_interconnect_AWVALID;
  wire m06_couplers_to_axi_cpu_interconnect_BREADY;
  wire [1:0]m06_couplers_to_axi_cpu_interconnect_BRESP;
  wire m06_couplers_to_axi_cpu_interconnect_BVALID;
  wire [31:0]m06_couplers_to_axi_cpu_interconnect_RDATA;
  wire m06_couplers_to_axi_cpu_interconnect_RREADY;
  wire [1:0]m06_couplers_to_axi_cpu_interconnect_RRESP;
  wire m06_couplers_to_axi_cpu_interconnect_RVALID;
  wire [31:0]m06_couplers_to_axi_cpu_interconnect_WDATA;
  wire m06_couplers_to_axi_cpu_interconnect_WREADY;
  wire [3:0]m06_couplers_to_axi_cpu_interconnect_WSTRB;
  wire m06_couplers_to_axi_cpu_interconnect_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire [11:9]xbar_to_m03_couplers_ARPROT;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire [11:9]xbar_to_m03_couplers_AWPROT;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire [20:18]xbar_to_m06_couplers_ARPROT;
  wire xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire [20:18]xbar_to_m06_couplers_AWPROT;
  wire xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [20:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [20:0]NLW_xbar_m_axi_awprot_UNCONNECTED;
  wire [27:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_axi_cpu_interconnect_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_axi_cpu_interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_cpu_interconnect_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_cpu_interconnect_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_axi_cpu_interconnect_WVALID;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M01_AXI_arprot[2:0] = m01_couplers_to_axi_cpu_interconnect_ARPROT;
  assign M01_AXI_arvalid = m01_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M01_AXI_awprot[2:0] = m01_couplers_to_axi_cpu_interconnect_AWPROT;
  assign M01_AXI_awvalid = m01_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi_cpu_interconnect_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi_cpu_interconnect_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_cpu_interconnect_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_cpu_interconnect_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi_cpu_interconnect_WVALID;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M02_AXI_arprot[2:0] = m02_couplers_to_axi_cpu_interconnect_ARPROT;
  assign M02_AXI_arvalid = m02_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M02_AXI_awprot[2:0] = m02_couplers_to_axi_cpu_interconnect_AWPROT;
  assign M02_AXI_awvalid = m02_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_axi_cpu_interconnect_BREADY;
  assign M02_AXI_rready = m02_couplers_to_axi_cpu_interconnect_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi_cpu_interconnect_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi_cpu_interconnect_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_axi_cpu_interconnect_WVALID;
  assign M03_AXI_araddr[31:0] = m03_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M03_AXI_arprot[2:0] = m03_couplers_to_axi_cpu_interconnect_ARPROT;
  assign M03_AXI_arvalid = m03_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M03_AXI_awprot[2:0] = m03_couplers_to_axi_cpu_interconnect_AWPROT;
  assign M03_AXI_awvalid = m03_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_axi_cpu_interconnect_BREADY;
  assign M03_AXI_rready = m03_couplers_to_axi_cpu_interconnect_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_axi_cpu_interconnect_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_axi_cpu_interconnect_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_axi_cpu_interconnect_WVALID;
  assign M04_AXI_araddr[31:0] = m04_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M04_AXI_arprot[2:0] = m04_couplers_to_axi_cpu_interconnect_ARPROT;
  assign M04_AXI_arvalid = m04_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M04_AXI_awprot[2:0] = m04_couplers_to_axi_cpu_interconnect_AWPROT;
  assign M04_AXI_awvalid = m04_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_axi_cpu_interconnect_BREADY;
  assign M04_AXI_rready = m04_couplers_to_axi_cpu_interconnect_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_axi_cpu_interconnect_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_axi_cpu_interconnect_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_axi_cpu_interconnect_WVALID;
  assign M05_AXI_araddr[31:0] = m05_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M05_AXI_arvalid = m05_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M05_AXI_awaddr[31:0] = m05_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M05_AXI_awvalid = m05_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_axi_cpu_interconnect_BREADY;
  assign M05_AXI_rready = m05_couplers_to_axi_cpu_interconnect_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_axi_cpu_interconnect_WDATA;
  assign M05_AXI_wvalid = m05_couplers_to_axi_cpu_interconnect_WVALID;
  assign M06_AXI_araddr[31:0] = m06_couplers_to_axi_cpu_interconnect_ARADDR;
  assign M06_AXI_arprot[2:0] = m06_couplers_to_axi_cpu_interconnect_ARPROT;
  assign M06_AXI_arvalid = m06_couplers_to_axi_cpu_interconnect_ARVALID;
  assign M06_AXI_awaddr[31:0] = m06_couplers_to_axi_cpu_interconnect_AWADDR;
  assign M06_AXI_awprot[2:0] = m06_couplers_to_axi_cpu_interconnect_AWPROT;
  assign M06_AXI_awvalid = m06_couplers_to_axi_cpu_interconnect_AWVALID;
  assign M06_AXI_bready = m06_couplers_to_axi_cpu_interconnect_BREADY;
  assign M06_AXI_rready = m06_couplers_to_axi_cpu_interconnect_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_axi_cpu_interconnect_WDATA;
  assign M06_AXI_wstrb[3:0] = m06_couplers_to_axi_cpu_interconnect_WSTRB;
  assign M06_AXI_wvalid = m06_couplers_to_axi_cpu_interconnect_WVALID;
  assign S00_AXI_arready = axi_cpu_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_cpu_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = axi_cpu_interconnect_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_cpu_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_cpu_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_cpu_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = axi_cpu_interconnect_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_cpu_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_cpu_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_cpu_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_cpu_interconnect_to_s00_couplers_WREADY;
  assign axi_cpu_interconnect_ACLK_net = ACLK;
  assign axi_cpu_interconnect_ARESETN_net = ARESETN;
  assign axi_cpu_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_cpu_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_cpu_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_cpu_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_cpu_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_cpu_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_cpu_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_cpu_interconnect_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign axi_cpu_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_cpu_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_cpu_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_axi_cpu_interconnect_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_axi_cpu_interconnect_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_axi_cpu_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_cpu_interconnect_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_axi_cpu_interconnect_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_cpu_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_cpu_interconnect_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_axi_cpu_interconnect_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_axi_cpu_interconnect_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi_cpu_interconnect_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi_cpu_interconnect_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_cpu_interconnect_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi_cpu_interconnect_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_cpu_interconnect_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_cpu_interconnect_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi_cpu_interconnect_WREADY = M01_AXI_wready;
  assign m02_couplers_to_axi_cpu_interconnect_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_axi_cpu_interconnect_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_axi_cpu_interconnect_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi_cpu_interconnect_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_axi_cpu_interconnect_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi_cpu_interconnect_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi_cpu_interconnect_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_axi_cpu_interconnect_WREADY = M02_AXI_wready;
  assign m03_couplers_to_axi_cpu_interconnect_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_axi_cpu_interconnect_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_axi_cpu_interconnect_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_axi_cpu_interconnect_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_axi_cpu_interconnect_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_axi_cpu_interconnect_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_axi_cpu_interconnect_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_axi_cpu_interconnect_WREADY = M03_AXI_wready;
  assign m04_couplers_to_axi_cpu_interconnect_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_axi_cpu_interconnect_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_axi_cpu_interconnect_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_axi_cpu_interconnect_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_axi_cpu_interconnect_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_axi_cpu_interconnect_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_axi_cpu_interconnect_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_axi_cpu_interconnect_WREADY = M04_AXI_wready;
  assign m05_couplers_to_axi_cpu_interconnect_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_axi_cpu_interconnect_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_axi_cpu_interconnect_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_axi_cpu_interconnect_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_axi_cpu_interconnect_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_axi_cpu_interconnect_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_axi_cpu_interconnect_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_axi_cpu_interconnect_WREADY = M05_AXI_wready;
  assign m06_couplers_to_axi_cpu_interconnect_ARREADY = M06_AXI_arready;
  assign m06_couplers_to_axi_cpu_interconnect_AWREADY = M06_AXI_awready;
  assign m06_couplers_to_axi_cpu_interconnect_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_axi_cpu_interconnect_BVALID = M06_AXI_bvalid;
  assign m06_couplers_to_axi_cpu_interconnect_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_axi_cpu_interconnect_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_axi_cpu_interconnect_RVALID = M06_AXI_rvalid;
  assign m06_couplers_to_axi_cpu_interconnect_WREADY = M06_AXI_wready;
  m00_couplers_imp_I5GH1N m00_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arready(m00_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awready(m00_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_cpu_interconnect_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1UBGIXM m01_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arprot(m01_couplers_to_axi_cpu_interconnect_ARPROT),
        .M_AXI_arready(m01_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awprot(m01_couplers_to_axi_cpu_interconnect_AWPROT),
        .M_AXI_awready(m01_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_cpu_interconnect_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1J5P44O m02_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arprot(m02_couplers_to_axi_cpu_interconnect_ARPROT),
        .M_AXI_arready(m02_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awprot(m02_couplers_to_axi_cpu_interconnect_AWPROT),
        .M_AXI_awready(m02_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m02_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m02_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi_cpu_interconnect_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_T17W6X m03_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m03_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arprot(m03_couplers_to_axi_cpu_interconnect_ARPROT),
        .M_AXI_arready(m03_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awprot(m03_couplers_to_axi_cpu_interconnect_AWPROT),
        .M_AXI_awready(m03_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m03_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m03_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m03_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m03_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m03_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m03_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m03_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m03_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m03_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wstrb(m03_couplers_to_axi_cpu_interconnect_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m03_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m03_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_15FU5SC m04_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m04_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arprot(m04_couplers_to_axi_cpu_interconnect_ARPROT),
        .M_AXI_arready(m04_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awprot(m04_couplers_to_axi_cpu_interconnect_AWPROT),
        .M_AXI_awready(m04_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m04_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m04_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m04_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m04_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m04_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m04_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m04_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m04_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m04_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wstrb(m04_couplers_to_axi_cpu_interconnect_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_GFBASD m05_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m05_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arready(m05_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awready(m05_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m05_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m05_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m05_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m05_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m05_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m05_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m05_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m05_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m05_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wvalid(m05_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_59JXRJ m06_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(m06_couplers_to_axi_cpu_interconnect_ARADDR),
        .M_AXI_arprot(m06_couplers_to_axi_cpu_interconnect_ARPROT),
        .M_AXI_arready(m06_couplers_to_axi_cpu_interconnect_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_axi_cpu_interconnect_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_axi_cpu_interconnect_AWADDR),
        .M_AXI_awprot(m06_couplers_to_axi_cpu_interconnect_AWPROT),
        .M_AXI_awready(m06_couplers_to_axi_cpu_interconnect_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_axi_cpu_interconnect_AWVALID),
        .M_AXI_bready(m06_couplers_to_axi_cpu_interconnect_BREADY),
        .M_AXI_bresp(m06_couplers_to_axi_cpu_interconnect_BRESP),
        .M_AXI_bvalid(m06_couplers_to_axi_cpu_interconnect_BVALID),
        .M_AXI_rdata(m06_couplers_to_axi_cpu_interconnect_RDATA),
        .M_AXI_rready(m06_couplers_to_axi_cpu_interconnect_RREADY),
        .M_AXI_rresp(m06_couplers_to_axi_cpu_interconnect_RRESP),
        .M_AXI_rvalid(m06_couplers_to_axi_cpu_interconnect_RVALID),
        .M_AXI_wdata(m06_couplers_to_axi_cpu_interconnect_WDATA),
        .M_AXI_wready(m06_couplers_to_axi_cpu_interconnect_WREADY),
        .M_AXI_wstrb(m06_couplers_to_axi_cpu_interconnect_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_axi_cpu_interconnect_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m06_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m06_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  s00_couplers_imp_WZLZH6 s00_couplers
       (.M_ACLK(axi_cpu_interconnect_ACLK_net),
        .M_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(axi_cpu_interconnect_ACLK_net),
        .S_ARESETN(axi_cpu_interconnect_ARESETN_net),
        .S_AXI_araddr(axi_cpu_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_cpu_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_cpu_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_cpu_interconnect_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_cpu_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_cpu_interconnect_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_cpu_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_cpu_interconnect_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_cpu_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_cpu_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_cpu_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_cpu_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_cpu_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_cpu_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_cpu_interconnect_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_cpu_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_cpu_interconnect_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_cpu_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_cpu_interconnect_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_cpu_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_cpu_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_cpu_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_cpu_interconnect_to_s00_couplers_BID),
        .S_AXI_bready(axi_cpu_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_cpu_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_cpu_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_cpu_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_cpu_interconnect_to_s00_couplers_RID),
        .S_AXI_rlast(axi_cpu_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_cpu_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_cpu_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_cpu_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_cpu_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wid(axi_cpu_interconnect_to_s00_couplers_WID),
        .S_AXI_wlast(axi_cpu_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_cpu_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_cpu_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_cpu_interconnect_to_s00_couplers_WVALID));
  system_xbar_0 xbar
       (.aclk(axi_cpu_interconnect_ACLK_net),
        .aresetn(axi_cpu_interconnect_ARESETN_net),
        .m_axi_araddr({xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m06_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[17:15],xbar_to_m04_couplers_ARPROT,xbar_to_m03_couplers_ARPROT,xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[2:0]}),
        .m_axi_arready({xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m06_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[17:15],xbar_to_m04_couplers_AWPROT,xbar_to_m03_couplers_AWPROT,xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[2:0]}),
        .m_axi_awready({xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m06_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[23:20],xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module system_axi_hp1_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awlen,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [28:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awlen;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  output [63:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [28:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [3:0]S00_AXI_awlen;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  input [63:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [7:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_hp1_interconnect_ACLK_net;
  wire axi_hp1_interconnect_ARESETN_net;
  wire [28:0]axi_hp1_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]axi_hp1_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]axi_hp1_interconnect_to_s00_couplers_AWCACHE;
  wire [3:0]axi_hp1_interconnect_to_s00_couplers_AWLEN;
  wire [2:0]axi_hp1_interconnect_to_s00_couplers_AWPROT;
  wire axi_hp1_interconnect_to_s00_couplers_AWREADY;
  wire [2:0]axi_hp1_interconnect_to_s00_couplers_AWSIZE;
  wire axi_hp1_interconnect_to_s00_couplers_AWVALID;
  wire axi_hp1_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_hp1_interconnect_to_s00_couplers_BRESP;
  wire axi_hp1_interconnect_to_s00_couplers_BVALID;
  wire [63:0]axi_hp1_interconnect_to_s00_couplers_WDATA;
  wire axi_hp1_interconnect_to_s00_couplers_WLAST;
  wire axi_hp1_interconnect_to_s00_couplers_WREADY;
  wire [7:0]axi_hp1_interconnect_to_s00_couplers_WSTRB;
  wire axi_hp1_interconnect_to_s00_couplers_WVALID;
  wire [28:0]s00_couplers_to_axi_hp1_interconnect_AWADDR;
  wire [1:0]s00_couplers_to_axi_hp1_interconnect_AWBURST;
  wire [3:0]s00_couplers_to_axi_hp1_interconnect_AWCACHE;
  wire [3:0]s00_couplers_to_axi_hp1_interconnect_AWLEN;
  wire [2:0]s00_couplers_to_axi_hp1_interconnect_AWPROT;
  wire s00_couplers_to_axi_hp1_interconnect_AWREADY;
  wire [2:0]s00_couplers_to_axi_hp1_interconnect_AWSIZE;
  wire s00_couplers_to_axi_hp1_interconnect_AWVALID;
  wire s00_couplers_to_axi_hp1_interconnect_BREADY;
  wire [1:0]s00_couplers_to_axi_hp1_interconnect_BRESP;
  wire s00_couplers_to_axi_hp1_interconnect_BVALID;
  wire [63:0]s00_couplers_to_axi_hp1_interconnect_WDATA;
  wire s00_couplers_to_axi_hp1_interconnect_WLAST;
  wire s00_couplers_to_axi_hp1_interconnect_WREADY;
  wire [7:0]s00_couplers_to_axi_hp1_interconnect_WSTRB;
  wire s00_couplers_to_axi_hp1_interconnect_WVALID;

  assign M00_AXI_awaddr[28:0] = s00_couplers_to_axi_hp1_interconnect_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_hp1_interconnect_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_hp1_interconnect_AWCACHE;
  assign M00_AXI_awlen[3:0] = s00_couplers_to_axi_hp1_interconnect_AWLEN;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_hp1_interconnect_AWPROT;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_hp1_interconnect_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_hp1_interconnect_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_hp1_interconnect_BREADY;
  assign M00_AXI_wdata[63:0] = s00_couplers_to_axi_hp1_interconnect_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_axi_hp1_interconnect_WLAST;
  assign M00_AXI_wstrb[7:0] = s00_couplers_to_axi_hp1_interconnect_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_hp1_interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_awready = axi_hp1_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = axi_hp1_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_hp1_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_wready = axi_hp1_interconnect_to_s00_couplers_WREADY;
  assign axi_hp1_interconnect_ACLK_net = M00_ACLK;
  assign axi_hp1_interconnect_ARESETN_net = M00_ARESETN;
  assign axi_hp1_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[28:0];
  assign axi_hp1_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_hp1_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_hp1_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_hp1_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_hp1_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_hp1_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_hp1_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_hp1_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[63:0];
  assign axi_hp1_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_hp1_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[7:0];
  assign axi_hp1_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_axi_hp1_interconnect_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_hp1_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_hp1_interconnect_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_hp1_interconnect_WREADY = M00_AXI_wready;
  s00_couplers_imp_H1ZQRK s00_couplers
       (.M_ACLK(axi_hp1_interconnect_ACLK_net),
        .M_ARESETN(axi_hp1_interconnect_ARESETN_net),
        .M_AXI_awaddr(s00_couplers_to_axi_hp1_interconnect_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_hp1_interconnect_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_hp1_interconnect_AWCACHE),
        .M_AXI_awlen(s00_couplers_to_axi_hp1_interconnect_AWLEN),
        .M_AXI_awprot(s00_couplers_to_axi_hp1_interconnect_AWPROT),
        .M_AXI_awready(s00_couplers_to_axi_hp1_interconnect_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_hp1_interconnect_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_hp1_interconnect_AWVALID),
        .M_AXI_bready(s00_couplers_to_axi_hp1_interconnect_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_hp1_interconnect_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_hp1_interconnect_BVALID),
        .M_AXI_wdata(s00_couplers_to_axi_hp1_interconnect_WDATA),
        .M_AXI_wlast(s00_couplers_to_axi_hp1_interconnect_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_hp1_interconnect_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_hp1_interconnect_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_hp1_interconnect_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_awaddr(axi_hp1_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_hp1_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_hp1_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awlen(axi_hp1_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awprot(axi_hp1_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awready(axi_hp1_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_hp1_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_hp1_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bready(axi_hp1_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_hp1_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_hp1_interconnect_to_s00_couplers_BVALID),
        .S_AXI_wdata(axi_hp1_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_hp1_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_hp1_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_hp1_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_hp1_interconnect_to_s00_couplers_WVALID));
endmodule

module system_axi_hp2_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [28:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [28:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [3:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  output [63:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_hp2_interconnect_ACLK_net;
  wire axi_hp2_interconnect_ARESETN_net;
  wire [28:0]axi_hp2_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_hp2_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_hp2_interconnect_to_s00_couplers_ARCACHE;
  wire [3:0]axi_hp2_interconnect_to_s00_couplers_ARLEN;
  wire [2:0]axi_hp2_interconnect_to_s00_couplers_ARPROT;
  wire axi_hp2_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]axi_hp2_interconnect_to_s00_couplers_ARSIZE;
  wire axi_hp2_interconnect_to_s00_couplers_ARVALID;
  wire [63:0]axi_hp2_interconnect_to_s00_couplers_RDATA;
  wire axi_hp2_interconnect_to_s00_couplers_RLAST;
  wire axi_hp2_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_hp2_interconnect_to_s00_couplers_RRESP;
  wire axi_hp2_interconnect_to_s00_couplers_RVALID;
  wire [28:0]s00_couplers_to_axi_hp2_interconnect_ARADDR;
  wire [1:0]s00_couplers_to_axi_hp2_interconnect_ARBURST;
  wire [3:0]s00_couplers_to_axi_hp2_interconnect_ARCACHE;
  wire [3:0]s00_couplers_to_axi_hp2_interconnect_ARLEN;
  wire [2:0]s00_couplers_to_axi_hp2_interconnect_ARPROT;
  wire s00_couplers_to_axi_hp2_interconnect_ARREADY;
  wire [2:0]s00_couplers_to_axi_hp2_interconnect_ARSIZE;
  wire s00_couplers_to_axi_hp2_interconnect_ARVALID;
  wire [63:0]s00_couplers_to_axi_hp2_interconnect_RDATA;
  wire s00_couplers_to_axi_hp2_interconnect_RLAST;
  wire s00_couplers_to_axi_hp2_interconnect_RREADY;
  wire [1:0]s00_couplers_to_axi_hp2_interconnect_RRESP;
  wire s00_couplers_to_axi_hp2_interconnect_RVALID;

  assign M00_AXI_araddr[28:0] = s00_couplers_to_axi_hp2_interconnect_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_hp2_interconnect_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_hp2_interconnect_ARCACHE;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_hp2_interconnect_ARLEN;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_hp2_interconnect_ARPROT;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_hp2_interconnect_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_hp2_interconnect_ARVALID;
  assign M00_AXI_rready = s00_couplers_to_axi_hp2_interconnect_RREADY;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_hp2_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[63:0] = axi_hp2_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rlast = axi_hp2_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_hp2_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_hp2_interconnect_to_s00_couplers_RVALID;
  assign axi_hp2_interconnect_ACLK_net = M00_ACLK;
  assign axi_hp2_interconnect_ARESETN_net = M00_ARESETN;
  assign axi_hp2_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[28:0];
  assign axi_hp2_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_hp2_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_hp2_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_hp2_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_hp2_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_hp2_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_hp2_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign s00_couplers_to_axi_hp2_interconnect_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_hp2_interconnect_RDATA = M00_AXI_rdata[63:0];
  assign s00_couplers_to_axi_hp2_interconnect_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_hp2_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_hp2_interconnect_RVALID = M00_AXI_rvalid;
  s00_couplers_imp_SELTG5 s00_couplers
       (.M_ACLK(axi_hp2_interconnect_ACLK_net),
        .M_ARESETN(axi_hp2_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_hp2_interconnect_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_hp2_interconnect_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_hp2_interconnect_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_axi_hp2_interconnect_ARLEN),
        .M_AXI_arprot(s00_couplers_to_axi_hp2_interconnect_ARPROT),
        .M_AXI_arready(s00_couplers_to_axi_hp2_interconnect_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_hp2_interconnect_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_hp2_interconnect_ARVALID),
        .M_AXI_rdata(s00_couplers_to_axi_hp2_interconnect_RDATA),
        .M_AXI_rlast(s00_couplers_to_axi_hp2_interconnect_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_hp2_interconnect_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_hp2_interconnect_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_hp2_interconnect_RVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_hp2_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_hp2_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_hp2_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_hp2_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_hp2_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_hp2_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_hp2_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_hp2_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_hp2_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_hp2_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_hp2_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_hp2_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_hp2_interconnect_to_s00_couplers_RVALID));
endmodule
