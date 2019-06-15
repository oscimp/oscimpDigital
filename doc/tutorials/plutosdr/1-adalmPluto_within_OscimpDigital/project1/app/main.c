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

#define ELEMENT_SIZE 1024	// Nb Sample

#define CLK_FREQ 2000000
#define MOD_FREQ 100000
#define NCO_ACCUM_SIZE 28

int main()
{
	int16_t *rawData;
	int ramfd = 0, i;

	struct iio_device *dev, *phy;
	struct iio_context *ctx;
	struct iio_channel *rx0_i, *rx0_q;

	rawData = (int16_t *) malloc(2 * ELEMENT_SIZE * sizeof(int16_t));

	ctx = iio_create_local_context();

	dev = iio_context_find_device(ctx, "cf-ad9361-lpc");
	phy = iio_context_find_device(ctx, "ad9361-phy");

	iio_channel_attr_write_longlong(iio_device_find_channel(phy, "altvoltage1", true),
		"frequency", 2200000000);	/* TX LO frequency 2.4GHz */

	iio_channel_attr_write_longlong(iio_device_find_channel(phy, "altvoltage0", true),
		"frequency", 2200100000);	/* RX LO frequency 2.4GHz + 100 kHz */

	iio_channel_attr_write_longlong(iio_device_find_channel(phy, "voltage0", false),
		"sampling_frequency", CLK_FREQ);	/* RX baseband rate 5 MSPS */

	rx0_i = iio_device_find_channel(dev, "voltage0", 0);
	rx0_q = iio_device_find_channel(dev, "voltage1", 0);

	iio_channel_enable(rx0_i);
	iio_channel_enable(rx0_q);

	/* NCO configuration */
	nco_counter_send_conf("/dev/nco00", CLK_FREQ, MOD_FREQ,
			      NCO_ACCUM_SIZE, 0, 1, 1); // 0, 1, 1 => offset, PINC HW/SF, POFF HW/SF

	ramfd = open("/dev/data00", O_RDONLY);
	if (ramfd < 0) {
		perror("ram open error\n");
		return EXIT_FAILURE;
	}
	read(ramfd, rawData, 2 * ELEMENT_SIZE * sizeof(int16_t));
	FILE *fd = fopen("data.dat", "w");
	for (i = 0; i < 2 * ELEMENT_SIZE; i+=2)
		fprintf(fd, "%d %d\n", rawData[i], rawData[i+1]);
	fclose(fd);
	close(ramfd);
	iio_context_destroy(ctx);
	free(rawData);
	return EXIT_SUCCESS;
}
