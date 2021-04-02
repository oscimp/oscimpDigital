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
14 bits (or 16-bits for the 16-bit Redpitaya).

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

How to choose (<span>Nb COEFF</span>) ? The criteria that will help you choose is the transition band width.
The more steep your transition is, the more coefficients you will need. In fact, to have a filter that
corresponds to the wanted template, you will need N >= fs/df, where fs is your sampling frequency and
df is your transition width.

The DECIMATE FACTOR allows you to save computational resources in the FPGA by dividing the sampling frequency
(which is 125 MHz on RedPitaya14 and 122.88MHz on RedPitaya 16)
In the TCL example that you can find in the <span>design</span> directory,
the decimation factor is <span>DECIMATE\_FACTOR 5</span> so that the
output feeding the DAC output is “only” clocked at 25 MS/s (= 125/5).

BE AWARE that if you plug the output of the FIR into the data2ram, this later one will only record the output of the FIR
at the rythm of fs/DECIMATE_FACTOR. 

The user might then decide to shift to the right the result to drop some
of the least-significant bits, as illustrated here with the selection of
outputting 16 bits from the FIR filter (e.g. for further computations in
the PL) and shifting the 2 least significant bits to send 14-bit wide
words (as expected from the legacy Redpitaya ADC datastream – 16 bits
for the 16-bit Redpitaya) to the PS.

To summarize:

  - disconnect interface between <span>converters/dataB\_out</span> and
    <span>dupplDataB/data\_in</span>;

  - add <span>firReal</span> IP, renamed as <span>fir00</span> with:
    
      - <span>DATA\_IN\_SIZE</span>: 14;
    
      - <span>DATA\_OUT\_SIZE</span>: 19;
    
      - <span>NB\_COEFF</span>: 32;
    
      - <span>DECIMATE\_FACTOR</span>: 5;

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

# PS: Linux kernel driver

Rather than using a single complex stream to communicate with the PS, we
have now selected the <span>dataReal\_to\_ram</span> to define multiple
real streams. The driver is the same than
<span>dataComplex\_to\_ram</span>, so that this part of the XML may be
left unchanged (memory address must be checked, as shown for example on
Fig. [3](#addr)), in addition to which we wish to communicate with the
FIR to define the coefficients. This time, the
<span>module\_generator</span> XML configuration file should look like

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

# On the Redpitaya ...

For communicating with the FIR, we will benefit from an existing library
function as implemented in <span>liboscimp\_fpga</span> (see
$OSCIMP\_DIGITAL\_LIB). This library must be installed by:

    make && make install

to place the .so in <span>buildroot</span> <span>target</span> dir (the
board must be flashed again), or by

    make && make install_ssh

to transfer the .so to the embedded board’s <span>/usr/lib</span>
directory by using <span> ssh</span>. By default target IP is
192.168.0.10, which can be updated to match another network
configuration with

    make && IP=AA.BB.CC.DD.EE make install_ssh

``` c
#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "fir_conf.h" // library for communicating with the FIR


int main()
{int k;
 char c[16384];
 int fi,fo;
 fi=open("/dev/data1600",O_RDWR);
 fo=open("/tmp/data.bin",O_WRONLY|O_CREAT,S_IRWXU);
 fir_send_confSigned("/dev/fir00","coefs.txt",32);
 for (k=1;k<5;k++)
  {read(fi,c,16384);
   write(fo,c,16384);
  }
 close(fi);
 close(fo);
 return 0;
}
```

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
