# FIR

This IP is a *Finite Impulse Response* (*FIR*) filter. Taps (integer coefficients) are read from a file
and do not need to be hardwired upon synthesis. The input can be Real or Complex depending on the
version of the processing block.

**firReal** must be used for a real data stream and **firComplex** for a complex
data stream.

<strong>
see [redpitaya tutorial 4](https://github.com/oscimp/oscimpDigital/tree/master/doc/tutorials/redpitaya/4-FIR)
for a complete example.</strong>

<p align="center">
<img src='figures/fir.png' width='500'>
</p>

## IP

**firReal**, **firComplex**

## Generic

* **NB_COEFF**: tap length (number of coefficients) (default 128)
* **COEFF_SIZE**: tap size (default 16)
* **DECIMATE_FACTOR**: decimation between input and output stream (default 10)
* **DATA_IN_SIZE**: input data size (default 16)
* **DATA_OUT_SIZE**: output data size (default 39)
* **data_signed**: specify if input are signed or unsigned (default true/signed)

Be aware that while the FIR internally computes using the theoretical number of bits equal to
``DATA_IN_SIZE+COEFF_SIZE+log2(NB_COEFF)``, setting ``DATA_OUT_SIZE`` to a smaller value will
truncate the **most significant bits**, leading to inconsistent output (noise) if the truncation
is too large. Wisely start with the theoretical output data length and truncate if too many
sign bits are visible.

## Ports and interfaces

* **s00_axi**: (aximm interface) AXI 4 lite bus connected to the CPU.
* **s00_axi_reset**: (reset interface) active high reset signal, synchronous to s00_axi. Used for AXI communication part.
* **s00_axi_aclk**: (clock interface) clock signal, synchronous to s00_axi. Used for AXI communication part.
* **data_in**: (real interface for **firReal**, complex for **firComplex**) input data stream.
* **data_out**: (real interface for **firReal**, complex for **firComplex**) output data stream.

## TCL instanciation and connection

### TCL

```tcl
## add a firReal and configure it to:
# receive 14 bits data
# transmit 32 bits data
# no decimation
# use 25 x 16 bits coeffs 
# 
# Note: to use firComplex only add_ip_and_conf first params must be changed

add_ip_and_conf firReal firReal_I {
    data_signed true \
    DATA_IN_SIZE 14 \
    DATA_OUT_SIZE 32 \
    DECIMATE_FACTOR 1 \
    COEFF_SIZE 16 \
    NB_COEFF 25 }

# connect AXI interface
connect_proc firReal_I s00_axi 0x70000

# connect firReal_I to previous and next blocks
connect_to_fpga_pins $previous data_out firReal_I data_in
connect_to_fpga_pins firReal_I data_out $next data_out
```

## Driver

The driver used for the FIR IP is **fir_core**.

Access is done by `write()`

### **Example**

```c

/* ... */
/* open fir device */
int fir = open("/dev/firXX", O_RDWR);
if (fir < 0) {
    /* do something */
    return;
}

/* open coefficient file */
FILE *coeff_fd = fopen(fileCoeff, "r");
if (coeff_fd == NULL) {
    /* do something */
    return EXIT_FAILURE;
}

/* read coefficients and store in reverse order */
for (i = coeffSize-1; i >= 0; i--) {
    fscanf(coeff_fd, "%d", &aa);
    coeffs[i] = aa;
}

/* write/send coeffs */
do {
    i = write(fir, coeffs, size);
    size -= i;
} while (size > 0);
```


## Function to configure IP

To configure the fir, use the functions located in fir_conf.c and fir_conf.h:
```c
int fir_send_conf(const char *filename, const char *fileCoeff,
    const int coeffSize);
```
**param**

* *filename*: device filename (`/dev/something`)
* *fileCoeff*: ASCII file containing coefficients (one coefficient by line)
* *coeffSize*: number of coefficient to send

**return**

* 0 if filename exists and coefficient list has been send successfully;
* negative number if something went wrong

### **Example**

```c
#include <fir_conf.h>

/* SNIP */

int main(void)
{
    /* ... */
    if (fir_send_conf("/dev/firXX", "mycoeff.txt", 25) < 0) {
        /* do something */
        return EXIT_FAILURE;
    }

    /* do something */

    return EXIT_SUCCESS;
}
```
