# nco_counter

this IP is used to generate a complex oscillator (I and Q coefficients
in quadrature) and the associated complex square-wave output.

![nco_counter_output](figures/nco_counter_output.svg)

__Figure1__: NCO counter outputs

## IP

**nco_counter**

## Generic

* **DATA_SIZE**: (natural) output data stream bus size (default: 16).
* **LUT_SIZE**: (natural) look up table size, consistent with DAC output for example (default: 10, only a few discrete values allowed: 10 or 12).
* **COUNTER_SIZE**: (natural) accumulator size defining the frequency resolution (default: 28).
* **RESET_ACCUM**: (boolean) reset the accumulator to **DEFAULT_RST_ACCUM_VAL** (default: false).
* **DEFAULT_RST_ACCUM_VAL**: (natural) inital accumulator value (default: 25).

## Ports and interfaces
* **sine_out**: (complex sine wave output) quadrature I and Q coefficients of the 
oscillator output.
* **square_out**: (complex square wave output) quadrature square waves.

## Registers

#define REG_RST_ACCUM 	0x00
#define REG_POFF 		0x01
#define REG_CTRL 		0x02
#define REG_PINC 		0x03
#define REG_MAX_ACCUM 	0x04
/* specific */
#define REG_PINC_L 		0x03
#define REG_PINC_H 		0x04
#define REG_MAX_ACCUM_L 0x05
#define REG_MAX_ACCUM_H 0x06

__**REG_ID**__ (*BASE_ADDR + 0x00*)
![nco_counter_reg_id](figures/nco_counter_reg_id.svg)

*Note*: read only

__**REG_RST_ACCUM**__ (*BASE_ADDR + 0x00*)
![nco_counter_reg_rst_accum](figures/nco_counter_reg_rst_accum.svg)

*Note*: write only

__**REG_POFF**__ (*BASE_ADDR + 0x04*)
![nco_counter_reg_rst_poff](figures/nco_counter_reg_rst_poff.svg)

__**REG_CTRL**__ (*BASE_ADDR + 0x08*)
![nco_counter_reg_ctrl](figures/nco_counter_reg_ctrl.svg)

__**REG_PINC**__ (*BASE_ADDR + 0x0C*)
![nco_counter_reg_pinc](figures/nco_counter_reg_pinc.svg)

__**REG_MAX_ACCUM**__ (*BASE_ADDR + 0x10*)
![nco_counter_reg_max_accum](figures/nco_counter_reg_max_accum.svg)

## TCL instanciation and connection

### common

```tcl
# add nco_counter with
# output in 16 bits.
set nco_counter[create_bd_cell -type ip -vlnv ggm:cogen:nco_counter:1.0 nco_counter]
set_property -dict [ list \
    CONFIG.DATA_SIZE 16 ] $nco_counter

# interconnect
# nco_counter -> next 1
connect_bd_intf_net [get_bd_intf_pins $nco_counter/sine_out] \
    [get_bd_intf_pins $nextInst1/data_in]

# CANDR
connect_bd_net [get_bd_pins $clk_src/clk_o] \
	[get_bd_pins $nco_counter/ref_clk_i]
connect_bd_net [get_bd_pins $rst_src/rst_o] \
	[get_bd_pins $nco_counter/ref_rst_i]

# connect AXI bus
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins $nco_counter/s00_axi]
```
## Driver

**nco_counter_core**

Access is done by ioctl:

* **NCO_COUNTER_GET(reg)** to read a NCO register value
* **NCO_COUNTER_SET(reg)** to write a NCO register value

where reg is:
* **REG_ID**: read reg ID
* **REG_RST_ACCUM**: write to reset the accumulator
* **REG_POFF**: access phase offset
* **REG_CTRL**: 
* **REG_PINC**: access phase increment
* **REG_MAX_ACCUM**: access maximum accumulator value

**Example**

```c
#include <nco_counter_core/nco_counter_config.h>

/* ... */

/* configure NCO *** TODO : remettre les configurations par ioctl *** */
nco_counter_send_conf("/dev/noc_counter", 125000000, 10000000, 32, 0,   1,   1);
                     // /dev              f_ck=125M  f_o=10M  acc offs pinc poff
```

## Functions to configure IP

located in axi_to_dac_conf.c, axi_to_dac_conf.h

### To configure all parameters with the same function
```c
int nco_counter_send_conf(const char *filename,
         const int32_t fck, const double fout,
         const enum accumulator_size, const int offset,
         const char pinc_software, const char poff_software);
```
**param**

* *filename*: device filename (*/dev/something*)
* *fck*: input (reference) clock frequency
* *fout*: output clock frequency
* *accumulator_size*: accumulator size (bits)
* *offset*: phase offset
* *pinc_software*: control phase increment from interface (another IP) or AXI bus
* *poff_software*: control phase offset from interface (another IP) or AXI bus

**return**

* 0 if filename exists and register has been accessed successfully;
* negative number if something went wrong

### Set NCO configuration

```c
/* configure NCO */
nco_counter_send_conf("/dev/noc_counter", 125000000, 10000000, 32, 0,   1,   1);
                     // /dev              f_ck=125M  f_o=10M  acc offs pinc poff
```
**param**
* *filename*: device filename (*/dev/something*);
* *125000000*: input (reference) clock frequency of 125 MHz for the Redpitaya
* *10000000*: output frequency set to 10 MHz
* *32* is the accumulator size
* *0* means no phase offset 
* *1* phase increment configured by AXI bus communication (PS software)
* *1* phase offset configured by AXI bus communication (PS software)

**return**

* 0 if filename exists and register has been accessed successfully;
* negative number if something went wrong
