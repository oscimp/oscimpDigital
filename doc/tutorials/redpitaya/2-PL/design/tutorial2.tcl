variable fpga_ip	$::env(OSCIMP_DIGITAL_IP)
variable board_name $::env(BOARD_NAME)

# change to upper
set up_board [string toupper $board_name]

if {$up_board == "REDPITAYA"} {
	set part_name xc7z010clg400-1
	set board_preset "$fpga_ip/preset/redpitaya_preset.xml"
	set ADC_SIZE 14
} else {
	if {$up_board == "REDPITAYA16"} {
		set part_name xc7z020clg400-1
		set board_preset "$fpga_ip/preset/redpitaya16_preset.xml"
		set ADC_SIZE 16
	}
}
set project_name tutorial2
set build_path tmp
set bd_path $build_path/$project_name.srcs/sources_1/bd/$project_name
set repo_path $fpga_ip

file delete -force $build_path

# Project and block design creation
create_project $project_name $build_path -part $part_name
create_bd_design $project_name

# Set Path for the custom IP cores
set_property IP_REPO_PATHS $repo_path [current_project]
update_ip_catalog

########################
## instances (CTRL-i) ##
########################

source $repo_path/redpitaya_converters/redpitaya_converters.tcl
set converters [ create_bd_cell -type ip -vlnv ggm:cogen:redpitaya_converters:1.0 converters]
set_property -dict [ list CONFIG.ADC_SIZE $ADC_SIZE \
	CONFIG.ADC_EN true \
	CONFIG.DAC_EN true] $converters

# shifter is mandatory for redpitaya 16 : ADC is 16bits DAC 14bits
set shiftA [ create_bd_cell -type ip -vlnv ggm:cogen:shifterReal:1.0 shiftA]
set_property -dict [ list \
	CONFIG.SIGNED_FORMAT true \
	CONFIG.DATA_IN_SIZE $ADC_SIZE \
	CONFIG.DATA_OUT_SIZE 14] $shiftA
set shiftB [ create_bd_cell -type ip -vlnv ggm:cogen:shifterReal:1.0 shiftB]
set_property -dict [ list \
	CONFIG.SIGNED_FORMAT true \
	CONFIG.DATA_IN_SIZE $ADC_SIZE \
	CONFIG.DATA_OUT_SIZE 14] $shiftB

# Create instance: ps7, and set properties
startgroup
set ps7 [ create_bd_cell -type ip \
	-vlnv xilinx.com:ip:processing_system7:5.5 ps7 ]
set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET $board_preset ] $ps7
endgroup

# custom reset in case no AXI communication block is used
set rst_ps7_0_125M [create_bd_cell -type ip \
	-vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_125M]

# ====================================================================================
# Connections 
#

# Create port connections (make external = CTRL-t)
connect_bd_intf_net [get_bd_intf_pins $converters/phys_interface] \
	[get_bd_intf_ports phys_interface_0]

# ADC -> DAC (intf = connect interfaces)
connect_bd_intf_net [get_bd_intf_pins $converters/dataA_out] \
	[get_bd_intf_pins $shiftA/data_in]
connect_bd_intf_net [get_bd_intf_pins $shiftA/data_out] \
	[get_bd_intf_pins $converters/dataA_in]

connect_bd_intf_net [get_bd_intf_pins $converters/dataB_out] \
	[get_bd_intf_pins $shiftB/data_in]
connect_bd_intf_net [get_bd_intf_pins $shiftB/data_out] \
	[get_bd_intf_pins $converters/dataB_in]

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
## reset processing_rst : reset
connect_bd_net -net rst_ps7_0_125M_peripheral_reset \
	[get_bd_pins $converters/adc_rst_i] \
	[get_bd_pins rst_ps7_0_125M/peripheral_reset]

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
add_files -norecurse -fileset constrs_1 $repo_path/redpitaya_converters/redpitaya_converters.xdc
add_files -norecurse -fileset constrs_1 $repo_path/redpitaya_converters/redpitaya_converters_adc.xdc

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
launch_runs synth_1 -jobs 4
wait_on_run synth_1
## do implementation
launch_runs impl_1 -jobs 4
wait_on_run impl_1
## make bit file
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
exit
