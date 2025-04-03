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
proc cr_bd_nocs_aurora_bridge { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name nocs_aurora_bridge

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

  set NOC_CHANS [expr $::env(PITON_NUM_TILES) * 3]

  # Create IPs of Xilix AXI-stream interconnect (axis_muxer with True Round-Robin arbitration of NOC packets)
  set axis_muxer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_muxer]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI $NOC_CHANS \
    CONFIG.ARB_ALGORITHM {3} \
    CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} \
    CONFIG.ARB_ON_TLAST {1} \
    CONFIG.ARB_ON_MAX_XFERS {0} \
  ] [get_bd_cells axis_muxer]

  # Create IPs of Xilix AXI-stream interconnect
  set axis_demuxer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_demuxer]
  set_property -dict [list \
    CONFIG.NUM_MI $NOC_CHANS \
  ] [get_bd_cells axis_demuxer]


  set noc_rstn [ create_bd_port -dir I -type rst noc_rstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $noc_rstn
  # make_bd_pins_external         [get_bd_pins axis_muxer/S00_AXIS_ARESETN]
  # set_property name "noc_rstn"  [get_bd_ports S00_AXIS_ARESETN_0]
  make_bd_pins_external         [get_bd_pins axis_muxer/S00_AXIS_ACLK]
  set_property name "noc_clk"   [get_bd_ports S00_AXIS_ACLK_0]
  set_property -dict [list CONFIG.ASSOCIATED_RESET noc_rstn CONFIG.FREQ_HZ {50000000}] [get_bd_ports noc_clk]

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
  set g_eth_port "qsfp0"
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
  set aurora_inst [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:12.0 aurora_inst ]
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
  connect_bd_net [get_bd_ports noc_clk]   [get_bd_pins aurora_inst/init_clk] 
  connect_bd_net [get_bd_pins gndx1/dout] [get_bd_pins aurora_inst/power_down] [get_bd_pins aurora_inst/gt_rxcdrovrden_in]

  for {set idx 0} {$idx < $NOC_CHANS} {incr idx} {
    if {$idx > 0} {
      connect_bd_net [get_bd_ports noc_clk]  [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_ACLK]
    }
    connect_bd_net [get_bd_pins aurora_inst/gt_pll_lock] [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_ARESETN]
    connect_bd_net [get_bd_pins gndx1/dout] [get_bd_pins axis_muxer/S[format {%02d} $idx]_ARB_REQ_SUPPRESS]

    set tx_fifo_$idx [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 tx_fifo_$idx]
    set_property -dict [list \
      CONFIG.FIFO_DEPTH {16} \
    ] [get_bd_cells tx_fifo_$idx]
    connect_bd_net [get_bd_ports noc_clk]  [get_bd_pins tx_fifo_$idx/s_axis_aclk]
    connect_bd_net [get_bd_ports noc_rstn] [get_bd_pins tx_fifo_$idx/s_axis_aresetn]

    # make_bd_intf_pins_external [get_bd_intf_pins axis_muxer/S[format {%02d} $idx]_AXIS]
    # set_property name "s_axis${idx}" [get_bd_intf_ports S[format {%02d} $idx]_AXIS_0]
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0                                       s_axis_$idx
    set_property -dict [list CONFIG.HAS_TLAST 1 CONFIG.TDATA_NUM_BYTES 8 CONFIG.TDEST_WIDTH 8] [get_bd_intf_ports s_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins tx_fifo_$idx/S_AXIS] [get_bd_intf_ports                                 s_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins tx_fifo_$idx/M_AXIS] [get_bd_intf_pins axis_muxer/S[format {%02d} $idx]_AXIS]

    set inrdy_rst_$idx [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 inrdy_rst_$idx ]
    set_property -dict [list \
      CONFIG.C_OPERATION {and} \
      CONFIG.C_SIZE {1} \
    ] [get_bd_cells inrdy_rst_$idx]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Op1] [get_bd_pins axis_muxer/S[format {%02d} $idx]_AXIS_tready]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Op2] [get_bd_pins aurora_inst/gt_pll_lock]
    connect_bd_net [get_bd_pins inrdy_rst_$idx/Res] [get_bd_pins tx_fifo_$idx/m_axis_tready]

    connect_bd_net [get_bd_ports noc_clk]  [get_bd_pins axis_demuxer/M[format {%02d} $idx]_AXIS_ACLK]
    connect_bd_net [get_bd_pins aurora_inst/gt_pll_lock] [get_bd_pins axis_demuxer/M[format {%02d} $idx]_AXIS_ARESETN]

    set rx_fifo_$idx [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 rx_fifo_$idx]
    set_property -dict [list \
      CONFIG.FIFO_DEPTH {16} \
      CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
      CONFIG.TDATA_NUM_BYTES {8} \
      CONFIG.HAS_TKEEP.VALUE_SRC USER \
      CONFIG.HAS_TKEEP {1} \
      CONFIG.HAS_TLAST.VALUE_SRC USER \
      CONFIG.HAS_TLAST {1} \
      CONFIG.TDEST_WIDTH.VALUE_SRC USER \
      CONFIG.TDEST_WIDTH 8 \
      CONFIG.FIFO_MODE {2} \
    ] [get_bd_cells rx_fifo_$idx]
    connect_bd_net [get_bd_ports noc_clk]  [get_bd_pins rx_fifo_$idx/s_axis_aclk]
    connect_bd_net [get_bd_pins aurora_inst/gt_pll_lock] [get_bd_pins rx_fifo_$idx/s_axis_aresetn]

    # make_bd_intf_pins_external [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx]_AXIS]
    # set_property name "m_axis${idx}" [get_bd_intf_ports M[format {%02d} $idx]_AXIS_0]
    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0      m_axis_$idx
    connect_bd_intf_net [get_bd_intf_pins rx_fifo_$idx/M_AXIS] [get_bd_intf_ports m_axis_$idx]
    connect_bd_intf_net [get_bd_intf_pins rx_fifo_$idx/S_AXIS] [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx]_AXIS]
  }

  set tx_fifo [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 tx_fifo]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {16} \
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
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES {31} \
    CONFIG.HAS_TKEEP.VALUE_SRC USER \
    CONFIG.HAS_TKEEP {1} \
    CONFIG.HAS_TLAST.VALUE_SRC USER \
    CONFIG.HAS_TLAST {1} \
    CONFIG.TDEST_WIDTH.VALUE_SRC USER \
    CONFIG.TDEST_WIDTH 8 \
  ] [get_bd_cells rx_fifo]

  set aur_fifo [create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 aur_fifo]
  set_property -dict [list \
    CONFIG.FIFO_DEPTH {16} \
    CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.TDATA_NUM_BYTES {32} \
    CONFIG.HAS_TKEEP.VALUE_SRC USER \
    CONFIG.HAS_TKEEP {1} \
    CONFIG.HAS_TLAST.VALUE_SRC USER \
    CONFIG.HAS_TLAST {1} \
  ] [get_bd_cells aur_fifo]

  # setting Near-End PMA Loopback mode (0x2)
  set const3h2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const3h2 ]
  set_property -dict [list \
    CONFIG.CONST_WIDTH {3} \
    CONFIG.CONST_VAL {2} \
  ] $const3h2
  connect_bd_net [get_bd_pins const3h2/dout] [get_bd_pins aurora_inst/loopback] 

  set g_refport_freq [format {%0.0f} [expr {$g_eth100gb_freq*1000000+0.5}] ]
  puts "PORT FREQUENCY: $g_refport_freq"
  set qsfp_refck [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 qsfp_refck ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ $g_refport_freq \
   ] $qsfp_refck
  connect_bd_intf_net [get_bd_intf_ports qsfp_refck] [get_bd_intf_pins aurora_inst/GT_DIFF_REFCLK1]

  set qsfp_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 qsfp_wiz ]
  set_property -dict [ list \
   CONFIG.USE_RESET {false} \
  ] $qsfp_wiz
  #  CONFIG.PRIM_SOURCE {Differential_clock_capable_pin}
  # connect_bd_intf_net [get_bd_intf_pins qsfp_wiz/CLK_IN1_D] [get_bd_ports noc_clk]
  connect_bd_net [get_bd_pins qsfp_wiz/clk_in1] [get_bd_ports noc_clk]

  set qsfp_rx_4x [ create_bd_intf_port -mode Slave  -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 qsfp_rx_4x ]
  set qsfp_tx_4x [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 qsfp_tx_4x ]
  connect_bd_intf_net [get_bd_intf_ports qsfp_rx_4x] [get_bd_intf_pins aurora_inst/GT_SERIAL_RX]
  connect_bd_intf_net [get_bd_intf_ports qsfp_tx_4x] [get_bd_intf_pins aurora_inst/GT_SERIAL_TX]

  set rst_inv [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 rst_inv ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] [get_bd_cells $rst_inv]
  connect_bd_net [get_bd_pins rst_inv/Op1] [get_bd_ports noc_rstn]
  connect_bd_net [get_bd_pins rst_inv/Res] [get_bd_pins aurora_inst/pma_init]
  connect_bd_net [get_bd_pins rst_inv/Res] [get_bd_pins aurora_inst/reset_pb]

  set aur_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 aur_rst_gen ]
  connect_bd_net [get_bd_pins qsfp_wiz/clk_out1] [get_bd_pins aur_rst_gen/slowest_sync_clk]
  connect_bd_net [get_bd_ports noc_rstn]         [get_bd_pins aur_rst_gen/ext_reset_in] [get_bd_pins aur_rst_gen/aux_reset_in]
  connect_bd_net [get_bd_pins gndx1/dout] [get_bd_pins aur_rst_gen/mb_debug_sys_rst]
  # connect_bd_net [get_bd_pins vccx1/dout] [get_bd_pins aur_rst_gen/dcm_locked]
  # connect_bd_net [get_bd_pins aur_rst_gen/bus_struct_reset] [get_bd_pins aurora_inst/pma_init]
  # connect_bd_net [get_bd_pins aur_rst_gen/mb_reset]         [get_bd_pins aurora_inst/reset_pb]

  set mux_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 mux_rst_gen ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH.VALUE_SRC USER \
   CONFIG.C_AUX_RESET_HIGH {0} \
  ] $mux_rst_gen
  # connect_bd_net [get_bd_pins aurora_inst/gt_pll_lock]   [get_bd_pins mux_rst_gen/dcm_locked]
  # connect_bd_net [get_bd_pins aurora_inst/sys_reset_out] [get_bd_pins mux_rst_gen/ext_reset_in]
  connect_bd_net [get_bd_pins      qsfp_wiz/locked]        [get_bd_pins mux_rst_gen/dcm_locked] [get_bd_pins aur_rst_gen/dcm_locked]
  connect_bd_net [get_bd_pins aur_rst_gen/mb_reset]        [get_bd_pins mux_rst_gen/ext_reset_in]
  connect_bd_net [get_bd_ports noc_clk]                    [get_bd_pins mux_rst_gen/slowest_sync_clk]
  # make_bd_pins_external                                    [get_bd_pins mux_rst_gen/mb_reset]
  # set_property name "noc_rst_long"                         [get_bd_ports mb_reset_0]
  # make_bd_pins_external                                    [get_bd_pins aurora_inst/gt_pll_lock]
  # set_property name "noc_rstn_long"                         [get_bd_ports gt_pll_lock_0]

  set aur_rst_inv [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 aur_rst_inv ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] [get_bd_cells $aur_rst_inv]
  connect_bd_net [get_bd_pins aur_rst_inv/Op1] [get_bd_pins aurora_inst/sys_reset_out]

  # connect_bd_net [get_bd_pins mux_rst_gen/interconnect_aresetn] [get_bd_pins axis_muxer/ARESETN] [get_bd_pins axis_demuxer/ARESETN]
  # connect_bd_net [get_bd_pins mux_rst_gen/peripheral_aresetn]
  # connect_bd_net [get_bd_pins aur_rst_gen/interconnect_aresetn]
  # connect_bd_net [get_bd_pins aur_rst_inv/Res]
  connect_bd_net [get_bd_pins aurora_inst/channel_up] \
                 [get_bd_pins axis_muxer/ARESETN] \
                 [get_bd_pins axis_demuxer/ARESETN] \
                 [get_bd_pins axis_muxer/M00_AXIS_ARESETN] \
                 [get_bd_pins axis_demuxer/S00_AXIS_ARESETN] \
                 [get_bd_pins aur_fifo/s_axis_aresetn] \
                 [get_bd_pins tx_fifo/s_axis_aresetn] \
                 [get_bd_pins rx_fifo/s_axis_aresetn]

  # connect_bd_net [get_bd_pins qsfp_wiz/clk_out1]
  connect_bd_net [get_bd_pins aurora_inst/user_clk_out] \
                 [get_bd_pins axis_muxer/ACLK] \
                 [get_bd_pins axis_muxer/M00_AXIS_ACLK] \
                 [get_bd_pins axis_demuxer/ACLK] \
                 [get_bd_pins axis_demuxer/S00_AXIS_ACLK] \
                 [get_bd_pins aur_fifo/s_axis_aclk] \
                 [get_bd_pins tx_fifo/s_axis_aclk] \
                 [get_bd_pins rx_fifo/s_axis_aclk]
                #  [get_bd_pins mux_rst_gen/slowest_sync_clk]


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
  connect_bd_net [get_bd_pins concat_aur_hi_ok/dout]    [get_bd_pins and_aur_state/Op1]
  # connect_bd_net [get_bd_pins mux_rst_gen/aux_reset_in] [get_bd_pins and_aur_state/Res]
  connect_bd_net [get_bd_pins mux_rst_gen/aux_reset_in] [get_bd_pins vccx1/dout]

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
  connect_bd_net [get_bd_pins concat_aur_lo_ok/dout]        [get_bd_pins or_aur_state/Op1]
  # connect_bd_net [get_bd_pins mux_rst_gen/mb_debug_sys_rst] [get_bd_pins or_aur_state/Res]
  connect_bd_net [get_bd_pins mux_rst_gen/mb_debug_sys_rst] [get_bd_pins gndx1/dout]

  # Connecting by wires instead of interfaces to exclude validation warnings of mismatched data widths
  # connect_bd_intf_net [get_bd_intf_pins tx_fifo/M_AXIS] [get_bd_intf_pins aurora_inst/USER_DATA_S_AXIS_TX]
  # connect_bd_intf_net [get_bd_intf_pins rx_fifo/S_AXIS] [get_bd_intf_pins aurora_inst/USER_DATA_M_AXIS_RX]
  # connect_bd_net [get_bd_pins aurora_inst/s_axi_tx_tready] [get_bd_pins tx_fifo/m_axis_tready]
  # connect_bd_net [get_bd_pins aurora_inst/s_axi_tx_tvalid] [get_bd_pins tx_fifo/m_axis_tvalid]
  # connect_bd_net [get_bd_pins aurora_inst/s_axi_tx_tlast]  [get_bd_pins tx_fifo/m_axis_tlast]
  # connect_bd_net [get_bd_pins aurora_inst/m_axi_rx_tvalid] [get_bd_pins rx_fifo/s_axis_tvalid]
  # connect_bd_net [get_bd_pins aurora_inst/m_axi_rx_tlast]  [get_bd_pins rx_fifo/s_axis_tlast]
  connect_bd_net [get_bd_pins aur_fifo/s_axis_tready] [get_bd_pins tx_fifo/m_axis_tready]
  connect_bd_net [get_bd_pins aur_fifo/s_axis_tvalid] [get_bd_pins tx_fifo/m_axis_tvalid]
  connect_bd_net [get_bd_pins aur_fifo/s_axis_tlast]  [get_bd_pins tx_fifo/m_axis_tlast]
  connect_bd_net [get_bd_pins aur_fifo/m_axis_tready] [get_bd_pins rx_fifo/s_axis_tready]
  connect_bd_net [get_bd_pins aur_fifo/m_axis_tvalid] [get_bd_pins rx_fifo/s_axis_tvalid]
  connect_bd_net [get_bd_pins aur_fifo/m_axis_tlast]  [get_bd_pins rx_fifo/s_axis_tlast]
  # connect_bd_intf_net [get_bd_intf_pins tx_fifo/M_AXIS] [get_bd_intf_pins rx_fifo/S_AXIS]

  connect_bd_intf_net [get_bd_intf_pins tx_fifo/S_AXIS] [get_bd_intf_pins axis_muxer/M00_AXIS]
  connect_bd_intf_net [get_bd_intf_pins rx_fifo/M_AXIS] [get_bd_intf_pins axis_demuxer/S00_AXIS]

  set concat_data_tx [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_data_tx ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {2} \
  ] $concat_data_tx
  # connect_bd_net [get_bd_pins concat_data_tx/dout] [get_bd_pins aurora_inst/s_axi_tx_tdata]
  connect_bd_net [get_bd_pins concat_data_tx/dout] [get_bd_pins aur_fifo/s_axis_tdata]
  connect_bd_net [get_bd_pins concat_data_tx/In0]  [get_bd_pins tx_fifo/m_axis_tdest]
  connect_bd_net [get_bd_pins concat_data_tx/In1]  [get_bd_pins tx_fifo/m_axis_tdata]

  set concat_keep_tx [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 concat_keep_tx ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {2} \
  ] $concat_keep_tx
  # connect_bd_net [get_bd_pins concat_keep_tx/dout] [get_bd_pins aurora_inst/s_axi_tx_tkeep]
  connect_bd_net [get_bd_pins concat_keep_tx/dout] [get_bd_pins aur_fifo/s_axis_tkeep]
  connect_bd_net [get_bd_pins concat_keep_tx/In0]  [get_bd_pins vccx1/dout]
  connect_bd_net [get_bd_pins concat_keep_tx/In1]  [get_bd_pins tx_fifo/m_axis_tkeep]

  set slice_data_rx [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 slice_data_rx ]
  set_property -dict [ list \
   CONFIG.DIN_WIDTH {256} \
   CONFIG.DIN_FROM {255} \
   CONFIG.DIN_TO {8} \
  ] $slice_data_rx
  # connect_bd_net [get_bd_pins slice_data_rx/Din]  [get_bd_pins aurora_inst/m_axi_rx_tdata]
  connect_bd_net [get_bd_pins slice_data_rx/Din]  [get_bd_pins aur_fifo/m_axis_tdata]
  connect_bd_net [get_bd_pins slice_data_rx/Dout] [get_bd_pins rx_fifo/s_axis_tdata]

  set slice_keep_rx [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 slice_keep_rx ]
  set_property -dict [ list \
   CONFIG.DIN_WIDTH {32} \
   CONFIG.DIN_FROM {31} \
   CONFIG.DIN_TO {1} \
  ] $slice_keep_rx
  # connect_bd_net [get_bd_pins slice_keep_rx/Din]  [get_bd_pins aurora_inst/m_axi_rx_tkeep]
  connect_bd_net [get_bd_pins slice_keep_rx/Din]  [get_bd_pins aur_fifo/m_axis_tkeep]
  connect_bd_net [get_bd_pins slice_keep_rx/Dout] [get_bd_pins rx_fifo/s_axis_tkeep]

  set slice_dest_rx [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 slice_dest_rx ]
  set_property -dict [ list \
   CONFIG.DIN_WIDTH {256} \
   CONFIG.DIN_FROM {7} \
   CONFIG.DIN_TO {0} \
  ] $slice_dest_rx
  # connect_bd_net [get_bd_pins slice_dest_rx/Din]  [get_bd_pins aurora_inst/m_axi_rx_tdata]
  connect_bd_net [get_bd_pins slice_dest_rx/Din]  [get_bd_pins aur_fifo/m_axis_tdata]
  connect_bd_net [get_bd_pins slice_dest_rx/Dout] [get_bd_pins rx_fifo/s_axis_tdest]

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_nocs_aurora_bridge()

cr_bd_nocs_aurora_bridge ""
