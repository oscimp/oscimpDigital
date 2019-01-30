variable fpga_ip	$::env(OSCIMP_DIGITAL_IP)

set part_name xc7z010clg400-1
set project_name tutorial2
set build_path tmp
set bd_path $build_path/$project_name.srcs/sources_1/bd/$project_name
set repo_path $fpga_ip

file delete -force $build_path

# Project and block design creation
create_project $project_name $build_path -part $part_name
create_bd_design $project_name

# Load RedPitaya ports
source $repo_path/ltc2145/ltc2145.tcl
source $repo_path/ad9767/ad9767.tcl
source $repo_path/redpitaya_adc_dac_clk/redpitaya_adc_dac_clk.tcl

# Set Path for the custom IP cores
set_property IP_REPO_PATHS $repo_path [current_project]
update_ip_catalog

########################
## instances (CTRL-i) ##
########################

# ltc2145_0
set ltc2145_0 [create_bd_cell -type ip -vlnv gwbs:user:ltc2145:1.0 ltc2145_0]
# ad9767_0
set ad9767_0 [create_bd_cell -type ip -vlnv ggm:cogen:ad9767:1.0 ad9767_0]
# redpitaya_adc_dac_clk_0
set redpitaya_adc_dac_clk_0 [create_bd_cell -type ip \
	-vlnv ggm:cogen:redpitaya_adc_dac_clk:1.0 redpitaya_adc_dac_clk_0]

# Create instance: ps7, and set properties
startgroup
set ps7 [ create_bd_cell -type ip \
	-vlnv xilinx.com:ip:processing_system7:5.5 ps7 ]
set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET "$fpga_ip/preset/redpitaya_preset.xml" ] $ps7
endgroup

# custom reset in case no AXI communication block is used
set rst_ps7_0_125M [create_bd_cell -type ip \
	-vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_125M]

# ====================================================================================
# Connections 
#

# Create port connections (make external = CTRL-t)
# ADC
connect_bd_net -net adc_data_a_i_1 [get_bd_ports adc_data_a_i_0] [get_bd_pins ltc2145_0/adc_data_a_i]
connect_bd_net -net adc_data_b_i_1 [get_bd_ports adc_data_b_i_0] [get_bd_pins ltc2145_0/adc_data_b_i]
connect_bd_net -net ltc2145_0_adc_cdcs [get_bd_ports adc_cdcs_0] [get_bd_pins ltc2145_0/adc_cdcs]

# clock
connect_bd_net -net adc_clk_n_i_1 [get_bd_ports adc_clk_n_i_0] [get_bd_pins redpitaya_adc_dac_clk_0/adc_clk_n_i]
connect_bd_net -net adc_clk_p_i_1 [get_bd_ports adc_clk_p_i_0] [get_bd_pins redpitaya_adc_dac_clk_0/adc_clk_p_i]
# DAC
connect_bd_net -net ad9767_0_dac_clk_o [get_bd_ports dac_clk_o_0] [get_bd_pins ad9767_0/dac_clk_o]
connect_bd_net -net ad9767_0_dac_dat_o [get_bd_ports dac_dat_o_0] [get_bd_pins ad9767_0/dac_dat_o]
connect_bd_net -net ad9767_0_dac_rst_o [get_bd_ports dac_rst_o_0] [get_bd_pins ad9767_0/dac_rst_o]
connect_bd_net -net ad9767_0_dac_sel_o [get_bd_ports dac_sel_o_0] [get_bd_pins ad9767_0/dac_sel_o]
connect_bd_net -net ad9767_0_dac_wrt_o [get_bd_ports dac_wrt_o_0] [get_bd_pins ad9767_0/dac_wrt_o]

# Create connections between blocks
# ADC (connect signals)
connect_bd_net -net redpitaya_adc_dac_clk_0_adc_clk_o \
	[get_bd_pins ltc2145_0/adc_clk_i] [get_bd_pins redpitaya_adc_dac_clk_0/adc_clk_o]
# DAC
connect_bd_net -net redpitaya_adc_dac_clk_0_dac_2clk_o \
	[get_bd_pins ad9767_0/dac_2clk_i] [get_bd_pins redpitaya_adc_dac_clk_0/dac_2clk_o]
