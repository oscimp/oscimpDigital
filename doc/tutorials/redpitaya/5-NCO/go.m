fs=125; % sampling frequency in MHz
filelist=dir('./*MHz*.bin')
for k=1:length(filelist)
  f=fopen(filelist(k).name);
  d=fread(f,inf,'int16');
  fclose(f)
  subplot(211)
  re=d(1:2:end);
  im=d(2:2:end);
  plot(re);hold on
  subplot(212)
  f=linspace(-fs/2,fs/2,length(d(1:2:end)));
  c=re-mean(re)+i*(im-mean(im));
  plot(f,fftshift(abs(fft(c))));hold on
end
subplot(211)
xlabel('time (sample number)')
ylabel('voltage (bits)')
subplot(212)
xlabel('frequency (Hz)')
ylabel('FFT(ADC) (a.u.)')
xlim([-10 10])
legend('2.5 MHz','3 MHz')
