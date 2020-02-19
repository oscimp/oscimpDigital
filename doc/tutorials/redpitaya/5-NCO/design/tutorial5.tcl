variable fpga_ip	$::env(OSCIMP_DIGITAL_IP)

set part_name xc7z010clg400-1
# TODO : change name here
set project_name tutorial5
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

# Create instance: ps7, and set properties
startgroup
set ps7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7 ]
set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET "$fpga_ip/preset/redpitaya_preset.xml" ] $ps7
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
	-config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" } \
	$ps7
endgroup

# redpitaya ADC/DAC
set converters [ create_bd_cell -type ip -vlnv ggm:cogen:redpitaya_converters:1.0 converters]
set_property -dict [ list CONFIG.ADC_SIZE 14 \
	CONFIG.ADC_EN true \
	CONFIG.DAC_EN true] $converters
source $repo_path/redpitaya_converters/redpitaya_converters.tcl
connect_bd_intf_net [get_bd_intf_pins $converters/phys_interface] \
	[get_bd_intf_ports phys_interface_0]
connect_bd_intf_net [get_bd_intf_pins $converters/dataB_out] \
	[get_bd_intf_pins $converters/dataB_in]

## duppl converters dataA_out
set duppl_LTC1 [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 duppl_LTC1]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $duppl_LTC1
# converters -> duppl
connect_bd_intf_net [get_bd_intf_pins $converters/dataA_out] \
	[get_bd_intf_pins $duppl_LTC1/data_in]
# duppl -> converters
connect_bd_intf_net [get_bd_intf_pins $duppl_LTC1/data1_out] \
	[get_bd_intf_pins $converters/dataA_in]

## second stage duppl input A
set duppl_LTC2 [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 duppl_LTC2]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $duppl_LTC2
connect_bd_intf_net [get_bd_intf_pins duppl_LTC1/data2_out] \
	[get_bd_intf_pins duppl_LTC2/data_in]

## NCO
set datanco [create_bd_cell -type ip -vlnv ggm:cogen:nco_counter:1.0 datanco]
set_property -dict [ list CONFIG.DATA_SIZE {16} \
	CONFIG.COUNTER_SIZE {32}] $datanco
connect_bd_net [get_bd_pins $converters/clk_o] \
	[get_bd_pins $datanco/ref_clk_i]
connect_bd_net [get_bd_pins $converters/rst_o] \
	[get_bd_pins $datanco/ref_rst_i]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/ps7/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins datanco/s00_axi]

## dupplNCO
set duppl_NCO [create_bd_cell -type ip -vlnv ggm:cogen:dupplComplex_1_to_2:1.0 duppl_NCO]
set_property -dict [ list CONFIG.DATA_SIZE {16}] $duppl_NCO
# nco -> duppl
connect_bd_intf_net [get_bd_intf_pins $datanco/sine_out] \
	[get_bd_intf_pins $duppl_NCO/data_in]

## mixer
set mixer [create_bd_cell -type ip -vlnv ggm:cogen:mixer_sin:1.0 mixer]
set_property -dict [ list CONFIG.DATA_IN_SIZE {14} \
	CONFIG.DATA_OUT_SIZE 14 \
	CONFIG.NCO_SIZE {16}] $mixer
# dupplADC -> mixer
connect_bd_intf_net [get_bd_intf_pins $duppl_LTC2/data2_out] \
	[get_bd_intf_pins $mixer/data_in]
# dupplNCO -> mixer
connect_bd_intf_net [get_bd_intf_pins $duppl_NCO/data1_out] \
	[get_bd_intf_pins $mixer/nco_in]

## expand out mixer
set expand_mix [create_bd_cell -type ip -vlnv ggm:cogen:expanderComplex:1.0 expand_mix]
set_property -dict [ list CONFIG.DATA_IN_SIZE {14} \
	CONFIG.DATA_OUT_SIZE {16}] $expand_mix
# mixer -> expander
connect_bd_intf_net [get_bd_intf_pins $mixer/data_out] \
	[get_bd_intf_pins $expand_mix/data_in]

# duppl ADC
set duppl_toRe [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 duppl_toRe]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $duppl_toRe
connect_bd_intf_net [get_bd_intf_pins $duppl_LTC2/data1_out] \
	[get_bd_intf_pins $duppl_toRe/data_in]

# real2cplx chanA raw
set R2C [create_bd_cell -type ip -vlnv ggm:cogen:convertRealToComplex:1.0 R2C]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $R2C
# duppl(1) -> R2C(I)
connect_bd_intf_net [get_bd_intf_pins $duppl_toRe/data1_out] \
	[get_bd_intf_pins $R2C/dataI_in]
# duppl(1) -> R2C(Q)
connect_bd_intf_net [get_bd_intf_pins $duppl_toRe/data2_out] \
	[get_bd_intf_pins $R2C/dataQ_in]

# expander chanA raw
set expand_R2C [create_bd_cell -type ip -vlnv ggm:cogen:expanderComplex:1.0 expand_R2C]
set_property -dict [ list CONFIG.DATA_IN_SIZE {14} \
	CONFIG.DATA_OUT_SIZE {16}] $expand_R2C
connect_bd_intf_net [get_bd_intf_pins $R2C/data_out] \
	[get_bd_intf_pins $expand_R2C/data_in]

## data2ram
set data1600 [create_bd_cell -type ip -vlnv ggm:cogen:dataComplex_to_ram:1.0 data1600]
set_property -dict [ list CONFIG.NB_INPUT {3} \
	CONFIG.DATA_SIZE {16} \
	CONFIG.NB_SAMPLE {4096} ] $data1600
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/ps7/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins $data1600/s00_axi]

# raw -> data16
connect_bd_intf_net [get_bd_intf_pins $expand_R2C/data_out] \
	[get_bd_intf_pins $data1600/data1_in]
# mixer -> data16
connect_bd_intf_net [get_bd_intf_pins $expand_mix/data_out] \
	[get_bd_intf_pins $data1600/data2_in]
# nco -> data16
connect_bd_intf_net [get_bd_intf_pins $duppl_NCO/data2_out] \
	[get_bd_intf_pins $data1600/data3_in]


# ====================================================================================
# Connections 
#

# Global connections CPU/RESET
## reset processing_rst : reset
connect_bd_net [get_bd_pins rst_ps7_125M/peripheral_reset] \
	[get_bd_pins $converters/adc_rst_i]

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
