A few notes on the PI(D) block:

* all parameters (P, I coefficients, input et setpoint) are signed integers
* the P output is shifted by PSR
* the I output is shifted by ISR
* the I accumulator and PI output is saturated to avoid overflow
