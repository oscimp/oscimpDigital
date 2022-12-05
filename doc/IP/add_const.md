# add_constReal/add_constComplex

These IPs are used to add an offset to all samples of the input data stream.

The offset is a value configured by `generic` at synthesis time and may be
changed through AXI interface.

**add_constReal** must be used for a real data stream and **add_constComplex**
for a complex data stream.

**Note:
Adding two N bits values requires for the output stream and for security N+1 bits.**

- when output size is greater than N+1 bits extra MSB will be added
- when output size is lower than N+1: output will be truncated. If overflow
  appears output will set to max/min value ($$-2^{n-1}$$ or $$2^{n-1}-1$$ when
  signed, or $$2^{n}-1$$ when unsigned).


### **Internal propagation delay**

1 clock cycle

## IP

**add_constReal, add_constComplex**

## Generic

* **format**: (string) data are only positive (unsigned) or may be negative
  (signed) (default: signed).
* **add_val**: (natural) default offset used.
* **DATA_IN_SIZE**: (natural) input data stream bus size (default: 16).
* **DATA_OUT_SIZE**: (natural) output data stream bus size (default: 18).

## Ports and interfaces
* **s00_axi**: (aximm interface) AXI 4 lite bus connected to the CPU
* **s00_axi_reset**: (reset interface) active high reset signal, synchronous to s00_axi. Used for
  AXI communication part.
* **s00_axi_aclk**: (clock interface) clock signal, synchronous to s00_axi. Used for
  AXI communication part.
* **data_int**: (real interface for **add_constReal**, complex interface for
  **add_constComplex**) input data stream
* **data_out**: (real interface for **add_constReal**, complex interface for
  **add_constComplex**) output data stream

## Registers

**Note:** `offset_l` must be written first.

__**REG_ID**__ (*BASE_ADDR + 0x00*)
![add_const_reg_id](figures/axi_to_dac_reg_id.svg)

__**REG_OFFSET_L**__ (*BASE_ADDR + 0x04*): lower offset part
![add_const_reg_offset_l](figures/add_const_reg_offset_l.svg)

*Note*: if *DATA_IN_SIZE* < 32, upper bits from this register are discarded to fit *DATA_IN_SIZE* bits

__**REG_OFFSET_H**__ (*BASE_ADDR + 0x08*) higher offset part
![add_const_reg_offset_h](figures/add_const_reg_offset_h.svg)

*Note*: if *DATA_IN_SIZE* < 64, upper bits from this register are discarded to fit *DATA_IN_SIZE* bits. If
*DATA_IN_SIZE* <= 32, this register is not used.

## TCL instanciation and connection

### common

```tcl
# add a add_constReal and configure it to:
#  - propagate results with full resolution
#  - with a default offset of 10
#  - to works with signed numbers
# change add_constReal by add_constComplex to use complex version
add_ip_and_conf add_constReal constR {
	    DATA_IN_SIZE 16 \
		DATA_OUT_SIZE 17 \
		format "signed" \
		add_val 10}

# connect AXI interface (address 0x4C30_0000 + 0x00000)
connect_proc constR s00_axi 0x00000

# connect add_const to an other block with a real data stream.
connect_intf $previous_block data_out constR data_in
connect_intf constR data_out $next_block data_in

```

## Testing from bash

```bash
redpitaya> devmem 0x43C00000       # read IP identifier
0x00000001
redpitaya> devmem 0x43C00004 32 10 # set offset_l to 10
redpitaya> devmem 0x43C00008 32 0  # set offset_h to 0
redpitaya> devmem 0x43C00004 32    # check offset_l
0x0000000a
redpitaya> devmem 0x43C00008 32    # check offset_h
0x00000000
```

## Driver

**add_const_core**

Access is done by ioctl:

* **ADD_CONST_SET_CONST**: to write offset 
* **ADD_CONST_GET_CONST**: to read offset

**Example**

```c
#include <add_const_core/add_const_config.h>

/* ... */

int val;
/* open device */
int fd = open("/dev/addConst", O_RDWR);
if (fd < 0) {
	/* do something */
	return;
}

/* set offset to 10 */
val = 10;
ioctl(fd, ADD_CONST_SET_CONST, &val);

/* get current offset */
ioctl(fd, ADD_CONST_GET_CONST, &val);
printf("%d\n", val);

/* close device */
close(fd);

```

## Functions to configure IP

located in **add_const_conf.c**, **add_const_conf.h**

### To configure offset
```c
int add_const_set_offset(const char *filename, const int64_t offset);
```
**param**

* *filename*: device filename (*/dev/something*)
* *offset*: offset value

**return**

* 0 if filename exists and register has been accessed successfully;
* negative number if something went wrong

### To get offset
```c
int add_const_get_offset(const char *filename, int64_t *offset);
```
**param**

* *filename*: device filename (*/dev/something*)
* *offset*: pointer to get offset

**return**

* 0 if filename exists and register has been accessed successfully;
* negative number if something went wrong

example:

```c

#include <add_const_conf.h>

/* SNIP */

int ret;
/* configure */
ret = add_const_set_offset("/dev/addConst", 10);
if (ret != 0) {
	/* do something */
	return;
}

/* check configuration */
int64_t val;
ret = add_const_get_offset("/dev/addConst", &val);
if (ret != 0) {
	/* do something */
	return;
}

printf("%ld\n", val);

```
