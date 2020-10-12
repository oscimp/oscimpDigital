# dataReal_to_ram or dataComplex_to_ram 

this IP is used to transfer one or multiple Real or Complex datastreams from
the FPGA to the CPU.

* each input is packaged in an real or complex interface
* output is an AXI 4 lite

## IP

**dataReal_to_ram** or **dataComplex_to_ram**

## Generic

* **DATA_SIZE**: (natural) input data stream bus size (default: 32).
* **NB_INPUT**: (natural) number of input streams, maximum 12 (default: 12).
* **NB_SAMPLE**: (natural) memory depth, so that **NB_SAMPLE x DATA_SIZE / 8** bytes
(real) or **NB_SAMPLE x DATA_SIZE / 8 x 2** bytes (complex)
will be transfered from **data_to_ram** FPGA block to CPU memory (default: 1024).
* **DATA_FORMAT**: (string) signed or unsigned input data.
* **USE_EOF**: (boolean) generate End Of Frame signal (default: false).


**NOTE:** **DATA_IN_SIZE** may be any size > 1, but CPU is limited to 8, 16, 32 or 64bits.
- when **DATA_IN_SIZE** match one size allowed by the CPU, internally this size is used
- when **DATA_IN_SIZE** didn't match, samples are extended to nearest allowed size:
 - if **DATA_FORMAT** is "signed" by using input **MSB**
 - if **DATA_FORMAT** is "unsigned" by using '0'

## Ports and interfaces
* **s00_axi**: (aximm interface) AXI 4 lite bus connected to the CPU
* **s00_axi_reset**: (reset interface) active high reset signal, synchronous to s00_axi. Used for
  AXI communication part.
* **s00_axi_aclk**: (clock interface) clock signal, synchronous to s00_axi. Used for
  AXI communication part.
* **datan_i**: (real or complex interface) nth input data stream, with **n** between
1 and **NB_INPUT** (<=12)
* **interrupt_o**: an optional single bit to connect to the CPU interrupt input  

## Registers

__**REG_START**__ (*BASE_ADDR + 0x00*)
![data_to_ram_reg_start](figures/data_to_ram_reg_start.svg)

Start filling data_to_ram memory when writing to this register.

__**REG_STATUS**__ (*BASE_ADDR + 0x04*)
![data_to_ram_reg_status](figures/data_to_ram_reg_status.svg)

Data_to_ram block status

__**REG_DATA**__ (*BASE_ADDR + 0x08*)
![data_to_ram_reg_data](figures/data_to_ram_reg_data.svg)

Fetch data_to_ram data from this register

## TCL instanciation and connection

### common

```tcl
# add dataReal_to_ram with
# 16 bit inputs on a single channel.
set dataReal_to_ram [create_bd_cell -type ip -vlnv ggm:cogen:dataReal_to_ram:1.0 dataReal_to_ram]
set_property -dict [ list \
    CONFIG.DATA_SIZE 16 \
	CONFIG.NB_INPUT 1 \
	CONFIG.NB_SAMPLE 1024 ] $dataReal_to_ram

# interconnect
connect_bd_intf_net [get_bd_intf_pins $dataReal_to_ram/data1_in] \
    [get_bd_intf_pins $preInst1/data_out]

# connect AXI bus
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" } \
    [get_bd_intf_pins $dataReal_to_ram/s00_axi]

# OPTIONAL: connect interrupt (only one interrupt)
connect_bd_net [get_bd_pins $dataReal_to_ram/interupt_o] \
        [get_bd_pins $ps7/irq_f2p]

```
## Driver

**data_to_ram_core**

By default, read is blocking. To start acquisition before calling read() an
*ioctl* is available:

**DCTR_START** to start asynchroniouly filling memory.

```c
[...]
int i = 1;
ioctl(fd, DCTR_START, &i);
[...]
```
### interrupts

By default, this driver use a polling method to know when the acquisition is done. This method is CPU consuming.
An alternative is to use interrupt driven method.
To use this, **interrupt_o** pin must be connected to the CPU interrupt controler
and the dataxx_to_ram node in devicetree updated with line like:
```c
interrupt-parent = <&intc>;
interrupts = <0 29 1>;
```
where:
- the value of **interrupt-parent** depends on target device
- the second value of **interrupts** depends on both target device and number of interrupt line used (for Zynq allowed values
 are between 26 and 37, 53 and 60) 

## Example

For a dataComplex_to_ram configured with 2 16bits signed input and 1024 samples per channel
```c
#define NB_INPUT 2
#define NB_SAMPLE 1024
/* 2 x -> complex samples */
#define SAMPLE_SIZE (2 * sizeof(short))
#define ACQUIS_SIZE (NB_INPUT * NB_SAMPLE * SAMPLE_SIZE)
int val[ACQUIS_SIZE];

/* open device */
int fd = open("/dev/data_to_ram", O_RDWR);
if (fd < 0) {
	/* do something */
	return;
}

read(fd,val, ACQUIS_SIZE);

/* close device */
close(fd);

```
