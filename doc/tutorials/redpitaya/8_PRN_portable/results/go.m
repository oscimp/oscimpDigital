f=fopen('data15fois16.bin');d=fread(f,inf,'int32');
x=d(1:2:end); z=zeros(1,length(x));
z(1:15)=1;
subplot(211)
u=(abs(fft(d(1:2:end)))); plot(u/max(u),'b'); hold on
u=(abs(fft(z-mean(z)))); plot(u/max(u),'r');

subplot(212)
f=fopen('data4fois16.bin');d=fread(f,inf,'int32');
z=zeros(1,length(x));
z(1:3)=1; 
u=(abs(fft(d(1:2:end)))); plot(u/max(u),'b'); hold on
u=(abs(fft(z-mean(z))));  plot(u/max(u),'r');
print -depsc cara_fir.eps

figure
f=fopen('data15fois16.bin');d=fread(f,inf,'int32');
subplot(211)
x=d(2:2:end); plot(abs(fft(x)),'b'); hold on
x=d(1:2:end); plot(abs(fft(x)),'r');

subplot(212)
f=fopen('data4fois16.bin');d=fread(f,inf,'int32');
x=d(2:2:end); plot(abs(fft(x)),'b'); hold on
x=d(1:2:end); plot(abs(fft(x)),'r');
print -depsc cara_fir2.eps
