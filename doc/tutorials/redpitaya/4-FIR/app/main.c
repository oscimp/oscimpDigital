#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "fir_conf.h" // library for communicating with the FIR


int main()
{int k;
 char c[16384];
 int fi,fo;
 fi=open("/dev/data1600",O_RDWR);
 fo=open("/tmp/data.bin",O_WRONLY|O_CREAT,S_IRWXU);
 fir_send_confSigned("/dev/fir00","coefs.txt",32);
 for (k=1;k<5;k++)
  {read(fi,c,16384);
   write(fo,c,16384);
  }
 close(fi);
 close(fo);
 return 0;
}
