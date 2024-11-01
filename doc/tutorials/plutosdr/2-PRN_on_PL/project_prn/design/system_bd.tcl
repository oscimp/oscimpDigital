variable fpga_ip    $::env(OSCIMP_DIGITAL_IP)

set_property  ip_repo_paths [list ${fpga_ip} ${lib_dirs}] [current_project]
update_ip_catalog

# create board design
# default ports

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr
create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 fixed_io

create_bd_port -dir O spi0_csn_2_o
create_bd_port -dir O spi0_csn_1_o
create_bd_port -dir O spi0_csn_0_o
create_bd_port -dir I spi0_csn_i
create_bd_port -dir I spi0_clk_i
create_bd_port -dir O spi0_clk_o
create_bd_port -dir I spi0_sdo_i
create_bd_port -dir O spi0_sdo_o
create_bd_port -dir I spi0_sdi_i

create_bd_port -dir I -from 16 -to 0 gpio_i
create_bd_port -dir O -from 16 -to 0 gpio_o
create_bd_port -dir O -from 16 -to 0 gpio_t

# interrupts

create_bd_port -dir I -type intr ps_intr_00
create_bd_port -dir I -type intr ps_intr_01
create_bd_port -dir I -type intr ps_intr_02
create_bd_port -dir I -type intr ps_intr_03
create_bd_port -dir I -type intr ps_intr_04
create_bd_port -dir I -type intr ps_intr_05
create_bd_port -dir I -type intr ps_intr_06
create_bd_port -dir I -type intr ps_intr_07
create_bd_port -dir I -type intr ps_intr_08
create_bd_port -dir I -type intr ps_intr_09
create_bd_port -dir I -type intr ps_intr_10
create_bd_port -dir I -type intr ps_intr_11
create_bd_port -dir I -type intr ps_intr_12
create_bd_port -dir I -type intr ps_intr_13
create_bd_port -dir I -type intr ps_intr_14
create_bd_port -dir I -type intr ps_intr_15

# instance: sys_ps7

ad_ip_instance processing_system7 sys_ps7

# ps7 settings

ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V}
ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_NAME clg225
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP1 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP2 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ 200.0
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_IO 17
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_UART1_IO {MIO 12 .. 13}
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C1_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SD0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_SPI0_IO EMIO
ad_ip_parameter sys_ps7 CONFIG.PCW_TTC0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_FABRIC_INTERRUPT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_IO MIO
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_IO {MIO 52}
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_INTR 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_MODE REVERSE

# DDR MT41K256M16 HA-125 (32M, 16bit, 8banks)

ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 0.048
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 0.050
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 0.241
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 0.240

ad_ip_instance xlconcat sys_concat_intc
ad_ip_parameter sys_concat_intc CONFIG.NUM_PORTS 16

ad_ip_instance proc_sys_reset sys_rstgen
ad_ip_parameter sys_rstgen CONFIG.C_EXT_RST_WIDTH 1

# system reset/clock definitions

ad_connect  sys_cpu_clk sys_ps7/FCLK_CLK0
ad_connect  sys_200m_clk sys_ps7/FCLK_CLK1
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N

# interface connections

ad_connect  ddr sys_ps7/DDR
ad_connect  gpio_i sys_ps7/GPIO_I
ad_connect  gpio_o sys_ps7/GPIO_O
ad_connect  gpio_t sys_ps7/GPIO_T
ad_connect  fixed_io sys_ps7/FIXED_IO

# spi connections

ad_connect  spi0_csn_2_o sys_ps7/SPI0_SS2_O
ad_connect  spi0_csn_1_o sys_ps7/SPI0_SS1_O
ad_connect  spi0_csn_0_o sys_ps7/SPI0_SS_O
ad_connect  spi0_csn_i sys_ps7/SPI0_SS_I
ad_connect  spi0_clk_i sys_ps7/SPI0_SCLK_I
ad_connect  spi0_clk_o sys_ps7/SPI0_SCLK_O
ad_connect  spi0_sdo_i sys_ps7/SPI0_MOSI_I
ad_connect  spi0_sdo_o sys_ps7/SPI0_MOSI_O
ad_connect  spi0_sdi_i sys_ps7/SPI0_MISO_I

