variable adi_hdl_dir $::env(ADI_HDL_DIR)
source $adi_hdl_dir/projects/scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

set p_device "xc7z010clg225-1"

# xpr creation and bitstream generation
set action [lindex $argv 0]

puts $action

if {[string equal -nocase $action "xpr"]} {
	adi_project_xilinx pluto

	adi_project_files pluto [list \
	  "system_top.v" \
	  "system_constr.xdc" \
	  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v"]
	
	set_property is_enabled false [get_files  *system_sys_ps7_0.xdc]

	save_bd_design

	close_project

} else {
	open_project pluto.xpr

	adi_project_run pluto
	source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl
}

