BASE_NAME=project_gps
USE_STATIC_LIB+=1
LDFLAGS+=-liio -lad9361
CORE_MODULES_LIST = \
	${OSCIMP_DIGITAL_DRIVER}/fpgagen_core/fpgagen_core.ko \
	${OSCIMP_DIGITAL_DRIVER}/data_to_ram_core/data_to_ram_core.ko
include $(OSCIMP_DIGITAL_APP)/Makefile.inc
