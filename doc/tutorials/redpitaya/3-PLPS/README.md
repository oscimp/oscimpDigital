<span>**Redpitaya: second exemple, from ADC to PS**</span>  
   
G. Goavec-Mérou, J.-M Friedt  
   

This document is a sequel to the previous tutorial on which it is based.
It concludes with not only copying the ADC measurements to the DAC, but
also with allowing the user to collecte the sample values from the PS
for storage or further processing (Fig. [2](#fin)).

![Objective (top) of this tutorial and final schematic of the processing
chain described in this document.<span label="fin"></span>](figures/objective.png)

![Objective (top) of this tutorial and final schematic of the processing
chain described in this
document.<span label="fin"></span>](figures/combinedADC_DAC_data2ram.png)

# Sending data to the PS: the PL side

Transfering data towards the PS <span>*in addition*</span> to sending
the stream to the DAC requires duplicating the data on the one hand, and
interleaving the two streams from the two ADCs on the other hand.

Doing so is achieved by:

1.  add <span>dupplReal\_1\_to\_2</span>,
    <span>convertRealToComplex</span> (converting two real data streams
    to one complex) and then <span>dataComplex\_to\_ram</span> (renamed
    as <span>data1600</span>

2.  Double click on <span>dupplReal\_1\_to\_2</span> to configure to 14
    bit (or 16-bit if using the 16-bit Redpitaya) data (doing so on the
    two stream doublers). Same for <span>convertRealToComplex</span>

3.  Link <span>data1\_out</span> of each <span>dupplReal</span> to
    <span>data1\_in</span> and <span>data2\_in</span> respectively of  
    <span>convertRealToComplex</span>

4.  Cut the wires linking the ADC and DAC, and use the two free outputs
    of the <span>dupplReal\_1\_to\_2</span> blocks

5.  Connect <span>dataA\_out</span> and <span>dataB\_out</span> of the
    ADCs to the two free inputs of the <span>dupplReal\_1\_to\_2</span>
    blocks

6.  <span>dataComplex\_to\_RAM</span>: configure <span>Data Size</span>
    to 14 bits (or 16-bit if using the 16-bit Redpitaya), <span>Nb
    Input</span> to 1 and <span>Nb Sample</span> to the number of
    samples to be transfered. For example, defining 4096 <span>**sample
    pairs**</span> (complex numbers) each encoded as 16-bit values, or a
    total of 16384 bytes available to the PS.

Once these blocks have been defined and connected, execute <span>Run
Connection Automation</span> for connecting to the AXI bus.

# Sending data to the PS: the Linux kernel side

The driver needed to fetch data on the PS from Linux will be
<span>data\_to\_ram\_core</span>. Compiling this kernel module requires
exporting the variables

    export BOARD_NAME=redpitaya
    export BR_DIR=${HOME}/buildroot-2018.08.1/

Compilation is achieved from the
<span>$OSCIMP\_DIGITAL\_DRIVER/data\_to\_ram\_core</span> directory by
running  
<span>make install</span>  
which will install the <span>.ko</span> in
<span>$OSCIMP\_DIGITAL\_NFS/$BOARD\_NAME/modules</span>.

We have briefly introduced the <span>devicetree overlay</span> in
<span>1-PL</span>. In the context of this tutorial, where we must
communicate with an IP, the <span>overlay</span> approach is mandatory.
This file provides both bitstream name and, through a sub-node,
information used by the Linux kernel to know which driver must be
probed, and the base address of the memory segment shared between PS and
PL, allocated for communications between the IP and the associated
driver.

The plugin to the devicetree is generated thanks to the
<span>module\_generator</span> tool located in <span>
$OSCIMP\_DIGITAL\_APP/tools/module\_generator</span>: this tool is
designed to get the definition of all resources from an XML file written
manually. In this example, the configuration file is

``` xml
<?xml version="1.0" encoding="utf-8"?>
<project name="tutorial3" version="1.0">
	<options>
		<option target="makefile" name="DONT_USE_LIB">1</option>
	</options>
	<ips>
		<ip name ="dataComplex_to_ram" >
			<instance name="data1600" id = "0"
				base_addr="0x43c00000" addr_size="0xffff" />
		</ip>
	</ips>
</project>
```

with the <span>name</span> tag including the name of the bitstream
without the <span>.bit.bin</span> extension nor the “\_wrapper” part of
its name (notice that the default name <span>tutorial3</span> is given
by Vivado to generate <span>tutorial3\_wrapper.bit.bin</span>). The
<span>ip</span> tag informs on the IP (module\_generator uses this
information to deduce which driver is used), while
<span>base\_addr</span> and <span>addr\_size</span> provide the address
starting point and range as provided in each IP attribute by Vivado
(Fig. [3](#addr)). <span>option</span> node tell
<span>module\_generator</span> to add <span>DONT\_USE\_LIB</span> in the
Makefile. This variable is used to avoid application to be linked to the
liboscimp\_fpga (see. 4-FIR for library introduction).

This XML file may be written manually or by using a script :

    vivado -mode batch -source $OSCIMP_DIGITAL_IP/scripts/gen_module_generator_xml.tcl -tclargs . project_name bd_name

Where the first argument is the directory where .xpr is stored, the
second is the name of the project and the last is the name of the block
design.

This script generate a file called project\_name.xml in the upper
directory.

![Address range used by each IP able to communicate between the PL and
PS through the AXI bus.<span label="addr"></span>](figures/adresses.png)

This XML is used to generate devicetree file, script to load drivers and
apply the overlay, and a Makefile dedicated to compile the application,
the dtbo and to install all files in
<span>$OSCIMP\_DIGITAL\_NFS/tutorial3</span>.

This task is done by this command:  
<span>fpga\_app/tools/module\_generator/module\_generator
my\_file.xml</span>

After generation, a new directory, called <span>app</span> is present in
the current directory, containing all files. The Makefile is basic since
it provides the application name and simply includes
<span>$OSCIMP\_DIGITAL\_APP/Makefile.inc</span>. <span>make</span> will
compile the application (<span>tutorial3\_us</span>) and the dtbo
(<span>tutorial3.dtbo</span>) while <span>make install</span> will 1/
create  
<span>$OSCIMP\_DIGITAL\_NFS/$BOARD\_NAME/tutorial3</span>, and 2/ copy
binary files in a sub-directory called <span>bin</span>.

The rest needs some explanations.

## Devicetree overlay

For the current design the overlay looks like:

    /dts-v1/;
    /plugin/;
    
    / {
    	compatible = "xlnx,zynq-7000";
    
    	fragment0 {
    		target = <&fpga_full>;
    		#address-cells = <1>;
    		#size-cells = <1>;
    		__overlay__ {
    			#address-cells = <1>;
    			#size-cells = <1>;
    
    			firmware-name = "tutorial3_wrapper.bit.bin";
    
    			data1600: data1600@43c00000{
    				compatible = "ggm,dataToRam";
    				reg = <0x43c00000 0xffff>;
    			};
    
    		};
    	};
    };

Compared to the previous tutorials, this devicetree provides a subnode
to declare a driver. This node is describe by a name used, at runtime,
for the pseudo-file in <span>/dev</span>, an attribute
<span>compatible</span> used by Linux to match between this entry and
the <span>compatible</span> attribute of the core driver and, finally,
an attribute <span>reg</span> wich provides the base address in memory
and size of this slice.

## Loader script

The second file created by <span>module\_generator</span> is a script
called <span> tutorial3\_us.sh</span>:

``` bash
CORE_MODULES_DIR=../../modules

mkdir -p /lib/firmware
cp ../bitstreams/tutorial3_wrapper.bit.bin /lib/firmware
DTB_DIR=/sys/kernel/config/device-tree/overlays/fpga
rmdir $DTB_DIR
mkdir $DTB_DIR
cat tutorial3.dtbo > $DTB_DIR/dtbo

insmod ${CORE_MODULES_DIR}/data_to_ram_core.ko
```

this script copies the bitstream to <span>/lib/firmware</span>, applies
the overlay and loads the core driver.

## Source code

This file is not provided by <span>module\_generator</span> and must be
created/written manually.

``` c
#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{int k,fi,fo; char c[16384];
 fi=open("/dev/data1600",O_RDWR); fo=open("/tmp/data.bin",O_WRONLY|O_CREAT);
 for (k=1;k<5;k++) {read(fi,c,16384); write(fo,c,16384); }
 close(fi); close(fo);
}
```

where we open <span>/dev/data1600</span> to read 5 time 16384 samples
and write these values in an other file in binary format.

# On the Redpitaya ...

Having completed all compilation and installation steps, we have in  
<span>$OSCIMP\_DIGITAL\_NFS/$BOARD\_NAME</span>:

1.  <span>tutorial3.dtbo</span>, <span>tutorial3\_us.sh</span> and
    <span>tutorial3\_us</span> in <span>tutorial3/bin</span> directory;

2.  <span>tutorial3\_wrapper.bit.bin</span> in
    <span>tutorial3/bitstreams</span>;

3.  <span>data\_to\_ram\_core.ko</span> in <span>modules/</span>

The next task, before using the application is to load the bitstream,
the overlay and the driver. This is done by the command: `sh
tutorial3_us.sh`.

If all goes well, the blue LED on the Redpitaya board will light up (the
bitstream has been used to configure the FPGA) and the kernel module is
loaded. The last step is to fetch data from userspace: `./tutorial3_us`

whos execution will generate a binary data file loaded in GNU/Octave
with

``` octave
f=fopen('data.bin')
d=fread(f,inf,'int16');
plot(d(2:2:end));
```

providing a result as exhibited in Fig. [4](#adc) in which the input of
the ADC is directly connected to the non-differential to differential
amplifier input in order to exploit aliasing on purpose (bypassing the
low-pass filter).

![Acquisitions from FPGA by the userspace program communicating with the
kernel through the <span>/dev/data1600</span> device: sine waves the
generated at a level of +6 dBm at 1 MHz, 6 MHz, 124 MHz (aliased to
weaker 1 MHz) and 125 MHz (aliased to the DC
signal).<span label="adc"></span>](figures/mesures.png)
