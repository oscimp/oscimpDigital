#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include "nco_conf.h"

// 3 complex short = 6*2*2 bytes/measurement
#define channels 12

int main()
{char c[4096*channels];
 int fi,fo;
 fi=open("/dev/data1600",O_RDWR);
 fo=open("/tmp/data.bin",O_WRONLY|O_CREAT,0666);
 nco_counter_send_conf("/dev/datanco0", 125000000, 10000000, 32, 0,   1,   1);
                     // /dev            f_ck=125M  f_o=10M  acc offs pinc poff
 read(fi,c,4096*channels);
 write(fo,c,4096*channels);
 close(fi);
 close(fo);
}
