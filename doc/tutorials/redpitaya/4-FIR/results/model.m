N=32
subplot(211)
longueurs=[4 8 16 28];
for longueur=longueurs
  bt=[ones(1,longueur) zeros(1,N-longueur)];
length(bt)
  bf=fftshift(abs(fft(bt,4096)));
  bf=bf./max(bf);
  f=linspace(-125/2,125/2,length(bf));
  plot(f,20*log10(bf));hold on
end
axis tight
xlabel('freq (MHz)')
ylabel('relative power (dB)')
legend('4x1 + 28x0','8x1 + 24x0','16x1 + 16x0','28x1 + 4x0','location','southwest')

subplot(212)
longueurs=[16 24 26 28];
for longueur=longueurs
  bt=[ones(1,longueur) zeros(1,N-longueur)];
length(bt)
  bf=fftshift(abs(fft(bt,4096)));
  bf=bf./max(bf);
  f=linspace(-125/2,125/2,length(bf));
  plot(f,20*log10(bf));hold on
end
axis([0 10 -45 0])
xlabel('relative power (dB)')
ylabel('relative power (dB)')
legend('16x1 + 16x0','24x1 + 8x0','26x1 + 6x0','28x1 + 4x0','location','southwest')

% amplitude v.s frequency measurement
freq=[0.5   1   1.5   2   2.5    3    4   7]; % MHz
meas=[1060 1060 1060 1060 0990 0990 0870 0240 ;
      1500 1470 1410 1320 1150 1000 0608 0512 ;
      1600 1570 1500 1360 1150 0976 0470 0560 ;
      1730 1660 1570 1390 1140 0928 0330 0544];
for k=1:4
  % plot(freq,10*log10(meas(k,:)/(1.5*max(meas(k,:)))),'o');
  plot(freq,20*log10(meas(k,:)/(1500)),'o');
end

% frequency at which the amplitude is lowest (notch position)
line([7.8 7.8],[-50 0]) % 16x1
line([5.2 5.2],[-50 0]) % 24x1
line([4.8 4.8],[-50 0]) % 26x1
line([4.5 4.5],[-50 0]) % 28x1
