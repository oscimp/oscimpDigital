CORE_MODULES_DIR=../../modules

mkdir -p /lib/firmware
cp ../bitstreams/prn_fir_wrapper.bit.bin /lib/firmware
DTB_DIR=/sys/kernel/config/device-tree/overlays/fpga
rmdir $DTB_DIR
mkdir $DTB_DIR
cat prn_fir.dtbo > $DTB_DIR/dtbo

insmod ${CORE_MODULES_DIR}/data_to_ram_core.ko
insmod ${CORE_MODULES_DIR}/fir_core.ko
