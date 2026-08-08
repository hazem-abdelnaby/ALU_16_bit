lappend search_path ICer@IC_EDA /home/ICer/Shared_Folder/ALU/std_cells
lappend search_path ICer@IC_EDA /home/ICer/Shared_Folder/ALU/rtl
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

set target_library [list $TTLIB]

set link_library [list * $TTLIB]

read_file -format verilog "ALU_TOP.v  ARITHMETIC_UNIT.v  CMP_UNIT.v  Decoder.v  LOGIC_UNIT.v  SHIFT_UNIT.v "
link

compile

write_file -format verilog -output ALU_netlist.v
