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

#include <nco_conf.h>

#define ELEMENT_SIZE 1024	// Nb Sample

#define CLK_FREQ 2000000
#define MOD_FREQ 100000
#define NCO_ACCUM_SIZE 28
#define CHANNEL 3

int main()
{
	int16_t *rawData;
	int ramfd = 0, i, ii;

	rawData = (int16_t *) malloc(CHANNEL * 2 * ELEMENT_SIZE * sizeof(int16_t));

	/* NCO configuration */
	nco_counter_send_conf("/dev/nco00", CLK_FREQ, MOD_FREQ,
			      NCO_ACCUM_SIZE, 0, 1, 1); // 0, 1, 1 => offset, PINC HW/SF, POFF HW/SF

	ramfd = open("/dev/data00", O_RDONLY);
	if (ramfd < 0) {
		perror("ram open error\n");
		return EXIT_FAILURE;
	}
	read(ramfd, rawData, CHANNEL * 2 * ELEMENT_SIZE * sizeof(int16_t));
	FILE *fd = fopen("data.dat", "w");
	for (i = 0; i < CHANNEL * 2 * ELEMENT_SIZE; i+=(CHANNEL * 2)) {
		for (ii=0; ii < CHANNEL * 2; ii++)
			fprintf(fd, "%d ", rawData[i + ii]);
		fprintf(fd, "\n");
	}

	fclose(fd);
	close(ramfd);
	free(rawData);
	return EXIT_SUCCESS;
}
