# dataReal_to_ram or dataComplex_to_ram 

this IP is used to transfer one or multiple Real or Complex datastreams from
the FPGA to the CPU.

* each input is packaged in an real or complex interface
* output is an AXI stream

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

## Ports and interfaces
* **s00_axi**: (aximm interface) AXI 4 lite bus connected to the CPU
* **s00_axi_reset**: (reset interface) active high reset signal, synchronous to s00_axi. Used for
  AXI communication part.
* **s00_axi_aclk**: (clock interface) clock signal, synchronous to s00_axi. Used for
  AXI communication part.
* **datan_i**: (real or complex interface) nth input data stream, with **n** between
1 and **NB_INPUT** (<=12)

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
```
## Driver

**data_to_ram_core**

Access is done by ioctl and read:

* **DCTR_START** to start filling memory.

**Example**

```c

int val[16384];

/* open device */
int fd = open("/dev/data_to_ram", O_RDWR);
if (fd < 0) {
	/* do something */
	return;
}

read(fd,val,16384);

/* close device */
close(fd);

```
