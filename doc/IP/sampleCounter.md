# sampleCounterComplex/sampleCounterReal

Used to associate a numeric value (counter) to each input sample.
This counter has a fixed size (**SAMPLE_COUNTER_SIZE**). When the value is equal
to $2^{SAMPLE_COUNTER_SIZE}-1), the counter restart with the value 0.

*Note: counter output (**counter_out**) interface is always real*

[sampleCounter_scheme]: figures/sampleCounter.svg "sampleCounter_scheme"
![sampleCounter block internal scheme][sampleCounter_scheme]

__figure1__: sampleCounter block principle

### **Internal propagation delay**

1 clock cycle

## IP
* **sampleCounterReal**: in and out real interfaces variant
* **sampleCounterComplex**: in and out complex interfaces variant

## Generic
* **SAMPLE_COUNTER_SIZE**: (natural) output counter size (default: 32).
* **DATA_SIZE**: (natural) input/output data stream bus size (default: 16).

## Ports and interfaces
* **data_in**: input data stream (complex type for *sampleCounterComplex* or
  real type for *sampleCounterReal*). Size fixed by **DATA_SIZE**
* **data_out**: output data stream (complex type for *sampleCounterComplex* or
  real type for *sampleCounterReal*). Size fixed by **DATA_SIZE**
* **counter_out**: output counter value (real type for both). Size fixed by
  **SAMPLE_COUNTER_SIZE**

## TCL instanciation and connection

### common

```tcl
# add sampleCounterComplex with a 32 bits data stream and a 16 bits counter stream
# replace sampleCounterComplex by sampleCounterReal
add_ip_and_conf sampleCounterComplex sCnt {
    DATA_SIZE 32 \
    SAMPLE_COUNTER_SIZE 16}

# prev -> sampleCounter
connect_intf $prevInst data_out sCnt data_in
# sampleCounter (data) -> next
connect_intf sCnt data_out $nextInst data_in
# sampleCounter (counter) -> next
connect_intf sCnt counter_out $anotherNextInst data_in
```

## Registers

**NA**

## Driver

**NA**

## Functions to configure IP

**NA**
