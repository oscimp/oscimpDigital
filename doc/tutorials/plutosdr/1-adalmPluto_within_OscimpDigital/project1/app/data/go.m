x=load('data_100kHz.dat');
subplot(321);plot(x(1:6:end));hold on;plot(x(2:6:end));
subplot(323);plot(x(3:6:end));hold on;plot(x(4:6:end));
subplot(325);plot(x(5:6:end));hold on;plot(x(6:6:end));

%x=load('data_200kHz.dat');
x=load('data_250kHz.dat');
%x=load('data_050kHz.dat');
subplot(322);plot(x(1:6:end));hold on;plot(x(2:6:end));
subplot(324);plot(x(3:6:end));hold on;plot(x(4:6:end));
subplot(326);plot(x(5:6:end));hold on;plot(x(6:6:end));
