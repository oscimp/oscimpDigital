####################################################################################
## Copyright 2018(c) Analog Devices, Inc.
## Auto-generated, do not modify!
####################################################################################

PROJECT_NAME := pluto

M_DEPS += $(ADI_HDL_DIR)/library/xilinx/common/ad_iobuf.v
M_DEPS += $(ADI_HDL_DIR)/library/axi_ad9361/axi_ad9361_delay.tcl

LIB_DEPS += axi_ad9361
LIB_DEPS += axi_dmac
LIB_DEPS += util_fir_dec
LIB_DEPS += util_fir_int

include $(ADI_HDL_DIR)/projects/scripts/project-xilinx.mk
CLEAN_TARGET += image
include $(OSCIMP_DIGITAL_IP)/dfu_frm.mk
