BASE_NAME=pluto_nco_prn_xcorr
USE_STATIC_LIB=1
include $(OSCIMP_DIGITAL_APP)/Makefile.inc

install_pluto:
	mkdir -p /tmp/$(BASE_NAME)
	cp *.dtbo *_us* $(OSCIMP_DIGITAL_DRIVER)/nco_counter_core/*.ko \
		$(OSCIMP_DIGITAL_DRIVER)/switch_core/*.ko \
		$(OSCIMP_DIGITAL_DRIVER)/data_to_ram_core/*.ko \
		/tmp/$(BASE_NAME)
	scp -r /tmp/$(BASE_NAME) root@192.168.2.1:/tmp/
dl_bin:
	scp root@pluto.local:/tmp/data.bin /tmp/
