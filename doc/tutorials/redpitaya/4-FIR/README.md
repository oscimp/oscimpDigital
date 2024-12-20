<span>**Redpitaya: third example**</span>  
   
G. Goavec-Mérou, J.-M Friedt  
   

This tutorial is a sequel to the previous one on which it is based. In
addition to copying the ADC input to the DAC output, we wish to add to
the stream of data sent to the user (PS) a filtered copy of one of the
ADC inputs. The Finite Impulse Response (FIR) filter will process the
125 MS/s stream with integer coefficients configured from userspace (PS)
(Fig. [2](#fin)). Furthermore, we wish to extend capability beyond a
single complex stream: we will now stream two parallel real data, which
could be extended to more than two channels.

![Schematic of the objective and final processing chain described in
this document<span label="fin"></span>](figures/structs.png)

![Schematic of the objective and final processing chain described in
this
document<span label="fin"></span>](figures/combinedADC_DAC_data2ram_FIR.png)

# FIR configuration

The ADC to DAC and ADC to RAM blocks are the same as before, with stream
dupplication every time a new datastream must reach two users. The
novelty here is the use of a FIR filter.

From the program of the previous tutorial, add a FIR_Real IP. Double click
on the FIR block and update the Data Width (<span>Data In Size</span>) to
16 bits.

The coefficient width (<span>COEFF Size</span>) will define the
size of the data transferred from the PS to the PL, as stored as a
column of decimal values written in human readable ASCII format. The
number of coefficients (<span>Nb COEFF</span>) and the number of bits of
(<span>Data Out Size</span>) are defined at synthesis time and must match
the largest expected filter (as well as available resources).

How to choose (<span>Data Out Size</span>) ? Let us call the input data width
(in bits) P, the coefficient width (in bits) M the number of coefficients N and the output data width (in bits) Q.
Theoretically, if we don't want our output to saturate, we have to take \(Q=P+M+\log_2(N)\) bits.
In practice, this number of bits is grossly over-estimated. The cardinal sinus distribution of the
coefficients makes roughly that only one coefficient prevails on the others. That's why removing \(\log_2(N)\)
of the sum of will give a much more conservative number of bits relevant at the output.

How to choose (<span>Nb COEFF</span>) ? The criteria that will help you to choose is the transition band width.
The more steep your transition is, the more coefficients you will need. In fact, to have a filter that
corresponds to the wanted template, you will need N >= fs/df, where fs is your sampling frequency and
df is your transition width. A method to generate the list of coefficients is described later in this tutorial.

The DECIMATE FACTOR allows you to save computational resources in the FPGA by dividing the sampling frequency
(which is 125 MHz on RedPitaya14 and 122.88MHz on RedPitaya 16)
In the TCL example that you can find in the <span>design</span> directory,
the decimation factor is <span>DECIMATE\_FACTOR 5</span> so that the
output feeding the DAC output is “only” clocked at 25 MS/s (= 125/5).
BE AWARE that if you plug the output of the FIR into the data2ram, this later one will only record the output of the FIR
at the rythm of fs/DECIMATE_FACTOR, even if it has another channel fed directly by the ADC for example. 

If you use coefficients that are big (in order to have some gain), you may be forced to use a big data out size. If you
want to resize the data, if you want to output this signal into the 14 bits DAC for instance, you would want to keep only
the N most significant bits generated by the FIR IP. This is possible thanks to the Shifter IP. In the block design we propose
here, we plug the output of the FIR filter into the input of a shifter Real IP, and we configure it to shift from 19 bits to 14 bits.

In your design, you may also want to increase the number of bits of a given data. This is possible thanks to the Expander IP.
This IP add N bits at the left of the input number which will be either zeros if the number is positive, or ones if it's negative,
in order to keep the very same value in the output. In this tutorial, we use one expander to get a 16 bits number with a 14 bits
number generated by the ADC, because we configure the data 2 ram IP to handle 16 bits data.


To summarize:

  - disconnect interface between <span>converters/dataB\_out</span> and
    <span>dupplDataB/data\_in</span>;

  - add <span>firReal</span> IP, renamed as <span>fir00</span> with:
    
      - <span>DATA\_IN\_SIZE</span>: 14;
    
      - <span>DATA\_OUT\_SIZE</span>: 19;
    
      - <span>NB\_COEFF</span>: 32;
      - <span>COEFF\_SIZE</span>: 16;
      - <span>DECIMATE\_FACTOR</span>: 1;
      - <span>ID</span>: 1 (you can left it to the default value since it's a deprecated option and it's not used anymore)

  - update dupplDataB with <span>DATA\_SIZE</span> = 19

  - suppress <span>convertRealToCplx</span> and <span>data1600</span>;

  - add <span>dataReal\_to\_ram</span> IP, renamed as
    <span>data1600</span>, with:
    
      - <span>DATA\_SIZE</span> = 16;
    
      - <span>NB\_SAMPLE</span> = 4096;
    
      - <span>NB\_INPUT</span> = 2;

  - add <span>expanderReal</span> IP, connect this block between
    <span>dupplDataA</span> and <span>data1600/data1\_in</span> with:
    
      - <span>DATA\_IN\_SIZE</span> = 14;
    
      - <span>DATA\_OUT\_SIZE</span> = 16;

  - add <span>shifterReal</span> IP, connect this block between
    <span>dupplDataB</span> and <span>data1600/data2\_in</span> with:
    
      - <span>DATA\_IN\_SIZE</span> = 19;
    
      - <span>DATA\_OUT\_SIZE</span> = 16;

When you are done, if it was not the previous program but a new project, don't forget to add the constraints and set up the HDL wrapper as shown in the first tutorial.

Then, generate the bitstream.

# PS: Linux kernel driver

Rather than using a single complex stream to communicate with the PS, we
have now selected the <span>dataReal\_to\_ram</span> to define multiple
real streams. The result will be the same as <span>dataComplex\_to\_ram</span>,
so the driver is the same. So, This part of the XML may be
left unchanged (yet, don't forget to check the memory address, as shown for example on
Fig. [3](#addr)). We define a new block to communicate with the
FIR to define the coefficients.

You can use the module generator as shown in the second tutorial to generate this XML
or you can do it by hand.
This time, the <span>module\_generator</span> XML configuration file should look like

``` xml
<?xml version="1.0" encoding="utf-8"?>
<project name="tutorial4" version="1.0">
	<ips>
		<ip name ="dataReal_to_ram" >
			<instance name="data1600" id="0"
				base_addr="0x43C00000" addr_size="0xffff" />
		</ip>
		<ip name ="firReal" >
			<instance name="fir00" id="0"
				base_addr="0x43C10000" addr_size="0xffff" />
		</ip>
	</ips>
</project>
```

![Address range used by the IPs as defined by
Vivado.<span label="addr"></span>](figures/address.png)

# Installing the program on the RedPitaya ...

To communicate with the FIR, we will benefit from an existing library
function as implemented in <span>liboscimp\_fpga</span> (see
$OSCIMP\_DIGITAL\_LIB). This library must be installed with :

    make && make install

to place the .so in <span>buildroot</span> <span>target</span> dir (the
board must be flashed again), or with

    make && make install_ssh

to transfer the .so to the embedded board’s <span>/usr/lib</span>
directory by using <span> ssh</span>. By default target IP is
192.168.0.10, which can be updated to match another network
configuration with

    make && IP=AA.BB.CC.DD.EE make install_ssh
    
Then, generates the encrypted bitstream and the app folder and install the program on the redpitaya as shown in the second tutorial.

You can copy this C code which will configure the FIR with the 33 coefficients that you will provide in a file "coefs.txt" (more on that in the next section), and which will then perform 5 consecutive data to ram bursts (like in the previous tutorial) :

``` c
#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "fir_conf.h" // library to communicate with the FIR


int main()
{int k;
 char c[16384];
 int fi,fo;
 fi=open("/dev/data1600",O_RDWR);
 fo=open("/tmp/data.bin",O_WRONLY|O_CREAT,S_IRWXU);
 fir_send_confSigned("/dev/fir00","coefs.txt",33);
 for (k=1;k<5;k++)
  {read(fi,c,16384);
   write(fo,c,16384);
  }
 close(fi);
 close(fo);
 return 0;
}
```

# Providing coefficients to the FIR

Several algorithms will help you find coefficients for the FIR you want to design. Here, we propose you to use the firls algorithm that you can find in matlab/GNU Octave or in the numpy python module. With this method, you can design every type of filter you want, but it will have a linear phase since the generated coefficients are symetrical.

In the Octave console (or matlab), type this line to get access to the firls fuction :

``` m
pkg load signal
```
then use the firls function like that :
``` m
b = firls(33,[0 0.3 0.6 1],[1 1 0 0]);
```
The first number is the number of coefficients, the second parameter is an array of normalized frequencies (fs = 2), and the last one is an array containing the gain you want at the coresponding frequencies described in the second parameter. Here for instance, we have a filter designed to let pass frequencies 0 to 0.3\*fs/2 (=18.75MHz on RedPitaya 14) and to cut those between 0.6\*fs/2 and fs/2.

The coefficients are now stored in the b variable, but are really low. To exploit the whole capacity of your Vivado program, we want that the maximum absolute value of the list of coefficients to be the maximum absolute value a coefficient can have, which is defined by the COEFF_SIZE parameter of your FIR IP in Vivado. For instance, if COEFF_SIZE is 16, since we work with unsigned int, we have 1 bit which indicated the sign (+ or -), and 15 which can indicate a value. So, our maximum absolute value is 2^15-1 = 32767. If this value is too high (you get overflows and strange results on the scope), you can lower this value to adjust the gain of the filter as you whish.

So, divide the b array by its maximum value and multiply it by the the maximum value you want. Since the FIR IP only handles signed integers, we want to get rid of the coma :
``` m
b = floor(b./max(b).*32767);
```

Then, copy this array of coefficient into a file named coefs.txt in the bin directory of the project folder in the nfs directory (nfs/redpitaya/tutorial4/bin). This file must be a row of signed integers. Then, each time you use the command :
``` bash
./tutorial4_us
```
 The main.c program will load the coefficients in coefs.txt in the FIR. If you want to change your FIR, you can do it on the fly by just modifying coefs.txt and then relaunching this command.

# Troubleshooting

If you get strange results on the scope, there are several places where a mistake can be made :
 - in Vivado :
 	- check that each input is fed by an output with the expected number of bits
 	- check that the RedPitaya IP is configured for the good model
 	- check that your FIR block has a sufficient number of output bits. Don't hesitate to increase the data_out_size value.
 	- check that you didn't forget to configure the Zynq IP.
 - in your selection of coefficients
 	- if you have a problem of gain, increase the maximum of the coefficients (and don't forget to increase also the data_out_size value of the FIR IP in Vivado).


# Example

Examples of outputs of running this program are given in Figs.
[5](#fir1) and [6](#fir2): all filter lengths are set to 32, with a
varying number of non-null values set to 1 in the beginning of the
filter. Since in this design the FIR output is routed to the DAC, an
oscilloscope is first used to monitor the generated signal frequency and
the filtered signal amplitude (oscilloscope “Measure” functions set to
“Frequency C1” and “Peak to Peak Amplitude C3”). In all cases the
generated signal is 1.5 V\(_{pp}\).

The transfer function of a FIR filter is the Fourier transform of its
coefficients so that the transfer function of rectangular window FIR
filters are sinc functions. The expected transfer functions are
displayed in Fig. [5](#fir1) (top) and the experiemental amplitude of
the FIR output for varying filter window width and notch frequency are
shown in Fig. [5](#fir1) (bottom). The notch frequency are in excellent
agreement, the amplitude measurements are plagued by poor resolution of
the oscilloscope measurement.

![Left: transfer function of rectangular FIR windows (top) and measured
amplitude and notch frequencies (bottom). On the bottom chart, vertical
lines are located at the observed notch frequency. Right: experimental
setup, including arrows showing that the same driving signal is feeding
both ADCs, and the two DAC outputs are either copies of one ADC or the
filtered output of the other
ADC.<span label="fir1"></span>](results/model.png) ![Left: transfer
function of rectangular FIR windows (top) and measured amplitude and
notch frequencies (bottom). On the bottom chart, vertical lines are
located at the observed notch frequency. Right: experimental setup,
including arrows showing that the same driving signal is feeding both
ADCs, and the two DAC outputs are either copies of one ADC or the
filtered output of the other
ADC.<span label="fir1"></span>](results/DSC_0368_3ann.JPG)

Beyond these oscilloscope measurements, datasets can be dumped from the
<span>data\_to\_ram</span> for further processing. Various test FIRs are
designed by clearnig to 0 all coefficients except the first ones, which
might be either set to 1 for the first 16 coefficients, or set to 4 for
the first 4 coefficients (keeping the total power constant). Since
sampling is at 125 MS/s, the cutoff frequency of a 16-tap long
coefficient must be about 7.8 MHz: most of the recorded datasets (1 or
6 MHz) are not affected by the filter except for the bottom one in
which the signal frequency becomes close to the cutoff frequency of the
filter. The group delay (time needed between filling input and providing
the first output) is observed as the phase shift between input and
output (Fig. [6](#fir2))

![Filtered output (blue) with respect ot the input (red) driving signal:
<span>data\_to\_ram</span>
outputs.<span label="fir2"></span>](figures/mesures.png)

Collecting the filtered output on the <span>data\_to\_ram</span> device
demonstrates how the FPGA can be efficiently used either to process the
stream straight from the acquisition interface through the various
processing blocks, or as co-processor from data provided by the CPU and
running through the FPGA before being recovered by the CPU.
