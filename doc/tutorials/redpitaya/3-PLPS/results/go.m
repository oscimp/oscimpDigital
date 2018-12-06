subplot(211)
f=fopen('data006MHz_m6dBm_in1.bin')
d=fread(f,inf,'int16');
plot(d(2:2:end));hold on

f=fopen('data124MHz_m6dBm_in1.bin')
d=fread(f,inf,'int16');
plot(d(2:2:end))

f=fopen('data125MHz_m6dBm_in1.bin')
d=fread(f,inf,'int16');
plot(d(2:2:end))

f=fopen('data001MHz_m6dBm_in1.bin')
d=fread(f,inf,'int16');
plot(d(2:2:end))
