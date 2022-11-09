set_property -dict [ list CONFIG.PCW_IRQ_F2P_INTR 1 \
	CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
	CONFIG.PCW_USE_S_AXI_HP0 {1} ] $ps7

# ADC
add_ip_and_conf redpitaya_converters converters {
	DAC_EN false \
	ADC_SIZE 14 }

connect_proc_rst converters adc_rst_i
connect_to_fpga_pins converters phys_interface phys_interface_0

connect_intf converters clk_o ps7 S_AXI_HP0_ACLK

#dataReal
add_ip_and_conf dataReal_dma_direct dataReal {
	NB_INPUT 2 \
	NB_SAMPLE 500000 \
	SIGNED_FORMAT true \
	DATA_SIZE 14 \
	USE_SOF false \
	STOP_ON_EOF false }

connect_intf converters dataA_out dataReal data1_in
connect_intf converters dataB_out dataReal data2_in
connect_intf converters clk_o dataReal m00_axis_aclk
connect_proc dataReal s00_axi 0x1000

# axi dma
add_ip_and_conf axi_dma axi_dma_x {
	c_include_sg false \
	c_sg_length_width 24 \
	c_include_mm2s false \
	c_s2mm_burst_size 32}

connect_intf dataReal m00_axis axi_dma_x s_axis_s2mm
connect_intf axi_dma_x s2mm_introut ps7 irq_f2p

apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
	-config {Master "/ps7/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins axi_dma_x/s_axi_lite]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
	-config {Master "/axi_dma_x/M_AXI_S2MM" Clk "Auto"} \
	[get_bd_intf_pins ps7/s_axi_hp0]

connect_bd_net [get_bd_pins rst_converters_125M/peripheral_reset] [get_bd_pins dataReal/m00_axis_reset]
save_bd_design
