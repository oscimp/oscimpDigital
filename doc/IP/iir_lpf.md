# iir_lpf_real and iir_lpf_complex

These IPs represent a recursive first-order lowpass filter. Input and output data streams 
are considered to be signed integers (twos complement).  The data stream may be
a real interface (**iir_lpf_real**) or a complex interface (**iir_lpf_complex**). 

Bit width of the integer values is defined by parameter DATA_WIDTH.
Bit shift defining the feedback signal scaling is given by FILTER_COEFF_TWOS_POWER.
* to prevent numerical instabilities and effects of feedback signal quantization,
 the internal signal bit width is increased to DATA_WIDTH + 2 x FILTER_COEFF_TWOS_POWER.
Filter cutoff frequency is defined by sampling clock frequency and bit shift 
parameter FILTER_COEFF_TWOS_POWER according to the formula in figure [1](#iir_lpf_real2). 
 
[iir_lpf_real2]: figures/iir_lpf_real2.svg "iir_lpf_real"
![**iir_lpf_real** block diagram. ][iir_lpf_real2]
__Figure1__: **iir_lpf_real** block diagram.signals *data_in* and *data_en_i* are from input real interface, 
signal *data_o* is from output real interface. Signal *data_en_o* is identical to the signal *en_i_1*.

## IP

* **iir_lpf_real**: lowpass filters real data (data_in)
* **iir_lpf_complex**: lowpass filters complex data (data_in)

## Generic

* **DATA_WIDTH**: (natural) data stream bus size (default: 16).
* **FILTER_COEFF_TWOS_POWER**: (natural) internal variable bit shift; along with sampling frequency 
determines the cutoff frequency (default: 16).

## Ports and interfaces

* **data_in**: (real interface for *iir_lpf_real* and complex interface for
  *iir_lpf_complex*) input data stream
* **data_out**: (real interface for *iir_lpf_real*)and (complex interface for *iir_lpf_complex*) output data stream.

## Registers

**NA**

## TCL instanciation and connection

```tcl
# add a real iir lowpass filter and configure it for a cutoff frequency of about 500 Hz at f_clk = 125MHz.
set lowpass_filter_1 [create_bd_cell -type ip -vlnv ggm:cogen:iir_lpf_real:1.0 iir_lpf]
set_property -dict [list \
    CONFIG.DATA_WIDTH 16 \
    CONFIG.FILTER_COEFF_TWOS_POWER 16] $lowpass_filter_1

# connect data_in to an other block with a real data stream (ADC for instance)
connect_bd_intf_net [get_bd_intf_pins $previous_block/data_out]
	[get_bd_intf_pins $lowpass_filter_1/data_in]
```
## Driver

**NA**

## Functions to configure IP

**NA**