# interrupts

ad_connect  sys_concat_intc/dout sys_ps7/IRQ_F2P
ad_connect  sys_concat_intc/In15 ps_intr_15
ad_connect  sys_concat_intc/In14 ps_intr_14
ad_connect  sys_concat_intc/In13 ps_intr_13
ad_connect  sys_concat_intc/In12 ps_intr_12
ad_connect  sys_concat_intc/In11 ps_intr_11
ad_connect  sys_concat_intc/In10 ps_intr_10
ad_connect  sys_concat_intc/In9 ps_intr_09
ad_connect  sys_concat_intc/In8 ps_intr_08
ad_connect  sys_concat_intc/In7 ps_intr_07
ad_connect  sys_concat_intc/In6 ps_intr_06
ad_connect  sys_concat_intc/In5 ps_intr_05
ad_connect  sys_concat_intc/In4 ps_intr_04
ad_connect  sys_concat_intc/In3 ps_intr_03
ad_connect  sys_concat_intc/In2 ps_intr_02
ad_connect  sys_concat_intc/In1 ps_intr_01
ad_connect  sys_concat_intc/In0 ps_intr_00

# iic

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_main

ad_ip_instance axi_iic axi_iic_main

ad_connect  iic_main axi_iic_main/iic
ad_cpu_interconnect 0x41600000 axi_iic_main
ad_cpu_interrupt ps-15 mb-15 axi_iic_main/iic2intc_irpt

# ad9361

create_bd_port -dir I rx_clk_in
create_bd_port -dir I rx_frame_in
create_bd_port -dir I -from 11 -to 0 rx_data_in

create_bd_port -dir O tx_clk_out
create_bd_port -dir O tx_frame_out
create_bd_port -dir O -from 11 -to 0 tx_data_out

create_bd_port -dir O enable
create_bd_port -dir O txnrx
create_bd_port -dir I up_enable
create_bd_port -dir I up_txnrx

# ad9361 core(s)

ad_ip_instance axi_ad9361 axi_ad9361
ad_ip_parameter axi_ad9361 CONFIG.ID 0
ad_ip_parameter axi_ad9361 CONFIG.CMOS_OR_LVDS_N 1
ad_ip_parameter axi_ad9361 CONFIG.MODE_1R1T 1
ad_ip_parameter axi_ad9361 CONFIG.ADC_INIT_DELAY 21

ad_ip_instance axi_dmac axi_ad9361_dac_dma
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_TYPE_DEST 2
ad_ip_parameter axi_ad9361_dac_dma CONFIG.CYCLIC 1
ad_ip_parameter axi_ad9361_dac_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_DATA_WIDTH_DEST 32

ad_ip_instance util_fir_int fir_interpolator
ad_ip_instance xlslice interp_slice

ad_ip_instance axi_dmac axi_ad9361_adc_dma
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_TYPE_SRC 2
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.CYCLIC 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_DATA_WIDTH_SRC 32

ad_ip_instance util_fir_dec fir_decimator
ad_ip_instance xlslice decim_slice

# connections

ad_connect  rx_clk_in axi_ad9361/rx_clk_in
ad_connect  rx_frame_in axi_ad9361/rx_frame_in
ad_connect  rx_data_in axi_ad9361/rx_data_in
ad_connect  tx_clk_out axi_ad9361/tx_clk_out
ad_connect  tx_frame_out axi_ad9361/tx_frame_out
ad_connect  tx_data_out axi_ad9361/tx_data_out
ad_connect  enable axi_ad9361/enable
ad_connect  txnrx axi_ad9361/txnrx
ad_connect  up_enable axi_ad9361/up_enable
ad_connect  up_txnrx axi_ad9361/up_txnrx

ad_connect  axi_ad9361/tdd_sync GND
ad_connect  sys_200m_clk axi_ad9361/delay_clk
ad_connect  axi_ad9361/l_clk axi_ad9361/clk

