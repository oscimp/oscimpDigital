# fft

This IP is a cordic based Fast Fourier Transform algorithm.

<p align="center">
<img src='figures/fft.png' width='500'>
</p>

## Generic

* **LOG_2_N_FFT**: 2**LOG_2_N_FFT = size of the FFT in clock cycles (default 11)
* **SHIFT_VAL**: size of the FFT coefficients (default 16)
* **DATA_SIZE**: output data size (default 32)
* **DATA_IN_SIZE**: input data size (default 16)
* **USE_FIRST_BUFF**: (default true)
* **USE_SEC_BUFF**: (default true)
* **USE_EOF**: To enable the use of the end of frame flag. (default false)

## Ports and interfaces

* **s00_axi**: (aximm interface) AXI 4 lite bus connected to the CPU.
* **s00_axi_reset**: (reset interface) active high reset signal, synchronous to s00_axi. Used for AXI communication part.
* **s00_axi_aclk**: (clock interface) clock signal, synchronous to s00_axi. Used for AXI communication part.
* **data_in**: (real interface) input data stream.
* **data_out**: (complex interface) output data stream.

## Driver

The driver used for the fft IP is **fft_core**.

## Function to configure IP

To configure the fft, use the functions located in fft_conf.c and fft_conf.h:
```c
int fft_send_conf(const char *filename, const char *fileCoeffRe, const char *fileCoeffIm, const int coeffSize);
```

Or for instance in python using python wrapper:
```python
liboscimp_fpga.fft_send_conf(/dev/MY_FFT_IP, my_real_fft_coefficients.dat, my_imaginary_fft_coefficients.dat, 2**LOG_2_N_FFT)
```

## Use it!

Still in preparation :).