connect_bd_net -net redpitaya_adc_dac_clk_0_dac_2ph_o \
	[get_bd_pins ad9767_0/dac_2ph_i] [get_bd_pins redpitaya_adc_dac_clk_0/dac_2ph_o]
connect_bd_net -net redpitaya_adc_dac_clk_0_dac_clk_o \
	[get_bd_pins ad9767_0/dac_clk_i] [get_bd_pins redpitaya_adc_dac_clk_0/dac_clk_o]
connect_bd_net -net redpitaya_adc_dac_clk_0_dac_locked_o \
	[get_bd_pins ad9767_0/dac_locked_i] [get_bd_pins redpitaya_adc_dac_clk_0/dac_locked_o]
# ADC -> DAC (intf = connect interfaces)
connect_bd_intf_net -intf_net adc_dac_a \
	[get_bd_intf_pins ltc2145_0/dataA_out] \
	[get_bd_intf_pins ad9767_0/dataA_in]
connect_bd_intf_net -intf_net adc_dac_b \
	[get_bd_intf_pins ltc2145_0/dataB_out] \
	[get_bd_intf_pins ad9767_0/dataB_in]

# Global connections CPU/RESET
## clock (explicit since no AXI bus is used)
connect_bd_net -net ps7_FCLK_CLK0 \
	[get_bd_pins ps7/M_AXI_GP0_ACLK] \
	[get_bd_pins rst_ps7_0_125M/slowest_sync_clk] \
	[get_bd_pins ps7/FCLK_CLK0]
## reset CPU -> processing_rst
connect_bd_net -net ps7_FCLK_RESET0_N \
	[get_bd_pins ps7/FCLK_RESET0_N] \
	[get_bd_pins rst_ps7_0_125M/ext_reset_in]
## reset adc_dac_clk : aresetn
connect_bd_net -net adc_dac_clk_rst_o \
	[get_bd_pins ltc2145_0/processing_rst_i] \
	[get_bd_pins redpitaya_adc_dac_clk_0/adc_rst_o]
## reset processing_rst : reset
connect_bd_net -net rst_ps7_0_125M_peripheral_reset \
	[get_bd_pins redpitaya_adc_dac_clk_0/adc_rst_i] \
	[get_bd_pins rst_ps7_0_125M/peripheral_reset]
## reset processing_rst : aresetn
connect_bd_net -net rst_ps7_0_125M_peripheral_aresetn \
	[get_bd_pins ltc2145_0/resetn] \
	[get_bd_pins rst_ps7_0_125M/peripheral_aresetn]

#==========================
# autoconnect and AXI	 =
#==========================

apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
	-config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" } \
	$ps7

save_bd_design

# ====================================================================================
# Generate output products and wrapper, add constraint any any additional files
# ====================================================================================
#
make_wrapper -files [get_files $bd_path/$project_name.bd] -top

set project_name_wrapper $project_name
append project_name_wrapper _wrapper
add_files -norecurse $bd_path/hdl/$project_name_wrapper.v

# Load any additional Verilog files in the project folder
set files [glob -nocomplain projects/$project_name/*.v projects/$project_name/*.sv]
if {[llength $files] > 0} {
  add_files -norecurse $files
}

# Load RedPitaya constraint files
add_files -norecurse -fileset constrs_1 $repo_path/ltc2145/ltc2145-redpy.xdc
add_files -norecurse -fileset constrs_1 $repo_path/ad9767/ad9767.xdc
add_files -norecurse -fileset constrs_1 $repo_path/redpitaya_adc_dac_clk/redpitaya_clk_pin.xdc

set_property VERILOG_DEFINE {TOOL_VIVADO} [current_fileset]

# =================================================
# synth & impl
# =================================================

set_property "needs_refresh" "1" [get_runs impl_1]
# set the current impl run
current_run -implementation [get_runs impl_1]							
puts "INFO: Project created: $project_name"
# set the current impl run
current_run -implementation [get_runs impl_1]
generate_target all [get_files $bd_path/$project_name.bd]
launch_runs synth_1
wait_on_run synth_1
## do implementation
launch_runs impl_1
wait_on_run impl_1
## make bit file
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
exit
