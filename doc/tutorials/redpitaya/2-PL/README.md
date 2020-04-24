<span>**Redpitaya: first Vivado project example, using the RF ADC and
DAC**</span>  
   
G. Goavec-Mérou  
   

This documents aims at providing basics on:

  - creating a basic Vivado project and the associated block design,

  - adding IP and connections between these processing blocks as well as
    towards the FPGA pins,

  - generating the bitstream,

  - converting the bitstream to a format usable with GNU/Linux and
    configuring the FPGA.

This presentation will aim at connecting the Redpitaya radiofrequency
ADC output to the DAC input (Fig.
[\[bloc\_design\_final\]](#bloc_design_final)).

![Objective of the tutorial (top) and block design (bottom) including
the processor, and the combined ADC/DAC block including clocking
circuit.](objective.png)

![Objective of the tutorial (top) and block design (bottom) including
the processor, and the combined ADC/DAC block including clocking
circuit.](combinedADC_DAC.png)

<span id="bloc_design_final" label="bloc_design_final">\[bloc\_design\_final\]</span>

# Creating the design

Creating a new design for the Redpitaya requires configuring a project
for the Zynq 7010 embedded on the board (Figs. [1](#createProj1),
[\[createProj\_selectType\]](#createProj_selectType),
[\[createProj\_selectpart\]](#createProj_selectpart) and
[\[createProj\_summary\]](#createProj_summary)): despite not being
defined in Xilinx Vivado, we provide manually the proper Zynq
declination instead of the platform settings (Fig.
[\[createProj\_selectpart\]](#createProj_selectpart)).

Such a result is achieved by selecting a <span>RTL Project</span> so
that all additional configurations are performed manually. The option
<span>*Do not specify sources at this time*</span> prevents
<span>Vivado</span> from asking the list of source files at the creation
of the project (Fig.
[\[createProj\_selectType\]](#createProj_selectType)).

![Selecting the project name and storage
location<span label="createProj1"></span>](./createProj1.png)

![Selecting the project type.](./createProj_selectType.png)

<span id="createProj_selectType" label="createProj_selectType">\[createProj\_selectType\]</span>

![Selecting the Zynq SOC type: the Redpitaya is fitted with a
<span>xc7z010clg400-1</span> model of the Zynq, hence a Zynq-7000 in a
“clg400” package, and a speed grade set to
-1.](./createProj_selectPart2019.png)

<span id="createProj_selectpart" label="createProj_selectpart">\[createProj\_selectpart\]</span>

![Fenêtre récapitulative.](./createProj_summary.png)

<span id="createProj_summary" label="createProj_summary">\[createProj\_summary\]</span>

# Creating the block design

The classical approach offered by Vivado is to assemble blocks
graphically: while we shall depart later from this approach for large
designs, we will use it for the smaller designs of the first tutorials.
Assembling IPs graphically is achieved using the <span>*block
design*</span> tool.

In the left menu, double click on <span>*Create Block Design*</span>.
Selecting the design name does not really matter but will define the
final bitstream name: for consistency sake we <span>**advise to use the
same name than the name of the project**</span>.

The first item to be added is the <span>*processing system*</span>
(representing CPU in the block design). Such a result is achieved by
displaying (<span>CTRL + i</span> shortcut) a window allowing for the
selection of all available IPs. In the list, add <span>*ZYNQ7 Processing
System*</span> (search keyword <span>zynq</span>). Failing to add this
IP, even if not needed, will result in a system freeze when configuring
the FPGA from GNU/Linux.

Once this block has been added, a green horizontal bar appears with the
text <span>*Run Block Automation*</span>. Running this option will route
the few mandatory connections.

At the beginning of a project creation <span>*block design*</span> has
no knowledge of the Redpitaya hardware configuration (amount of RAM,
peripherals ...): defining such a configuration of the processing system
is needed for further work. Such a result is achieved by double-clicking
on the <span>*processing system*</span> block: on top of the newly
created window, in the <span>Presets</span> menu, select <span>*Apply
configuration*</span> and load the configuration file
<span>redpitaya.tcl</span> (or <span>redpitaya16.tcl</span> for the
16-bit Redpitaya version \[1\]) found in the
<span>red\_vivado\_support</span> directory of the
<https://github.com/trabucayre/redpitaya/> repository, or locally at  
<span>/somewhere/oscimpDigital/fpga\_ip/preset/redpitaya.tcl</span>.

# Configuring Vivado to use custom IPs

<span>Tools</span> \(\rightarrow\) <span>Settings</span> \(\rightarrow\)
<span>IP</span> \(\rightarrow\) <span>Repository</span> \(\rightarrow\)
<span>+</span> and add <span>somewhere/oscimpDigital/fpga\_ip</span>.
This operation is completed only once on a given Vivado installation,
when accessing for the first time the custom IPs provided by the OscImp
project.

# Inserting a new block in Vivado

Handling ADC, DAC and the associated clocking circuitry is being taken
care of by a single processing block:
<span>redpitaya\_converters</span>. This block is designed to handle the
legacy 14-bit Redpitaya as well as the newer 16-bit Redpitaya.

Since this design will not allow communicating with the PS, some blocks
that will be used later are not added, such as the <span>*axi
interconnect*</span> and the <span>*Processor System Reset*</span>. The
latter block is however mandatory in the current case since it handles
reset signals. Hence, having again hit <span>CTRL + i</span>, select
<span>*Processor System Reset*</span> (search keyword
<span>reset</span>). Now connect the <span>redpitaya\_converters</span>
<span>adc\_rst\_i</span> input to the <span>proc\_sys\_reset</span>
output named <span>peripher\_reset</span>.

Forthermore, clock settings must be manually defined since here we do
not rely on AXI communication to set these signals automatically as will
be done later: connect <span>FCLK\_CLK0</span> (of ps7) to
<span>M\_AXI\_GP0\_ACLK</span> (same block) and
<span>slowest\_sync\_clk</span> (of <span>rst\_ps7</span>).

# Connecting blocks to the FPGA pins

The block describing the ADC, DAC and internal signals must be connected
to the FPGA pins (Fig. [\[bloc\_design\_final\]](#bloc_design_final)).

Exporting a signal to the outer world is achieved by using the
<span>*make external*</span> command obtained by selecting a given
signal on a block (the line and its name should turn brown) and
right-mouse click, or using the shortcut <span>CTRL + t</span>: apply
this command to the <span>phys\_interface</span> of the
<span>redpitaya\_converters</span> block.

The <span>make external</span> command we have just used (CTRL+t
shortcut) has exported each signal and now requires defining which of
the FPGA pins they are connected to. Such constraints are defined by
dedicated files with the <span>.xdc</span> extension. For the IP we have
used in this design, these files are provided in the sub-directory with
the IP name in the repository and must be added:

  - in the <span>Sources</span> tab on the left of the schematic, unwrap
    <span>Constraints</span> and right-click on <span>constrs\_1</span>
    (Fig. [2](#addSources)) and select <span>*Add Sources*</span>

  - <span>*Add or create constraints*</span>;

  - using the “+” button, <span>*Add Files*</span> and select the
    <span>xdc</span> files
    
      - <span>redpitaya\_converters.xdc</span> must alway be selected;
    
      - add either <span>redpitaya\_converters\_adc.xdc</span> or
        <span>redpitaya\_converters\_adc16.xdc</span> depending whether
        the legacy (14-bit) or newer (16-bit) Redpitaya is used
    
    located in the IP directories of the
    <span>oscimpDigital/fpga\_ip/redpitaya\_converters</span>
    repository.

  - before validating with <span>Finish</span>, select <span>*Copy
    constraints files into project*</span>, otherwise the project will
    refer to the repository file using absolute paths, preventing the
    use of the project if moved to another computer or directory
    (collaborative work).

![Adding constraints for mapping signals to FPGA
pins.<span label="addSources"></span>](addSources.png)

# Bitstream generation

The project is now completed, but prior to generating the bitstream a
last step is mandatory: creating a wrapper whose function is to assemble
the various HDL source codes. This file also provides the
<span>top</span> file of the design.

Such a result is achieved by right-clicking in the <span>Sources</span>
tab the name of the block design (Fig.
[\[createHDLWrapper\]](#createHDLWrapper)) and selecting <span>Create
HDL Wrapper</span>. Having completed this step, we click on
<span>Generate Bitstream</span> in the lower left part of the
<span>Vivado</span> graphical interface.

![Creating the wrapper (<span>top</span> of the design) needed to
generate the bitstream](createHDLWrapper.png)

.
<span id="createHDLWrapper" label="createHDLWrapper">\[createHDLWrapper\]</span>

# Signed bitstream and FPGA configuration

The previous steps have ended with the generation of a <span>.bit</span>
located in the  
<span>project\_name/project\_name.runs/impl\_1</span> directory and
called <span>project\_name\_wrapper.bit</span>

## Creating the encrypted bitstream

The default file format of the bitstream generated by Vivado is a
<span>.bit</span> file. The driver allowing to configure the PL from
GNU/Linux requires a specific format including a dedicated header.
Converting from one format to another is achieved by using the
<span>bootgen</span> tool provided by the Vivado SDK.

This tool expects a configuration file with a <span>.bif</span>
extension and filled with

    all:
    {
      bitstream_name.bit
    }

so that the following command is executed

``` bash
bootgen -image bif_file.bif -arch zynq -process_bitstream bin
```

Following this command, a file named
<span>bitstream\_name.bit.bin</span> is generated in the current working
directory.

## Configuring the PL by using <span>fpga\_manager</span>

GNU/Linux provides a homogeneous framework for configuring the FPGA of
SoC chips: <span>fpga\_manager</span>. This framework expects the
<span>.bit.bin</span> file to be located in the
<span>/lib/firmware</span> of the target platform.

Once the file is in the right location, the driver must be informed that
the FPGA must be configured and which bitstream to use:

``` bash
echo "bitstream_name.bit.bin" > /sys/class/fpga_manager/fpga0/firmware
```

which results in

``` bash
fpga_manager fpga0: writing bitstream_name.bit.bin to Xilinx Zynq FPGA Manager
```

being displayed in the console or in <span>/var/log/syslog</span> and
the LED (blue on the Redpitaya platform) connected to <span>Prog
done</span> will be lit.

## Using the <span>devicetree</span> overlay for PL configuration

The devicetree overlay provides an alternative solution for configuring
the FPGA in which all necessary resources – driver name, address space
and bitstream name – are referenced in a single file and communicated to
the kernel module. For the purpose of this design, this solution is
oversized but offer a coherent approach with next tutorials, where Axi
based IPs are used.

Similar to the previous method, the bitstream must be located in
<span>/lib/firmware</span>.

Without getting in the details of the devicetree overlay format, the
following code aims at modify <span>fpga\_full</span> node, defined at
board’s default devicetree, to provide, through attribute
<span>firmware-name</span>, the bitstream name.

    /dts-v1/;
    /plugin/;
    / {
        compatible = "xlnx,zynq-7000";
        fragment@0 {
            target = <&fpga_full>;
            #address-cells = <1>;
            #size-cells = <1>;
            __overlay__ {
                #address-cells = <1>;
                #size-cells = <1>;
    
                firmware-name = "bitstream_name.bit.bin";
            };
        };
    };

This file is compiled by using the following command

    /somewhere/buildroot/output/host/bin/dtc -@ -I dts -O dtb -o ${FILENAME}.dtbo ${FILENAME}.dts

in which

  - <span>-@</span> requires generating symbols that will be dynamically
    linked when loaded,

  - <span>-I dts</span> defines the format of the input file,

  - <span>-O dtb</span> defines the format of the output file,

  - <span>-o</span> the name of the generated file.

Loading this file in memory is achieved in two steps:

1.  creating a directory hosting our overlay
    
    ``` bash
    mkdir /sys/kernel/config/device-tree/overlays/myname
    ```
    
    will create a directory automatically filled with the files needed
    to communicate with the driver
    
    ``` bash
    redpitaya> ls -l /sys/kernel/config/device-tree/overlays/myname/
    total 0
    -rw-r--r--    1 root     root             0 Jan  1 00:04 dtbo
    -rw-r--r--    1 root     root          4096 Jan  1 00:04 path
    -r--r--r--    1 root     root          4096 Jan  1 00:04 status
    ```

2.  loading the overlay in the <span>devicetree</span> :
    
    ``` bash
    cat gpio_red.dtbo > /sys/kernel/config/device-tree/overlays/myname/dtbo
    ```
    
    will configure the PL by transferring the bitstream, insert, if
    needed, the associated module driver as defined by the “compatible”
    field which must be filled with a matching string in the driver.

Returning to a state where the overlay functionalities are removed is
achieved by erasing the directory:

``` bash
rmdir /sys/kernel/config/device-tree/overlays/myname
```

1.  In case of the 16-bit Redpitaya, we wish to echo the 16-bit ADC
    measurement to the 14-bit DAC. A bit-shift –
    <https://github.com/oscimp/oscimpDigital/blob/master/doc/IP/shifter.md>
    – to the right by two bits is necessary to match data bus sizes.
    This shifter is automatically inserted when generating the Vivado
    project from the TCL script found in the <span>design</span>
    directory.
