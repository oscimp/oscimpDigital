close all;clear all; more off; set (0,"defaultaxesfontname","Helvetica")
tic
pkg load signal

x=read_complex_binary('./gps.bin');
fs=1.023; % MHz
freq0=[-1.0e4:500:1.0e4]-20000;
  
x=x(1:2e5);
time=[0:1/fs/1e6:length(x)/fs/1e6]';time=time(1:end-1);
tic
for m=[1:31]
   a=cacode(m,fs/1.023); a=a-mean(a);
   l=1;
   m
   for freq=freq0               % run through possible frequency offsets
    mysine=exp(j*2*pi*(-freq)*time); 
    xx=x.*mysine;                     % frequency shift the signal
    [u(l,m),v(l,m)]=max(abs(xcorr(a,xx))); % check for cross correlation max.
    l=l+1;
   end
   %imagesc(abs(u))
   %pause(0.01)
end
toc
imagesc([1:31],-freq0-20000,abs(u))
