variable fpga_ip	$::env(OSCIMP_DIGITAL_IP)

# Defines useful variable
set part_name xc7z010clg400-1
set project_name prn_fir
set build_path tmp
set bd_path $build_path/$project_name.srcs/sources_1/bd/$project_name
set repo_path $fpga_ip

# Remove old project
file delete -force $build_path

# Create the project
create_project $project_name $build_path -part $part_name

# create bd
create_bd_design $project_name

# Add OSC_IMP IP
set_property IP_REPO_PATHS $fpga_ip [current_project]
update_ip_catalog

# Create PS7
startgroup
    set ps7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
    set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET "$fpga_ip/preset/redpitaya_preset.xml" ] $ps7

    # Automation
    apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
        -config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" } \
        $ps7
endgroup

# Save block design
save_bd_design

# Create PNR block
startgroup
   set prn [ create_bd_cell -type ip -vlnv ggm:cogen:prn20b:1.0 prn20b_0 ]
   apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
       -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} \
       Master {/processing_system7_0/M_AXI_GP0} Slave {/prn20b_0/s00_axi} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins $prn/s00_axi]
   connect_bd_net [get_bd_pins $prn/ref_clk_i] [get_bd_pins $ps7/FCLK_CLK0]
   connect_bd_net [get_bd_pins $prn/ref_rst_i] [get_bd_pins rst_ps7_0_125M/peripheral_reset]
endgroup

# Create splitter to raw data and processed data
startgroup
   set splitter_raw_data [ create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 dupplReal_1_to_2_0 ]
   set_property -dict [list CONFIG.DATA_SIZE {20}] $splitter_raw_data
   connect_bd_intf_net [get_bd_intf_pins $splitter_raw_data/data_in] [get_bd_intf_pins $prn/prn_full_out]
endgroup

# Create PNR shifter for proccessed data
startgroup
   set shifter_prn_proc_data [ create_bd_cell -type ip -vlnv ggm:cogen:shifterReal:1.0 shifterReal_0 ]
   set_property -dict [list CONFIG.DATA_OUT_SIZE {16} CONFIG.DATA_IN_SIZE {20}] $shifter_prn_proc_data
   connect_bd_intf_net [get_bd_intf_pins $shifter_prn_proc_data/data_in] [get_bd_intf_pins $splitter_raw_data/data1_out]
endgroup

# Set the initial source
set initial_source $shifter_prn_proc_data/data_out

# Create fir
startgroup
    # Create the block and configure it
    set fir_0 [ create_bd_cell -type ip -vlnv ggm:cogen:firReal:1.0 fir_0 ]
    set_property -dict [ list \
        CONFIG.NB_COEFF {15} \
        CONFIG.DECIMATE_FACTOR {1} \
        CONFIG.COEFF_SIZE {6} \
        CONFIG.DATA_IN_SIZE {16} \
        CONFIG.DATA_OUT_SIZE {22} ] $fir_0

    # Automation for AXI
    apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
       -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" } \
       [get_bd_intf_pins $fir_0/s00_axi]

    # Connect input data
    connect_bd_intf_net\
       [get_bd_intf_pins $initial_source] \
       [get_bd_intf_pins $fir_0/data_in]
endgroup

# Save block design
save_bd_design

# Create shifter
startgroup
    # Create the block and configure it
    set shifter_0 [ create_bd_cell -type ip -vlnv ggm:cogen:shifterReal:1.0 shifter_0 ]
    set_property -dict [ list \
        CONFIG.DATA_OUT_SIZE {20} \
        CONFIG.DATA_IN_SIZE {22} ] $shifter_0

    # Connect input data
    connect_bd_intf_net\
       [get_bd_intf_pins $fir_0/data_out] \
       [get_bd_intf_pins $shifter_0/data_in]
endgroup

# Save block design
save_bd_design

# Create Ram block for processed data
startgroup
   set ram_fir [create_bd_cell -type ip -vlnv ggm:cogen:dataReal_to_ram:1.0 dataReal_to_ram_0]
   set_property -dict [list \
   	CONFIG.NB_INPUT {2} \
   	CONFIG.DATA_SIZE {20} \
   	CONFIG.NB_SAMPLE {4096} ] $ram_fir
   apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { \
       Clk_master {/processing_system7_0/FCLK_CLK0 (125 MHz)} Clk_slave {Auto}\
       Clk_xbar {/processing_system7_0/FCLK_CLK0 (125 MHz)}\
       Master {/processing_system7_0/M_AXI_GP0} Slave {/dataReal_to_ram_0/s00_axi}\
       intc_ip {/ps7_0_axi_periph} master_apm {0}}  [get_bd_intf_pins $ram_fir/s00_axi]
   connect_bd_intf_net [get_bd_intf_pins $ram_fir/data1_in] [get_bd_intf_pins $shifter_0/data_out]
   connect_bd_intf_net [get_bd_intf_pins $ram_fir/data2_in] [get_bd_intf_pins $splitter_raw_data/data2_out]
endgroup

# Save block design
save_bd_design

# Generate the block design
generate_target all [get_files  $bd_path/$project_name.bd]
make_wrapper -files [get_files $bd_path/$project_name.bd] -top

# Set the top block
set project_name_wrapper $project_name
append project_name_wrapper _wrapper
add_files -norecurse $bd_path/hdl/$project_name_wrapper.v

# Load any additional Verilog files in the project folder
set files [glob -nocomplain projects/$project_name/*.v projects/$project_name/*.sv]
if {[llength $files] > 0} {
  add_files -norecurse $files
}

# Create bitstream
launch_runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# export usage
#
open_run impl_1
report_utilization -hierarchical -hierarchical_depth 1 -file prn_fir_usage_ressources.txt

get_bd_addr_segs 

# Copy the bitstream
file copy -force tmp/$project_name.runs/impl_1/${project_name}_wrapper.bit .

exit