ad_connect axi_ad9361/l_clk fir_decimator/aclk
ad_connect axi_ad9361/adc_data_i0 fir_decimator/channel_0
ad_connect axi_ad9361/adc_data_q0 fir_decimator/channel_1
ad_connect axi_ad9361/adc_valid_i0 fir_decimator/s_axis_data_tvalid
ad_connect axi_ad9361_adc_dma/fifo_wr_din fir_decimator/m_axis_data_tdata
ad_connect axi_ad9361_adc_dma/fifo_wr_en fir_decimator/m_axis_data_tvalid
ad_connect axi_ad9361/up_adc_gpio_out decim_slice/Din
ad_connect fir_decimator/decimate decim_slice/Dout

ad_connect axi_ad9361/l_clk fir_interpolator/aclk
ad_connect axi_ad9361_dac_dma/fifo_rd_dout fir_interpolator/s_axis_data_tdata
ad_connect axi_ad9361_dac_dma/fifo_rd_valid fir_interpolator/s_axis_data_tvalid
ad_connect axi_ad9361/dac_valid_i0 fir_interpolator/dac_read
ad_connect axi_ad9361_dac_dma/fifo_rd_en fir_interpolator/s_axis_data_tready
ad_connect axi_ad9361/dac_data_i0 fir_interpolator/channel_0
ad_connect axi_ad9361/dac_data_q0 fir_interpolator/channel_1
ad_connect axi_ad9361/up_dac_gpio_out interp_slice/Din
ad_connect fir_interpolator/interpolate interp_slice/Dout

ad_connect  axi_ad9361/l_clk axi_ad9361_adc_dma/fifo_wr_clk
ad_connect  axi_ad9361_adc_dma/fifo_wr_overflow axi_ad9361/adc_dovf
ad_connect  axi_ad9361/l_clk axi_ad9361_dac_dma/fifo_rd_clk
ad_connect  axi_ad9361_dac_dma/fifo_rd_underflow axi_ad9361/dac_dunf
ad_connect  axi_ad9361/dac_data_i1 GND
ad_connect  axi_ad9361/dac_data_q1 GND

# interconnects

ad_cpu_interconnect 0x79020000 axi_ad9361
ad_cpu_interconnect 0x7C400000 axi_ad9361_adc_dma
ad_cpu_interconnect 0x7C420000 axi_ad9361_dac_dma
ad_mem_hp1_interconnect sys_cpu_clk sys_ps7/S_AXI_HP1
ad_mem_hp1_interconnect sys_cpu_clk axi_ad9361_adc_dma/m_dest_axi
ad_mem_hp2_interconnect sys_cpu_clk sys_ps7/S_AXI_HP2
ad_mem_hp2_interconnect sys_cpu_clk axi_ad9361_dac_dma/m_src_axi
ad_connect  sys_cpu_resetn axi_ad9361_adc_dma/m_dest_axi_aresetn
ad_connect  sys_cpu_resetn axi_ad9361_dac_dma/m_src_axi_aresetn

# interrupts

ad_cpu_interrupt ps-13 mb-13 axi_ad9361_adc_dma/irq
ad_cpu_interrupt ps-12 mb-12 axi_ad9361_dac_dma/irq


# GGM

# axiStreamToComplex
ad_ip_instance axiStreamToComplex axis2Complex
ad_ip_parameter axis2Complex CONFIG.DATA_SIZE 16

ad_connect axi_ad9361/rst axis2Complex/s00_axis_reset
ad_connect axi_ad9361/l_clk axis2Complex/s00_axis_aclk

ad_connect fir_decimator/m_axis_data_tdata axis2Complex/s00_axis_tdata
ad_connect fir_decimator/m_axis_data_tvalid axis2Complex/s00_axis_tvalid

# duppl
ad_ip_instance dupplComplex_1_to_2 duppl
ad_ip_parameter duppl CONFIG.DATA_SIZE 16

ad_connect axis2Complex/data_out duppl/data_in

