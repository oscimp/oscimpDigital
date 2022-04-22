#  unwrap_phase_diff

This IP represents an algorithm to compute instantaneous frequency as a difference of successive 
samples of signal phase. The frequency is corrected for jumps at the end of base <-pi, pi> interval.
The base <-pi, pi> interval is mapped into integer range and the corresponding limits are defined by 
the constant PI_VALUE. 
For example: if the input phase value is incrementing and reaches the upper limit (+ PI_VALUE) and 
wraps around to the lower limit(-PI_VALUE), the successive difference is 2PI_VALUE. The algorithm 
detects a phase jump, if the successive differences are greater than the decision threshold being PI_VALUE.
Based on the sign of the phase jump, either 2PI_VALUE is added if the phase jump is negative, or 
subtracted vice-versa (see [fig.1])
[fig.1]:figures/unwrap_phase_diff_rewritten_logic.svg "unwrap_phase_diff_rewritten_logic"

![**unwrap_phase_diff** block diagram. ][fig.1]
__Figure1__: **unwrap_phase_diff** HDL code-corresponding block diagram.

Three distinct modes of the phase jump estimation are implemented, 0: simple phase unwrapping,
1: phase and frequency unwrapping, 2: robust phase and frequency unwrapping. Their meaning is described
in the original literature [1].
[1]:https://corpus.ulaval.ca/jspui/handle/20.500.11794/26766 "Bergeron, H.: Synthese de frequences optiques"

The data stream is a real interface .
Integer value representing the value of PI is defined by PI_VALUE. This corresponds to a base PI interval
used typically by preceding cordic_atan signal block.
Method of phase (and/or frequency) unwrapping is given by numerical constant ESTIMATION_METHOD.

## IP

* **unwrap_phase_diff**: continuous phase differentiation and unwrapping algorithm.

## Generic

* **DATA_WIDTH**: (natural) data stream bus size (default: 16).
** This should equal to the output data width of the typically preceding cordic_atan signal block.
* **DATA_OUT_WIDTH**: (natural) data stream bus size (default: 32).
** It is equal or greater greater than input data width ( greater when a phase and frequency unwrapping is used).
For a further reference see [1].
* PI_VALUE (integer) : integer value defines mapping between PI number and its integer representation. i
This value is typically used by preceding 
cordic_atan signal block.(default: 12868 ~ 3.141*2**(13-1) - cordic).

## Ports and interfaces

* **data_in**: (real interface) input data stream
* **data_out**: (real interface) output data stream.

## Registers

**NA**

## TCL instanciation and connection

```tcl
# add an unwrap_phase_diff module and configure it.
set unwrap1 [create_bd_cell -type ip -vlnv ggm:cogen:unwrap_phase_diff:1.0 unwrap_phase_diff]
set_property -dict [list \
    CONFIG.DATA_WIDTH 16 \
    CONFIG.DATA_OUT_WIDTH 32\
    CONFIG.ESTIMATION_METHOD 0\
    CONFIG.PI_VALUE 12868 \
    CONFIG.FILTER_COEFF_TWOS_POWER 16] $unwrap1

# connect data_in to an other block with a real data stream (ADC for instance)
connect_bd_intf_net [get_bd_intf_pins $previous_block/data_out]
	[get_bd_intf_pins $unwrap_1/data_in]
connect_bd_intf_net [get_bd_intf_pins $unwrap_1/data_out]
	[get_bd_intf_pins $next_block/data_in]

```
## Driver

**NA**

## Functions to configure IP

**NA**
