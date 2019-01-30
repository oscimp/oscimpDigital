# vivado -mode batch -source addr.tcl | grep -A1 \ SEG
open_project tmp/prn_fir.xpr
open_bd_design tmp/prn_fir.srcs/sources_1/bd/prn_fir/prn_fir.bd
set liste [get_bd_addr_segs]
puts stdout $liste
set max [llength $liste]
puts stdout $max
for {set i 0} {$i < $max} {incr i} {
  report_property -all [lindex [get_bd_addr_segs ] $i ]
 }

