CORE_MODULES_DIR=../../modules

#mkdir -p /lib/firmware
#cp ../bitstreams/pluto2_wrapper.bit.bin /lib/firmware
DTB_DIR=/sys/kernel/config/device-tree/overlays/fpga
if [ -d $DTB_DIR ]; then
	rmdir $DTB_DIR
fi
mkdir $DTB_DIR
cat pluto2.dtbo > $DTB_DIR/dtbo

insmod ${CORE_MODULES_DIR}/data_to_ram_core.ko
insmod ${CORE_MODULES_DIR}/nco_counter_core.ko
