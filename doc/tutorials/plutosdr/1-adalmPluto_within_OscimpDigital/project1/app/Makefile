BASE_NAME=project1
USE_STATIC_LIB+=1
LDFLAGS+=-liio
CORE_MODULES_LIST = \
	${OSCIMP_DIGITAL_DRIVER}/data_to_ram_core/data_to_ram_core.ko \
	${OSCIMP_DIGITAL_DRIVER}/nco_counter_core/nco_counter_core.ko
include $(OSCIMP_DIGITAL_APP)/Makefile.inc
