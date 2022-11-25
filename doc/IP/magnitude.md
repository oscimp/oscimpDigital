# magnitude

This IP is used to perform $real \time real + imag \time imag$ of the complex input stream

|[magnitude_output](figures/magnitude.svg)

__figure1__: Magnitude block internal behaviour.

**NOTE: output size is fixed to be (2 * DATA_SIZE) + 1. One have to add a shifter
or an expander to adapts data bus size**

**Internal propagation delay**: 1 clock cycle.
## IP

* **magnitude**: convert a complex stream (data_in) to a real stream (data_out)

## Generic

* **DATA_SIZE**: (natural) input data stream bus size (default: 16).

## Ports and interfaces

* **data_in**: (complex interface) input data stream
* **data_out**: (real interface) output data stream

## Registers

**NA**

## TCL instanciation and connection

```tcl
# add a real mixer and configure it to propagate results with full resolution
# change mixer_sin by mixerComplex_sin to use complex version
add_ip_and_conf magnitude mag {
	DATA_SIZE 16}

# connect data_in to an other block with a real data stream (ADC for instance)
connect_intf $previous_block data_out mag data_in
# connect nco_in to an other block with a complex data stream (NCO for instance)
connect_intf mag data_out $next_block data_in


```
## Driver

**NA**

## Functions to configure IP

**NA**
