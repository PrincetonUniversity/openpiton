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
proc cr_bd_nocs_demux { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name nocs_demux

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

  # Create IPs of Xilix AXI-stream interconnect
  set axis_demuxer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_demuxer]
  set_property -dict [list \
    CONFIG.NUM_MI $NOC_CHANS \
    CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
    CONFIG.XBAR_TDATA_NUM_BYTES.VALUE_SRC USER \
    CONFIG.XBAR_TDATA_NUM_BYTES {8} \
  ] [get_bd_cells axis_demuxer]

  make_bd_pins_external         [get_bd_pins axis_demuxer/ACLK]
  set_property name "xbar_clk"  [get_bd_ports ACLK_0]
  make_bd_pins_external         [get_bd_pins axis_demuxer/ARESETN]
  set_property name "xbar_rstn" [get_bd_ports ARESETN_0]
  make_bd_pins_external         [get_bd_pins axis_demuxer/M00_AXIS_ACLK]
  set_property name "noc_clk"   [get_bd_ports M00_AXIS_ACLK_0]
  make_bd_pins_external         [get_bd_pins axis_demuxer/M00_AXIS_ARESETN]
  set_property name "noc_rstn"  [get_bd_ports M00_AXIS_ARESETN_0]

  connect_bd_net [get_bd_ports xbar_clk]  [get_bd_pins axis_demuxer/S00_AXIS_ACLK]
  connect_bd_net [get_bd_ports xbar_rstn] [get_bd_pins axis_demuxer/S00_AXIS_ARESETN]

  create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0                                                                    s_axis
  # in TCL we don't have explicit log2(), so using just $NOC_CHANS instead of enough its logarithm
  set_property -dict [list CONFIG.HAS_TLAST 1 CONFIG.HAS_TKEEP 1 CONFIG.TDATA_NUM_BYTES 31 CONFIG.TDEST_WIDTH $NOC_CHANS] [get_bd_intf_ports s_axis]
  connect_bd_intf_net [get_bd_intf_pins axis_demuxer/S00_AXIS]                                                            [get_bd_intf_ports s_axis]

  for {set idx 0} {$idx < $NOC_CHANS} {incr idx} {
    if {$idx > 0} {
      connect_bd_net [get_bd_ports noc_clk]  [get_bd_pins axis_demuxer/M[format {%02d} $idx]_AXIS_ACLK]
      connect_bd_net [get_bd_ports noc_rstn] [get_bd_pins axis_demuxer/M[format {%02d} $idx]_AXIS_ARESETN]
    }

    create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_$idx
    connect_bd_intf_net [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx]_AXIS] [get_bd_intf_ports m_axis_$idx]

    #  make_bd_intf_pins_external [get_bd_intf_pins axis_demuxer/M[format {%02d} $idx]_AXIS]
    #  set_property name "m_axis${idx}" [get_bd_intf_ports M[format {%02d} $idx]_AXIS_0]
  }

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_nocs_demux()

cr_bd_nocs_demux ""
