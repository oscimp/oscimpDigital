# mixerComplex_sin, mixer_sin and multiplierReal

These IPs are used to perform multiplication between two input streams.

Note: Internal data size is DATA1_IN_SIZE + DATA2_IN_SIZE for *multiplierReal*
or DATA_IN_SIZE + NCO_SIZE for *mixer_sin* and *mixerComplex_sin*.

* if output is configured with the same number of bits: no modifications are applied between
  internal data and output;
* if output has more bits: additionnals bits are added (same principle as expander):
    - with a serie of '0' when the block is configured for compute unsigned multiplications
    - by copying internal data's sign bit (MSB) when signed
* If output is configured with less bits, results are shifted right (divided by
  2^n) (same principle as shifter).

## IP

* **mixerComplex_sin**: multiply two complex interfaces
* **mixer_sin**: multiply one complex interface by one real interface
* **multiplierReal**: multiply two real interfaces

## Generic

### multiplierReal

* **SIGNED_FORMAT** (boolean) signed or unsigned streams (default: true)
* **DATA1_IN_SIZE** (natural) stream data size for the first input (default: 16)
* **DATA2_IN_SIZE** (natural) stream data size for the second input (default: 16)
* **DATA_OUT_SIZE** (natural) output stream data size (default: 32)

### mixerComplex_sin / mixer_sin

* **NCO_SIZE** (natural) stream data size for the NCO input (default: 16)
* **ENABLE_SEL** (string) select master interface (nco_in or data_in) (default: data_in)
* **DATA_IN_SIZE** (natural) input stream data size (default: 16)
* **DATA_OUT_SIZE** (natural) output stream data size (default: 16)

## Ports and interfaces

### multiplierReal

* **data1_in**: (real interface) first input
* **data2_in**: (real interface) second input
* **data_out**: (real interface) output data stream

### mixerComplex_sin / mixer_sin

* **data_in**: (complex interface for **mixerComplex_sin** or real interface for
  **mixer_sin**) input data stream
* **nco_in**: (complex interface) nco input
* **data_out**: (real interface) output data stream

## Registers

**NA**

## TCL instanciation and connection

### multiplierReal

```tcl
# add a multiplierReal and configure it as signed and to propagate results
# with full resolution
add_ip_and_conf multiplierReal mult {
	SIGNED_FORMAT true \
	DATA1_IN_SIZE 14 \
	DATA2_IN_SIZE 16 \
	DATA_OUT_SIZE 30}

# connect dataX_in to others blocks with a real data stream (ADC for instance)
connect_intf $previous_block1 data_out mult data1_in
connect_intf $previous_block2 data_out mult data2_in
# connect output to an other block with a real data stream
connect_intf mult data_out $next_block data_in

```

### mixerComplex_sin / mixer_sin

```tcl
# add a mixer_sin and configure it to propagate results
# with full resolution
# change mixer_sin by mixerComplex_sin to use complex version
add_ip_and_conf mixer_sin mixer {
	ENABLE_SEL data_in \
	DATA_IN_SIZE 14 \
	NCO_SIZE 16 \
	DATA_OUT_SIZE 30}

# connect dataX_in to others blocks with a real data stream (ADC for instance)
connect_intf $previous_block data_out mult data_in
connect_intf $previous_block data_out mult nco_in
# connect output to an other block with a real data stream
connect_intf mult data_out $next_block data_in

```

## Driver

**NA**

## Functions to configure IP

**NA**
