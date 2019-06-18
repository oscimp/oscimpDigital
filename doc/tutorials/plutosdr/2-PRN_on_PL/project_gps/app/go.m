filelist=dir("max*.dat");
for k=1:length(filelist)
	a=load(filelist(k).name);
	d(:,k)=a;
	%figure()
	%plot(a)
end
imagesc(d);
