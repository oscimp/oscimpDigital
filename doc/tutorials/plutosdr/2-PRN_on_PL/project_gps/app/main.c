#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>

#include <nco_conf.h>
#include <fpgagen_conf.h>
#include <switch_conf.h>
#include <iio.h>
#include <ad9361.h>
#include <math.h>
#include <sys/time.h>

#define BYPASS_NCO 1
#undef BYPASS_NCO

int configure_fpga(/*int nco_freq, int cacode*/);
void usage(char *app)
{
	printf("%s -f doppler frequency -p cacode number\n", app);
	printf("%s -c\n", app);
}

#define CENTER_FREQ 20000
#define SAMPLERATE 1022999

int main(int argc, char **argv)
{
	struct timeval t1, t2;
	int i;
	int nco_freq = -1, cacode = -1;
	char filename[256];

	if (argc == 1) {
		printf("missing parameter\n");
		usage(argv[0]);
		return EXIT_FAILURE;
	}

	for (i = 1; i < argc; i += 2) {
		if (!strcmp(argv[i], "-p")) {
			cacode = atoi(argv[i + 1]);
		} else if (!strcmp(argv[i], "-f")) {
			nco_freq = atoi(argv[i + 1]);
		} else if (!strcmp(argv[i], "-c")) { // configure and stop
			return configure_fpga(/*nco_freq, cacode*/);
		} else {
			printf("unkown parameter\n");
			usage(argv[0]);
			return EXIT_FAILURE;
		}
	}

	if (cacode == -1 || nco_freq == -1) {
		printf("wrong or missing parameter\n");
		usage(argv[0]);
		return EXIT_FAILURE;
	}
	if (cacode < 0 || cacode > 31) {
		printf("cacode must be between 0 and 31\n");
		return EXIT_FAILURE;
	}

	int freq = (int)CENTER_FREQ + nco_freq;
	if (EXIT_FAILURE == nco_counter_send_conf("/dev/nco", SAMPLERATE, freq, 32, 0, 1, 1))
		return EXIT_FAILURE;

	gettimeofday(&t1, NULL);
	if (EXIT_FAILURE == fpgagen_send_conf("/dev/select_cacode", 0, cacode))
		return EXIT_FAILURE;
	gettimeofday(&t2, NULL);
	printf("fpgagen %ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	usleep(1000);
	/*usleep(1000);
	usleep(1000);
	usleep(1000);
	usleep(1000);
	usleep(1000);
	usleep(1000);
	usleep(1000);*/

	gettimeofday(&t1, NULL);

	int32_t c[2048 * 2];
	int fi, fo;
	fi = open("/dev/data3200", O_RDWR);
#if 0
	sprintf(filename, "xcorr_prn%d_freq%d.dat", cacode, nco_freq);
	fo = open(filename, O_WRONLY | O_CREAT);
#endif
	read(fi, c, 2048 * 2 * sizeof(int32_t));

	long curr_abs;
	long max=0;
	for (i=0; i < 2048*2;i+=2) {
		curr_abs = sqrt(c[i] * c[i] + c[i+1] * c[i+1]);
		if (curr_abs > max) {
			max = curr_abs;
		}
	}
	sprintf(filename, "max_%02d.dat", cacode);
	FILE *fd = fopen(filename, "a+");
	fprintf(fd, "%ld\n", max);
	fclose(fd);
	printf("%ld\n", max);
#if 0
	if (max > 2000) 
		write(fo, c, 2048 * 2 * sizeof(int32_t));
#endif
	gettimeofday(&t2, NULL);
	printf("acquis %ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	close(fi);
	//close(fo);
}

int setparamsStr(struct iio_device *phy, char *key, char *val)
{
	struct iio_channel *chn = NULL;
	const char *attr = NULL;
	int ret;

	ret = iio_device_identify_filename(phy, key, &chn, &attr);
	if (ret) {
		printf("Parameter not recognized: %s", key);
		return EXIT_FAILURE;
	}
	if (chn)
		ret = iio_channel_attr_write(chn, attr, val);
	else if (iio_device_find_attr(phy, attr))
		ret = iio_device_attr_write(phy, attr, val);
	else
		ret = iio_device_debug_attr_write(phy, attr, val);
	if (ret < 0) {
		printf("Unable to write attribute %s : %d\n", key, ret);
		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}

int setparams(struct iio_device *phy, char *key, int value)
{
	char val[128];
	sprintf(val, "%d", value);
	return setparamsStr(phy, key, val);
}

int configure_fpga(/*int nco_freq, int cacode*/)
{
	struct timeval t1, t2;

	//int freq;
	int ret;
	long lo_freq = (long)1.575420e9;

/*#ifdef BYPASS_NCO
	int bypass_nco = 0;
#else*/
	int bypass_nco = 1;
	lo_freq += (long) CENTER_FREQ;
//#endif
	ret = switch_send_conf("/dev/bp_nco", bypass_nco);
	if (ret == EXIT_FAILURE)
		return EXIT_FAILURE;
#if 0
#ifdef BYPASS_NCO
	freq = (int)CENTER_FREQ;
	lo_freq += nco_freq;
#else
	freq = (int)CENTER_FREQ + nco_freq;
	lo_freq -= (long) 10e6;
#endif

#ifndef BYPASS_NCO
	ret = nco_counter_send_conf("/dev/nco", 50000000, freq, 32, 0, 1, 1);
	if (ret == EXIT_FAILURE)
		return EXIT_FAILURE;
#endif

	gettimeofday(&t1, NULL);
	ret = fpgagen_send_conf("/dev/select_cacode", 0, cacode);
	if (ret == EXIT_FAILURE)
		return EXIT_FAILURE;
	gettimeofday(&t2, NULL);
	printf("fpgagen %d\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));
#endif

#if 1
	/* ad936x configuration */
	struct iio_device *dev;
	struct iio_channel *rx0_i, *rx0_q;

	struct iio_device *phy;
	struct iio_context *ctx;
	ctx = iio_create_local_context();

	gettimeofday(&t1, NULL);
	dev = iio_context_find_device(ctx, "cf-ad9361-lpc");
	phy = iio_context_find_device(ctx, "ad9361-phy");
	gettimeofday(&t2, NULL);
	printf("iio_context find %ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	setparams(phy, "out_altvoltage0_RX_LO_frequency", lo_freq);
	gettimeofday(&t2, NULL);
	printf("rx_lo %ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	setparams(phy, "in_voltage_rf_bandwidth", 50000000);//bandwidth);
	setparams(phy, "in_voltage_quadrature_tracking_en", 1);//quadrature);
	setparams(phy, "in_voltage_rf_dc_offset_tracking_en", 1);//rfdc);
	setparams(phy, "in_voltage_bb_dc_offset_tracking_en", 1);//bbdc);
	gettimeofday(&t2, NULL);
	printf("%ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	setparamsStr(phy, "in_voltage0_gain_control_mode", "manual");//gain1_str);
	setparams(phy, "in_voltage0_hardwaregain", 55);

	setparamsStr(phy, "in_voltage0_rf_port_select", "A_BALANCED");
	gettimeofday(&t2, NULL);
	printf("misc config %ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	ret = ad9361_set_bb_rate(phy, SAMPLERATE);
	if (ret) {
		printf("Unable to set BB rate\n");
		return EXIT_FAILURE;
	}
	gettimeofday(&t2, NULL);
	printf("bb_rate %ld\n", (t2.tv_sec-t1.tv_sec)*1000000 + (t2.tv_usec-t1.tv_usec));

	rx0_i = iio_device_find_channel(dev, "voltage0", 0);
	rx0_q = iio_device_find_channel(dev, "voltage1", 0);

	iio_channel_enable(rx0_i);
	iio_channel_enable(rx0_q);
#endif

	return EXIT_SUCCESS;
}
