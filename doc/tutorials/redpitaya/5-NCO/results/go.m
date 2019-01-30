fs=125; % sampling frequency in MHz
filelist=dir('./*MHz*.bin')
for k=1:length(filelist)
  f=fopen(filelist(k).name); d=fread(f,inf,'int16'); fclose(f)
  figure
  subplot(211)
  adc=d(1:6:end);  % 2 is same as 1
  mixed=d(3:6:end)+j*d(4:6:end);
  nco=d(5:6:end)+j*d(6:6:end);
  plot(real(nco(1:100)));hold on;plot(adc(1:100),'r');
  xlabel('time (sample number)')
  ylabel('voltage (bits)')
  title(filelist(k).name)
  subplot(212)
  f=linspace(-fs/2,fs/2,length(adc));res=fftshift(abs(fft(adc)));
  plot(f,res/max(res));hold on
  f=linspace(-fs/2,fs/2,length(nco));res=fftshift(abs(fft(nco)));
  plot(f,res/max(res),'r');
  f=linspace(-fs/2,fs/2,length(mixed));res=fftshift(abs(fft(mixed)));
  plot(f,res/max(res),'g');
  legend('ADC','NCO','mixer output','location','northwest')
  xlabel('frequency (MHz)')
  ylabel('FFT(ADC) (a.u.)')
  xlim([-11.5 11.5])
%  eval(['print -depsc ',num2str(k),'.eps'])
end
