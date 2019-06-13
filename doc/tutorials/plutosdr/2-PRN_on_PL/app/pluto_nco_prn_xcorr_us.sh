CORE_MODULES_DIR=./

DTB_DIR=/sys/kernel/config/device-tree/overlays/fpga
if [ -d $DTB_DIR ]; then
	rmdir $DTB_DIR
fi
mkdir $DTB_DIR
cat pluto_nco_prn_xcorr.dtbo > $DTB_DIR/dtbo

insmod ${CORE_MODULES_DIR}/nco_counter_core.ko
insmod ${CORE_MODULES_DIR}/switch_core.ko
insmod ${CORE_MODULES_DIR}/data_to_ram_core.ko
