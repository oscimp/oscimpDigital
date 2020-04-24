<span>**Redpitaya TCL programming**</span>  
   
G. Goavec-Mérou, J.-M Friedt  
   

This tutorial is a sequel to the second one on which it is based. In
addition to copying the ADC inputs to the DAC outputs, we wish (Fig.
[\[obj\]](#obj)) to <span>**mix**</span> the stream of data coming from
the ADC with a local numerically controlled oscillator
(<span>**NCO**</span>) and finally filter (<span>**FIR**</span>) before
sending back to the DAC and the processing system (Fig. [2](#fin)). In
this tutorial, all such tasks will be achieved by programming in TCL
rather than using the graphical user interface of Vivado.

![Schematic of the objective and final processing chain described in
this document<span label="fin"></span>](figures/tutorial6.png)

![Schematic of the objective and final processing chain described in
this document<span label="fin"></span>](figures/objective.png)

Starting from an existing TCL script, we first consider adding our
processing blocks using the Vivado TCL commands as described at
<https://www.xilinx.com/support/documentation/sw_manuals/xilinx2019_2/ug835-vivado-tcl-commands.pdf>.
The second part of the tutorial will wrap the Xilinx Vivado commands
with custom OscimpDigital commands to make the script compatible with
the Altera/Intel synthesis tool.

# Initial TCL script

Starting from <span>tutorial3.tcl</span> in <span>3-PLPS/Design</span>
which presents how to acquire data from the ADC and split the stream to
send both the a data2ram and the DAC, we now wish to add the NCO + mixer
+ FIR filter.

The processor is instanciated:

    startgroup
    set ps7 [ create_bd_cell -type ip \
        -vlnv xilinx.com:ip:processing_system7:5.5 ps7 ]
    set_property -dict [list CONFIG.PCW_IMPORT_BOARD_PRESET $board_preset ] $ps7
    apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
        -config {make_external "FIXED_IO, DDR" Master "Disable" Slave "Disable" } \
        $ps7
    endgroup

followed by the ADC and DAC

    set converters [ create_bd_cell -type ip -vlnv ggm:cogen:redpitaya_converters:1.0 converters]
    set_property -dict [ list CONFIG.ADC_SIZE $ADC_SIZE \
        CONFIG.ADC_EN true \
        CONFIG.DAC_EN true] $converters
    source $repo_path/redpitaya_converters/redpitaya_converters.tcl
    connect_bd_intf_net [get_bd_intf_pins $converters/phys_interface] \
        [get_bd_intf_ports phys_interface_0]

The streams are dupplicated to split between DAC and PS input

    # dupplDataA
    set dupplDataA [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 dupplDataA]
    set_property -dict [ list CONFIG.DATA_SIZE $ADC_SIZE] $dupplDataA
    connect_bd_intf_net [get_bd_intf_pins $converters/dataA_out] \
        [get_bd_intf_pins dupplDataA/data_in]
    
    # dupplDataB
    set dupplDataB [create_bd_cell -type ip -vlnv ggm:cogen:dupplReal_1_to_2:1.0 dupplDataB]
    set_property -dict [ list CONFIG.DATA_SIZE $ADC_SIZE] $dupplDataB
    connect_bd_intf_net [get_bd_intf_pins $converters/dataB_out] \
        [get_bd_intf_pins dupplDataB/data_in]

Since in all Redpitayas the DAC is 14 bit but some Redpitayas are fitted
with 16-bit ADC, we shift to match bus sizes

    # shifter is mandatory for redpitaya 16 : ADC is 16bits DAC 14bits
    # shiftA_out
    set shiftA_out [ create_bd_cell -type ip -vlnv ggm:cogen:shifterReal:1.0 shiftA_out]
    set_property -dict [ list \
        CONFIG.SIGNED_FORMAT true \
        CONFIG.DATA_IN_SIZE $ADC_SIZE \
        CONFIG.DATA_OUT_SIZE 14] $shiftA_out
    connect_bd_intf_net [get_bd_intf_pins dupplDataA/data2_out] \
        [get_bd_intf_pins $shiftA_out/data_in]
    connect_bd_intf_net [get_bd_intf_pins shiftA_out/data_out] \
        [get_bd_intf_pins $converters/dataA_in]
    
    # shiftB_out
    set shiftB_out [ create_bd_cell -type ip -vlnv ggm:cogen:shifterReal:1.0 shiftB_out]
    set_property -dict [ list \
        CONFIG.SIGNED_FORMAT true \
        CONFIG.DATA_IN_SIZE $ADC_SIZE \
        CONFIG.DATA_OUT_SIZE 14] $shiftB_out
    connect_bd_intf_net [get_bd_intf_pins dupplDataB/data2_out] \
        [get_bd_intf_pins $shiftB_out/data_in]
    connect_bd_intf_net [get_bd_intf_pins shiftB_out/data_out] \
        [get_bd_intf_pins $converters/dataB_in]

Finally the data are sent to the PS

    # convert realToComplex
    set convertReal2Cplx [create_bd_cell -type ip -vlnv ggm:cogen:convertRealToComplex:1.0 convertReal2Cplx]
    set_property -dict [ list CONFIG.DATA_SIZE $ADC_SIZE] $convertReal2Cplx
    connect_bd_intf_net [get_bd_intf_pins dupplDataA/data1_out] \
        [get_bd_intf_pins convertReal2Cplx/dataI_in]
    connect_bd_intf_net [get_bd_intf_pins dupplDataB/data1_out] \
        [get_bd_intf_pins convertReal2Cplx/dataQ_in]
    
    # data2ram
    set data1600 [create_bd_cell -type ip -vlnv ggm:cogen:dataComplex_to_ram:1.0 data1600]
    set_property -dict [ list CONFIG.DATA_SIZE $ADC_SIZE \
                            CONFIG.NB_INPUT {1} \
                            CONFIG.NB_SAMPLE {4096}] $data1600
    connect_bd_intf_net [get_bd_intf_pins convertReal2Cplx/data_out] \
        [get_bd_intf_pins data1600/data1_in]
    
    apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
        -config {Master "/ps7/M_AXI_GP0" Clk "Auto" } \
        [get_bd_intf_pins data1600/s00_axi]
    
    connect_bd_net [get_bd_pins rst_ps7_125M/peripheral_reset] \
        [get_bd_pins $converters/adc_rst_i]

The name of the interfaces are found using the
<span>oscimpDigital/fpga\_ip/tools/print\_businterfaces.py</span> and
providing as argument the directory name of the processing block in the
<span>fpga\_ip</span> directory. For example
<span>./tools/print\_businterfaces.py dupplComplex\_1\_to\_2</span>

    ./tools/print_businterfaces.py dupplComplex_1_to_2
    component:
    ----------
    name        : dupplComplex_1_to_2
    VLNV        : ggm:cogen:dupplComplex_1_to_2:1.0
    description : dupplComplex_1_to_2_v1_0
    
    Parameters:
    -----------
    name: DATA_SIZE
      display name  : Data Size
        default value : 8
    ...

# TCL script modifications

The NCO AXI connection must be taken care of manually, following the
same syntax as used in the data\_to\_ram block with the
apply\_bd\_automation command. Similarly, the NCO reset and clock must
be connected to the converter clock using

    connect_bd_net [get_bd_pins $converters/clk_o] \
        [get_bd_pins $datanco/ref_clk_i]
    connect_bd_net [get_bd_pins $converters/rst_o] \
        [get_bd_pins $datanco/ref_rst_i]

assuming the name of the NCO is <span>datanco</span>.

See <span>design/tutorial6.tcl</span> for the lines to be added to
tutorial 2 to reach the expected result.

# OscimpDigital wrapper

TCL is a verbose language and the commands are not consistent between
Xilinx and Altera/Intel. Commands have been implemented to OscimpDigital
to add an abstraction layer and add the compatibility with any
TCL-compatible vendor (at the moment Xilinx and Altera/Intel).

  - <span>add\_ip\_and\_conf</span>: adds an IP and configures
    parameters, using only the OscimpDigital name and no need to provide
    the Xilinx VLNV – Vendor, Library, Name, and Version – identifier

  - <span>connect\_proc</span>: connect to AXI bus. The argument is the
    least significant byte with respect to the 0x43C0000 base address
    (start at 0x00000 and increment by 0x10000 for each new block to be
    consistent with Vivado’s allocation of 64 KB blocks for each IP),

  - <span>connect\_proc\_clk</span>: connect the clock to the PS clock

  - <span>connect\_proc\_rst</span>: connect the reset to the PS reset

  - <span>connect\_intf</span>: connects interface to interface or
    signal to signal

  - <span>connect\_to\_fpga\_pins</span>: same as Make external

Using these commands, the developer only focuses on connecting blocks
together without struggling with the details of each vendor
implementation.

Similarly, the proposed Makefile automates all synthesis steps,
whichever vendor is addressed by a given platform: the project is
synthesized using <span>make project</span>.

Using these commands, the previous project becomes:

<span>**TODO**</span>
