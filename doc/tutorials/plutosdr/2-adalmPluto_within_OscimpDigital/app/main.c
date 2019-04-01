#include <stdint.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/types.h>
/* memory management */
#include <sys/mman.h>
#include <string.h>
#include <iio.h>

#include <nco_conf.h>

#define ELEMENT_SIZE 1024 // Nb Sample
#define CHANNELS     3    // NB input

#define CLK_FREQ 50000000 
#define MOD_FREQ 100000 
#define NCO_ACCUM_SIZE 28


int main(int argc,char **argv)
{
        int16_t *rawData;
	int ramfd=0,i,df,channels;

	struct iio_device *dev;
	struct iio_channel *rx0_i, *rx0_q;

	struct iio_device *phy;
	struct iio_context *ctx;
	
	if (argc>1) df=atoi(argv[1]); else df=MOD_FREQ;
	if (argc>2) channels=atoi(argv[2]); else channels=CHANNELS;
	rawData=(int16_t*)malloc(ELEMENT_SIZE*channels*sizeof(int16_t));

	ctx = iio_create_local_context();

	dev = iio_context_find_device(ctx, "cf-ad9361-lpc");
	phy = iio_context_find_device(ctx, "ad9361-phy");

        iio_channel_attr_write_longlong(
                iio_device_find_channel(phy, "altvoltage1", true),
                "frequency",
                2200000000); /* TX LO frequency 2.4GHz */

        iio_channel_attr_write_longlong(
                iio_device_find_channel(phy, "altvoltage0", true),
                "frequency",
                2200100000); /* RX LO frequency 2.4GHz + 100 kHz */

        iio_channel_attr_write_longlong(
                iio_device_find_channel(phy, "voltage0", false),
                "sampling_frequency",
                50000000); /* RX baseband rate 5 MSPS */

        nco_counter_send_conf("/dev/nco00", CLK_FREQ, df,
		NCO_ACCUM_SIZE, 0, 1, 1);

	rx0_i = iio_device_find_channel(dev, "voltage0", 0);
	rx0_q = iio_device_find_channel(dev, "voltage1", 0);
 
	iio_channel_enable(rx0_i);
	iio_channel_enable(rx0_q);

        ramfd= open ("/dev/data00", O_RDONLY);
        if (ramfd< 0 )
        {
                perror("ram open error\n");
                return EXIT_FAILURE;
        }
        read(ramfd, rawData, ELEMENT_SIZE*sizeof(int16_t)*channels);
        FILE * fd = fopen ("data.dat","w");
        for ( i = 0 ; i < ELEMENT_SIZE*channels; ++i )
              fprintf(fd,"%d\n", rawData[i]);
        fclose(fd);
        close(ramfd);
        iio_context_destroy(ctx);
	free(rawData);
        return EXIT_SUCCESS;
}
