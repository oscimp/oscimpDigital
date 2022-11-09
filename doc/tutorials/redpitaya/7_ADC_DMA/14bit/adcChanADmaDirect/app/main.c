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
#include <sys/ioctl.h>
#include <math.h>

#define ACQUIS_SIZE 1000000

int main()
{
	int ret = EXIT_FAILURE;;
	int16_t *content;

	FILE *fileout;

	int fd_data = open("/dev/data00", O_RDWR);
	if (fd_data < 0) {
		printf("erreur d'ouverture de /dev/data00\n");
		return EXIT_FAILURE;
	}

	content = (int16_t *) malloc(ACQUIS_SIZE * sizeof(int16_t));
	if (content == NULL) {
		printf("erreur d'allocation\n");
		goto content_malloc_fail;
	}

	fileout = fopen("dump.bin", "w+");
	if (fileout == NULL) {
		printf("erreur d'ouverture de dump.bin\n");
		goto out;
	}

	read(fd_data, content, ACQUIS_SIZE * sizeof(int16_t));
	fwrite(content, sizeof(int16_t), ACQUIS_SIZE, fileout);
	fflush(fileout);
	fclose(fileout);

	ret = EXIT_SUCCESS;
out:
	free(content);
content_malloc_fail:
	close(fd_data);
	return ret;
}
