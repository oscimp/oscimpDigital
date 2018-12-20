filenames=dir('*.bin');
for k=1:length(filenames)
  f=fopen(filenames(k).name);
  d=fread(f,inf,'int16');
  subplot(length(filenames),1,k)
  plot(d(2:2:end));hold on
  plot(d(1:2:end));
  title([filenames(k).name(1:4),' ',filenames(k).name(17:end)])
  xlim([0 200])
  ylabel('V (a.u.)')
  legend('unfiltered','filtered')
end
xlabel('time (a.u.)')
