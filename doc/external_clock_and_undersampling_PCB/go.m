%graphics_toolkit('fltk')
leg=[];
fs=125;
fr=linspace(-fs/2,fs/2,30000);
filename=dir('d*.bin');
for filelist=1:length(filename)
subplot(3,3,filelist)
  filename(filelist).name
  f=fopen(['./',filename(filelist).name]);d=fread(f,inf,'int16');
  d1=d(1:2:end);
  d2=d(2:2:end);
  plot(d1(1:30000));hold on
  plot(d2(1:30000));hold on
title(filename(filelist).name(23:end-4))
%subplot(313)
%  plot(fr,fftshift(abs(fft(d1(1:30000)))));hold on
%  plot(fr,fftshift(abs(fft(d2(1:30000)))));hold on
  leg=[leg,'''',filename(filelist).name(23:end-4),''','];
end
%axis([-fs/2 fs/2 0 1e7])
%subplot(312)
%eval(['legend(',leg(1:end-1),',''location'',''southeast'')'])
%xlabel('sample number (no unit)')
%ylabel('value (bits)')