# nco
ad_ip_instance nco_counter nco
ad_ip_parameter nco CONFIG.DATA_SIZE 16
ad_ip_parameter nco CONFIG.LUT_SIZE 12
ad_ip_parameter nco CONFIG.COUNTER_SIZE 32

ad_connect axi_ad9361/rst nco/ref_rst_i
ad_connect sys_rstgen/peripheral_reset nco/s00_axi_reset
ad_connect axi_ad9361/l_clk nco/ref_clk_i

create_bd_port -dir O cos_fake_o
ad_connect cos_fake_o nco/cos_fake_o

ad_cpu_interconnect 0x43C00000 nco

# mixer
ad_ip_instance mixerComplex_sin mixer
ad_ip_parameter mixer CONFIG.NCO_SIZE 16
ad_ip_parameter mixer CONFIG.DATA_IN_SIZE 16
ad_ip_parameter mixer CONFIG.DATA_OUT_SIZE 16

ad_connect duppl/data1_out mixer/data_in
ad_connect nco/sine_out mixer/nco_in

# switch
ad_ip_instance switchComplex use_nco
ad_ip_parameter use_nco CONFIG.DEFAULT_INPUT 0
ad_ip_parameter use_nco CONFIG.DATA_SIZE 16

ad_connect duppl/data2_out use_nco/data1_in
ad_connect mixer/data_out use_nco/data2_in
ad_connect sys_rstgen/peripheral_reset use_nco/s00_axi_reset

ad_cpu_interconnect 0x43C10000 use_nco

# clk domain change

# complex to axis
ad_ip_instance complexToAxiStream cplx_to_axis
ad_ip_parameter cplx_to_axis CONFIG.DATA_SIZE 16

ad_connect use_nco/data_out cplx_to_axis/data_in

ad_connect axi_ad9361/l_clk cplx_to_axis/m00_axis_aclk

# fifo
ad_ip_instance fifo_generator fifo_clk_x
ad_ip_parameter fifo_clk_x CONFIG.INTERFACE_TYPE {AXI_STREAM}
ad_ip_parameter fifo_clk_x CONFIG.Clock_Type_AXI {Independent_Clock}
ad_ip_parameter fifo_clk_x CONFIG.Empty_Threshold_Assert_Value_axis 13
ad_ip_parameter fifo_clk_x CONFIG.Empty_Threshold_Assert_Value_rach 13
ad_ip_parameter fifo_clk_x CONFIG.Empty_Threshold_Assert_Value_rdch 1021
ad_ip_parameter fifo_clk_x CONFIG.Empty_Threshold_Assert_Value_wach 13
ad_ip_parameter fifo_clk_x CONFIG.Empty_Threshold_Assert_Value_wdch 1021
ad_ip_parameter fifo_clk_x CONFIG.Empty_Threshold_Assert_Value_wrch 13
ad_ip_parameter fifo_clk_x CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM}
ad_ip_parameter fifo_clk_x CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM}
ad_ip_parameter fifo_clk_x CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM}
ad_ip_parameter fifo_clk_x CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM}
ad_ip_parameter fifo_clk_x CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM}
ad_ip_parameter fifo_clk_x CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM}
ad_ip_parameter fifo_clk_x CONFIG.Full_Flags_Reset_Value 1
ad_ip_parameter fifo_clk_x CONFIG.Full_Threshold_Assert_Value_axis 15
ad_ip_parameter fifo_clk_x CONFIG.Full_Threshold_Assert_Value_rach 15
ad_ip_parameter fifo_clk_x CONFIG.Full_Threshold_Assert_Value_wach 15
ad_ip_parameter fifo_clk_x CONFIG.Full_Threshold_Assert_Value_wrch 15
ad_ip_parameter fifo_clk_x CONFIG.HAS_ACLKEN {false}
ad_ip_parameter fifo_clk_x CONFIG.Input_Depth_axis 16
ad_ip_parameter fifo_clk_x CONFIG.Reset_Type {Asynchronous_Reset}
ad_ip_parameter fifo_clk_x CONFIG.TDATA_NUM_BYTES 4
ad_ip_parameter fifo_clk_x CONFIG.TKEEP_WIDTH 4
ad_ip_parameter fifo_clk_x CONFIG.TSTRB_WIDTH 4
ad_ip_parameter fifo_clk_x CONFIG.TUSER_WIDTH 0

