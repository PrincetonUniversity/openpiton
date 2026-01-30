# Copyright 2023 Barcelona Supercomputing Center-Centro Nacional de Supercomputación

# Licensed under the Solderpad Hardware License v 2.1 (the "License");
# you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
# You may obtain a copy of the License at
# 
#     http://www.solderpad.org/licenses/SHL-2.1
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Alexander Kropotov, BSC-CNS
# Date: 27.12.2023
# Description: 

# Proc to create JTAG chain based on built-in FPGA BSCAN
proc cr_bd_axistx_cmac_bridge { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name axistx_cmac_bridge

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./bd

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create instance: gndx1, and set properties
  set gndx1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gndx1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
  ] $gndx1

  # Create instance: vccx1, and set properties
  set vccx1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vccx1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
   CONFIG.CONST_WIDTH {1} \
  ] $vccx1

  # Create instance: eth_cmac, and set properties
  global g_board_part
  global g_cmac_port
  if { ${g_board_part} eq "u280" } {
    set g_eth100gb_freq "156.25"
    if { ${g_cmac_port} eq "qsfp0" } {
      set g_cmac_loc      "CMACE4_X0Y6"
      set g_gt_grp_loc    "X0Y40~X0Y43"
      set g_lane1_loc     "X0Y40"
      set g_lane2_loc     "X0Y41"
      set g_lane3_loc     "X0Y42"
      set g_lane4_loc     "X0Y43"
    }
    if { ${g_cmac_port} eq "qsfp1" } {
      # set g_cmac_loc      "CMACE4_X0Y7"
      # using non defualt for QSFP1 CMAC provides better timing
      set g_cmac_loc      "CMACE4_X0Y6"
      set g_gt_grp_loc    "X0Y44~X0Y47"
      set g_lane1_loc     "X0Y44"
      set g_lane2_loc     "X0Y45"
      set g_lane3_loc     "X0Y46"
      set g_lane4_loc     "X0Y47"
    }
  }
  if { ${g_board_part} eq "u250" } {
    set g_eth100gb_freq "156.25"
    if { ${g_cmac_port} eq "qsfp0" } {
      # set g_cmac_loc      "CMACE4_X0Y7"
      set g_cmac_loc      "CMACE4_X0Y8"
      set g_gt_grp_loc    "X1Y44~X1Y47"
      set g_lane1_loc     "X1Y44"
      set g_lane2_loc     "X1Y45"
      set g_lane3_loc     "X1Y46"
      set g_lane4_loc     "X1Y47"
    }
    if { ${g_cmac_port} eq "qsfp1" } {
      # set g_cmac_loc      "CMACE4_X0Y6"
      set g_cmac_loc      "CMACE4_X0Y7"
      set g_gt_grp_loc    "X1Y40~X1Y43"
      set g_lane1_loc     "X1Y40"
      set g_lane2_loc     "X1Y41"
      set g_lane3_loc     "X1Y42"
      set g_lane4_loc     "X1Y43"
    }
  }
  if { ${g_board_part} eq "u55c" } {
    set g_eth100gb_freq "161.1328125"
    if { ${g_cmac_port} eq "qsfp0" } {
      set g_cmac_loc      "CMACE4_X0Y3"
      set g_gt_grp_loc    "X0Y24~X0Y27"
      set g_lane1_loc     "X0Y24"
      set g_lane2_loc     "X0Y25"
      set g_lane3_loc     "X0Y26"
      set g_lane4_loc     "X0Y27"
    }
    if { ${g_cmac_port} eq "qsfp1" } {
      set g_cmac_loc      "CMACE4_X0Y4"
      set g_gt_grp_loc    "X0Y28~X0Y31"
      set g_lane1_loc     "X0Y28"
      set g_lane2_loc     "X0Y29"
      set g_lane3_loc     "X0Y30"
      set g_lane4_loc     "X0Y31"
    }
  }
  set eth_cmac [ create_bd_cell -type ip -vlnv xilinx.com:ip:cmac_usplus:3.1 eth_cmac ]
  set_property -dict [ list \
   CONFIG.ADD_GT_CNRL_STS_PORTS {0} \
   CONFIG.CMAC_CAUI4_MODE {1} \
   CONFIG.CMAC_CORE_SELECT $g_cmac_loc \
   CONFIG.DIFFCLK_BOARD_INTERFACE {Custom} \
   CONFIG.ENABLE_AXI_INTERFACE {0} \
   CONFIG.ENABLE_PIPELINE_REG {0} \
   CONFIG.ENABLE_TIME_STAMPING {0} \
   CONFIG.ETHERNET_BOARD_INTERFACE {Custom} \
   CONFIG.GT_GROUP_SELECT $g_gt_grp_loc \
   CONFIG.GT_REF_CLK_FREQ $g_eth100gb_freq \
   CONFIG.GT_RX_BUFFER_BYPASS {0} \
   CONFIG.INCLUDE_AUTO_NEG_LT_LOGIC {0} \
   CONFIG.INCLUDE_RS_FEC {1} \
   CONFIG.INCLUDE_STATISTICS_COUNTERS {1} \
   CONFIG.LANE10_GT_LOC {NA} \
   CONFIG.LANE1_GT_LOC $g_lane1_loc \
   CONFIG.LANE2_GT_LOC $g_lane2_loc \
   CONFIG.LANE3_GT_LOC $g_lane3_loc \
   CONFIG.LANE4_GT_LOC $g_lane4_loc \
   CONFIG.LANE5_GT_LOC {NA} \
   CONFIG.LANE6_GT_LOC {NA} \
   CONFIG.LANE7_GT_LOC {NA} \
   CONFIG.LANE8_GT_LOC {NA} \
   CONFIG.LANE9_GT_LOC {NA} \
   CONFIG.NUM_LANES {4x25} \
   CONFIG.PLL_TYPE {QPLL0} \
   CONFIG.RX_CHECK_ACK {1} \
   CONFIG.RX_EQ_MODE {AUTO} \
   CONFIG.RX_FLOW_CONTROL {0} \
   CONFIG.RX_FORWARD_CONTROL_FRAMES {0} \
   CONFIG.RX_GT_BUFFER {1} \
   CONFIG.RX_MAX_PACKET_LEN {9600} \
   CONFIG.RX_MIN_PACKET_LEN {64} \
   CONFIG.TX_FLOW_CONTROL {0} \
   CONFIG.INCLUDE_RS_FEC {1} \
   CONFIG.TX_OTN_INTERFACE {0} \
   CONFIG.USER_INTERFACE {AXIS} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $eth_cmac
  set_property USER_COMMENTS.comment_3 "https://www.xilinx.com/support/documentation/ip_documentation/l_ethernet/v3_1/pg211-50g-ethernet.pdf#page=26" [get_bd_intf_pins /eth_cmac/axis_rx]
  set_property USER_COMMENTS.comment_2 "https://www.xilinx.com/support/documentation/ip_documentation/l_ethernet/v3_1/pg211-50g-ethernet.pdf#page=23" [get_bd_intf_pins /eth_cmac/axis_tx]
  set_property USER_COMMENTS.comment_1 "http://www.xilinx.com/support/documentation/ip_documentation/cmac_usplus/v3_1/pg203-cmac-usplus.pdf#page=117
http://www.xilinx.com/support/documentation/user_guides/ug578-ultrascale-gty-transceivers.pdf#page=88" [get_bd_pins /eth_cmac/gt_loopback_in]
  set_property USER_COMMENTS.comment_4 "https://www.xilinx.com/support/documentation/user_guides/ug578-ultrascale-gty-transceivers.pdf#page=88" [get_bd_pins /eth_cmac/gt_loopback_in]

  set gndx56 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gndx56 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {56} \
  ] $gndx56
  connect_bd_net [get_bd_pins gndx56/dout] [get_bd_pins eth_cmac/tx_preamblein]

  connect_bd_net [get_bd_pins gndx1/dout] [get_bd_pins eth_cmac/drp_en] \
                                          [get_bd_pins eth_cmac/drp_we] \
                                          [get_bd_pins eth_cmac/ctl_rx_test_pattern] \
                                          [get_bd_pins eth_cmac/ctl_tx_test_pattern] \
                                          [get_bd_pins eth_cmac/ctl_tx_send_idle] \
                                          [get_bd_pins eth_cmac/ctl_tx_send_lfi] \
                                          [get_bd_pins eth_cmac/ctl_rx_rsfec_enable] \
                                          [get_bd_pins eth_cmac/ctl_tx_rsfec_enable] \
                                          [get_bd_pins eth_cmac/ctl_rx_rsfec_enable_correction] \
                                          [get_bd_pins eth_cmac/ctl_rx_rsfec_enable_indication] \
                                          [get_bd_pins eth_cmac/ctl_rsfec_ieee_error_indication_mode]
  connect_bd_net [get_bd_pins vccx1/dout] [get_bd_pins eth_cmac/ctl_rx_enable]
  make_bd_pins_external         [get_bd_pins eth_cmac/gt_rxusrclk2]
  set_property name "qsfp_clk"  [get_bd_ports gt_rxusrclk2_0]
  connect_bd_net [get_bd_pins eth_cmac/gt_rxusrclk2] [get_bd_pins eth_cmac/rx_clk]

  global sys_clk_freq
  set sys_rstn [ create_bd_port -dir I -type rst sys_rstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
  ] $sys_rstn

  set sys_rstn_in [ create_bd_port -dir I -type rst sys_rstn_in ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
  ] $sys_rstn_in

  make_bd_pins_external         [get_bd_pins eth_cmac/init_clk]
  set_property name "sys_clk"   [get_bd_ports init_clk_0]
  set_property -dict [list CONFIG.ASSOCIATED_RESET "sys_rstn:sys_rstn_in" CONFIG.FREQ_HZ $sys_clk_freq] [get_bd_ports sys_clk]
  connect_bd_net [get_bd_ports sys_clk] [get_bd_pins eth_cmac/drp_clk]

  set mux_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 mux_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $mux_rst_gen
  connect_bd_net [get_bd_ports sys_clk] [get_bd_pins mux_rst_gen/slowest_sync_clk]
  make_bd_pins_external                 [get_bd_pins mux_rst_gen/peripheral_aresetn]
  set_property name "sys_rstn_out" [get_bd_ports peripheral_aresetn_0]

  set rx_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rx_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $rx_rst_gen
  connect_bd_net [get_bd_pins eth_cmac/gt_rxusrclk2] [get_bd_pins rx_rst_gen/slowest_sync_clk]
  make_bd_pins_external                              [get_bd_pins rx_rst_gen/peripheral_aresetn]
  set_property name "qsfp_rstn"                      [get_bd_ports peripheral_aresetn_0]

  set tx_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 tx_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $tx_rst_gen
  connect_bd_net [get_bd_pins eth_cmac/gt_txusrclk2] [get_bd_pins tx_rst_gen/slowest_sync_clk]

  set tx_rfi_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 tx_rfi_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $tx_rfi_gen
  connect_bd_net [get_bd_pins eth_cmac/gt_txusrclk2]     [get_bd_pins tx_rfi_gen/slowest_sync_clk]
  connect_bd_net [get_bd_pins eth_cmac/stat_rx_aligned]  [get_bd_pins tx_rfi_gen/aux_reset_in]
  connect_bd_net [get_bd_pins gndx1/dout]                [get_bd_pins tx_rfi_gen/mb_debug_sys_rst]
  connect_bd_net [get_bd_pins tx_rfi_gen/bus_struct_reset]     [get_bd_pins eth_cmac/ctl_tx_send_rfi]
  connect_bd_net [get_bd_pins tx_rfi_gen/interconnect_aresetn] [get_bd_pins eth_cmac/ctl_tx_enable]


  global QSFP_BRDG_CHAN_BYTES
  global QSFP_BRDG_SGNL_BYTES
  global AXIS_INTERCON_MAXCHANS
  global CMAC_BRDG_CHANS
  global CMAC_BRDG_CHANS_SGNL
  global CMAC_BRDG_DEST_OFFS
  global AXIS_TDEST_WIDTH

  set CMAC_FULL_DAT_BYTES 64
  set CMAC_DATA_OVERHD_BYTES 8
  set CMAC_USE_DAT_BYTES [expr {$CMAC_FULL_DAT_BYTES - $CMAC_DATA_OVERHD_BYTES}]
  # set QSFP_BRDG_ODCHI_BYTES $CMAC_USE_DAT_BYTES
  # set QSFP_BRDG_ODCHO_BYTES $CMAC_USE_DAT_BYTES
  set QSFP_BRDG_ODCHI_BYTES $QSFP_BRDG_CHAN_BYTES
  set QSFP_BRDG_ODCHO_BYTES $QSFP_BRDG_CHAN_BYTES

  set AXIS_INTERCON_PARTS     [expr {int(($CMAC_BRDG_CHANS + $AXIS_INTERCON_MAXCHANS - 1)/$AXIS_INTERCON_MAXCHANS)}]
  set AXIS_INTERCON_PARTCHANS [expr {int( $CMAC_BRDG_CHANS / $AXIS_INTERCON_PARTS)}]

  if {$AXIS_INTERCON_PARTS > 1} {
    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_muxer
    set_property -dict [list \
      CONFIG.NUM_MI {1} \
      CONFIG.NUM_SI $AXIS_INTERCON_PARTS \
      CONFIG.ARB_ALGORITHM {3} \
      CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} \
      CONFIG.ARB_ON_TLAST {1} \
      CONFIG.ARB_ON_MAX_XFERS {0} \
    ] [get_bd_cells axis_muxer]

    connect_bd_net [get_bd_pins tx_rst_gen/interconnect_aresetn] \
                   [get_bd_pins axis_muxer/ARESETN] \
                   [get_bd_pins axis_muxer/M00_AXIS_ARESETN]

    connect_bd_net [get_bd_pins eth_cmac/gt_txusrclk2] \
                   [get_bd_pins axis_muxer/ACLK] \
                   [get_bd_pins axis_muxer/M00_AXIS_ACLK]

    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_demuxer
    set_property -dict [list \
      CONFIG.NUM_MI $AXIS_INTERCON_PARTS \
      CONFIG.ARB_ON_TLAST {1} \
      CONFIG.ARB_ON_MAX_XFERS {0} \
    ] [get_bd_cells axis_demuxer]

    # initialize address map to exclude further conflicts
    for {set idx 0} {$idx < $AXIS_INTERCON_PARTS} {incr idx} {
      set_property -dict [list \
        CONFIG.M[format {%02d} [expr {$AXIS_INTERCON_PARTS-1-$idx}]]_AXIS_HIGHTDEST [format {0x%02x} [expr {0xFFFFFFFF-$idx}]] \
        CONFIG.M[format {%02d} [expr {$AXIS_INTERCON_PARTS-1-$idx}]]_AXIS_BASETDEST [format {0x%02x} [expr {0xFFFFFFFF-$idx}]] \
      ] [get_bd_cells axis_demuxer]
    }

    connect_bd_net [get_bd_pins rx_rst_gen/interconnect_aresetn] \
                   [get_bd_pins axis_demuxer/ARESETN] \
                   [get_bd_pins axis_demuxer/S00_AXIS_ARESETN]

    connect_bd_net [get_bd_pins eth_cmac/gt_rxusrclk2] \
                   [get_bd_pins axis_demuxer/ACLK] \
                   [get_bd_pins axis_demuxer/S00_AXIS_ACLK]
  }


  for {set idx 0} {$idx < $CMAC_BRDG_CHANS} {incr idx} {
    set idx_hi [expr {int($idx / $AXIS_INTERCON_PARTCHANS)}]
    set idx_lo [expr {    $idx % $AXIS_INTERCON_PARTCHANS }]

    # If number of channels is not aligned with max limit, for last cascade part with more than estimated even number of channels per part:
    if {$idx_hi > ($AXIS_INTERCON_PARTS-1)} {
      set idx_hi [expr {$AXIS_INTERCON_PARTS-1}]
      set idx_lo [expr {$idx - ($idx_hi * $AXIS_INTERCON_PARTCHANS)}]
    }

    puts "AXISt-CMAC bridge: Iteration $idx to cascade Interconnect over $CMAC_BRDG_CHANS channels (chan $idx_lo in cascade part $idx_hi of $AXIS_INTERCON_PARTS)"

    # creation of few instances of interconnect for cascading because of limitation of number of channels
    if {$idx_lo == 0} {
      if {$idx_hi < ($AXIS_INTERCON_PARTS-1)} {
        set intercon_chans $AXIS_INTERCON_PARTCHANS
      } else {
        set intercon_chans [expr {$CMAC_BRDG_CHANS - $idx}]
      }
      puts "  At lower cascade: set muxer/demuxer $idx_hi of $AXIS_INTERCON_PARTS with $intercon_chans channels"
      puts "  of evenly distributed $AXIS_INTERCON_PARTCHANS and of max limit $AXIS_INTERCON_MAXCHANS channels per muxer/demuxer"

      create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_muxer_$idx_hi
      set_property -dict [list \
        CONFIG.NUM_MI {1} \
        CONFIG.NUM_SI $intercon_chans \
        CONFIG.ARB_ALGORITHM {3} \
        CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} \
        CONFIG.ARB_ON_TLAST {1} \
        CONFIG.ARB_ON_MAX_XFERS {0} \
      ] [get_bd_cells axis_muxer_$idx_hi]
      # CONFIG.ENABLE_ADVANCED_OPTIONS {1}
      # CONFIG.XBAR_TDATA_NUM_BYTES $CMAC_USE_DAT_BYTES

      connect_bd_net [get_bd_pins tx_rst_gen/interconnect_aresetn] \
                     [get_bd_pins axis_muxer_$idx_hi/ARESETN] \
                     [get_bd_pins axis_muxer_$idx_hi/M00_AXIS_ARESETN]

      connect_bd_net [get_bd_pins eth_cmac/gt_txusrclk2] \
                     [get_bd_pins axis_muxer_$idx_hi/ACLK] \
                     [get_bd_pins axis_muxer_$idx_hi/M00_AXIS_ACLK]

      create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_demuxer_$idx_hi
      set_property -dict [list \
        CONFIG.NUM_MI $intercon_chans \
        CONFIG.ARB_ON_TLAST {1} \
        CONFIG.ARB_ON_MAX_XFERS {0} \
      ] [get_bd_cells axis_demuxer_$idx_hi]
      # For last channel set all rest decode address space,
      # but not needed because "Unmapped TDEST transfers will drop the transfer" according to https://docs.amd.com/v/u/en-US/pg035_axis_interconnect#page=9
      # set_property CONFIG.M[format {%02d} [expr {$intercon_chans-1}]]_AXIS_HIGHTDEST {0xFF} [get_bd_cells axis_demuxer_$idx_hi]

      # initialize address map to exclude further conflicts
      for {set jdx 0} {$jdx < $intercon_chans} {incr jdx} {
        set_property -dict [list \
          CONFIG.M[format {%02d} [expr {$intercon_chans-1-$jdx}]]_AXIS_HIGHTDEST [format {0x%02x} [expr {0xFFFFFFFF-$jdx}]] \
          CONFIG.M[format {%02d} [expr {$intercon_chans-1-$jdx}]]_AXIS_BASETDEST [format {0x%02x} [expr {0xFFFFFFFF-$jdx}]] \
        ] [get_bd_cells axis_demuxer_$idx_hi]
      }

      connect_bd_net [get_bd_pins rx_rst_gen/interconnect_aresetn] \
                     [get_bd_pins axis_demuxer_$idx_hi/ARESETN] \
                     [get_bd_pins axis_demuxer_$idx_hi/S00_AXIS_ARESETN]

      connect_bd_net [get_bd_pins eth_cmac/gt_rxusrclk2] \
                     [get_bd_pins axis_demuxer_$idx_hi/ACLK] \
                     [get_bd_pins axis_demuxer_$idx_hi/S00_AXIS_ACLK]

      if {$AXIS_INTERCON_PARTS > 1} {
        connect_bd_net [get_bd_pins eth_cmac/gt_txusrclk2]            [get_bd_pins axis_muxer/S[format {%02d} $idx_hi]_AXIS_ACLK]
        connect_bd_net [get_bd_pins tx_rst_gen/interconnect_aresetn]  [get_bd_pins axis_muxer/S[format {%02d} $idx_hi]_AXIS_ARESETN]
        connect_bd_net [get_bd_pins gndx1/dout]                       [get_bd_pins axis_muxer/S[format {%02d} $idx_hi]_ARB_REQ_SUPPRESS]

        connect_bd_net [get_bd_pins eth_cmac/gt_rxusrclk2]            [get_bd_pins axis_demuxer/M[format {%02d} $idx_hi]_AXIS_ACLK]
        connect_bd_net [get_bd_pins rx_rst_gen/interconnect_aresetn]  [get_bd_pins axis_demuxer/M[format {%02d} $idx_hi]_AXIS_ARESETN]

        connect_bd_intf_net [get_bd_intf_pins axis_muxer_$idx_hi/M00_AXIS]   [get_bd_intf_pins axis_muxer/S[format {%02d} $idx_hi]_AXIS]
        connect_bd_intf_net [get_bd_intf_pins axis_demuxer_$idx_hi/S00_AXIS] [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx_hi]_AXIS]

        set demux_low_dest $idx
        if {$demux_low_dest  >= $CMAC_BRDG_CHANS_SGNL} {
          set demux_low_dest  [expr {$demux_low_dest  + $CMAC_BRDG_DEST_OFFS}]
        }
        set idx_up [expr {$idx+$intercon_chans-1}]
        set demux_high_dest $idx_up
        if {$demux_high_dest >= $CMAC_BRDG_CHANS_SGNL} {
          set demux_high_dest [expr {$demux_high_dest + $CMAC_BRDG_DEST_OFFS}]
        }
        puts "  At higher cascade: set demuxer dest $idx_hi of $AXIS_INTERCON_PARTS addr range: from $demux_low_dest (chan $idx) to $demux_high_dest (chan $idx_up)"
        set_property -dict [list \
          CONFIG.M[format {%02d} $idx_hi]_AXIS_BASETDEST [format {0x%02x} $demux_low_dest ] \
          CONFIG.M[format {%02d} $idx_hi]_AXIS_HIGHTDEST [format {0x%02x} $demux_high_dest] \
        ] [get_bd_cells axis_demuxer]
      }
    }

    # Extra FIFOs in NOC channels of muxers/demuxers
    # set_property -dict [list \
    #   CONFIG.S[format {%02d} $idx_lo]_FIFO_DEPTH {16} \
    #   CONFIG.S[format {%02d} $idx_lo]_FIFO_MODE {1} \
    # ] [get_bd_cells axis_muxer_$idx_hi]
    # set_property CONFIG.M[format {%02d} $idx_lo]_FIFO_DEPTH {16} [get_bd_cells axis_demuxer_$idx_hi]

    connect_bd_net [get_bd_ports sys_clk]                         [get_bd_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_AXIS_ACLK]
    connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_AXIS_ARESETN]
    if { $CMAC_BRDG_CHANS > 1 } {
    connect_bd_net [get_bd_pins gndx1/dout]                       [get_bd_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_ARB_REQ_SUPPRESS]
    }

    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 in_fifo_$idx
    set_property -dict [list \
      CONFIG.FIFO_DEPTH {32} \
    ] [get_bd_cells in_fifo_$idx]

    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 in_tx_conv_$idx
    set_property -dict [list \
      CONFIG.S_TDEST_WIDTH.VALUE_SRC USER \
      CONFIG.S_TDEST_WIDTH $AXIS_TDEST_WIDTH \
      CONFIG.M_HAS_TKEEP.VALUE_SRC USER \
      CONFIG.M_HAS_TKEEP {1} \
    ] [get_bd_cells in_tx_conv_$idx]
    connect_bd_net [get_bd_ports sys_clk]     [get_bd_pins in_fifo_$idx/s_axis_aclk]    [get_bd_pins in_tx_conv_$idx/aclk]
    connect_bd_net [get_bd_ports sys_rstn_in] [get_bd_pins in_fifo_$idx/s_axis_aresetn] [get_bd_pins in_tx_conv_$idx/aresetn]

    # make_bd_intf_pins_external [get_bd_intf_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_AXIS]
    # set_property name "s_axis${idx}" [get_bd_intf_ports S[format {%02d} $idx_lo]_AXIS_0]
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_$idx
    set_property -dict [list \
      CONFIG.HAS_TLAST 1 \
    ] [get_bd_intf_ports s_axis_$idx]
    if {$idx < $CMAC_BRDG_CHANS_SGNL} {
      set_property CONFIG.TDATA_NUM_BYTES $QSFP_BRDG_SGNL_BYTES [get_bd_intf_ports s_axis_$idx]
    } else {
      set_property CONFIG.TDATA_NUM_BYTES $QSFP_BRDG_CHAN_BYTES [get_bd_intf_ports s_axis_$idx]
    }
    # special width for odd channels (intended for delivery acknoledgement on even channels) if needed
    if {$idx % 2 != 0} {
      set_property CONFIG.TDATA_NUM_BYTES $QSFP_BRDG_ODCHI_BYTES [get_bd_intf_ports s_axis_$idx]
    }
    connect_bd_intf_net [get_bd_intf_pins in_fifo_$idx/S_AXIS]    [get_bd_intf_ports s_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins in_fifo_$idx/M_AXIS]    [get_bd_intf_pins  in_tx_conv_$idx/S_AXIS]
    connect_bd_intf_net [get_bd_intf_pins in_tx_conv_$idx/M_AXIS] [get_bd_intf_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_AXIS]
    make_bd_pins_external  [get_bd_pins in_tx_conv_$idx/s_axis_tdest]
    set_property name chan_tdest_$idx [get_bd_ports s_axis_tdest_0]

    # Delegation of TDEST value to upper level instead of constant assignment because of possibly different number of channels at recieving side
    # create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 in_dest_$idx
    # set_property -dict [ list \
    #   CONFIG.CONST_WIDTH $AXIS_TDEST_WIDTH \
    #   CONFIG.CONST_VAL $idx \
    # ] [get_bd_cells in_dest_$idx]
    # connect_bd_net [get_bd_pins in_dest_$idx/dout] [get_bd_pins in_fifo_$idx/s_axis_tdest]

    create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 inrdy_rst_$idx
    set_property -dict [list \
      CONFIG.C_OPERATION {and} \
      CONFIG.C_SIZE {1} \
    ] [get_bd_cells inrdy_rst_$idx]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Op1] [get_bd_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_AXIS_tready]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Op2] [get_bd_pins axis_muxer_$idx_hi/S[format {%02d} $idx_lo]_AXIS_ARESETN]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Res] [get_bd_pins in_fifo_$idx/m_axis_tready]

    connect_bd_net [get_bd_ports sys_clk]                         [get_bd_pins axis_demuxer_$idx_hi/M[format {%02d} $idx_lo]_AXIS_ACLK]
    connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins axis_demuxer_$idx_hi/M[format {%02d} $idx_lo]_AXIS_ARESETN]

    create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 out_fifo_$idx
    set_property -dict [list \
      CONFIG.FIFO_DEPTH {32} \
      CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
      CONFIG.HAS_TKEEP.VALUE_SRC USER \
      CONFIG.HAS_TKEEP {0} \
      CONFIG.HAS_TLAST.VALUE_SRC USER \
      CONFIG.HAS_TLAST {1} \
      CONFIG.TDEST_WIDTH.VALUE_SRC USER \
      CONFIG.TDEST_WIDTH {0} \
      CONFIG.FIFO_MODE {2} \
    ] [get_bd_cells out_fifo_$idx]
    if {$idx < $CMAC_BRDG_CHANS_SGNL} {
      set_property CONFIG.TDATA_NUM_BYTES $QSFP_BRDG_SGNL_BYTES [get_bd_cells out_fifo_$idx]
      set idx_dest $idx
    } else {
      set_property CONFIG.TDATA_NUM_BYTES $QSFP_BRDG_CHAN_BYTES [get_bd_cells out_fifo_$idx]
      set idx_dest [expr {$idx + $CMAC_BRDG_DEST_OFFS}]
    }
    # special width for odd channels (intended for delivery acknoledgement on even channels) if needed
    if {$idx % 2 != 0} {
      set_property CONFIG.TDATA_NUM_BYTES $QSFP_BRDG_ODCHO_BYTES [get_bd_cells out_fifo_$idx]
    }
    connect_bd_net [get_bd_ports sys_clk]                         [get_bd_pins out_fifo_$idx/s_axis_aclk]
    connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins out_fifo_$idx/s_axis_aresetn]

    # make_bd_intf_pins_external [get_bd_intf_pins axis_demuxer_$idx_hi/M[format {%02d} $idx_lo]_AXIS]
    # set_property name "m_axis${idx}" [get_bd_intf_ports M[format {%02d} $idx_lo]_AXIS_0]
    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0       m_axis_$idx
    connect_bd_intf_net [get_bd_intf_pins out_fifo_$idx/M_AXIS] [get_bd_intf_ports m_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins out_fifo_$idx/S_AXIS] [get_bd_intf_pins axis_demuxer_$idx_hi/M[format {%02d} $idx_lo]_AXIS]
    set_property -dict [list \
      CONFIG.M[format {%02d} $idx_lo]_AXIS_BASETDEST [format {0x%02x} $idx_dest] \
      CONFIG.M[format {%02d} $idx_lo]_AXIS_HIGHTDEST [format {0x%02x} $idx_dest] \
    ] [get_bd_cells axis_demuxer_$idx_hi]
  }

  create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 tx_fifo
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {256} \
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES $CMAC_USE_DAT_BYTES \
    CONFIG.HAS_TKEEP.VALUE_SRC USER \
    CONFIG.HAS_TKEEP {1} \
    CONFIG.HAS_TLAST.VALUE_SRC USER \
    CONFIG.HAS_TLAST {1} \
    CONFIG.TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.TDEST_WIDTH $AXIS_TDEST_WIDTH \
    CONFIG.FIFO_MODE {2} \
  ] [get_bd_cells tx_fifo]

  set tx_tdata_remap "tdest\[[expr {$AXIS_TDEST_WIDTH-1}]:0\],tkeep\[[expr {$CMAC_USE_DAT_BYTES-1}]:0\],tdata\[[expr {$CMAC_USE_DAT_BYTES*8-1}]:0\]"
  set tx_tkeep_remap ${CMAC_FULL_DAT_BYTES}'b
  for {set idx 0} {$idx < $CMAC_FULL_DAT_BYTES} {incr idx} {
    append tx_tkeep_remap {1}
  }
  create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 cmac_tx_conv
  set_property -dict [list \
    CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.S_TDATA_NUM_BYTES $CMAC_USE_DAT_BYTES \
    CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.M_TDATA_NUM_BYTES $CMAC_FULL_DAT_BYTES \
    CONFIG.S_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.S_TDEST_WIDTH $AXIS_TDEST_WIDTH \
    CONFIG.M_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.M_TDEST_WIDTH {0} \
    CONFIG.S_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.S_HAS_TKEEP {1} \
    CONFIG.M_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.M_HAS_TKEEP {1} \
    CONFIG.S_HAS_TLAST.VALUE_SRC USER \
    CONFIG.S_HAS_TLAST {1} \
    CONFIG.M_HAS_TLAST.VALUE_SRC USER \
    CONFIG.M_HAS_TLAST {1} \
    CONFIG.M_TUSER_WIDTH.VALUE_SRC USER \
    CONFIG.M_TUSER_WIDTH {1} \
    CONFIG.TDATA_REMAP $tx_tdata_remap \
    CONFIG.TKEEP_REMAP $tx_tkeep_remap \
    CONFIG.TUSER_REMAP {1'b0} \
  ] [get_bd_cells cmac_tx_conv]

  connect_bd_net [get_bd_pins tx_rst_gen/interconnect_aresetn] \
                 [get_bd_pins tx_fifo/s_axis_aresetn] \
                 [get_bd_pins cmac_tx_conv/aresetn]

  connect_bd_net [get_bd_pins eth_cmac/gt_txusrclk2] \
                 [get_bd_pins tx_fifo/s_axis_aclk] \
                 [get_bd_pins cmac_tx_conv/aclk]

  # set g_refport_freq [format {%0.0f} [expr {$g_eth100gb_freq*1000000+0.5}] ]
  # puts "PORT FREQUENCY: $g_refport_freq"
  make_bd_intf_pins_external [get_bd_intf_pins eth_cmac/gt_ref_clk]
  set_property name "qsfp_refck" [get_bd_intf_ports gt_ref_clk_0]
  # set_property -dict [ list \
  #  CONFIG.FREQ_HZ $g_refport_freq \
  # ] [get_bd_intf_ports qsfp_refck]

  make_bd_intf_pins_external [get_bd_intf_pins eth_cmac/gt_serial_port]
  set_property name "qsfp_4x" [get_bd_intf_ports gt_serial_port_0]

  set gt_loopback [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 gt_loopback ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
  ] $gt_loopback
  create_bd_port -dir I -from 2 -to 0 loopback_mode
  connect_bd_net [get_bd_ports loopback_mode] [get_bd_pins gt_loopback/In0]  [get_bd_pins gt_loopback/In1]  [get_bd_pins gt_loopback/In2]  [get_bd_pins gt_loopback/In3]
  connect_bd_net [get_bd_pins gt_loopback/dout] [get_bd_pins eth_cmac/gt_loopback_in]

  # Generate powerup reset signal
  set powerup_rst_gen [create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 powerup_rst_gen]
  set_property -dict [list \
    CONFIG.CE {true} \
    CONFIG.Output_Width {20} \
  ] [get_bd_cells powerup_rst_gen]
  connect_bd_net [get_bd_ports sys_clk] [get_bd_pins powerup_rst_gen/CLK]

  set powerup_rst [create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 powerup_rst]
  set_property -dict [list \
    CONFIG.DIN_FROM {19} \
    CONFIG.DIN_TO {19} \
    CONFIG.DIN_WIDTH {20} \
  ] [get_bd_cells powerup_rst]
  connect_bd_net [get_bd_pins powerup_rst_gen/Q] [get_bd_pins powerup_rst/Din]

  set powerup_rst_inv [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 powerup_rst_inv ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $powerup_rst_inv
  connect_bd_net [get_bd_pins powerup_rst_inv/Res] [get_bd_pins powerup_rst_gen/CE]

  set aur_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 aur_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $aur_rst_gen
  connect_bd_net [get_bd_ports sys_clk]         [get_bd_pins aur_rst_gen/slowest_sync_clk]
  connect_bd_net [get_bd_ports sys_rstn]        [get_bd_pins aur_rst_gen/ext_reset_in]
  connect_bd_net [get_bd_pins powerup_rst/Dout] [get_bd_pins aur_rst_gen/aux_reset_in] [get_bd_pins powerup_rst_inv/Op1]
  connect_bd_net [get_bd_pins gndx1/dout]       [get_bd_pins aur_rst_gen/mb_debug_sys_rst]
  connect_bd_net [get_bd_pins aur_rst_gen/bus_struct_reset] [get_bd_pins eth_cmac/sys_reset] \
                                                            [get_bd_pins eth_cmac/gtwiz_reset_tx_datapath] \
                                                            [get_bd_pins eth_cmac/gtwiz_reset_rx_datapath] 
  connect_bd_net [get_bd_pins aur_rst_gen/peripheral_reset] [get_bd_pins eth_cmac/core_drp_reset] \
                                                            [get_bd_pins eth_cmac/core_tx_reset] \
                                                            [get_bd_pins eth_cmac/core_rx_reset]
  connect_bd_net [get_bd_pins aur_rst_gen/mb_reset]         [get_bd_pins eth_cmac/ctl_rx_force_resync] \
                                                            [get_bd_pins mux_rst_gen/ext_reset_in] \
                                                            [get_bd_pins rx_rst_gen/ext_reset_in] \
                                                            [get_bd_pins tx_rst_gen/ext_reset_in] \
                                                            [get_bd_pins tx_rfi_gen/ext_reset_in]

  set aur_powergood [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 aur_powergood ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {and} \
   CONFIG.C_SIZE {4} \
  ] $aur_powergood
  connect_bd_net [get_bd_pins aur_powergood/Op1] [get_bd_pins eth_cmac/gt_powergoodout]
  connect_bd_net [get_bd_pins aur_powergood/Res] [get_bd_pins aur_rst_gen/dcm_locked] \
                                                 [get_bd_pins mux_rst_gen/dcm_locked] \
                                                 [get_bd_pins rx_rst_gen/dcm_locked] \
                                                 [get_bd_pins tx_rst_gen/dcm_locked] \
                                                 [get_bd_pins tx_rfi_gen/dcm_locked]

  set concat_aur_hi_ok [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_aur_hi_ok ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {2} \
  ] $concat_aur_hi_ok
  connect_bd_net [get_bd_pins concat_aur_hi_ok/In0] [get_bd_pins eth_cmac/stat_rx_status]
  connect_bd_net [get_bd_pins concat_aur_hi_ok/In1] [get_bd_pins eth_cmac/stat_rx_aligned]

  set and_aur_state [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 and_aur_state ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {and} \
   CONFIG.C_SIZE {2} \
  ] $and_aur_state
  connect_bd_net [get_bd_pins and_aur_state/Op1] [get_bd_pins concat_aur_hi_ok/dout]
  connect_bd_net [get_bd_pins and_aur_state/Res] [get_bd_pins mux_rst_gen/aux_reset_in] \
                                                 [get_bd_pins rx_rst_gen/aux_reset_in] \
                                                 [get_bd_pins tx_rst_gen/aux_reset_in]

  set concat_aur_lo_ok [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_aur_lo_ok ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {10} \
  ] $concat_aur_lo_ok
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In0] [get_bd_pins eth_cmac/stat_rx_hi_ber]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In1] [get_bd_pins eth_cmac/stat_rx_aligned_err]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In2] [get_bd_pins eth_cmac/stat_rx_misaligned]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In3] [get_bd_pins eth_cmac/stat_rx_local_fault]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In4] [get_bd_pins eth_cmac/stat_rx_internal_local_fault]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In5] [get_bd_pins eth_cmac/stat_rx_received_local_fault]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In6] [get_bd_pins eth_cmac/stat_rx_remote_fault]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In7] [get_bd_pins eth_cmac/stat_tx_local_fault]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In8] [get_bd_pins eth_cmac/usr_rx_reset]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In9] [get_bd_pins eth_cmac/usr_tx_reset]

  set or_aur_state [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 or_aur_state ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {10} \
  ] $or_aur_state
  connect_bd_net [get_bd_pins or_aur_state/Op1] [get_bd_pins concat_aur_lo_ok/dout]
  connect_bd_net [get_bd_pins or_aur_state/Res] [get_bd_pins mux_rst_gen/mb_debug_sys_rst] \
                                                [get_bd_pins rx_rst_gen/mb_debug_sys_rst] \
                                                [get_bd_pins tx_rst_gen/mb_debug_sys_rst]

  connect_bd_intf_net [get_bd_intf_pins cmac_tx_conv/M_AXIS] [get_bd_intf_pins eth_cmac/axis_tx]
  connect_bd_intf_net [get_bd_intf_pins cmac_tx_conv/S_AXIS] [get_bd_intf_pins tx_fifo/M_AXIS]

  make_bd_intf_pins_external [get_bd_intf_pins eth_cmac/axis_rx]
  set_property name m_axis_cmac_rx [get_bd_intf_ports axis_rx_0]

  if {$AXIS_INTERCON_PARTS > 1} {
    connect_bd_intf_net        [get_bd_intf_pins axis_muxer/M00_AXIS]   [get_bd_intf_pins tx_fifo/S_AXIS]     
    make_bd_intf_pins_external [get_bd_intf_pins axis_demuxer/S00_AXIS]
  } else {
    connect_bd_intf_net        [get_bd_intf_pins axis_muxer_0/M00_AXIS] [get_bd_intf_pins tx_fifo/S_AXIS]     
    make_bd_intf_pins_external [get_bd_intf_pins axis_demuxer_0/S00_AXIS]
  }

  set_property name s_axis_demux_rx [get_bd_intf_ports S00_AXIS_0]
  set_property -dict [list \
    CONFIG.TDATA_NUM_BYTES $CMAC_USE_DAT_BYTES \
    CONFIG.HAS_TKEEP {1} \
    CONFIG.HAS_TLAST {1} \
    CONFIG.TDEST_WIDTH $AXIS_TDEST_WIDTH \
  ] [get_bd_intf_ports s_axis_demux_rx]

  set_property -dict [list \
    CONFIG.ASSOCIATED_RESET "qsfp_rstn" \
    CONFIG.ASSOCIATED_BUSIF "m_axis_cmac_rx:s_axis_demux_rx" \
  ] [get_bd_ports qsfp_clk]

