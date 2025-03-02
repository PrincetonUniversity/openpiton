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
## DDR4 RDIMM Controller 1, 72-bit Data Interface, x4 Componets, Single Rank
##     <<<NOTE>>> DQS Clock strobes have been swapped from JEDEC standard to match Xilinx MIG Clock order:
##                JEDEC Order   DQS ->  0  9  1 10  2 11  3 12  4 13  5 14  6 15  7 16  8 17
##                Xil MIG Order DQS ->  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
##
set_property -dict {PACKAGE_PIN AN13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[24]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ24"     - IO_L23N_T3U_N9_67
set_property -dict {PACKAGE_PIN AM13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[26]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ26"     - IO_L23P_T3U_N8_67
set_property -dict {PACKAGE_PIN AT13 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[6] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C3"   - IO_L22N_T3U_N7_DBC_AD0N_67
set_property -dict {PACKAGE_PIN AT14 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[6] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T3"   - IO_L22P_T3U_N6_DBC_AD0P_67
set_property -dict {PACKAGE_PIN AR13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[25]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ25"     - IO_L24N_T3U_N11_67
set_property -dict {PACKAGE_PIN AP13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[27]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ27"     - IO_L24P_T3U_N10_67
set_property -dict {PACKAGE_PIN AM14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[28]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ28"     - IO_L21N_T3L_N5_AD8N_67
set_property -dict {PACKAGE_PIN AL14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[30]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ30"     - IO_L21P_T3L_N4_AD8P_67
set_property -dict {PACKAGE_PIN AT15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[31]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ31"     - IO_L20N_T3L_N3_AD1N_67
set_property -dict {PACKAGE_PIN AR15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[29]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ29"     - IO_L20P_T3L_N2_AD1P_67
set_property -dict {PACKAGE_PIN AP14 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[7] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C12"  - IO_L19N_T3L_N1_DBC_AD9N_67
set_property -dict {PACKAGE_PIN AN14 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[7] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T12"  - IO_L19P_T3L_N0_DBC_AD9P_67
set_property -dict {PACKAGE_PIN AV13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[9]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ9"      - IO_L17N_T2U_N9_AD10N_67
set_property -dict {PACKAGE_PIN AU13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[8]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ8"      - IO_L17P_T2U_N8_AD10P_67
set_property -dict {PACKAGE_PIN AY15 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[2] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C1"   - IO_L16N_T2U_N7_QBC_AD3N_67
set_property -dict {PACKAGE_PIN AW15 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[2] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T1"   - IO_L16P_T2U_N6_QBC_AD3P_67
set_property -dict {PACKAGE_PIN AW13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[10]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ10"     - IO_L18N_T2U_N11_AD2N_67
set_property -dict {PACKAGE_PIN AW14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[11]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ11"     - IO_L18P_T2U_N10_AD2P_67
set_property -dict {PACKAGE_PIN AV14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[14]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ14"     - IO_L15N_T2L_N5_AD11N_67
set_property -dict {PACKAGE_PIN AU14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[12]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ12"     - IO_L15P_T2L_N4_AD11P_67
set_property -dict {PACKAGE_PIN BA11 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[15]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ15"     - IO_L14N_T2L_N3_GC_67
set_property -dict {PACKAGE_PIN AY11 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[13]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ13"     - IO_L14P_T2L_N2_GC_67
set_property -dict {PACKAGE_PIN AY12 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[3] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C10"  - IO_L13N_T2L_N1_GC_QBC_67
set_property -dict {PACKAGE_PIN AY13 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[3] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T10"  - IO_L13P_T2L_N0_GC_QBC_67
set_property -dict {PACKAGE_PIN BA13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[18]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ18"     - IO_L11N_T1U_N9_GC_67
set_property -dict {PACKAGE_PIN BA14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[19]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ19"     - IO_L11P_T1U_N8_GC_67
set_property -dict {PACKAGE_PIN BB10 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[4] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C2"   - IO_L10N_T1U_N7_QBC_AD4N_67
set_property -dict {PACKAGE_PIN BB11 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[4] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T2"   - IO_L10P_T1U_N6_QBC_AD4P_67
set_property -dict {PACKAGE_PIN BB12 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[17]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ17"     - IO_L12N_T1U_N11_GC_67
set_property -dict {PACKAGE_PIN BA12 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[16]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ16"     - IO_L12P_T1U_N10_GC_67
set_property -dict {PACKAGE_PIN BA7  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[22]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ22"     - IO_L9N_T1L_N5_AD12N_67
set_property -dict {PACKAGE_PIN BA8  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[23]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ23"     - IO_L9P_T1L_N4_AD12P_67
set_property -dict {PACKAGE_PIN BC9  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[20]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ20"     - IO_L8N_T1L_N3_AD5N_67
set_property -dict {PACKAGE_PIN BB9  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[21]   ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ21"     - IO_L8P_T1L_N2_AD5P_67
set_property -dict {PACKAGE_PIN BA9  IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[5] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C11"  - IO_L7N_T1L_N1_QBC_AD13N_67
set_property -dict {PACKAGE_PIN BA10 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[5] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T11"  - IO_L7P_T1L_N0_QBC_AD13P_67
set_property -dict {PACKAGE_PIN BD7  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[1]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ1"      - IO_L5N_T0U_N9_AD14N_67
set_property -dict {PACKAGE_PIN BC7  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[2]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ2"      - IO_L5P_T0U_N8_AD14P_67
set_property -dict {PACKAGE_PIN BF9  IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[0] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C0"   - IO_L4N_T0U_N7_DBC_AD7N_67
set_property -dict {PACKAGE_PIN BF10 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[0] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T0"   - IO_L4P_T0U_N6_DBC_AD7P_67
set_property -dict {PACKAGE_PIN BD8  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[3]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ3"      - IO_L6N_T0U_N11_AD6N_67
set_property -dict {PACKAGE_PIN BD9  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[0]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ0"      - IO_L6P_T0U_N10_AD6P_67
set_property -dict {PACKAGE_PIN BF7  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[7]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ7"      - IO_L3N_T0L_N5_AD15N_67
set_property -dict {PACKAGE_PIN BE7  IOSTANDARD POD12_DCI      } [get_ports ddr_dq[6]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ6"      - IO_L3P_T0L_N4_AD15P_67
set_property -dict {PACKAGE_PIN BE10 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[5]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ5"      - IO_L2N_T0L_N3_67
set_property -dict {PACKAGE_PIN BD10 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[4]    ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQ4"      - IO_L2P_T0L_N2_67
set_property -dict {PACKAGE_PIN BF8  IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[1] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_C9"   - IO_L1N_T0L_N1_DBC_67
set_property -dict {PACKAGE_PIN BE8  IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[1] ]; # Bank 67 VCCO - VCC1V2 Net "DDR4_C1_DQS_T9"   - IO_L1P_T0L_N0_DBC_67
set_property -dict {PACKAGE_PIN AM15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[56]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ56"     - IO_L23N_T3U_N9_66
set_property -dict {PACKAGE_PIN AL15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[57]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ57"     - IO_L23P_T3U_N8_66
set_property -dict {PACKAGE_PIN AR16 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[14]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C7"   - IO_L22N_T3U_N7_DBC_AD0N_66
set_property -dict {PACKAGE_PIN AP16 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[14]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T7"   - IO_L22P_T3U_N6_DBC_AD0P_66
#set_property -dict {PACKAGE_PIN AN18 IOSTANDARD LVCMOS12       } [get_ports ddr_event_n  ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_EVENT_B"  - IO_T3U_N12_66
set_property -dict {PACKAGE_PIN AN16 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[59]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ59"     - IO_L24N_T3U_N11_66
set_property -dict {PACKAGE_PIN AN17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[58]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ58"     - IO_L24P_T3U_N10_66
set_property -dict {PACKAGE_PIN AL16 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[63]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ63"     - IO_L21N_T3L_N5_AD8N_66
set_property -dict {PACKAGE_PIN AL17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[62]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ62"     - IO_L21P_T3L_N4_AD8P_66
set_property -dict {PACKAGE_PIN AR18 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[60]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ60"     - IO_L20N_T3L_N3_AD1N_66
set_property -dict {PACKAGE_PIN AP18 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[61]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ61"     - IO_L20P_T3L_N2_AD1P_66
set_property -dict {PACKAGE_PIN AM16 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[15]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C16"  - IO_L19N_T3L_N1_DBC_AD9N_66
set_property -dict {PACKAGE_PIN AM17 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[15]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T16"  - IO_L19P_T3L_N0_DBC_AD9P_66
set_property -dict {PACKAGE_PIN AU16 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[50]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ50"     - IO_L17N_T2U_N9_AD10N_66
set_property -dict {PACKAGE_PIN AU17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[51]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ51"     - IO_L17P_T2U_N8_AD10P_66
set_property -dict {PACKAGE_PIN AW18 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[12]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C6"   - IO_L16N_T2U_N7_QBC_AD3N_66
set_property -dict {PACKAGE_PIN AV18 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[12]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T6"   - IO_L16P_T2U_N6_QBC_AD3P_66
set_property -dict {PACKAGE_PIN AR17 IOSTANDARD LVCMOS12       } [get_ports ddr_reset_n  ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_RESET_N"  - IO_T2U_N12_66
set_property -dict {PACKAGE_PIN AV16 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[48]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ48"     - IO_L18N_T2U_N11_AD2N_66
set_property -dict {PACKAGE_PIN AV17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[49]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ49"     - IO_L18P_T2U_N10_AD2P_66
set_property -dict {PACKAGE_PIN AT17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[55]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ55"     - IO_L15N_T2L_N5_AD11N_66
set_property -dict {PACKAGE_PIN AT18 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[54]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ54"     - IO_L15P_T2L_N4_AD11P_66
set_property -dict {PACKAGE_PIN BB16 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[53]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ53"     - IO_L14N_T2L_N3_GC_66
set_property -dict {PACKAGE_PIN BB17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[52]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ52"     - IO_L14P_T2L_N2_GC_66
set_property -dict {PACKAGE_PIN AY16 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[13]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C15"  - IO_L13N_T2L_N1_GC_QBC_66
set_property -dict {PACKAGE_PIN AW16 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[13]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T15"  - IO_L13P_T2L_N0_GC_QBC_66
set_property -dict {PACKAGE_PIN AY17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[40]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ40"     - IO_L11N_T1U_N9_GC_66
set_property -dict {PACKAGE_PIN AY18 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[42]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ42"     - IO_L11P_T1U_N8_GC_66
set_property -dict {PACKAGE_PIN BC12 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[10]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C5"   - IO_L10N_T1U_N7_QBC_AD4N_66
set_property -dict {PACKAGE_PIN BC13 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[10]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T5"   - IO_L10P_T1U_N6_QBC_AD4P_66
set_property -dict {PACKAGE_PIN BA17 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[41]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ41"     - IO_L12N_T1U_N11_GC_66
set_property -dict {PACKAGE_PIN BA18 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[43]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ43"     - IO_L12P_T1U_N10_GC_66
set_property -dict {PACKAGE_PIN BB15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[45]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ45"     - IO_L9N_T1L_N5_AD12N_66
set_property -dict {PACKAGE_PIN BA15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[44]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ44"     - IO_L9P_T1L_N4_AD12P_66
set_property -dict {PACKAGE_PIN BD11 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[47]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ47"     - IO_L8N_T1L_N3_AD5N_66
set_property -dict {PACKAGE_PIN BC11 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[46]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ46"     - IO_L8P_T1L_N2_AD5P_66
set_property -dict {PACKAGE_PIN BC14 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[11]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C14"  - IO_L7N_T1L_N1_QBC_AD13N_66
set_property -dict {PACKAGE_PIN BB14 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[11]]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T14"  - IO_L7P_T1L_N0_QBC_AD13P_66
set_property -dict {PACKAGE_PIN BD13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[35]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ35"     - IO_L5N_T0U_N9_AD14N_66
set_property -dict {PACKAGE_PIN BD14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[33]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ33"     - IO_L5P_T0U_N8_AD14P_66
set_property -dict {PACKAGE_PIN BE11 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[8] ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C4"   - IO_L4N_T0U_N7_DBC_AD7N_66
set_property -dict {PACKAGE_PIN BE12 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[8] ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T4"   - IO_L4P_T0U_N6_DBC_AD7P_66
set_property -dict {PACKAGE_PIN BF12 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[34]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ34"     - IO_L6N_T0U_N11_AD6N_66
set_property -dict {PACKAGE_PIN BE13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[32]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ32"     - IO_L6P_T0U_N10_AD6P_66
set_property -dict {PACKAGE_PIN BD15 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[36]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ36"     - IO_L3N_T0L_N5_AD15N_66
set_property -dict {PACKAGE_PIN BD16 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[37]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ37"     - IO_L3P_T0L_N4_AD15P_66
set_property -dict {PACKAGE_PIN BF13 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[39]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ39"     - IO_L2N_T0L_N3_66
set_property -dict {PACKAGE_PIN BF14 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[38]   ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQ38"     - IO_L2P_T0L_N2_66
set_property -dict {PACKAGE_PIN BF15 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[9] ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_C13"  - IO_L1N_T0L_N1_DBC_66
set_property -dict {PACKAGE_PIN BE15 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[9] ]; # Bank 66 VCCO - VCC1V2 Net "DDR4_C1_DQS_T13"  - IO_L1P_T0L_N0_DBC_66
set_property -dict {PACKAGE_PIN AM25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[15]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR15"    - IO_L22N_T3U_N7_DBC_AD0N_D05_65
set_property -dict {PACKAGE_PIN AL25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[14]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR14"    - IO_L22P_T3U_N6_DBC_AD0P_D04_65
set_property -dict {PACKAGE_PIN AP26 IOSTANDARD SSTL12_DCI     } [get_ports ddr_ba[1]    ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_BA1"      - IO_T3U_N12_PERSTN0_65
set_property -dict {PACKAGE_PIN AN26 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[3]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR3"     - IO_L24N_T3U_N11_DOUT_CSO_B_65
set_property -dict {PACKAGE_PIN AM26 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[10]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR10"    - IO_L24P_T3U_N10_EMCCLK_65
#set_property -dict {PACKAGE_PIN AP24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_odt[1]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ODT1"     - IO_L21N_T3L_N5_AD8N_D07_65
#set_property -dict {PACKAGE_PIN AP23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cs_n[3]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CS_B3"    - IO_L21P_T3L_N4_AD8P_D06_65
#set_property -dict {PACKAGE_PIN AM24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[17]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR17"    - IO_L20N_T3L_N3_AD1N_D09_65
set_property -dict {PACKAGE_PIN AL24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[13]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR13"    - IO_L20P_T3L_N2_AD1P_D08_65
set_property -dict {PACKAGE_PIN AN24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[0]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR0"     - IO_L19N_T3L_N1_DBC_AD9N_D11_65
set_property -dict {PACKAGE_PIN AN23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[16]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR16"    - IO_L19P_T3L_N0_DBC_AD9P_D10_65
#set_property -dict {PACKAGE_PIN AV26 IOSTANDARD DIFF_SSTL12_DCI} [get_ports ddr_ck_c[1]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CK_C1"    - IO_L17N_T2U_N9_AD10N_D15_65
#set_property -dict {PACKAGE_PIN AU26 IOSTANDARD DIFF_SSTL12_DCI} [get_ports ddr_ck_t[1]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CK_T1"    - IO_L17P_T2U_N8_AD10P_D14_65
set_property -dict {PACKAGE_PIN AT23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_parity   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_PAR"      - IO_L16N_T2U_N7_QBC_AD3N_A01_D17_65
#set_property -dict {PACKAGE_PIN AR23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cs_n[2]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CS_B2"    - IO_L16P_T2U_N6_QBC_AD3P_A00_D16_65
#set_property -dict {PACKAGE_PIN AP25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cs_n[1]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CS_B1"    - IO_T2U_N12_CSI_ADV_B_65
set_property -dict {PACKAGE_PIN AU24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_ba[0]    ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_BA0"      - IO_L18N_T2U_N11_AD2N_D13_65
set_property -dict {PACKAGE_PIN AT24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[1]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR1"     - IO_L18P_T2U_N10_AD2P_D12_65
set_property -dict {PACKAGE_PIN AU25 IOSTANDARD DIFF_SSTL12_DCI} [get_ports ddr_ck_c[0]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CK_C0"    - IO_L15N_T2L_N5_AD11N_A03_D19_65
set_property -dict {PACKAGE_PIN AT25 IOSTANDARD DIFF_SSTL12_DCI} [get_ports ddr_ck_t[0]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CK_T0"    - IO_L15P_T2L_N4_AD11P_A02_D18_65
set_property -dict {PACKAGE_PIN AV24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[6]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR6"     - IO_L14N_T2L_N3_GC_A05_D21_65
set_property -dict {PACKAGE_PIN AV23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cs_n[0]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CS_B0"    - IO_L14P_T2L_N2_GC_A04_D20_65
set_property -dict {PACKAGE_PIN AW26 IOSTANDARD SSTL12_DCI     } [get_ports ddr_bg[1]    ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_BG1"      - IO_L13N_T2L_N1_GC_QBC_A07_D23_65
set_property -dict {PACKAGE_PIN AW25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_act_n    ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ACT_B"    - IO_L13P_T2L_N0_GC_QBC_A06_D22_65
#set_property -dict {PACKAGE_PIN AY26 IOSTANDARD LVCMOS12       } [get_ports ddr_alert_n  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ALERT_B"  - IO_L11N_T1U_N9_GC_A11_D27_65
set_property -dict {PACKAGE_PIN AY25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[8]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR8"     - IO_L11P_T1U_N8_GC_A10_D26_65
set_property -dict {PACKAGE_PIN AY23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[5]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR5"     - IO_L10N_T1U_N7_QBC_AD4N_A13_D29_65
set_property -dict {PACKAGE_PIN AY22 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[4]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR4"     - IO_L10P_T1U_N6_QBC_AD4P_A12_D28_65
set_property -dict {PACKAGE_PIN BA25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[11]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR11"    - IO_T1U_N12_SMBALERT_65
set_property -dict {PACKAGE_PIN AW24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[2]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR2"     - IO_L12N_T1U_N11_GC_A09_D25_65
set_property -dict {PACKAGE_PIN AW23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_odt[0]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ODT0"     - IO_L12P_T1U_N10_GC_A08_D24_65
set_property -dict {PACKAGE_PIN BB25 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cke[0]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CKE0"     - IO_L9N_T1L_N5_AD12N_A15_D31_65
#set_property -dict {PACKAGE_PIN BB24 IOSTANDARD SSTL12_DCI     } [get_ports ddr_cke[1]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_CKE1"     - IO_L9P_T1L_N4_AD12P_A14_D30_65
set_property -dict {PACKAGE_PIN BA23 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[9]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR9"     - IO_L8N_T1L_N3_AD5N_A17_65
set_property -dict {PACKAGE_PIN BA22 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[7]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR7"     - IO_L8P_T1L_N2_AD5P_A16_65
set_property -dict {PACKAGE_PIN BC22 IOSTANDARD SSTL12_DCI     } [get_ports ddr_bg[0]    ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_BG0"      - IO_L7N_T1L_N1_QBC_AD13N_A19_65
set_property -dict {PACKAGE_PIN BB22 IOSTANDARD SSTL12_DCI     } [get_ports ddr_addr[12]  ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_ADR12"    - IO_L7P_T1L_N0_QBC_AD13P_A18_65
set_property -dict {PACKAGE_PIN BF25 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[64]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ64"     - IO_L5N_T0U_N9_AD14N_A23_65
set_property -dict {PACKAGE_PIN BF24 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[65]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ65"     - IO_L5P_T0U_N8_AD14P_A22_65
set_property -dict {PACKAGE_PIN BD24 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[16]]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQS_C8"   - IO_L4N_T0U_N7_DBC_AD7N_A25_65
set_property -dict {PACKAGE_PIN BC24 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[16]]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQS_T8"   - IO_L4P_T0U_N6_DBC_AD7P_A24_65
set_property -dict {PACKAGE_PIN BE25 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[67]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ67"     - IO_L6N_T0U_N11_AD6N_A21_65
set_property -dict {PACKAGE_PIN BD25 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[66]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ66"     - IO_L6P_T0U_N10_AD6P_A20_65
set_property -dict {PACKAGE_PIN BF23 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[70]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ70"     - IO_L3N_T0L_N5_AD15N_A27_65
set_property -dict {PACKAGE_PIN BE23 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[71]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ71"     - IO_L3P_T0L_N4_AD15P_A26_65
set_property -dict {PACKAGE_PIN BD23 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[68]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ68"     - IO_L2N_T0L_N3_FWE_FCS2_B_65
set_property -dict {PACKAGE_PIN BC23 IOSTANDARD POD12_DCI      } [get_ports ddr_dq[69]   ]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQ69"     - IO_L2P_T0L_N2_FOE_B_65
set_property -dict {PACKAGE_PIN BF22 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_c[17]]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQS_C17"  - IO_L1N_T0L_N1_DBC_RS1_65
set_property -dict {PACKAGE_PIN BE22 IOSTANDARD DIFF_POD12_DCI } [get_ports ddr_dqs_t[17]]; # Bank 65 VCCO - VCC1V2 Net "DDR4_C1_DQS_T17"  - IO_L1P_T0L_N0_DBC_RS0_65
