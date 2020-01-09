# mixer_sin and mixerComplex_sin

These IPs are used to perform complex multiplication between two data streams. These
two stream are always considered as signed data. The first data stream may be
a real interface (**mixer_sin** (figure [1](#mixer_sin)) or a complex interface (**mixerComplex_sin** figure [2](#mixerComplex_sin)). 

Output size must be fixed by the user:
* to have the full resolution this size must be equal to:
 * *DATA_IN_SIZE + NCO_SIZE -1* for *mixer_sin*
 * *DATA_IN_SIZE + NCO_SIZE* for *mixerComplex_sin*
* with a *DATA_OUT_SIZE* fixed to greater value, some sign bit(s) will be added at
  MSB;
* with a lower value, a right shift (division by 2^n) will be apply.

**NOTE: chronograms shows latency between input and output when no shift are
done. If *DATA_OUT_SIZE* is smaller than internal size an additional clock cycle is
added**

[mixer_sin]: figures/mixer_sin.svg "alt txt"
![**mixer_sin** chronogram. *data_i* and *data_en_i* are from *data_in* interface, and
*nco_i_i* and *nco_q_i* from *nco_in* interface.][mixer_sin]
__Figure1__: **mixer_sin** chronogram. *data_i* and *data_en_i* are from *data_in* interface, and
*nco_i_i* and *nco_q_i* from *nco_in* interface.

[mixerComplex_sin]: figures/mixerComplex_sin.svg "mixerComplex_sin"
![**mixerComplex_sin** chronogram. *data_i_i*, *data_i_i* and *data_en_i* are
from *data_in* interface, and *nco_i_i* and *nco_q_i* from *nco_in* interface.][mixerComplex_sin]

__Figure2__: **mixerComplex_sin** chronogram. *data_i_i*, *data_i_i* and *data_en_i* are
from *data_in* interface, and *nco_i_i* and *nco_q_i* from *nco_in* interface.

## IP

* **mixer_sin**: multiply an real data (data_in) to a complex data (nco_in)
* **mixerComplex_sin**: multiply an complex data (data_in) to an other complex data (nco_in)

## Generic

* **NCO_SIZE**: (natural) NCO stream bus size (default: 16).
* **DATA_IN_SIZE**: (natural) input data stream bus size (default: 16).
* **DATA_OUT_SIZE**: (natural) output data stream bus size (default: 16).

## Ports and interfaces

* **data_in**: (real interface for *mixer_sin* and complex interface for
  *mixerComplex_sin*) input data stream
* **nco_in**: (complex interface) input data stream from an NCO.
* **data_out**: (complex interface) output data stream.

## Registers

**NA**

## TCL instanciation and connection

```tcl
# add a real mixer and configure it to propagate results with full resolution
# change mixer_sin by mixerComplex_sin to use complex version
set mixer_x [create_bd_cell -type ip -vlnv ggm:cogen:mixer_sin:1.0 mixer]
set_property -dict [list \
    CONFIG.NCO_SIZE 16 \
    CONFIG.DATA_IN_SIZE 16 \
	CONFIG.DATA_OUT_SIZE 31] $mixer_x

# connect data_in to an other block with a real data stream (ADC for instance)
connect_bd_intf_net [get_bd_intf_pins $previous_block/data_out]
	[get_bd_intf_pins $mixer_x/data_in]
# connect nco_in to an other block with a complex data stream (NCO for instance)
connect_bd_intf_net [get_bd_intf_pins $nco/data_out]
	[get_bd_intf_pins $mixer_x/data_in]

```
## Driver

**NA**

## Functions to configure IP

**NA**
