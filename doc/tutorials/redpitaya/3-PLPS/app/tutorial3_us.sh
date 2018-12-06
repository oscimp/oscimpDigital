CORE_MODULES_DIR=../../modules

mkdir -p /lib/firmware
cp ../bitstreams/tutorial3_wrapper.bit.bin /lib/firmware
DTB_DIR=/sys/kernel/config/device-tree/overlays/fpga
rmdir $DTB_DIR
mkdir $DTB_DIR
cat tutorial3.dtbo > $DTB_DIR/dtbo

insmod ${CORE_MODULES_DIR}/data_to_ram_core.ko
