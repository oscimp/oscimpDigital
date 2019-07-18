# shifter

Used to apply a n-bit shift left or right (multiply/divide by 2^n):
* if output bus size is greater than input bus size a shift left is applied by
  adding a serie of 0 at LSB
* if both buses have the same size, then nothing is done
* if input bus size is greater than output bus size, a shift right is applied by
  discarding LSB (ie. propagating only output bus size MSB from input bus size)

## IP
* **shifterReal**: fixed shift (design time) working with real interface
* **shifterComplex**: fixed shift (design time) working with complex interface
* **shifterReal_dyn**: dynamic (CPU programmable) shift with fixed output bus size with real
  interface
* **shifterComplex_dyn**: dynamic (CPU programmable) shift with fixed output size with complex
  interface

**Note**: for *shifterXX_dyn* only right-shift (division) is supported

## Generic
### Common
* **DATA_IN_SIZE**: (natural) input data stream bus size (default: 16).
* **DATA_OUT_SIZE**: (natural) output data stream bus size (default: 32).

### dyn
* **SIGNED_DATA**: (boolean) data format (default: true)
* **DEFAULT_SHIFT** (natural) after reset how many LSB are discarded (default: 0)

## Ports and interfaces
### Common
* **data_in**: input data stream (complex type for *shifterComplex[_dyn]* or
  real type for *shifterReal[_dyn]*). Size fixed by **DATA_IN_SIZE**
* **data_out**: output data stream (complex type for *shifterComplex[_dyn]* or
  real type for *shifterReal[_dyn]*). Size fixed by **DATA_OUT_SIZE**

### dyn
* **s00_axi**: axi interface to connect to the CPU wrapper
* **s00_axi_reset**: reset signal in the **s00_axi** clock domain
* **s00_axi_aclk**: clock signal used for everything related to CPU
  communication

## TCL instanciation and connection

### common

```tcl
# add shifter with input in 32 bits and output in 16 bits
# replace shifterComplex_dyn by shifterReal_dyn or by shifterReal or shifterComplex
set shift [create_bd_cell -type ip -vlnv ggm:cogen:shifterComplex_dyn:1.0 shift]
set_property -dict [ list \
    CONFIG.DATA_IN_SIZE 32 \
    CONFIG.DATA_OUT_SIZE 16] $shift

# interconnect
# prev -> shift
connect_bd_intf_net [get_bd_intf_pins $prevInst/data_out] \
    [get_bd_intf_pins $shift/data_in]
# shift -> next
connect_bd_intf_net [get_bd_intf_pins $shift/data_out] \
    [get_bd_intf_pins $nextInst/data_in]
```

### dyn

```tcl
# connect AXI bus
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins $shift/s00_axi]
```



## Registers

* 0 << 2 : **ID**
* 1 << 2 : **REG_SHIFT_VAL**


## Driver

* **shifterReal** **shifterComplex**: NA
* **shifterReal_dyn** **shifterComplex_dyn**: **fpgagen**

Access is done by ioctl:
```c
/* open device */
int fd = open("/dev/shift", O_RDWR);
if (fd < 0) {
	/* do something */
	return;
}
int shift = 1;
/* write value */
ioctl(fd, FPGAGEN_SET_REGISTER((1 << 2)), &shift);
/* read value */
ioctl(fd, FPGAGEN_GET_REGISTER((1 << 2)), &shift);
/* close device */
close(fd);

```

## Functions to configure IP
**shifterReal** **shifterComplex**: NA

located in utils_conf.c, utils_conf.h

* set shift value: ```int shifter_set(char *filename, int shift);```
* get shift value: ```int shifter_get(char *filename, int *shift);```

### param
* *filename*: device filename (*/dev/something*)
* *shift*: value to send for *shifter_set* or pointer to fill for *shifter_get*.
  Allowed values are between 0 and *DATA_IN_SIZE-DATA_OUT_SIZE*

### return
* 0 if filename exists and register has been accessed successfully;
* negative number if something went wrong

example:
```c
int ret, res;
/* write value */
ret = shifter_set("/dev/shift", 1);
if (ret != 0) {
	/* do something */
	return;
}
/* read value */
ret = shifter_get("/dev/shift", &res);
if (ret != 0) {
	/* do something */
}

```
