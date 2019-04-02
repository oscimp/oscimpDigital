Custom IP using the OscimpDigital framework to add functionalities to the bitstream provided by ADI. Two
examples, one independent of the original AD9363 stream, demonstrates data transfer from the PL to the PS
through the ComplexToRAM block.

For those in a hurry, two DFU images ready for flashing the PlutoSDR are provided in the 
[dfu_images](dfu_images) directory. We use 

```bash
dfu-util -a firmware.dfu -D firmware_name.dfu
``` 

to flash the PlutoSDR. Original SDR functionality is kept since we only split the AXI stream 
to the custom interface. The firmware named pluto_bitstream_without_AXI.dfu only implements
an NCO connected to a single data to RAM block, while the pluto_bitstream_with_AXI.dfu implements
the AXI to complex block, mixing with an NCO programmed from the PS, and a 3-channel complex
data to RAM with the NCO values, the raw values and the mixer output.
