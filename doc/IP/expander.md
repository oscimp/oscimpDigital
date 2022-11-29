# expanderReal/expanderComplex

Used to remove MSB or extend MSB by adding a serie of '0' when unsigned or
copiying MSB from input data. If input and output size are the same data are
left unmodified.

Unlike shifter: values are unmodified, only the size is modified.

**Warning: removing too many bits may have to effect to corrupts data.**

[expander_scheme]: figures/expander.svg "expander_scheme"
![expander block internal scheme][expander_scheme]

__figure1__: expander block principle: when **out** > **in**: additionals MSBs are added
(may be '0' when unsigned or the input data's MSB when signed), when **out** < **in**: MSBs
are removed to fit the output size.

### **Internal propagation delay**

0 clock cycle

## IP

* **expanderReal**: extend or truncate input data for real interface
* **expanderComplex**: extend or truncate input data for complex interface

## Generic

* **format**: (string) `signed`/`unsigned`. With `unsigned` and output largest
  expansion is done using a serie of '0', when `signed` input MSB is copied.
* **DATA_IN_SIZE**: (natural) input data stream bus size (default: 16).
* **DATA_OUT_SIZE**: (natural) output data stream bus size (default: 16).

## Ports and interfaces
* **data_in**: input data stream (complex type for *expanderComplex* or
  real type for *expanderReal*). Size is fixed by **DATA_IN_SIZE**
* **data_out**: output data stream (complex type for *expanderComplex* or
  real type for *expanderReal[_dyn]*). Size is fixed by **DATA_OUT_SIZE**

## Registers

**NA**

## TCL instanciation and connection

```tcl
# add expander with input in 32 bits and output in 16 bits. data stream is
# signed
add_ip_and_conf expanderReal expander {
	format signed \
    DATA_IN_SIZE 32 \
    DATA_OUT_SIZE 16] $shift

# connect expander to other blocks.
connect_intf $previous_block data_out expander data_in
connect_intf expander data_out $next_block data_in
```

## Driver

**NA**

## Functions to configure IP

**NA**
