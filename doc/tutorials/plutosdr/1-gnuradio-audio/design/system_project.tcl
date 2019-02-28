
source /home/gwe/boards/pluto/plutosdr-fw/hdl/projects/scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

set p_device "xc7z010clg225-1"
adi_project_xilinx pluto

adi_project_files pluto [list \
  "system_top.v" \
  "system_constr.xdc" \
  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v"]

variable fpga_ip    $::env(GGM_FPGA_IP)
set_property  ip_repo_paths  [list ${fpga_ip} ${ad_hdl_dir}/library] [current_project]
update_ip_catalog

set_property is_enabled false [get_files  *system_sys_ps7_0.xdc]
adi_project_run pluto
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl

