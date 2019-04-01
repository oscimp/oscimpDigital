Custom IP using the OscimpDigital framework to add functionalities to the bitstream provided by ADI. Two
examples, one independent of the original AD9363 stream, demonstrates data transfer from the PL to the PS
through the ComplexToRAM block.

For those in a hurry, two DFU images ready for flashing the PlutoSDR are provided in the 
[dfu_images](dfu_images) directory. We use 
'''dfu-util -a firmware.dfu -D firmware_name.dfu''' 
to flash the PlutoSDR. Original SDR functionality is kept since we only split the AXI stream 
to the custom interface.
