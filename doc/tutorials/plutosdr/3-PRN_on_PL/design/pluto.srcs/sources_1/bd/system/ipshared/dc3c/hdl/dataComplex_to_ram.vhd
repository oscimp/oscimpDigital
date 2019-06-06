---------------------------------------------------------------------------
-- (c) Copyright: OscillatorIMP Digital
-- Author : Gwenhael Goavec-Merou<gwenhael.goavec-merou@trabucayre.com>
-- Creation date : 2018/11/30
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.math_real.all;

entity dataComplex_to_ram is
	generic (
		USE_EOF : boolean := false;
		NB_INPUT : natural := 12;
		DATA_FORMAT : string := "signed";
		DATA_SIZE : natural := 32;
		--ADDR_SIZE : natural := 12;
		NB_SAMPLE : natural := 1024;
		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 4
	);
	port (
		--interrupt
		data1_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data1_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data1_en_i : in std_logic := '0';
		data1_clk_i : in std_logic := '0';
		data1_rst_i : in std_logic := '0';
		data1_eof_i : in std_logic := '0';
		data2_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data2_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data2_en_i : in std_logic := '0';
		data2_clk_i : in std_logic := '0';
		data2_rst_i : in std_logic := '0';
		data2_eof_i : in std_logic := '0';
		data3_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data3_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data3_en_i : in std_logic := '0';
		data3_clk_i : in std_logic := '0';
		data3_rst_i : in std_logic := '0';
		data3_eof_i : in std_logic := '0';
		data4_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data4_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data4_en_i : in std_logic := '0';
		data4_clk_i : in std_logic := '0';
		data4_rst_i : in std_logic := '0';
		data4_eof_i : in std_logic := '0';
		data5_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data5_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data5_en_i : in std_logic := '0';
		data5_clk_i : in std_logic := '0';
		data5_rst_i : in std_logic := '0';
		data5_eof_i : in std_logic := '0';
		data6_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data6_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data6_en_i : in std_logic := '0';
		data6_clk_i : in std_logic := '0';
		data6_rst_i : in std_logic := '0';
		data6_eof_i : in std_logic := '0';
		data7_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data7_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data7_en_i : in std_logic := '0';
		data7_clk_i : in std_logic := '0';
		data7_rst_i : in std_logic := '0';
		data7_eof_i : in std_logic := '0';
		data8_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data8_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data8_en_i : in std_logic := '0';
		data8_clk_i : in std_logic := '0';
		data8_rst_i : in std_logic := '0';
		data8_eof_i : in std_logic := '0';
		data9_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data9_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data9_en_i : in std_logic := '0';
		data9_clk_i : in std_logic := '0';
		data9_rst_i : in std_logic := '0';
		data9_eof_i : in std_logic := '0';
		data10_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data10_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data10_en_i : in std_logic := '0';
		data10_clk_i : in std_logic := '0';
		data10_rst_i : in std_logic := '0';
		data10_eof_i : in std_logic := '0';
		data11_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data11_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data11_en_i : in std_logic := '0';
		data11_clk_i : in std_logic := '0';
		data11_rst_i : in std_logic := '0';
		data11_eof_i : in std_logic := '0';
		data12_i_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data12_q_i : in std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');
		data12_en_i : in std_logic := '0';
		data12_clk_i : in std_logic := '0';
		data12_rst_i : in std_logic := '0';
		data12_eof_i : in std_logic := '0';
		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_reset	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end dataComplex_to_ram;

architecture Behavioral of dataComplex_to_ram is
	constant ADDR_SIZE			 : natural := natural(ceil(log2(real(NB_SAMPLE))));
	constant MAX_WAY			 : natural := 12;
	-- compute upper near 2^n size for data extension
	function comp_internal_size(in_size : natural) return natural is
		constant NB_BIT : natural := natural(ceil(log2(real(in_size))));
	begin
		if (in_size <= 16) then
			return(16);
		else
			return(2**NB_BIT);
		end if;
	end function comp_internal_size;

	constant INT_DATA_SIZE       : natural := comp_internal_size(DATA_SIZE);

	-- control
	signal start_acquisition_s   : std_logic;
	signal busy_s                : std_logic;

	--axi
	constant INT_ADDR_WIDTH      : natural := 2;
	signal addr_s                : std_logic_vector(INT_ADDR_WIDTH-1 downto 0);
	signal write_en_s, read_en_s : std_logic;

	-- input data merge
	signal data_i_s : std_logic_vector((MAX_WAY * DATA_SIZE)-1 downto 0);
	signal data_q_s : std_logic_vector((MAX_WAY * DATA_SIZE)-1 downto 0);
	signal data_rst_s : std_logic_vector(MAX_WAY-1 downto 0);
	signal data_clk_s : std_logic_vector(MAX_WAY-1 downto 0);
	signal data_en_s : std_logic_vector(MAX_WAY-1 downto 0);
	signal data_eof_s : std_logic_vector(MAX_WAY-1 downto 0);

	-- read
	constant AXI_SIZE        : natural := C_S00_AXI_DATA_WIDTH;
	-- address adaptation
	-- bit used for chan muxing
	constant CHAN_MUX_SZ     : natural := natural(ceil(log2(real(NB_INPUT))));
	-- number of pkt (32bits)
	constant NB_PKT_PER_SAMP : natural := ((2*INT_DATA_SIZE)/AXI_SIZE);
	-- bit used for pkt (32bits) muxing
	constant PKT_MUX_SZ      : natural := natural(ceil(log2(real(NB_PKT_PER_SAMP))));
	constant RD_ADDR_SZ      : natural := ADDR_SIZE + CHAN_MUX_SZ + PKT_MUX_SZ;
	signal res_s             : std_logic_vector(AXI_SIZE-1 downto 0);
	signal ram_incr_s         : std_logic;
	signal ram_reinit_s      : std_logic;
begin

	data_i_s <= data12_i_i & data11_i_i & data10_i_i & data9_i_i &
		data8_i_i & data7_i_i & data6_i_i & data5_i_i & data4_i_i & data3_i_i &
		data2_i_i & data1_i_i;
	data_q_s <= data12_q_i & data11_q_i & data10_q_i & data9_q_i &
		data8_q_i & data7_q_i & data6_q_i & data5_q_i & data4_q_i & data3_q_i &
		data2_q_i & data1_q_i;
	data_rst_s <= data12_rst_i & data11_rst_i & data10_rst_i & data9_rst_i & 
		data8_rst_i & data7_rst_i & data6_rst_i & data5_rst_i & 
		data4_rst_i & data3_rst_i & data2_rst_i & data1_rst_i;
	data_clk_s <= data12_clk_i & data11_clk_i & data10_clk_i & data9_clk_i & 
		data8_clk_i & data7_clk_i & data6_clk_i & data5_clk_i & 
		data4_clk_i & data3_clk_i & data2_clk_i & data1_clk_i;
	data_en_s <= data12_en_i & data11_en_i & data10_en_i & data9_en_i & 
		data8_en_i & data7_en_i & data6_en_i & data5_en_i & 
		data4_en_i & data3_en_i & data2_en_i & data1_en_i;
	data_eof_s <= data12_eof_i & data11_eof_i & data10_eof_i & data9_eof_i & 
		data8_eof_i & data7_eof_i & data6_eof_i & data5_eof_i & 
		data4_eof_i & data3_eof_i & data2_eof_i & data1_eof_i;

	data32_top_inst : entity work.dataComplex_to_ram_top
	generic map(DATA_FORMAT => DATA_FORMAT, USE_EOF => USE_EOF,
		NB_WAY => NB_INPUT, NB_SAMPLE => NB_SAMPLE,
		INPUT_SIZE => DATA_SIZE, DATA_SIZE => INT_DATA_SIZE,
		AXI_SIZE => AXI_SIZE,
		ADDR_SIZE => ADDR_SIZE, RD_ADDR_SIZE => RD_ADDR_SZ,
		CHAN_MUX_SZ => CHAN_MUX_SZ, PKT_MUX_SZ => PKT_MUX_SZ)
	port map (
		-- Syscon signals
		cpu_clk_i => s00_axi_aclk, rst_i => s00_axi_reset,
		data_clk_i(NB_INPUT-1 downto 0) => data_clk_s(NB_INPUT-1 downto 0), 
		data_rst_i(NB_INPUT-1 downto 0) => data_rst_s(NB_INPUT-1 downto 0), 
		-- communication signals
		-- control
		start_acquisition_i => start_acquisition_s, busy_o => busy_s,
		-- results
		ram_incr_i => ram_incr_s, ram_reinit_i => ram_reinit_s, res_o => res_s,
		-- input
		data_i_i((NB_INPUT*DATA_SIZE)-1 downto 0) => data_i_s((NB_INPUT*DATA_SIZE)-1 downto 0),
		data_q_i((NB_INPUT*DATA_SIZE)-1 downto 0) => data_q_s((NB_INPUT*DATA_SIZE)-1 downto 0),
		data_en_i(NB_INPUT-1 downto 0) => data_en_s(NB_INPUT-1 downto 0),
		data_eof_i(NB_INPUT-1 downto 0) => data_eof_s(NB_INPUT-1 downto 0)
	);

	wb_inst : entity work.wb_dataComplex_to_ram
	generic map(
		wb_size       => C_S00_AXI_DATA_WIDTH
	)
	port map (reset	=> s00_axi_reset, clk => s00_axi_aclk,
		wbs_add => addr_s, wbs_writedata => s00_axi_wdata,
		wbs_readdata => s00_axi_rdata, wbs_read => read_en_s,
		wbs_read_ack => s00_axi_rvalid, wbs_write => write_en_s,
		ram_incr_o => ram_incr_s, ram_reinit_o => ram_reinit_s,
		ram_data_i => res_s,
		busy_i => busy_s, start_o => start_acquisition_s);

	-- Instantiation of Axi Bus Interface S00_AXI
	handle_comm : entity work.dataComplex_to_ram_handCom
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH,
		INTERNAL_ADDR_WIDTH => INT_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK		=> s00_axi_aclk,
		S_AXI_RESET		=> s00_axi_reset,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WSTRB	    => s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	    => s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RRESP	    => s00_axi_rresp,
		S_AXI_RVALID	=> open,
		S_AXI_RREADY	=> s00_axi_rready,
		read_en_o       => read_en_s,
		write_en_o      => write_en_s,
		addr_o          => addr_s
	);

end Behavioral;

