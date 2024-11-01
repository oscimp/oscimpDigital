### PCB for reliable conexion of an external clock and direct connection to ADC inputs for undersampling

Hardware modifications of the 14-bit Red Pitaya (also known as STEMlab 125-14) described
in report.pdf, and the associated KiCAD files (courtesy of Gilles Martin, FEMTO-ST, France,
translated from Eagle) for undersampling by getting rid of the unbalanced-balanced amplifier 
also acting as low pass filter. 

For external clocking (125 MHz), only populate the balun and channel closest to the border of the PCB. The
other two channels are for undersampling by bypassing the unbalanced to balanced differential
amplifiers. Follow
[these instructions](https://redpitaya.readthedocs.io/en/latest/developerGuide/hardware/125-14/top.html#external-125-14)
for wiring modifications (two resistors to be flipped) to disconnect the quartz crystal oscillator
and connect the clock input to the PCLK external source pins.

Replacing the active amplifier with a broadband balun (tested over the whole track-and-hold 
range up to 875 MHz input frequency) requires soldering three tiny wires (differential pair and Vref) 
on each channel at your own risks after removing the inductors connecting the differential 
amplifier output to the ADC inputs. The Vref signal trace must be cut before soldering a 
wire to the via pad whose varnish will have been removed with a sharp blade.
