# adder_substracter_real and adder_substracter_complex

These IPs are used to add or subtract two real or complex data streams. These
two stream are always considered as signed data. The data stream may be
real interfaces (**adder_substracter_real** (figure [1](#adder_substracter_real)) or 
complex interfaces (**adder_substracter_complex** figure [2](#adder_substracter_complex)). 

Output size is *DATA_SIZE+1* with *DATA_SIZE* the input size.

[adderReal]: figures/adderReal.svg "adderReal"
![**adder_substracter_real** chronogram. *data1_i* and *data1_en_i* are from *data1_in* interface, 
and *data2_i* and *data2_en_i* from *data2_in* interface.][adderReal]
__Figure1__: **adder_substracter_real** chronogram. *data1_i* and *data1_en_i* are from *data1_in* 
interface, and *data2_i* and *data2_en_i* from *data2_in* interface.

[adderComplex]: figures/adderComplex.svg "adderComplex"
![**adder_substracter_complex** chronogram. *data1_i_i*, *data1_i_q* and *data1_en_i* are
from *data1_in* interface, and *data2_i_i*, *data2_i_q* and *data2_en_i* from *data2_in* 
interface.][adderComplex]

__Figure2__: **adder_substracter_complex** chronogram. *data1_i_i*, *data1_i_q* and *data1_en_i* are
from *data1_in* interface, and *data2_i_i*, *data2_i_q* and *data2_en_i* from *data2_in* 
interface.

## IP

* **adder_substracter_real**: adds a real data stream (data1_i) to another real data
stream (data2_i)
* **adder_substracter_complex**: adds a complex data stream (data1_i) to another complex data
stream (data2_i)

## Generic

* **DATA_SIZE**: (natural) input data stream bus size (default: 16).

## Ports and interfaces

* **data1_i**: (real interface for *adder_substracter_real* and complex interface for
  *adder_substracter_complex*) input data stream
* **data2_i**: (real interface for *adder_substracter_real* and complex interface for
  *adder_substracter_complex*) input data stream
* **data_o**: (real interface for *adder_substracter_real* and complex interface for
  *adder_substracter_complex*) output data stream.

## Registers

**NA**

## TCL instanciation and connection

```tcl
# add a real mixer and configure it to propagate results with full resolution
# change mixer_sin by mixerComplex_sin to use complex version
set adder_subtracter_x [create_bd_cell -type ip -vlnv ggm:cogen:adder_substracter_real:1.0 adder_subtracter_real]
set_property -dict [list \
    CONFIG.DATA_SIZE 14 ] $adder_subtracter_x

# connect data1_i to an other block with a real data stream (ADC for instance)
connect_bd_intf_net [get_bd_intf_pins $previous_block/data_out]
	[get_bd_intf_pins $adder_subtracter_x/data1_i]
connect_bd_intf_net [get_bd_intf_pins $previous_block/data_out]
	[get_bd_intf_pins $adder_subtracter_x/data2_i]

```
## Driver

**NA**

## Functions to configure IP

**NA**
