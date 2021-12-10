# prn20b

Generates a 20-bit long pseudo random sequence using a linear feedback shift
register.
* the full output bus prn_full_o is 20-bit wide
* a single least significant bit is output on bit_o
* a prescaler allows tuning the output bandwidth by generating a new value
only once every prescaler value
* the prescaler width is PRESC_SIZE=16 and the default prescaler value is
DFLT_PRESC=15

## IP
* **prn20b**: 20 bit pseudo random sequence generator

## Generic
* **PRESC_SIZE**: (natural) prescaler size (default: 16).
* **DFLT_PRESC**: (natural) default prescaler value (default: 15).

## Ports and interfaces
* **prn_full_o**: 20-bit wide full width output
* **bit_o**: single bit pseudo-random sequence output
* **s00_axi**: axi interface to connect to the CPU wrapper
* **s00_axi_reset**: reset signal in the **s00_axi** clock domain
* **s00_axi_aclk**: clock signal used for everything related to CPU
  communication

## TCL instanciation and connection

```tcl
# add prn20b
