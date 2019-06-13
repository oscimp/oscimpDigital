fd=fopen("data_closed1.bin");
a=fread(fd, Inf, "int32");
prn1=a(1:2:end)+i*a(2:2:end);
subplot(311)
plot((abs(prn1)), 'b');
xlabel('sample (a.u.)')
ylabel('xcorr (a.u.)')
legend('through')

fd=fopen("data_open1.bin");
a=fread(fd, Inf, "int32");
prn1=a(1:2:end)+i*a(2:2:end);
subplot(312)
plot(20*(abs(prn1)), 'r');
xlabel('sample (a.u.)')
ylabel('xcorr (a.u.)')
legend('open')

fd=fopen("data_load1.bin");
a=fread(fd, Inf, "int32");
prn1=a(1:2:end)+i*a(2:2:end);
subplot(313)
plot(20*(abs(prn1)), 'g');
xlabel('sample (a.u.)')
ylabel('xcorr (a.u.)')
legend('load')
