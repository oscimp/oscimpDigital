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
freq=[0.1   0.5   1   1.5   2   2.5    3    4   5    6   7]; % MHz
meas=[0130 0130 0128 0126 0122 0115 0110 0093 0070 0050 0027 ;  % 16/16 
      0188 0186 0180 0170 0150 0133 0112 0066 0019 0037 0059 ;  % 24/08 
      0200 0200 0190 0178 0155 0131 0109 0053 0020 0053 0064 ;  % 26/06 
      0216 0213 0203 0186 0160 0130 0102 0035 0034 0064 0062];  % 28/04 
for k=1:4
<<<<<<< HEAD
  plot(freq,10*log10(meas(k,:)/(max(meas(k,:)))),'o');
=======
  plot(freq,20*log10(meas(k,:)/(max(meas(k,:)))),'o');
>>>>>>> 0d5c20b51512c84f13879f58a4d079e23c87988b
  % plot(freq,20*log10(meas(k,:)/(1500)),'o');
end

% frequency at which the amplitude is lowest (notch position)
line([7.8 7.8],[-50 0]) % 16x1  
line([5.2 5.2],[-50 0]) % 24x1
line([4.8 4.8],[-50 0]) % 26x1  
line([4.5 4.5],[-50 0]) % 28x1 
line([8.9 8.9],[-50 0]) % 28x1 (second)