if {[info exists g_cmac_ila] &&
                $g_cmac_ila != "0"} {
  create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 rx_axis_ila
  set_property -dict [list \
    CONFIG.C_DATA_DEPTH {2048} \
    CONFIG.C_NUM_MONITOR_SLOTS {2} \
    CONFIG.C_SLOT {0} \
    CONFIG.C_SLOT {1} \
    CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
    CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  ] [get_bd_cells rx_axis_ila]
  connect_bd_intf_net [get_bd_intf_pins rx_axis_ila/SLOT_0_AXIS] [get_bd_intf_pins eth_cmac/axis_rx]
  connect_bd_intf_net [get_bd_intf_pins rx_axis_ila/SLOT_1_AXIS] [get_bd_intf_ports s_axis_demux_rx]
  connect_bd_net [get_bd_pins rx_axis_ila/clk]    [get_bd_pins eth_cmac/gt_rxusrclk2]
  connect_bd_net [get_bd_pins rx_axis_ila/resetn] [get_bd_pins rx_rst_gen/interconnect_aresetn]

  create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 tx_axis_ila
  set_property -dict [list \
    CONFIG.C_DATA_DEPTH {2048} \
    CONFIG.C_NUM_MONITOR_SLOTS {2} \
    CONFIG.C_SLOT {0} \
    CONFIG.C_SLOT {1} \
    CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
    CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  ] [get_bd_cells tx_axis_ila]
  connect_bd_intf_net [get_bd_intf_pins tx_axis_ila/SLOT_0_AXIS] [get_bd_intf_pins eth_cmac/axis_tx]
  connect_bd_intf_net [get_bd_intf_pins tx_axis_ila/SLOT_1_AXIS] [get_bd_intf_pins cmac_tx_conv/S_AXIS]
  connect_bd_net [get_bd_pins tx_axis_ila/clk]    [get_bd_pins eth_cmac/gt_txusrclk2]
  connect_bd_net [get_bd_pins tx_axis_ila/resetn] [get_bd_pins tx_rst_gen/interconnect_aresetn]
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_axistx_cmac_bridge()

cr_bd_axistx_cmac_bridge ""
