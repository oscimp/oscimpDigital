#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>

#include <nco_conf.h>
#include <switch_conf.h>

#define USE_NCO 1
#undef USE_NCO

#undef USE_NCO_SWITCH

#define NUM_PRN 1 // 2

int fpga_configure();

int main()
{
	/* two input (x2) x 2048 sample complex (x2) */
	int32_t c[2048 * 2 *NUM_PRN];
	int fi, fo;

	fpga_configure();
	usleep(1000);

	fi = open("/dev/data3200", O_RDWR);
	fo = open("/tmp/data.bin", O_WRONLY | O_CREAT);
	read(fi, c, 2048 * 2 * NUM_PRN * sizeof(int32_t));
	write(fo, c, 2048 * 2 * NUM_PRN * sizeof(int32_t));

	close(fi);
	close(fo);
}

int fpga_configure()
{
#ifdef USE_NCO
	int freq = 20000;
	int ret;
	int use_nco = 1;
	ret = nco_counter_send_conf("/dev/nco", 20000000, freq, 32, 0, 1, 1);
	printf("plop\n");
	if (ret == EXIT_FAILURE) {
		printf("erreur conf nco\n");
		return EXIT_FAILURE;
	}
	ret = nco_counter_send_conf("/dev/nco", 1000000/*20000000*/, freq, 32, 0, 1, 1);
	if (ret == EXIT_FAILURE) return EXIT_FAILURE;
#else
	int use_nco = 0;
#endif
#ifdef USE_NCO_SWITCH
	return switch_send_conf("/dev/use_nco", use_nco);
#else 
	return(use_nco);
#endif

}
