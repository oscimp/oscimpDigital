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

# Load RedPitaya ports: only for blocks to be connected to hardware ports/pins
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
# dupplReal_1_to_2
set duppl_LTC1 [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 duppl_LTC1]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $duppl_LTC1
set duppl_LTC2 [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 duppl_LTC2]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $duppl_LTC2
set duppl_toRe [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 duppl_toRe]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $duppl_toRe
set R2C [create_bd_cell -type ip -vlnv ggm:cogen:convertRealToComplex:1.0 R2C]
set_property -dict [ list CONFIG.DATA_SIZE {14}] $R2C
set duppl_NCO [create_bd_cell -type ip -vlnv ggm:cogen:dupplComplex_1_to_2:1.0 duppl_NCO]
set_property -dict [ list CONFIG.DATA_SIZE {16}] $duppl_NCO
set data_to_ram [create_bd_cell -type ip -vlnv ggm:cogen:dataComplex_to_ram:1.0 data_to_ram]
set_property -dict [ list CONFIG.NB_INPUT {3} \
						CONFIG.DATA_SIZE {16} \
						CONFIG.NB_SAMPLE {4096} ] $data_to_ram
set mixer [create_bd_cell -type ip -vlnv ggm:cogen:mixer_sin:1.0 mixer]
# mixer output size = DATA_SIZE (on retranche gain applique' sur NCO)
set_property -dict [ list CONFIG.DATA_SIZE {14} \
						CONFIG.NCO_SIZE {16}] $mixer
set nco [create_bd_cell -type ip -vlnv ggm:cogen:nco_counter:1.0 nco]
set_property -dict [ list CONFIG.DATA_SIZE {16} \
						CONFIG.COUNTER_SIZE {32}] $nco
set expand_mix [create_bd_cell -type ip -vlnv ggm:cogen:expanderComplex:1.0 expand_mix]
set_property -dict [ list CONFIG.DATA_IN_SIZE {14} \
						CONFIG.DATA_OUT_SIZE {16}] $expand_mix
set expand_R2C [create_bd_cell -type ip -vlnv ggm:cogen:expanderComplex:1.0 expand_R2C]
set_property -dict [ list CONFIG.DATA_IN_SIZE {14} \
						CONFIG.DATA_OUT_SIZE {16}] $expand_R2C

# Create instance: ps7, and set properties
startgroup
set ps7 [ create_bd_cell -type ip \
	-vlnv xilinx.com:ip:processing_system7:5.5 ps7 ]
set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET "$fpga_ip/preset/redpitaya_preset.xml" ] $ps7
endgroup

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
connect_bd_intf_net -intf_net adc_dac_b \
	[get_bd_intf_pins ad9767_0/dataB_in] \
	[get_bd_intf_pins ltc2145_0/dataB_out]
connect_bd_intf_net -intf_net adc_duppl0 \
	[get_bd_intf_pins ltc2145_0/dataA_out] \
	[get_bd_intf_pins duppl_LTC1/data_in]
connect_bd_intf_net -intf_net adc_dac_a \
	[get_bd_intf_pins ad9767_0/dataA_in] \
	[get_bd_intf_pins duppl_LTC1/data1_out]
connect_bd_intf_net -intf_net adc_duppl1 \
	[get_bd_intf_pins duppl_LTC1/data2_out] \
	[get_bd_intf_pins duppl_LTC2/data_in]
connect_bd_intf_net -intf_net duppl_toRe \
	[get_bd_intf_pins duppl_LTC2/data1_out] \
	[get_bd_intf_pins duppl_toRe/data_in]
connect_bd_intf_net -intf_net R2Cre \
	[get_bd_intf_pins R2C/dataQ_in] \
	[get_bd_intf_pins duppl_toRe/data1_out]
connect_bd_intf_net -intf_net R2Cim \
	[get_bd_intf_pins R2C/dataI_in] \
	[get_bd_intf_pins duppl_toRe/data2_out]
connect_bd_intf_net -intf_net expand_R2Cs \
	[get_bd_intf_pins expand_R2C/data_in] \
	[get_bd_intf_pins R2C/data_out]
connect_bd_intf_net -intf_net mixerrf \
	[get_bd_intf_pins mixer/data_in] \
	[get_bd_intf_pins duppl_LTC2/data2_out]
connect_bd_intf_net -intf_net mixerlo \
	[get_bd_intf_pins mixer/nco_in] \
	[get_bd_intf_pins duppl_NCO/data1_out]
connect_bd_intf_net -intf_net duppllo \
	[get_bd_intf_pins nco/sine_out] \
	[get_bd_intf_pins duppl_NCO/data_in]
connect_bd_intf_net -intf_net expand_IF \
	[get_bd_intf_pins mixer/data_out] \
	[get_bd_intf_pins expand_mix/data_in]
connect_bd_intf_net [get_bd_intf_pins $data_to_ram/data2_in] \
	[get_bd_intf_pins $expand_mix/data_out]
connect_bd_intf_net [get_bd_intf_pins $data_to_ram/data1_in] \
	[get_bd_intf_pins $expand_R2C/data_out]
connect_bd_intf_net [get_bd_intf_pins $data_to_ram/data3_in] \
	[get_bd_intf_pins $duppl_NCO/data2_out]

#==========================
# autoconnect and AXI	 =
#==========================
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/ps7/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins $data_to_ram/s00_axi]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/ps7/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins nco/s00_axi]
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
	-config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" } \
	$ps7

# Global connections CPU/RESET
## reset processing_rst : reset
connect_bd_net -net rst_ps7_125M_peripheral_reset \
	[get_bd_pins ltc2145_0/processing_rst_i] \
	[get_bd_pins redpitaya_adc_dac_clk_0/adc_rst_i] \
	[get_bd_pins rst_ps7_125M/peripheral_reset]
connect_bd_net -net red_clk_mixer \
	[get_bd_pins nco/ref_clk_i] \
	[get_bd_pins ltc2145_0/adc_clk]
## reset processing_rst : aresetn
connect_bd_net -net rst_ps7_125M_peripheral_aresetn \
	[get_bd_pins ltc2145_0/resetn] \
	[get_bd_pins rst_ps7_125M/peripheral_aresetn]
connect_bd_net -net red_rst_mixer \
	[get_bd_pins nco/ref_rst_i] \
	[get_bd_pins redpitaya_adc_dac_clk_0/adc_rst_o]

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
launch_runs synth_1 -jobs 4
wait_on_run synth_1
## do implementation
launch_runs impl_1 -jobs 4
wait_on_run impl_1
## make bit file
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
exit
