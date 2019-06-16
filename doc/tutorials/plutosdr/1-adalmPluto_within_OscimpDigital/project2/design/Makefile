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

default: $(PROJECT_NAME).runs/impl_1/system_top.bit

include $(ADI_HDL_DIR)/projects/scripts/project-xilinx.mk

$(PROJECT_NAME).runs/impl_1/system_top.bit: $(PROJECT_NAME).xpr

# HL & NC: quiet.mk (just color)

$(PROJECT_NAME).xpr: $(M_DEPS) |lib
	-rm -rf $(CLEAN_TARGET)
	@echo "xpr"
	$(call build, \
		$(VIVADO) system_project.tcl -tclargs xpr, \
		$(PROJECT_NAME)_vivado.log, \
		$(HL)$(PROJECT_NAME)$(NC) project)

$(PROJECT_NAME).runs/impl_1/system_top.bit: $(PROJECT_NAME).xpr
	@echo "bit"
	$(call build, \
		$(VIVADO) system_project.tcl -tclargs bitstream, \
		$(PROJECT_NAME)_vivado.log, \
		$(HL)$(PROJECT_NAME)$(NC) bitstream)

bit: $(PROJECT_NAME).runs/impl_1/system_top.bit
xpr: $(PROJECT_NAME).xpr

CLEAN_TARGET += image
include $(OSCIMP_DIGITAL_IP)/dfu_frm.mk

