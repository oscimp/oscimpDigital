set_property ASYNC_REG TRUE \
	[get_cells -hier sync_stage1_*_reg] \
	[get_cells -hier sync_stage2_*_reg]
set_false_path \
	-from [get_cells -hier sync_stage0_*_reg -filter {IS_SEQUENTIAL}] \
	-to [get_cells -hier sync_stage1_*_reg -filter {IS_SEQUENTIAL}]
