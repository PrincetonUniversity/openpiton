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
proc cr_bd_axistx_aurora_bridge { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name axistx_aurora_bridge

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

  global AXIST_AUR_CHANS
  global AXIS_AUR_BYTES

  # Create IPs of Xilix AXI-stream interconnect (axis_muxer with True Round-Robin arbitration of AXISt packets)
  set axis_muxer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_muxer]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI $AXIST_AUR_CHANS \
    CONFIG.ARB_ALGORITHM {3} \
    CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} \
    CONFIG.ARB_ON_TLAST {1} \
    CONFIG.ARB_ON_MAX_XFERS {0} \
    CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
    CONFIG.XBAR_TDATA_NUM_BYTES {31} \
  ] [get_bd_cells axis_muxer]

  # Create IPs of Xilix AXI-stream interconnect
  set axis_demuxer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_demuxer]
  set_property -dict [list \
    CONFIG.NUM_MI $AXIST_AUR_CHANS \
  ] [get_bd_cells axis_demuxer]

  # Create instance: gndx1, and set properties
  set gndx1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gndx1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
  ] $gndx1

  # Create instance: vccx1, and set properties
  set vccx1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vccx1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
  ] $vccx1

  # Create instance: aurora_64b66b, and set properties
  global g_board_part
  global g_eth_port
  if { ${g_board_part} eq "u280" } {
    set g_eth100gb_freq "156.25"
    if { ${g_eth_port} eq "qsfp0" } {
      set g_quad_loc      "Quad_X0Y10"
      set g_lane1_loc     "X0Y40"
    }
    if { ${g_eth_port} eq "qsfp1" } {
      set g_quad_loc      "Quad_X0Y11"
      set g_lane1_loc     "X0Y44"
    }
  }
  if { ${g_board_part} eq "u55c" } {
    set g_eth100gb_freq "161.1328125"
    if { ${g_eth_port} eq "qsfp0" } {
      set g_quad_loc      "Quad_X0Y6"
      set g_lane1_loc     "X0Y24"
    }
    if { ${g_eth_port} eq "qsfp1" } {
      set g_quad_loc      "Quad_X0Y7"
      set g_lane1_loc     "X0Y28"
    }
  }
  set aurora_inst [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:13.0 aurora_inst ]
  set_property -dict [ list \
   CONFIG.C_AURORA_LANES {4} \
   CONFIG.C_REFCLK_FREQUENCY $g_eth100gb_freq \
   CONFIG.C_START_LANE $g_lane1_loc \
   CONFIG.C_START_QUAD $g_quad_loc \
   CONFIG.C_UCOLUMN_USED {left} \
   CONFIG.SupportLevel {1} \
   CONFIG.drp_mode {Disabled} \
  ] $aurora_inst
  set_property USER_COMMENTS.comment_1 "pma_init resets both serial GT and Aurora: https://docs.xilinx.com/r/en-US/pg074-aurora-64b66b/Reset"   [get_bd_pins /aurora_inst/pma_init]
  set_property USER_COMMENTS.comment_2 "https://www.xilinx.com/support/documentation/user_guides/ug578-ultrascale-gty-transceivers.pdf#page=88" [get_bd_pins /aurora_inst/loopback]
  connect_bd_net [get_bd_pins gndx1/dout] [get_bd_pins aurora_inst/power_down] [get_bd_pins aurora_inst/gt_rxcdrovrden_in]
  make_bd_pins_external         [get_bd_pins aurora_inst/user_clk_out]
  set_property name "aur_clk"   [get_bd_ports user_clk_out_0]

  global sys_clk_freq
  set sys_rstn [ create_bd_port -dir I -type rst sys_rstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
  ] $sys_rstn
  make_bd_pins_external         [get_bd_pins aurora_inst/init_clk]
  set_property name "sys_clk"   [get_bd_ports init_clk_0]
  set_property -dict [list CONFIG.ASSOCIATED_RESET sys_rstn CONFIG.FREQ_HZ $sys_clk_freq] [get_bd_ports sys_clk]

  set mux_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 mux_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $mux_rst_gen
  connect_bd_net [get_bd_ports sys_clk]                  [get_bd_pins mux_rst_gen/slowest_sync_clk]
  connect_bd_net [get_bd_pins aurora_inst/gt_pll_lock]   [get_bd_pins mux_rst_gen/dcm_locked]
  connect_bd_net [get_bd_pins aurora_inst/sys_reset_out] [get_bd_pins mux_rst_gen/ext_reset_in]
  make_bd_pins_external                                  [get_bd_pins mux_rst_gen/peripheral_aresetn]
  set_property name "sys_rstn_out"                       [get_bd_ports peripheral_aresetn_0]

  set txrx_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 txrx_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $txrx_rst_gen
  connect_bd_net [get_bd_pins aurora_inst/user_clk_out]  [get_bd_pins txrx_rst_gen/slowest_sync_clk]
  connect_bd_net [get_bd_pins aurora_inst/gt_pll_lock]   [get_bd_pins txrx_rst_gen/dcm_locked]
  connect_bd_net [get_bd_pins aurora_inst/sys_reset_out] [get_bd_pins txrx_rst_gen/ext_reset_in]
  make_bd_pins_external                                  [get_bd_pins txrx_rst_gen/peripheral_aresetn]
  set_property name "aur_rstn"                           [get_bd_ports peripheral_aresetn_0]

  for {set idx 0} {$idx < $AXIST_AUR_CHANS} {incr idx} {
    set_property -dict [list \
      CONFIG.S[format {%02d} $idx]_FIFO_DEPTH {16} \
      CONFIG.S[format {%02d} $idx]_FIFO_MODE {1} \
    ] [get_bd_cells axis_muxer]

    set_property CONFIG.M[format {%02d} $idx]_FIFO_DEPTH {16} [get_bd_cells axis_demuxer]

    connect_bd_net [get_bd_ports sys_clk]                         [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_ACLK]
    connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_ARESETN]
    if { $AXIST_AUR_CHANS > 1 } {
    connect_bd_net [get_bd_pins gndx1/dout]                       [get_bd_pins axis_muxer/S[format {%02d} $idx]_ARB_REQ_SUPPRESS]
    }

    set in_fifo_$idx [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 in_fifo_$idx]
    set_property -dict [list \
      CONFIG.FIFO_DEPTH {64} \
      CONFIG.TDEST_WIDTH.VALUE_SRC USER \
      CONFIG.TDEST_WIDTH 8 \
    ] [get_bd_cells in_fifo_$idx]
    connect_bd_net [get_bd_ports sys_clk]  [get_bd_pins in_fifo_$idx/s_axis_aclk]
    connect_bd_net [get_bd_ports sys_rstn] [get_bd_pins in_fifo_$idx/s_axis_aresetn]

    # make_bd_intf_pins_external [get_bd_intf_pins axis_muxer/S[format {%02d} $idx]_AXIS]
    # set_property name "s_axis${idx}" [get_bd_intf_ports S[format {%02d} $idx]_AXIS_0]
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0                                s_axis_$idx
    set_property -dict [list CONFIG.HAS_TLAST 1 CONFIG.TDATA_NUM_BYTES $AXIS_AUR_BYTES] [get_bd_intf_ports s_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins in_fifo_$idx/S_AXIS] [get_bd_intf_ports                          s_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins in_fifo_$idx/M_AXIS] [get_bd_intf_pins axis_muxer/S[format {%02d} $idx]_AXIS]

    set in_dest_$idx [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 in_dest_$idx]
    set_property -dict [ list \
      CONFIG.CONST_WIDTH {8} \
      CONFIG.CONST_VAL $idx \
    ] [get_bd_cells in_dest_$idx]
    connect_bd_net [get_bd_pins in_dest_$idx/dout] [get_bd_pins in_fifo_$idx/s_axis_tdest]

    set inrdy_rst_$idx [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 inrdy_rst_$idx ]
    set_property -dict [list \
      CONFIG.C_OPERATION {and} \
      CONFIG.C_SIZE {1} \
    ] [get_bd_cells inrdy_rst_$idx]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Op1] [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_tready]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Op2] [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_ARESETN]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Res] [get_bd_pins in_fifo_$idx/m_axis_tready]

    connect_bd_net [get_bd_ports sys_clk]                         [get_bd_pins axis_demuxer/M[format {%02d} $idx]_AXIS_ACLK]
    connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins axis_demuxer/M[format {%02d} $idx]_AXIS_ARESETN]

    set out_fifo_$idx [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 out_fifo_$idx]
    set_property -dict [list \
      CONFIG.FIFO_DEPTH {64} \
      CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
      CONFIG.TDATA_NUM_BYTES $AXIS_AUR_BYTES \
      CONFIG.HAS_TKEEP.VALUE_SRC USER \
      CONFIG.HAS_TKEEP {1} \
      CONFIG.HAS_TLAST.VALUE_SRC USER \
      CONFIG.HAS_TLAST {1} \
      CONFIG.TDEST_WIDTH.VALUE_SRC USER \
      CONFIG.TDEST_WIDTH 8 \
      CONFIG.FIFO_MODE {2} \
    ] [get_bd_cells out_fifo_$idx]
    connect_bd_net [get_bd_ports sys_clk]                         [get_bd_pins out_fifo_$idx/s_axis_aclk]
    connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins out_fifo_$idx/s_axis_aresetn]

    # make_bd_intf_pins_external [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx]_AXIS]
    # set_property name "m_axis${idx}" [get_bd_intf_ports M[format {%02d} $idx]_AXIS_0]
    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0       m_axis_$idx
    connect_bd_intf_net [get_bd_intf_pins out_fifo_$idx/M_AXIS] [get_bd_intf_ports m_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins out_fifo_$idx/S_AXIS] [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx]_AXIS]
  }

  set tx_fifo [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 tx_fifo]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {256} \
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES {31} \
    CONFIG.HAS_TKEEP.VALUE_SRC USER \
    CONFIG.HAS_TKEEP {1} \
    CONFIG.HAS_TLAST.VALUE_SRC USER \
    CONFIG.HAS_TLAST {1} \
    CONFIG.TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.TDEST_WIDTH 8 \
  ] [get_bd_cells tx_fifo]

  set rx_fifo [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 rx_fifo]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {256} \
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES {31} \
    CONFIG.HAS_TKEEP.VALUE_SRC USER \
    CONFIG.HAS_TKEEP {1} \
    CONFIG.HAS_TLAST.VALUE_SRC USER \
    CONFIG.HAS_TLAST {1} \
    CONFIG.TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.TDEST_WIDTH 8 \
    CONFIG.HAS_PROG_FULL {1} \
    CONFIG.PROG_FULL_THRESH {128} \
  ] [get_bd_cells rx_fifo]

  set fc_tx_flop [create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 fc_tx_flop]
  set_property -dict [list \
    CONFIG.CE {true} \
    CONFIG.Load {true} \
    CONFIG.Output_Width {1} \
    CONFIG.SCLR {true} \
  ] [get_bd_cells fc_tx_flop]
  connect_bd_net [get_bd_pins fc_tx_flop/L] [get_bd_pins rx_fifo/prog_full]

  set fc_rx_flop [create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 fc_rx_flop]
  set_property -dict [list \
    CONFIG.CE {true} \
    CONFIG.Load {true} \
    CONFIG.Output_Width {1} \
    CONFIG.SCLR {true} \
  ] [get_bd_cells fc_rx_flop]

  connect_bd_net [get_bd_pins txrx_rst_gen/bus_struct_reset] [get_bd_pins fc_tx_flop/SCLR] [get_bd_pins fc_rx_flop/SCLR]

  set fc_diff [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 fc_diff ]
    set_property -dict [list \
      CONFIG.C_OPERATION {xor} \
      CONFIG.C_SIZE {1} \
  ] [get_bd_cells fc_diff]
  connect_bd_net [get_bd_pins fc_diff/Op1] [get_bd_pins rx_fifo/prog_full]
  connect_bd_net [get_bd_pins fc_diff/Op2] [get_bd_pins fc_tx_flop/Q]

  set fc_wr [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 fc_wr ]
    set_property -dict [list \
      CONFIG.C_OPERATION {and} \
      CONFIG.C_SIZE {1} \
  ] [get_bd_cells fc_wr]
  connect_bd_net [get_bd_pins fc_wr/Res] [get_bd_pins fc_tx_flop/CE] [get_bd_pins fc_tx_flop/LOAD]
  connect_bd_net [get_bd_pins fc_wr/Op1] [get_bd_pins fc_diff/Res]

  set fc_inject_fifo [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 fc_inject_fifo]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {16} \
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES {0} \
    CONFIG.TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.TDEST_WIDTH {1} \
  ] [get_bd_cells fc_inject_fifo]
  connect_bd_net [get_bd_pins fc_inject_fifo/s_axis_tvalid] [get_bd_pins fc_diff/Res]
  connect_bd_net [get_bd_pins fc_inject_fifo/s_axis_tready] [get_bd_pins fc_wr/Op2]
  connect_bd_net [get_bd_pins fc_inject_fifo/s_axis_tdest]  [get_bd_pins rx_fifo/prog_full]

  set fc_injector [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 fc_injector]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {2} \
    CONFIG.ARB_ALGORITHM {1} \
    CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} \
    CONFIG.ARB_ON_TLAST {1} \
    CONFIG.ARB_ON_MAX_XFERS {0} \
    CONFIG.M00_FIFO_DEPTH {16} \
    CONFIG.M00_FIFO_MODE {1} \
  ] [get_bd_cells fc_injector]
  connect_bd_net [get_bd_pins fc_injector/S00_ARB_REQ_SUPPRESS] [get_bd_pins gndx1/dout] 
  connect_bd_net [get_bd_pins fc_injector/S01_ARB_REQ_SUPPRESS] [get_bd_pins fc_rx_flop/Q]

  set fc_inject_conv [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 fc_inject_conv]
  set_property -dict [list \
    CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.S_TDATA_NUM_BYTES {0} \
    CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.M_TDATA_NUM_BYTES {31} \
    CONFIG.TDATA_REMAP {248'b0} \
    CONFIG.S_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.S_HAS_TKEEP {0} \
    CONFIG.M_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.M_HAS_TKEEP {1} \
    CONFIG.TKEEP_REMAP {31'b0} \
    CONFIG.S_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.S_TDEST_WIDTH {1} \
    CONFIG.M_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.M_TDEST_WIDTH {8} \
    CONFIG.TDEST_REMAP {7'b1000000,tdest[0:0]} \
    CONFIG.S_HAS_TLAST.VALUE_SRC USER \
    CONFIG.S_HAS_TLAST {0} \
    CONFIG.M_HAS_TLAST.VALUE_SRC USER \
    CONFIG.M_HAS_TLAST {1} \
    CONFIG.TLAST_REMAP {1'b1} \
  ] [get_bd_cells fc_inject_conv]
  connect_bd_intf_net [get_bd_intf_pins fc_inject_conv/S_AXIS] [get_bd_intf_pins fc_inject_fifo/M_AXIS]
  connect_bd_intf_net [get_bd_intf_pins fc_inject_conv/M_AXIS] [get_bd_intf_pins fc_injector/S00_AXIS]

  set fc_extract_fifo [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 fc_extract_fifo]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {16} \
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES {0} \
    CONFIG.TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.TDEST_WIDTH {1} \
  ] [get_bd_cells fc_extract_fifo]
  connect_bd_net [get_bd_pins fc_extract_fifo/m_axis_tready] [get_bd_pins vccx1/dout]
  connect_bd_net [get_bd_pins fc_extract_fifo/m_axis_tvalid] [get_bd_pins fc_rx_flop/CE] [get_bd_pins fc_rx_flop/LOAD]
  connect_bd_net [get_bd_pins fc_extract_fifo/m_axis_tdest]  [get_bd_pins fc_rx_flop/L]

  set fc_extractor [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 fc_extractor]
  set_property -dict [list \
    CONFIG.NUM_MI {2} \
    CONFIG.M00_AXIS_BASETDEST {0x0} \
    CONFIG.M00_AXIS_HIGHTDEST {0x7F} \
    CONFIG.M01_AXIS_BASETDEST {0x80} \
    CONFIG.M01_AXIS_HIGHTDEST {0x0FF} \
    CONFIG.S00_FIFO_DEPTH {16} \
  ] [get_bd_cells fc_extractor]

  set fc_extract_conv [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 fc_extract_conv]
  set_property -dict [list \
    CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.S_TDATA_NUM_BYTES {31} \
    CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.M_TDATA_NUM_BYTES {0} \
    CONFIG.S_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.S_HAS_TKEEP {1} \
    CONFIG.M_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.M_HAS_TKEEP {0} \
    CONFIG.S_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.S_TDEST_WIDTH {8} \
    CONFIG.M_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.M_TDEST_WIDTH {1} \
    CONFIG.TDEST_REMAP {tdest[0:0]} \
    CONFIG.S_HAS_TLAST.VALUE_SRC USER \
    CONFIG.S_HAS_TLAST {1} \
    CONFIG.M_HAS_TLAST.VALUE_SRC USER \
    CONFIG.M_HAS_TLAST {0} \
  ] [get_bd_cells fc_extract_conv]
  connect_bd_intf_net [get_bd_intf_pins fc_extract_conv/S_AXIS] [get_bd_intf_pins fc_extractor/M01_AXIS]
  connect_bd_intf_net [get_bd_intf_pins fc_extract_conv/M_AXIS] [get_bd_intf_pins fc_extract_fifo/S_AXIS]

  set tx_tdata_remap {tdest[7:0]}
  for {set idx 0} {$idx < 248} {incr idx} {
    append tx_tdata_remap {,tdata[} $idx {]}
  }
  set tx_tkeep_remap {1'b1}
  for {set idx 0} {$idx < 31} {incr idx} {
    append tx_tkeep_remap {,tkeep[} $idx {]}
  }
  set aur_tx_conv [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 aur_tx_conv]
  set_property -dict [list \
    CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.S_TDATA_NUM_BYTES {31} \
    CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.M_TDATA_NUM_BYTES {32} \
    CONFIG.S_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.S_TDEST_WIDTH {8} \
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
    CONFIG.TDATA_REMAP $tx_tdata_remap \
    CONFIG.TKEEP_REMAP $tx_tkeep_remap \
  ] [get_bd_cells aur_tx_conv]

  set rx_tdata_remap {tdata[0]}
  for {set idx 1} {$idx < 248} {incr idx} {
    append rx_tdata_remap {,tdata[} $idx {]}
  }
  set rx_tkeep_remap {tkeep[0]}
  for {set idx 1} {$idx < 31} {incr idx} {
    append rx_tkeep_remap {,tkeep[} $idx {]}
  }
  set aur_rx_conv [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_subset_converter:1.1 aur_rx_conv]
  set_property -dict [list \
    CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.S_TDATA_NUM_BYTES {32} \
    CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.M_TDATA_NUM_BYTES {31} \
    CONFIG.S_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.S_TDEST_WIDTH {0} \
    CONFIG.M_TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.M_TDEST_WIDTH {8} \
    CONFIG.S_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.S_HAS_TKEEP {1} \
    CONFIG.M_HAS_TKEEP.VALUE_SRC USER \
    CONFIG.M_HAS_TKEEP {1} \
    CONFIG.S_HAS_TLAST.VALUE_SRC USER \
    CONFIG.S_HAS_TLAST {1} \
    CONFIG.M_HAS_TLAST.VALUE_SRC USER \
    CONFIG.M_HAS_TLAST {1} \
    CONFIG.S_HAS_TREADY.VALUE_SRC USER \
    CONFIG.S_HAS_TREADY {0} \
    CONFIG.M_HAS_TREADY.VALUE_SRC USER \
    CONFIG.M_HAS_TREADY {1} \
    CONFIG.TDATA_REMAP $rx_tdata_remap \
    CONFIG.TKEEP_REMAP $rx_tkeep_remap \
    CONFIG.TDEST_REMAP {tdata[255:248]} \
  ] [get_bd_cells aur_rx_conv]

  make_bd_pins_external  [get_bd_pins aur_rx_conv/transfer_dropped]
  set_property name "rx_overflow" [get_bd_ports transfer_dropped_0]

  # setting Near-End PMA Loopback mode (0x2)
  # set const3h2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const3h2 ]
  # set_property -dict [list \
  #   CONFIG.CONST_WIDTH {3} \
  #   CONFIG.CONST_VAL {2} \
  # ] $const3h2
  # connect_bd_net [get_bd_pins const3h2/dout] [get_bd_pins aurora_inst/loopback] 

  set g_refport_freq [format {%0.0f} [expr {$g_eth100gb_freq*1000000+0.5}] ]
  puts "PORT FREQUENCY: $g_refport_freq"
  make_bd_intf_pins_external [get_bd_intf_pins aurora_inst/GT_DIFF_REFCLK1]
  set_property name "qsfp_refck" [get_bd_intf_ports GT_DIFF_REFCLK1_0]
  set_property -dict [ list \
   CONFIG.FREQ_HZ $g_refport_freq \
  ] [get_bd_intf_ports qsfp_refck]

  make_bd_intf_pins_external [get_bd_intf_pins aurora_inst/GT_SERIAL_TX]
  make_bd_intf_pins_external [get_bd_intf_pins aurora_inst/GT_SERIAL_RX]
  set_property name "qsfp_tx_4x" [get_bd_intf_ports GT_SERIAL_TX_0]
  set_property name "qsfp_rx_4x" [get_bd_intf_ports GT_SERIAL_RX_0]

  make_bd_pins_external [get_bd_pins aurora_inst/loopback]
  set_property name "aur_loopback" [get_bd_ports loopback_0]

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
  connect_bd_net [get_bd_ports sys_clk]          [get_bd_pins aur_rst_gen/slowest_sync_clk]
  connect_bd_net [get_bd_ports sys_rstn]         [get_bd_pins aur_rst_gen/ext_reset_in]
  connect_bd_net [get_bd_pins powerup_rst/Dout]  [get_bd_pins aur_rst_gen/aux_reset_in] [get_bd_pins powerup_rst_inv/Op1]
  connect_bd_net [get_bd_pins gndx1/dout] [get_bd_pins aur_rst_gen/mb_debug_sys_rst]
  connect_bd_net [get_bd_pins aur_rst_gen/bus_struct_reset] [get_bd_pins aurora_inst/pma_init]
  connect_bd_net [get_bd_pins aur_rst_gen/mb_reset]         [get_bd_pins aurora_inst/reset_pb]

  set aur_powergood [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 aur_powergood ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {and} \
   CONFIG.C_SIZE {4} \
  ] $aur_powergood
  connect_bd_net [get_bd_pins aur_powergood/Op1] [get_bd_pins aurora_inst/gt_powergood]
  connect_bd_net [get_bd_pins aur_powergood/Res] [get_bd_pins aur_rst_gen/dcm_locked]

  connect_bd_net [get_bd_pins txrx_rst_gen/interconnect_aresetn] \
                 [get_bd_pins axis_muxer/ARESETN] \
                 [get_bd_pins axis_muxer/M00_AXIS_ARESETN] \
                 [get_bd_pins axis_demuxer/ARESETN] \
                 [get_bd_pins axis_demuxer/S00_AXIS_ARESETN] \
                 [get_bd_pins tx_fifo/s_axis_aresetn] \
                 [get_bd_pins rx_fifo/s_axis_aresetn] \
                 [get_bd_pins fc_inject_fifo/s_axis_aresetn] \
                 [get_bd_pins fc_extract_fifo/s_axis_aresetn] \
                 [get_bd_pins fc_injector/ARESETN] \
                 [get_bd_pins fc_injector/M00_AXIS_ARESETN] \
                 [get_bd_pins fc_injector/S00_AXIS_ARESETN] \
                 [get_bd_pins fc_injector/S01_AXIS_ARESETN] \
                 [get_bd_pins fc_extractor/ARESETN] \
                 [get_bd_pins fc_extractor/S00_AXIS_ARESETN] \
                 [get_bd_pins fc_extractor/M00_AXIS_ARESETN] \
                 [get_bd_pins fc_extractor/M01_AXIS_ARESETN] \
                 [get_bd_pins fc_inject_conv/aresetn] \
                 [get_bd_pins fc_extract_conv/aresetn] \
                 [get_bd_pins aur_tx_conv/aresetn] \
                 [get_bd_pins aur_rx_conv/aresetn]

  connect_bd_net [get_bd_pins aurora_inst/user_clk_out] \
                 [get_bd_pins axis_muxer/ACLK] \
                 [get_bd_pins axis_muxer/M00_AXIS_ACLK] \
                 [get_bd_pins axis_demuxer/ACLK] \
                 [get_bd_pins axis_demuxer/S00_AXIS_ACLK] \
                 [get_bd_pins tx_fifo/s_axis_aclk] \
                 [get_bd_pins rx_fifo/s_axis_aclk] \
                 [get_bd_pins fc_inject_fifo/s_axis_aclk] \
                 [get_bd_pins fc_extract_fifo/s_axis_aclk] \
                 [get_bd_pins fc_injector/ACLK] \
                 [get_bd_pins fc_injector/M00_AXIS_ACLK] \
                 [get_bd_pins fc_injector/S00_AXIS_ACLK] \
                 [get_bd_pins fc_injector/S01_AXIS_ACLK] \
                 [get_bd_pins fc_extractor/ACLK] \
                 [get_bd_pins fc_extractor/S00_AXIS_ACLK] \
                 [get_bd_pins fc_extractor/M00_AXIS_ACLK] \
                 [get_bd_pins fc_extractor/M01_AXIS_ACLK] \
                 [get_bd_pins fc_inject_conv/aclk] \
                 [get_bd_pins fc_extract_conv/aclk] \
                 [get_bd_pins fc_tx_flop/CLK] \
                 [get_bd_pins fc_rx_flop/CLK] \
                 [get_bd_pins aur_tx_conv/aclk] \
                 [get_bd_pins aur_rx_conv/aclk]

  set concat_aur_hi_ok [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_aur_hi_ok ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
  ] $concat_aur_hi_ok
  connect_bd_net [get_bd_pins concat_aur_hi_ok/In0] [get_bd_pins aurora_inst/gt_powergood]
  connect_bd_net [get_bd_pins concat_aur_hi_ok/In1] [get_bd_pins aurora_inst/lane_up]
  connect_bd_net [get_bd_pins concat_aur_hi_ok/In2] [get_bd_pins aurora_inst/channel_up]
  connect_bd_net [get_bd_pins concat_aur_hi_ok/In3] [get_bd_pins aurora_inst/gt_qplllock_quad1_out]

  set and_aur_state [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 and_aur_state ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {and} \
   CONFIG.C_SIZE {10} \
  ] $and_aur_state
  connect_bd_net [get_bd_pins and_aur_state/Op1] [get_bd_pins concat_aur_hi_ok/dout]
  connect_bd_net [get_bd_pins and_aur_state/Res] [get_bd_pins mux_rst_gen/aux_reset_in] [get_bd_pins txrx_rst_gen/aux_reset_in]

  set concat_aur_lo_ok [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_aur_lo_ok ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
  ] $concat_aur_lo_ok
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In0] [get_bd_pins aurora_inst/gt_reset_out]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In1] [get_bd_pins aurora_inst/link_reset_out]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In2] [get_bd_pins aurora_inst/mmcm_not_locked_out]
  connect_bd_net [get_bd_pins concat_aur_lo_ok/In3] [get_bd_pins aurora_inst/gt_qpllrefclklost_quad1_out]

  set or_aur_state [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 or_aur_state ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {4} \
  ] $or_aur_state
  connect_bd_net [get_bd_pins or_aur_state/Op1] [get_bd_pins concat_aur_lo_ok/dout]
  connect_bd_net [get_bd_pins or_aur_state/Res] [get_bd_pins mux_rst_gen/mb_debug_sys_rst] [get_bd_pins txrx_rst_gen/mb_debug_sys_rst]

  connect_bd_intf_net [get_bd_intf_pins aur_tx_conv/M_AXIS] [get_bd_intf_pins aurora_inst/USER_DATA_S_AXIS_TX]
  connect_bd_intf_net [get_bd_intf_pins aur_rx_conv/S_AXIS] [get_bd_intf_pins aurora_inst/USER_DATA_M_AXIS_RX]
  connect_bd_intf_net [get_bd_intf_pins aur_tx_conv/S_AXIS] [get_bd_intf_pins fc_injector/M00_AXIS]
  connect_bd_intf_net [get_bd_intf_pins aur_rx_conv/M_AXIS] [get_bd_intf_pins fc_extractor/S00_AXIS]
  connect_bd_intf_net [get_bd_intf_pins rx_fifo/S_AXIS]     [get_bd_intf_pins fc_extractor/M00_AXIS]
  connect_bd_intf_net [get_bd_intf_pins rx_fifo/M_AXIS]     [get_bd_intf_pins axis_demuxer/S00_AXIS]
  connect_bd_intf_net [get_bd_intf_pins tx_fifo/M_AXIS]     [get_bd_intf_pins fc_injector/S01_AXIS]
  connect_bd_intf_net [get_bd_intf_pins tx_fifo/S_AXIS]     [get_bd_intf_pins axis_muxer/M00_AXIS]

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_axistx_aurora_bridge()

cr_bd_axistx_aurora_bridge ""