ad_connect cplx_to_axis/m00_axis fifo_clk_x/S_AXIS

ad_connect axi_ad9361/l_clk fifo_clk_x/s_aclk
ad_connect sys_ps7/FCLK_CLK0 fifo_clk_x/m_aclk
ad_connect sys_rstgen/peripheral_aresetn fifo_clk_x/s_aresetn

# fifo axis to complex
ad_ip_instance axiStreamToComplex fifo2Cplx
ad_ip_parameter fifo2Cplx CONFIG.DATA_SIZE 16

ad_connect fifo_clk_x/M_AXIS fifo2Cplx/s00_axis
ad_connect sys_rstgen/peripheral_reset fifo2Cplx/s00_axis_reset
ad_connect sys_ps7/FCLK_CLK0 fifo2Cplx/s00_axis_aclk

# duppl to prns
ad_ip_instance dupplComplex_1_to_2 duppl_xcorr
ad_ip_parameter duppl_xcorr CONFIG.DATA_SIZE 16

ad_connect fifo2Cplx/data_out duppl_xcorr/data_in

# prn1
ad_ip_instance prnGenerator prn1_gen
ad_ip_parameter prn1_gen CONFIG.PERIOD_LEN 1
ad_ip_parameter prn1_gen CONFIG.BIT_LEN 7
ad_ip_parameter prn1_gen CONFIG.PRN_NUM 1

ad_connect sys_ps7/FCLK_CLK0 prn1_gen/clk
ad_connect sys_rstgen/peripheral_reset prn1_gen/reset

# prn4
ad_ip_instance prnGenerator prn4_gen
ad_ip_parameter prn4_gen CONFIG.PERIOD_LEN 1
ad_ip_parameter prn4_gen CONFIG.BIT_LEN 7
ad_ip_parameter prn4_gen CONFIG.PRN_NUM 4

ad_connect sys_ps7/FCLK_CLK0 prn4_gen/clk
ad_connect sys_rstgen/peripheral_reset prn4_gen/reset

# xcorr1
ad_ip_instance xcorr_prn_slow_complex xcorr1
ad_ip_parameter xcorr1 CONFIG.LENGTH 127
ad_ip_parameter xcorr1 CONFIG.NB_BLK 1
ad_ip_parameter xcorr1 CONFIG.IN_SIZE 16
ad_ip_parameter xcorr1 CONFIG.OUT_SIZE 32

ad_connect duppl_xcorr/data1_out xcorr1/data_in
ad_connect prn1_gen/prn_o xcorr1/prn_i
ad_connect xcorr1/prn_sync_o prn1_gen/tick_i

# xcorr4
ad_ip_instance xcorr_prn_slow_complex xcorr4
ad_ip_parameter xcorr4 CONFIG.LENGTH 127
ad_ip_parameter xcorr4 CONFIG.NB_BLK 1
ad_ip_parameter xcorr4 CONFIG.IN_SIZE 16
ad_ip_parameter xcorr4 CONFIG.OUT_SIZE 32

ad_connect duppl_xcorr/data2_out xcorr4/data_in
ad_connect prn4_gen/prn_o xcorr4/prn_i
ad_connect xcorr4/prn_sync_o prn4_gen/tick_i

#dataComplex
ad_ip_instance dataComplex_to_ram data_to_ram
ad_ip_parameter data_to_ram CONFIG.NB_INPUT 2
ad_ip_parameter data_to_ram CONFIG.DATA_SIZE 32
ad_ip_parameter data_to_ram CONFIG.NB_SAMPLE 2048

ad_connect xcorr1/data_out data_to_ram/data1_in
ad_connect xcorr4/data_out data_to_ram/data2_in
ad_connect sys_rstgen/peripheral_reset data_to_ram/s00_axi_reset

ad_cpu_interconnect 0x43C20000 data_to_ram

