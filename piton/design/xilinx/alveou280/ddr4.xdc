#--------------------------------------------
# Timing constraints for CDC in DDR SDRAM user interface, particularly in NOC - DDR AXI transition (fifo, reset) 
set sys_ck [get_clocks -of_objects [get_pins -hierarchical meep_shell/sys_clk]]
set mem_ck [get_clocks -of_objects [get_pins -hierarchical meep_shell/mem_clk]]
# set_false_path -from $xxx_clk -to $yyy_clk
# controlling resync paths to be less than source clock period
# (-datapath_only to exclude clock paths)
set_max_delay -datapath_only -from $mem_ck -to $sys_ck [expr [get_property -min period $mem_ck] * 0.9]
set_max_delay -datapath_only -from $sys_ck -to $mem_ck [expr [get_property -min period $sys_ck] * 0.9]
#--------------------------------------------

#--------------------------------------------
## DDR4 RDIMM Controller 0, 72-bit Data Interface, x4 Componets, Single Rank
##     <<<NOTE>>> DQS Clock strobes have been swapped from JEDEC standard to match Xilinx MIG Clock order:
##                JEDEC Order   DQS ->  0  9  1 10  2 11  3 12  4 13  5 14  6 15  7 16  8 17
##                Xil MIG Order DQS ->  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
##
set_property PACKAGE_PIN BE51               [ get_ports  {ddr_dq[42]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ42"    - IO_L24N_T3U_N11_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[42]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ42"    - IO_L24N_T3U_N11_66
set_property PACKAGE_PIN BD51               [ get_ports  {ddr_dq[43]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ43"    - IO_L24P_T3U_N10_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[43]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ43"    - IO_L24P_T3U_N10_66
set_property PACKAGE_PIN BE50               [ get_ports  {ddr_dq[40]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ40"    - IO_L23N_T3U_N9_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[40]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ40"    - IO_L23N_T3U_N9_66
set_property PACKAGE_PIN BE49               [ get_ports  {ddr_dq[41]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ41"    - IO_L23P_T3U_N8_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[41]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ41"    - IO_L23P_T3U_N8_66
set_property PACKAGE_PIN BF48               [ get_ports  {ddr_dqs_c[10]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C5"  - IO_L22N_T3U_N7_DBC_AD0N_66
set_property IOSTANDARD  DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[10]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C5"  - IO_L22N_T3U_N7_DBC_AD0N_66
set_property PACKAGE_PIN BF47               [ get_ports  {ddr_dqs_t[10]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T5"  - IO_L22P_T3U_N6_DBC_AD0P_66
set_property IOSTANDARD  DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[10]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T5"  - IO_L22P_T3U_N6_DBC_AD0P_66
set_property PACKAGE_PIN BF52               [ get_ports  {ddr_dq[44]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ44"    - IO_L21N_T3L_N5_AD8N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[44]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ44"    - IO_L21N_T3L_N5_AD8N_66
set_property PACKAGE_PIN BF51               [ get_ports  {ddr_dq[45]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ45"    - IO_L21P_T3L_N4_AD8P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[45]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ45"    - IO_L21P_T3L_N4_AD8P_66
set_property PACKAGE_PIN BG50               [ get_ports  {ddr_dq[46]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ46"    - IO_L20N_T3L_N3_AD1N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[46]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ46"    - IO_L20N_T3L_N3_AD1N_66
set_property PACKAGE_PIN BF50               [ get_ports  {ddr_dq[47]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ47"    - IO_L20P_T3L_N2_AD1P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[47]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ47"    - IO_L20P_T3L_N2_AD1P_66
set_property PACKAGE_PIN BG49               [ get_ports  {ddr_dqs_c[11]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C14" - IO_L19N_T3L_N1_DBC_AD9N_66
set_property IOSTANDARD  DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[11]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C14" - IO_L19N_T3L_N1_DBC_AD9N_66
set_property PACKAGE_PIN BG48               [ get_ports  {ddr_dqs_t[11]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T14" - IO_L19P_T3L_N0_DBC_AD9P_66
set_property IOSTANDARD  DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[11]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T14" - IO_L19P_T3L_N0_DBC_AD9P_66
#set_property PACKAGE_PIN BG47               #N/A                                  ;# Bank  66 VCCO - VCC1V2 Net "Not Connected"   - IO_T3U_N12_66
#set_property IOSTANDARD  LVCMOS18           #N/A                                  ;# Bank  66 VCCO - VCC1V2 Net "Not Connected"   - IO_T3U_N12_66
#set_property PACKAGE_PIN BF53               #N/A                                  ;# Bank  66 VCCO - VCC1V2 Net "Not Connected"   - IO_T2U_N12_66
#set_property IOSTANDARD  LVCMOS18           #N/A                                  ;# Bank  66 VCCO - VCC1V2 Net "Not Connected"   - IO_T2U_N12_66
set_property PACKAGE_PIN BE54               [ get_ports  {ddr_dq[67]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ67"    - IO_L18N_T2U_N11_AD2N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[67]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ67"    - IO_L18N_T2U_N11_AD2N_66
set_property PACKAGE_PIN BE53               [ get_ports  {ddr_dq[66]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ66"    - IO_L18P_T2U_N10_AD2P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[66]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ66"    - IO_L18P_T2U_N10_AD2P_66
set_property PACKAGE_PIN BG54               [ get_ports  {ddr_dq[64]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ64"    - IO_L17N_T2U_N9_AD10N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[64]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ64"    - IO_L17N_T2U_N9_AD10N_66
set_property PACKAGE_PIN BG53               [ get_ports  {ddr_dq[65]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ65"    - IO_L17P_T2U_N8_AD10P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[65]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ65"    - IO_L17P_T2U_N8_AD10P_66
set_property PACKAGE_PIN BJ54               [ get_ports  {ddr_dqs_c[16]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C8"  - IO_L16N_T2U_N7_QBC_AD3N_66
set_property IOSTANDARD  DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[16]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C8"  - IO_L16N_T2U_N7_QBC_AD3N_66
set_property PACKAGE_PIN BH54               [ get_ports  {ddr_dqs_t[16]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T8"  - IO_L16P_T2U_N6_QBC_AD3P_66
set_property IOSTANDARD  DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[16]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T8"  - IO_L16P_T2U_N6_QBC_AD3P_66
set_property PACKAGE_PIN BK54               [ get_ports  {ddr_dq[70]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ70"    - IO_L15N_T2L_N5_AD11N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[70]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ70"    - IO_L15N_T2L_N5_AD11N_66
set_property PACKAGE_PIN BK53               [ get_ports  {ddr_dq[71]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ71"    - IO_L15P_T2L_N4_AD11P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[71]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ71"    - IO_L15P_T2L_N4_AD11P_66
set_property PACKAGE_PIN BH52               [ get_ports  {ddr_dq[68]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ68"    - IO_L14N_T2L_N3_GC_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[68]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ68"    - IO_L14N_T2L_N3_GC_66
set_property PACKAGE_PIN BG52               [ get_ports  {ddr_dq[69]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ69"    - IO_L14P_T2L_N2_GC_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[69]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ69"    - IO_L14P_T2L_N2_GC_66
set_property PACKAGE_PIN BJ53               [ get_ports  {ddr_dqs_c[17]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C17" - IO_L13N_T2L_N1_GC_QBC_66
set_property IOSTANDARD DIFF_POD12_DCI      [ get_ports  {ddr_dqs_c[17]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C17" - IO_L13N_T2L_N1_GC_QBC_66
set_property PACKAGE_PIN BJ52               [ get_ports  {ddr_dqs_t[17]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T17" - IO_L13P_T2L_N0_GC_QBC_66
set_property IOSTANDARD DIFF_POD12_DCI      [ get_ports  {ddr_dqs_t[17]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T17" - IO_L13P_T2L_N0_GC_QBC_66
set_property PACKAGE_PIN BH50               [ get_ports  {ddr_dq[48]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ48"    - IO_L12N_T1U_N11_GC_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[48]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ48"    - IO_L12N_T1U_N11_GC_66
set_property PACKAGE_PIN BH49               [ get_ports  {ddr_dq[51]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ51"    - IO_L12P_T1U_N10_GC_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[51]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ51"    - IO_L12P_T1U_N10_GC_66
set_property PACKAGE_PIN BJ51               [ get_ports  {ddr_dq[49]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ49"    - IO_L11N_T1U_N9_GC_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[49]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ49"    - IO_L11N_T1U_N9_GC_66
set_property PACKAGE_PIN BH51               [ get_ports  {ddr_dq[50]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ50"    - IO_L11P_T1U_N8_GC_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[50]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ50"    - IO_L11P_T1U_N8_GC_66
set_property PACKAGE_PIN BJ47               [ get_ports  {ddr_dqs_c[12]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C6"  - IO_L10N_T1U_N7_QBC_AD4N_66
set_property IOSTANDARD DIFF_POD12_DCI      [ get_ports  {ddr_dqs_c[12]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C6"  - IO_L10N_T1U_N7_QBC_AD4N_66
set_property PACKAGE_PIN BH47               [ get_ports  {ddr_dqs_t[12]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T6"  - IO_L10P_T1U_N6_QBC_AD4P_66
set_property IOSTANDARD DIFF_POD12_DCI      [ get_ports  {ddr_dqs_t[12]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T6"  - IO_L10P_T1U_N6_QBC_AD4P_66
set_property PACKAGE_PIN BJ49               [ get_ports  {ddr_dq[54]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ54"    - IO_L9N_T1L_N5_AD12N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[54]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ54"    - IO_L9N_T1L_N5_AD12N_66
set_property PACKAGE_PIN BJ48               [ get_ports  {ddr_dq[55]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ55"    - IO_L9P_T1L_N4_AD12P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[55]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ55"    - IO_L9P_T1L_N4_AD12P_66
set_property PACKAGE_PIN BK51               [ get_ports  {ddr_dq[53]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ53"    - IO_L8N_T1L_N3_AD5N_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[53]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ53"    - IO_L8N_T1L_N3_AD5N_66
set_property PACKAGE_PIN BK50               [ get_ports  {ddr_dq[52]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ52"    - IO_L8P_T1L_N2_AD5P_66
set_property IOSTANDARD  POD12_DCI          [ get_ports  {ddr_dq[52]} ]        ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ52"    - IO_L8P_T1L_N2_AD5P_66
set_property PACKAGE_PIN BK49               [ get_ports  {ddr_dqs_c[13]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C15" - IO_L7N_T1L_N1_QBC_AD13N_66
set_property IOSTANDARD DIFF_POD12_DCI      [ get_ports  {ddr_dqs_c[13]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C15" - IO_L7N_T1L_N1_QBC_AD13N_66
set_property PACKAGE_PIN BK48               [ get_ports  {ddr_dqs_t[13]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T15" - IO_L7P_T1L_N0_QBC_AD13P_66
set_property IOSTANDARD DIFF_POD12_DCI      [ get_ports  {ddr_dqs_t[13]} ]     ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T15" - IO_L7P_T1L_N0_QBC_AD13P_66
#set_property PACKAGE_PIN BL48              #N/A                                   ;# Bank  66 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_66
#set_property IOSTANDARD  LVCMOS18          #N/A                                   ;# Bank  66 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_66
#set_property PACKAGE_PIN BL50              #N/A                                   ;# Bank  66 VCCO - VCC1V2 Net "VRP_61"          - IO_T0U_N12_VRP_66
#set_property IOSTANDARD  LVCMOS18          #N/A                                   ;# Bank  66 VCCO - VCC1V2 Net "VRP_61"          - IO_T0U_N12_VRP_66
set_property PACKAGE_PIN BL53              [ get_ports  {ddr_dq[33]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ33"    - IO_L6N_T0U_N11_AD6N_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[33]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ33"    - IO_L6N_T0U_N11_AD6N_66
set_property PACKAGE_PIN BL52              [ get_ports  {ddr_dq[34]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ34"    - IO_L6P_T0U_N10_AD6P_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[34]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ34"    - IO_L6P_T0U_N10_AD6P_66
set_property PACKAGE_PIN BM52              [ get_ports  {ddr_dq[32]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ32"    - IO_L5N_T0U_N9_AD14N_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[32]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ32"    - IO_L5N_T0U_N9_AD14N_66
set_property PACKAGE_PIN BL51              [ get_ports  {ddr_dq[35]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ35"    - IO_L5P_T0U_N8_AD14P_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[35]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ35"    - IO_L5P_T0U_N8_AD14P_66
set_property PACKAGE_PIN BM50              [ get_ports  {ddr_dqs_c[8]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C4"  - IO_L4N_T0U_N7_DBC_AD7N_66
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[8]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C4"  - IO_L4N_T0U_N7_DBC_AD7N_66
set_property PACKAGE_PIN BM49              [ get_ports  {ddr_dqs_t[8]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T4"  - IO_L4P_T0U_N6_DBC_AD7P_66
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[8]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T4"  - IO_L4P_T0U_N6_DBC_AD7P_66
set_property PACKAGE_PIN BN49              [ get_ports  {ddr_dq[38]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ38"    - IO_L3N_T0L_N5_AD15N_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[38]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ38"    - IO_L3N_T0L_N5_AD15N_66
set_property PACKAGE_PIN BM48              [ get_ports  {ddr_dq[39]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ39"    - IO_L3P_T0L_N4_AD15P_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[39]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ39"    - IO_L3P_T0L_N4_AD15P_66
set_property PACKAGE_PIN BN51              [ get_ports  {ddr_dq[37]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ37"    - IO_L2N_T0L_N3_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[37]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ37"    - IO_L2N_T0L_N3_66
set_property PACKAGE_PIN BN50              [ get_ports  {ddr_dq[36]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ36"    - IO_L2P_T0L_N2_66
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[36]} ]         ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQ36"    - IO_L2P_T0L_N2_66
set_property PACKAGE_PIN BP49              [ get_ports  {ddr_dqs_c[9]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C13" - IO_L1N_T0L_N1_DBC_66
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[9]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_C13" - IO_L1N_T0L_N1_DBC_66
set_property PACKAGE_PIN BP48              [ get_ports  {ddr_dqs_t[9]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T13" - IO_L1P_T0L_N0_DBC_66
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[9]} ]       ;# Bank  66 VCCO - VCC1V2 Net "DDR4_C0_DQS_T13" - IO_L1P_T0L_N0_DBC_66
##
##  DDR4 RDIMM Control, Command and Address
##       The DIMM interfaces have connectivity to support UDIMM, RDIMM, LRDIMM and 3DS devices.
##       The below constraints are configured to support DDR4, Single Rank, RDIMMs with x4 Compnent Connectivity and the unused pins are commented out.
##       The System Clock for the MEMORY interface are comemented out and moved to the Clock section of the XDC file
##
set_property PACKAGE_PIN BE44              [ get_ports  {ddr_addr[13]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR13"   - IO_L24N_T3U_N11_DOUT_CSO_B_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[13]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR13"   - IO_L24N_T3U_N11_DOUT_CSO_B_65
set_property PACKAGE_PIN BE43              [ get_ports  {ddr_addr[14]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR14"   - IO_L24P_T3U_N10_EMCCLK_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[14]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR14"   - IO_L24P_T3U_N10_EMCCLK_65
#set_property PACKAGE_PIN BD42              [ get_ports  {ddr_cs_n[2]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B2"   - IO_L23N_T3U_N9_PERSTN1_I2C_SDA_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_cs_n[2]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B2"   - IO_L23N_T3U_N9_PERSTN1_I2C_SDA_65
#set_property PACKAGE_PIN BC42              [ get_ports  {ddr_alert_n} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ALERT_B" - IO_L23P_T3U_N8_I2C_SCLK_65
#set_property IOSTANDARD  LVCMOS12          [ get_ports  {ddr_alert_n} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ALERT_B" - IO_L23P_T3U_N8_I2C_SCLK_65
#set_property PACKAGE_PIN BE46              [ get_ports  {ddr_odt[1]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ODT1"    - IO_L22N_T3U_N7_DBC_AD0N_D05_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_odt[1]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ODT1"    - IO_L22N_T3U_N7_DBC_AD0N_D05_65
#set_property PACKAGE_PIN BE45              [ get_ports  {ddr_cs_n[1]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B1"   - IO_L22P_T3U_N6_DBC_AD0P_D04_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_cs_n[1]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B1"   - IO_L22P_T3U_N6_DBC_AD0P_D04_65
set_property PACKAGE_PIN BF43              [ get_ports  {ddr_addr[5]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR5"    - IO_L21N_T3L_N5_AD8N_D07_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[5]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR5"    - IO_L21N_T3L_N5_AD8N_D07_65
set_property PACKAGE_PIN BF42              [ get_ports  {ddr_addr[3]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR3"    - IO_L21P_T3L_N4_AD8P_D06_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[3]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR3"    - IO_L21P_T3L_N4_AD8P_D06_65
set_property PACKAGE_PIN BF46              [ get_ports  {ddr_addr[0]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR0"    - IO_L20N_T3L_N3_AD1N_D09_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[0]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR0"    - IO_L20N_T3L_N3_AD1N_D09_65
set_property PACKAGE_PIN BF45              [ get_ports  {ddr_parity} ]            ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_PAR"     - IO_L20P_T3L_N2_AD1P_D08_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_parity} ]            ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_PAR"     - IO_L20P_T3L_N2_AD1P_D08_65
set_property PACKAGE_PIN BE41              [ get_ports  {ddr_bg[1]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BG1"     - IO_L19N_T3L_N1_DBC_AD9N_D11_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_bg[1]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BG1"     - IO_L19N_T3L_N1_DBC_AD9N_D11_65
set_property PACKAGE_PIN BD41              [ get_ports  {ddr_addr[11]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR11"   - IO_L19P_T3L_N0_DBC_AD9P_D10_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[11]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR11"   - IO_L19P_T3L_N0_DBC_AD9P_D10_65
set_property PACKAGE_PIN BF41              [ get_ports  {ddr_bg[0]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BG0"     - IO_T3U_N12_PERSTN0_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_bg[0]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BG0"     - IO_T3U_N12_PERSTN0_65
set_property PACKAGE_PIN BH41              [ get_ports  {ddr_act_n} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ACT_B"   - IO_T2U_N12_CSI_ADV_B_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_act_n} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ACT_B"   - IO_T2U_N12_CSI_ADV_B_65
set_property PACKAGE_PIN BG45              [ get_ports  {ddr_addr[10]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR10"   - IO_L18N_T2U_N11_AD2N_D13_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[10]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR10"   - IO_L18N_T2U_N11_AD2N_D13_65
set_property PACKAGE_PIN BG44              [ get_ports  {ddr_odt[0]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ODT0"    - IO_L18P_T2U_N10_AD2P_D12_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_odt[0]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ODT0"    - IO_L18P_T2U_N10_AD2P_D12_65
set_property PACKAGE_PIN BG43              [ get_ports  {ddr_addr[1]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR1"    - IO_L17N_T2U_N9_AD10N_D15_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[1]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR1"    - IO_L17N_T2U_N9_AD10N_D15_65
set_property PACKAGE_PIN BG42              [ get_ports  {ddr_addr[6]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR6"    - IO_L17P_T2U_N8_AD10P_D14_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[6]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR6"    - IO_L17P_T2U_N8_AD10P_D14_65
set_property PACKAGE_PIN BJ46              [ get_ports  {ddr_ck_c[0]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_C0"   - IO_L16N_T2U_N7_QBC_AD3N_A01_D17_65
set_property IOSTANDARD  DIFF_SSTL12_DCI   [ get_ports  {ddr_ck_c[0]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_C0"   - IO_L16N_T2U_N7_QBC_AD3N_A01_D17_65
set_property PACKAGE_PIN BH46              [ get_ports  {ddr_ck_t[0]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_T0"   - IO_L16P_T2U_N6_QBC_AD3P_A00_D16_65
set_property IOSTANDARD  DIFF_SSTL12_DCI   [ get_ports  {ddr_ck_t[0]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_T0"   - IO_L16P_T2U_N6_QBC_AD3P_A00_D16_65
#set_property PACKAGE_PIN BK41              [ get_ports  {ddr_ck_c[1]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_C1"   - IO_L15N_T2L_N5_AD11N_A03_D19_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_ck_c[1]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_C1"   - IO_L15N_T2L_N5_AD11N_A03_D19_65
#set_property PACKAGE_PIN BJ41              [ get_ports  {ddr_ck_t[1]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_T1"   - IO_L15P_T2L_N4_AD11P_A02_D18_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_ck_t[1]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CK_T1"   - IO_L15P_T2L_N4_AD11P_A02_D18_65
set_property PACKAGE_PIN BH45              [ get_ports  {ddr_ba[0]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BA0"     - IO_L14N_T2L_N3_GC_A05_D21_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_ba[0]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BA0"     - IO_L14N_T2L_N3_GC_A05_D21_65
set_property PACKAGE_PIN BH44              [ get_ports  {ddr_addr[16]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR16"   - IO_L14P_T2L_N2_GC_A04_D20_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[16]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR16"   - IO_L14P_T2L_N2_GC_A04_D20_65
#set_property PACKAGE_PIN BJ42              [ get_ports  {ddr_cke[1]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CKE1"    - IO_L13N_T2L_N1_GC_QBC_A07_D23_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_cke[1]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CKE1"    - IO_L13N_T2L_N1_GC_QBC_A07_D23_65
set_property PACKAGE_PIN BH42              [ get_ports  {ddr_cke[0]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CKE0"    - IO_L13P_T2L_N0_GC_QBC_A06_D22_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_cke[0]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CKE0"    - IO_L13P_T2L_N0_GC_QBC_A06_D22_65
## Clocks at top of XDC
#set_property PACKAGE_PIN BJ44              [ get_ports  {sys_clk0_n} ]             ;# Bank  65 VCCO - VCC1V2 Net "SYSCLK0_N"       - IO_L12N_T1U_N11_GC_A09_D25_65
#set_property IOSTANDARD  LVDS              [ get_ports  {sys_clk0_n} ]             ;# Bank  65 VCCO - VCC1V2 Net "SYSCLK0_N"       - IO_L12N_T1U_N11_GC_A09_D25_65
#set_property PACKAGE_PIN BJ43              [ get_ports  {sys_clk0_p} ]             ;# Bank  65 VCCO - VCC1V2 Net "SYSCLK0_P"       - IO_L12P_T1U_N10_GC_A08_D24_65
#set_property IOSTANDARD  LVDS              [ get_ports  {sys_clk0_p} ]             ;# Bank  65 VCCO - VCC1V2 Net "SYSCLK0_P"       - IO_L12P_T1U_N10_GC_A08_D24_65
###  <<<<NOTE>>>> No external BIAS on AC coupled LVDS clock inputs to 1.2V bank so this constraint is added to recenter LVDS signal on 1.2V IO standard.
#set_property DQS_BIAS    TRUE              [ get_ports  {sys_clk0_p} ]             ;# Bank  65 VCCO - VCC1V2 Net "SYSCLK0_P"       - IO_L12P_T1U_N10_GC_A08_D24_65
#set_property PACKAGE_PIN BK44              #N/A                                    ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B3"   - IO_L11N_T1U_N9_GC_A11_D27_65
#set_property IOSTANDARD  LVCMOS18          #N/A                                    ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B3"   - IO_L11N_T1U_N9_GC_A11_D27_65
set_property PACKAGE_PIN BK43              [ get_ports  {ddr_addr[8]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR8"    - IO_L11P_T1U_N8_GC_A10_D26_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[8]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR8"    - IO_L11P_T1U_N8_GC_A10_D26_65
set_property PACKAGE_PIN BK46              [ get_ports  {ddr_cs_n[0]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B0"   - IO_L10N_T1U_N7_QBC_AD4N_A13_D29_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_cs_n[0]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_CS_B0"   - IO_L10N_T1U_N7_QBC_AD4N_A13_D29_65
set_property PACKAGE_PIN BK45              [ get_ports  {ddr_addr[2]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR2"    - IO_L10P_T1U_N6_QBC_AD4P_A12_D28_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[2]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR2"    - IO_L10P_T1U_N6_QBC_AD4P_A12_D28_65
set_property PACKAGE_PIN BL43              [ get_ports  {ddr_addr[7]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR7"    - IO_L9N_T1L_N5_AD12N_A15_D31_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[7]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR7"    - IO_L9N_T1L_N5_AD12N_A15_D31_65
set_property PACKAGE_PIN BL42              [ get_ports  {ddr_addr[12]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR12"   - IO_L9P_T1L_N4_AD12P_A14_D30_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[12]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR12"   - IO_L9P_T1L_N4_AD12P_A14_D30_65
set_property PACKAGE_PIN BL46              [ get_ports  {ddr_addr[15]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR15"   - IO_L8N_T1L_N3_AD5N_A17_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[15]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR15"   - IO_L8N_T1L_N3_AD5N_A17_65
set_property PACKAGE_PIN BL45              [ get_ports  {ddr_addr[4]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR4"    - IO_L8P_T1L_N2_AD5P_A16_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[4]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR4"    - IO_L8P_T1L_N2_AD5P_A16_65
set_property PACKAGE_PIN BM47              [ get_ports  {ddr_ba[1]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BA1"     - IO_L7N_T1L_N1_QBC_AD13N_A19_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_ba[1]} ]          ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_BA1"     - IO_L7N_T1L_N1_QBC_AD13N_A19_65
#set_property PACKAGE_PIN BL47              [ get_ports  {ddr_addr[17]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR17"   - IO_L7P_T1L_N0_QBC_AD13P_A18_65
#set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[17]} ]        ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR17"   - IO_L7P_T1L_N0_QBC_AD13P_A18_65
set_property PACKAGE_PIN BM42              [ get_ports  {ddr_addr[9]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR9"    - IO_T1U_N12_SMBALERT_65
set_property IOSTANDARD  SSTL12_DCI        [ get_ports  {ddr_addr[9]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_ADR9"    - IO_T1U_N12_SMBALERT_65
set_property PACKAGE_PIN BN45              [ get_ports  {ddr_dq[57]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ57"    - IO_L6N_T0U_N11_AD6N_A21_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[57]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ57"    - IO_L6N_T0U_N11_AD6N_A21_65
set_property PACKAGE_PIN BM45              [ get_ports  {ddr_dq[59]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ59"    - IO_L6P_T0U_N10_AD6P_A20_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[59]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ59"    - IO_L6P_T0U_N10_AD6P_A20_65
set_property PACKAGE_PIN BN44              [ get_ports  {ddr_dq[56]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ56"    - IO_L5N_T0U_N9_AD14N_A23_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[56]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ56"    - IO_L5N_T0U_N9_AD14N_A23_65
set_property PACKAGE_PIN BM44              [ get_ports  {ddr_dq[58]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ58"    - IO_L5P_T0U_N8_AD14P_A22_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[58]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ58"    - IO_L5P_T0U_N8_AD14P_A22_65
set_property PACKAGE_PIN BP46              [ get_ports  {ddr_dqs_c[14]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_C7"  - IO_L4N_T0U_N7_DBC_AD7N_A25_65
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[14]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_C7"  - IO_L4N_T0U_N7_DBC_AD7N_A25_65
set_property PACKAGE_PIN BN46              [ get_ports  {ddr_dqs_t[14]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_T7"  - IO_L4P_T0U_N6_DBC_AD7P_A24_65
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[14]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_T7"  - IO_L4P_T0U_N6_DBC_AD7P_A24_65
set_property PACKAGE_PIN BP44              [ get_ports  {ddr_dq[61]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ61"    - IO_L3N_T0L_N5_AD15N_A27_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[61]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ61"    - IO_L3N_T0L_N5_AD15N_A27_65
set_property PACKAGE_PIN BP43              [ get_ports  {ddr_dq[60]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ60"    - IO_L3P_T0L_N4_AD15P_A26_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[60]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ60"    - IO_L3P_T0L_N4_AD15P_A26_65
set_property PACKAGE_PIN BP47              [ get_ports  {ddr_dq[63]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ63"    - IO_L2N_T0L_N3_FWE_FCS2_B_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[63]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ63"    - IO_L2N_T0L_N3_FWE_FCS2_B_65
set_property PACKAGE_PIN BN47              [ get_ports  {ddr_dq[62]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ62"    - IO_L2P_T0L_N2_FOE_B_65
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[62]} ]         ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQ62"    - IO_L2P_T0L_N2_FOE_B_65
set_property PACKAGE_PIN BP42              [ get_ports  {ddr_dqs_c[15]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_C16" - IO_L1N_T0L_N1_DBC_RS1_65
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[15]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_C16" - IO_L1N_T0L_N1_DBC_RS1_65
set_property PACKAGE_PIN BN42              [ get_ports  {ddr_dqs_t[15]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_T16" - IO_L1P_T0L_N0_DBC_RS0_65
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[15]} ]      ;# Bank  65 VCCO - VCC1V2 Net "DDR4_C0_DQS_T16" - IO_L1P_T0L_N0_DBC_RS0_65
set_property PACKAGE_PIN BJ31              [ get_ports  {ddr_dq[8]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ8"     - IO_L24N_T3U_N11_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[8]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ8"     - IO_L24N_T3U_N11_64
set_property PACKAGE_PIN BH31              [ get_ports  {ddr_dq[9]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ9"     - IO_L24P_T3U_N10_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[9]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ9"     - IO_L24P_T3U_N10_64
set_property PACKAGE_PIN BF33              [ get_ports  {ddr_dq[11]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ11"    - IO_L23N_T3U_N9_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[11]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ11"    - IO_L23N_T3U_N9_64
set_property PACKAGE_PIN BF32              [ get_ports  {ddr_dq[10]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ10"    - IO_L23P_T3U_N8_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[10]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ10"    - IO_L23P_T3U_N8_64
set_property PACKAGE_PIN BK30              [ get_ports  {ddr_dqs_c[2]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C1"  - IO_L22N_T3U_N7_DBC_AD0N_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[2]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C1"  - IO_L22N_T3U_N7_DBC_AD0N_64
set_property PACKAGE_PIN BJ29              [ get_ports  {ddr_dqs_t[2]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T1"  - IO_L22P_T3U_N6_DBC_AD0P_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[2]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T1"  - IO_L22P_T3U_N6_DBC_AD0P_64
set_property PACKAGE_PIN BG32              [ get_ports  {ddr_dq[15]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ15"    - IO_L21N_T3L_N5_AD8N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[15]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ15"    - IO_L21N_T3L_N5_AD8N_64
set_property PACKAGE_PIN BF31              [ get_ports  {ddr_dq[14]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ14"    - IO_L21P_T3L_N4_AD8P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[14]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ14"    - IO_L21P_T3L_N4_AD8P_64
set_property PACKAGE_PIN BH30              [ get_ports  {ddr_dq[13]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ13"    - IO_L20N_T3L_N3_AD1N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[13]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ13"    - IO_L20N_T3L_N3_AD1N_64
set_property PACKAGE_PIN BH29              [ get_ports  {ddr_dq[12]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ12"    - IO_L20P_T3L_N2_AD1P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[12]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ12"    - IO_L20P_T3L_N2_AD1P_64
set_property PACKAGE_PIN BG30              [ get_ports  {ddr_dqs_c[3]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C10" - IO_L19N_T3L_N1_DBC_AD9N_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[3]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C10" - IO_L19N_T3L_N1_DBC_AD9N_64
set_property PACKAGE_PIN BG29              [ get_ports  {ddr_dqs_t[3]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T10" - IO_L19P_T3L_N0_DBC_AD9P_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[3]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T10" - IO_L19P_T3L_N0_DBC_AD9P_64
#set_property PACKAGE_PIN BK29              [ get_ports  {ddr_event_n} ]        ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_EVENT_B" - IO_T3U_N12_64
#set_property IOSTANDARD  LVCMOS12          [ get_ports  {ddr_event_n} ]        ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_EVENT_B" - IO_T3U_N12_64
set_property PACKAGE_PIN BG33              [ get_ports  {ddr_reset_n} ]        ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_RESET_N" - IO_T2U_N12_64
set_property IOSTANDARD  LVCMOS12          [ get_ports  {ddr_reset_n} ]        ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_RESET_N" - IO_T2U_N12_64
set_property PACKAGE_PIN BH35              [ get_ports  {ddr_dq[25]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ25"    - IO_L18N_T2U_N11_AD2N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[25]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ25"    - IO_L18N_T2U_N11_AD2N_64
set_property PACKAGE_PIN BH34              [ get_ports  {ddr_dq[24]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ24"    - IO_L18P_T2U_N10_AD2P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[24]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ24"    - IO_L18P_T2U_N10_AD2P_64
set_property PACKAGE_PIN BF36              [ get_ports  {ddr_dq[27]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ27"    - IO_L17N_T2U_N9_AD10N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[27]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ27"    - IO_L17N_T2U_N9_AD10N_64
set_property PACKAGE_PIN BF35              [ get_ports  {ddr_dq[26]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ26"    - IO_L17P_T2U_N8_AD10P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[26]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ26"    - IO_L17P_T2U_N8_AD10P_64
set_property PACKAGE_PIN BK35              [ get_ports  {ddr_dqs_c[6]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C3"  - IO_L16N_T2U_N7_QBC_AD3N_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[6]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C3"  - IO_L16N_T2U_N7_QBC_AD3N_64
set_property PACKAGE_PIN BK34              [ get_ports  {ddr_dqs_t[6]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T3"  - IO_L16P_T2U_N6_QBC_AD3P_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[6]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T3"  - IO_L16P_T2U_N6_QBC_AD3P_64
set_property PACKAGE_PIN BG35              [ get_ports  {ddr_dq[31]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ31"    - IO_L15N_T2L_N5_AD11N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[31]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ31"    - IO_L15N_T2L_N5_AD11N_64
set_property PACKAGE_PIN BG34              [ get_ports  {ddr_dq[30]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ30"    - IO_L15P_T2L_N4_AD11P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[30]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ30"    - IO_L15P_T2L_N4_AD11P_64
set_property PACKAGE_PIN BJ34              [ get_ports  {ddr_dq[29]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ29"    - IO_L14N_T2L_N3_GC_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[29]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ29"    - IO_L14N_T2L_N3_GC_64
set_property PACKAGE_PIN BJ33              [ get_ports  {ddr_dq[28]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ28"    - IO_L14P_T2L_N2_GC_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[28]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ28"    - IO_L14P_T2L_N2_GC_64
set_property PACKAGE_PIN BJ32              [ get_ports  {ddr_dqs_c[7]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C12" - IO_L13N_T2L_N1_GC_QBC_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[7]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C12" - IO_L13N_T2L_N1_GC_QBC_64
set_property PACKAGE_PIN BH32              [ get_ports  {ddr_dqs_t[7]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T12" - IO_L13P_T2L_N0_GC_QBC_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[7]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T12" - IO_L13P_T2L_N0_GC_QBC_64
set_property PACKAGE_PIN BL33              [ get_ports  {ddr_dq[19]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ19"    - IO_L12N_T1U_N11_GC_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[19]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ19"    - IO_L12N_T1U_N11_GC_64
set_property PACKAGE_PIN BK33              [ get_ports  {ddr_dq[18]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ18"    - IO_L12P_T1U_N10_GC_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[18]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ18"    - IO_L12P_T1U_N10_GC_64
set_property PACKAGE_PIN BL31              [ get_ports  {ddr_dq[17]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ17"    - IO_L11N_T1U_N9_GC_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[17]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ17"    - IO_L11N_T1U_N9_GC_64
set_property PACKAGE_PIN BK31              [ get_ports  {ddr_dq[16]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ16"    - IO_L11P_T1U_N8_GC_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[16]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ16"    - IO_L11P_T1U_N8_GC_64
set_property PACKAGE_PIN BM35              [ get_ports  {ddr_dqs_c[4]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C2"  - IO_L10N_T1U_N7_QBC_AD4N_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[4]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C2"  - IO_L10N_T1U_N7_QBC_AD4N_64
set_property PACKAGE_PIN BL35              [ get_ports  {ddr_dqs_t[4]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T2"  - IO_L10P_T1U_N6_QBC_AD4P_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[4]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T2"  - IO_L10P_T1U_N6_QBC_AD4P_64
set_property PACKAGE_PIN BM33              [ get_ports  {ddr_dq[21]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ21"    - IO_L9N_T1L_N5_AD12N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[21]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ21"    - IO_L9N_T1L_N5_AD12N_64
set_property PACKAGE_PIN BL32              [ get_ports  {ddr_dq[20]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ20"    - IO_L9P_T1L_N4_AD12P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[20]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ20"    - IO_L9P_T1L_N4_AD12P_64
set_property PACKAGE_PIN BP34              [ get_ports  {ddr_dq[23]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ23"    - IO_L8N_T1L_N3_AD5N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[23]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ23"    - IO_L8N_T1L_N3_AD5N_64
set_property PACKAGE_PIN BN34              [ get_ports  {ddr_dq[22]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ22"    - IO_L8P_T1L_N2_AD5P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[22]} ]         ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ22"    - IO_L8P_T1L_N2_AD5P_64
set_property PACKAGE_PIN BN35              [ get_ports  {ddr_dqs_c[5]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C11" - IO_L7N_T1L_N1_QBC_AD13N_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[5]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C11" - IO_L7N_T1L_N1_QBC_AD13N_64
set_property PACKAGE_PIN BM34              [ get_ports  {ddr_dqs_t[5]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T11" - IO_L7P_T1L_N0_QBC_AD13P_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[5]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T11" - IO_L7P_T1L_N0_QBC_AD13P_64
#set_property PACKAGE_PIN BP33              #N/A                                    ;# Bank  64 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_64
#set_property IOSTANDARD  LVCMOS12          #N/A                                    ;# Bank  64 VCCO - VCC1V2 Net "Not Connected"   - IO_T1U_N12_64
set_property PACKAGE_PIN BP32              [ get_ports  {ddr_dq[1]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ1"     - IO_L6N_T0U_N11_AD6N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[1]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ1"     - IO_L6N_T0U_N11_AD6N_64
set_property PACKAGE_PIN BN32              [ get_ports  {ddr_dq[0]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ0"     - IO_L6P_T0U_N10_AD6P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[0]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ0"     - IO_L6P_T0U_N10_AD6P_64
set_property PACKAGE_PIN BM30              [ get_ports  {ddr_dq[3]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ3"     - IO_L5N_T0U_N9_AD14N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[3]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ3"     - IO_L5N_T0U_N9_AD14N_64
set_property PACKAGE_PIN BL30              [ get_ports  {ddr_dq[2]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ2"     - IO_L5P_T0U_N8_AD14P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[2]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ2"     - IO_L5P_T0U_N8_AD14P_64
set_property PACKAGE_PIN BN30              [ get_ports  {ddr_dqs_c[0]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C0"  - IO_L4N_T0U_N7_DBC_AD7N_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[0]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C0"  - IO_L4N_T0U_N7_DBC_AD7N_64
set_property PACKAGE_PIN BN29              [ get_ports  {ddr_dqs_t[0]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T0"  - IO_L4P_T0U_N6_DBC_AD7P_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[0]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T0"  - IO_L4P_T0U_N6_DBC_AD7P_64
set_property PACKAGE_PIN BP31              [ get_ports  {ddr_dq[6]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ6"     - IO_L3N_T0L_N5_AD15N_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[6]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ6"     - IO_L3N_T0L_N5_AD15N_64
set_property PACKAGE_PIN BN31              [ get_ports  {ddr_dq[7]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ7"     - IO_L3P_T0L_N4_AD15P_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[7]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ7"     - IO_L3P_T0L_N4_AD15P_64
set_property PACKAGE_PIN BP29              [ get_ports  {ddr_dq[4]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ4"     - IO_L2N_T0L_N3_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[4]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ4"     - IO_L2N_T0L_N3_64
set_property PACKAGE_PIN BP28              [ get_ports  {ddr_dq[5]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ5"     - IO_L2P_T0L_N2_64
set_property IOSTANDARD  POD12_DCI         [ get_ports  {ddr_dq[5]} ]          ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQ5"     - IO_L2P_T0L_N2_64
set_property PACKAGE_PIN BM29              [ get_ports  {ddr_dqs_c[1]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C9"  - IO_L1N_T0L_N1_DBC_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_c[1]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_C9"  - IO_L1N_T0L_N1_DBC_64
set_property PACKAGE_PIN BM28              [ get_ports  {ddr_dqs_t[1]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T9"  - IO_L1P_T0L_N0_DBC_64
set_property IOSTANDARD DIFF_POD12_DCI     [ get_ports  {ddr_dqs_t[1]} ]       ;# Bank  64 VCCO - VCC1V2 Net "DDR4_C0_DQS_T9"  - IO_L1P_T0L_N0_DBC_64
