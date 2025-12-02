pkg load signal
b2=round((firls(31,[0 .02 .04 1],[1 1 0 0]))*64);
b4=round((firls(31,[0 .04 .08 1],[1 1 0 0]))*64);
f=linspace(-62.5,62.5,1024);
subplot(211)
plot(f,20*log10(abs(fftshift(fft(b2,1024))))-26)
hold on
plot(f,20*log10(abs(fftshift(fft(b4,1024))))-26)
axis([0 15 -40 15])
d2=dlmread('figures/FIR_S12_p02_p04.csv','',7,0)
d4=dlmread('figures/FIR_S12_p04_p08.csv','',7,0)
xlabel('frequency (MHz)');ylabel('|S12| simulation (dB)')
legend('[0 .02 .04 1]','[0 .04 .08 1]')
subplot(212)
plot(d2(:,1)/1e6,d2(:,2))
hold on
plot(d4(:,1)/1e6,d4(:,2))
axis([0 15 -40 15])
xlabel('frequency (MHz)');ylabel('|S12| experimental (dB)')
legend('[0 .02 .04 1]','[0 .04 .08 1]')
