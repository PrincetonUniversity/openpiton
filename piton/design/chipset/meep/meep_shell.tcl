# Copyright 2022 Barcelona Supercomputing Center-Centro Nacional de Supercomputación

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
# Date: 10.12.2023
# Description: 

# Proc to create BD meep_shell
proc cr_bd_meep_shell { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name meep_shell

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
  xilinx.com:ip:axi_gpio:2.0\
  xilinx.com:ip:ddr4:2.2\
  xilinx.com:ip:util_vector_logic:2.0\
  xilinx.com:ip:axi_bram_ctrl:4.1\
  xilinx.com:ip:xlconstant:1.1\
  xilinx.com:ip:hbm:1.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  xilinx.com:ip:qdma:5.0\
  xilinx.com:ip:smartconnect:1.0\
  xilinx.com:ip:util_ds_buf:2.2\
  xilinx.com:ip:blk_mem_gen:8.4\
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


  # Create interface ports
  set mem_refclk [ create_bd_intf_port -mode Slave  -vlnv xilinx.com:interface:diff_clock_rtl:1.0 mem_refclk ]
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] &&
                  $::env(PROTOSYN_RUNTIME_BOARD)=="alveou250"} {
    set_property -dict [ list CONFIG.FREQ_HZ 300000000] $mem_refclk
  } else {
    set_property -dict [ list CONFIG.FREQ_HZ 100000000] $mem_refclk
  }

  if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                  $::env(PROTOSYN_RUNTIME_HBM)=="TRUE" &&
      [info exists ::env(PROTOSYN_RUNTIME_BOARD)] &&
                  $::env(PROTOSYN_RUNTIME_BOARD)=="alveou280"} {
    set DRAM_addr_width 33
  } else {
    set DRAM_addr_width 34
  }

  set m_axi [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH $DRAM_addr_width \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {512} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {6} \
   CONFIG.MAX_BURST_LENGTH {256} \
   CONFIG.NUM_READ_OUTSTANDING {256} \
   CONFIG.NUM_READ_THREADS {16} \
   CONFIG.NUM_WRITE_OUTSTANDING {256} \
   CONFIG.NUM_WRITE_THREADS {16} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $m_axi
if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  set_property CONFIG.PROTOCOL         {AXI3} [get_bd_intf_ports m_axi]
  set_property CONFIG.DATA_WIDTH       {256}  [get_bd_intf_ports m_axi]
  set_property CONFIG.MAX_BURST_LENGTH {16}   [get_bd_intf_ports m_axi]
}

  set ncmem_axi [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 ncmem_axi ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH $DRAM_addr_width \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {512} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {6} \
   CONFIG.MAX_BURST_LENGTH {256} \
   CONFIG.NUM_READ_OUTSTANDING {256} \
   CONFIG.NUM_READ_THREADS {16} \
   CONFIG.NUM_WRITE_OUTSTANDING {256} \
   CONFIG.NUM_WRITE_THREADS {16} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $ncmem_axi
if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  set_property CONFIG.PROTOCOL         {AXI3} [get_bd_intf_ports ncmem_axi]
  set_property CONFIG.DATA_WIDTH       {256}  [get_bd_intf_ports ncmem_axi]
  set_property CONFIG.MAX_BURST_LENGTH {16}   [get_bd_intf_ports ncmem_axi]
}

set PITON_EXTRA_MEMS 0
if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE" &&
    [info exists ::env(PITON_EXTRA_MEMS)]} {
  set PITON_EXTRA_MEMS $::env(PITON_EXTRA_MEMS)
}
for {set idx 0} {$idx < $PITON_EXTRA_MEMS} {incr idx} {
  set mcx_axi$idx [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 mcx_axi$idx ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH $DRAM_addr_width \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {256} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {6} \
   CONFIG.MAX_BURST_LENGTH {16} \
   CONFIG.NUM_READ_OUTSTANDING {256} \
   CONFIG.NUM_READ_THREADS {16} \
   CONFIG.NUM_WRITE_OUTSTANDING {256} \
   CONFIG.NUM_WRITE_THREADS {16} \
   CONFIG.PROTOCOL {AXI3} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] [get_bd_intf_ports mcx_axi$idx]
}

if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  set pci2hbm_maxi [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 pci2hbm_maxi ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH $DRAM_addr_width \
   CONFIG.DATA_WIDTH {256} \
   CONFIG.FREQ_HZ {250000000} \
   CONFIG.CLK_DOMAIN {meep_shell_qdma_0_0_axi_aclk} \
   CONFIG.HAS_REGION {0} \
   CONFIG.NUM_READ_OUTSTANDING {256} \
   CONFIG.NUM_WRITE_OUTSTANDING {256} \
   CONFIG.PROTOCOL {AXI3} \
   ] $pci2hbm_maxi

  set pci2hbm_saxi [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 pci2hbm_saxi ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH $DRAM_addr_width \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {256} \
   CONFIG.FREQ_HZ {250000000} \
   CONFIG.CLK_DOMAIN {meep_shell_qdma_0_0_axi_aclk} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {6} \
   CONFIG.MAX_BURST_LENGTH {16} \
   CONFIG.NUM_READ_OUTSTANDING {256} \
   CONFIG.NUM_READ_THREADS {16} \
   CONFIG.NUM_WRITE_OUTSTANDING {256} \
   CONFIG.NUM_WRITE_THREADS {16} \
   CONFIG.PROTOCOL {AXI3} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $pci2hbm_saxi

  set hbm_cattrip [ create_bd_port -dir O -from 0 -to 0 hbm_cattrip ]
} else {
  set ddr4_sdram_c0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0 ]
}

  set pci_express_x16 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x16 ]

  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk


  # Create ports
  set mem_calib_complete [ create_bd_port -dir O -from 0 -to 0 -type rst mem_calib_complete ]
  set pcie_gpio [ create_bd_port -dir O -from 4 -to 0 pcie_gpio ]
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn

  set sysck_axi_ports "ncmem_axi"
  for {set idx 0} {$idx < $PITON_EXTRA_MEMS} {incr idx} {
    append sysck_axi_ports ":mcx_axi" $idx
  }
  set sys_clk [ create_bd_port -dir I -type clk sys_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF $sysck_axi_ports \
 ] $sys_clk
  set sys_rst [ create_bd_port -dir I -type rst sys_rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $sys_rst

  set mem_clk [ create_bd_port -dir O -type clk mem_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {m_axi} \
 ] $mem_clk
  set mem_rst [ create_bd_port -dir O -type rst mem_rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $mem_rst


if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  # Create instance: hbm_0, and set properties
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] && $::env(PROTOSYN_RUNTIME_BOARD)=="alveou280"} {
    set hbm_density "8GB"
    set hbm_axi_sfx ""
  }
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] && $::env(PROTOSYN_RUNTIME_BOARD)=="alveou55c"} {
    set hbm_density "16GB"
    set hbm_axi_sfx "_8HI"
  }
  set hbm_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm_0 ]
  set_property -dict [ list \
   CONFIG.USER_APB_EN {false} \
   CONFIG.USER_CLK_SEL_LIST0 {AXI_00_ACLK} \
   CONFIG.USER_CLK_SEL_LIST1 {AXI_31_ACLK} \
   CONFIG.USER_HBM_CP_1 {6} \
   CONFIG.USER_HBM_DENSITY $hbm_density \
   CONFIG.USER_HBM_FBDIV_1 {36} \
   CONFIG.USER_HBM_HEX_CP_RES_1 {0x0000A600} \
   CONFIG.USER_HBM_HEX_FBDIV_CLKOUTDIV_1 {0x00000902} \
   CONFIG.USER_HBM_HEX_LOCK_FB_REF_DLY_1 {0x00001f1f} \
   CONFIG.USER_HBM_LOCK_FB_DLY_1 {31} \
   CONFIG.USER_HBM_LOCK_REF_DLY_1 {31} \
   CONFIG.USER_HBM_RES_1 {10} \
   CONFIG.USER_HBM_STACK {2} \
   CONFIG.USER_MC_ENABLE_00 {TRUE} \
   CONFIG.USER_MC_ENABLE_01 {TRUE} \
   CONFIG.USER_MC_ENABLE_02 {TRUE} \
   CONFIG.USER_MC_ENABLE_03 {TRUE} \
   CONFIG.USER_MC_ENABLE_04 {TRUE} \
   CONFIG.USER_MC_ENABLE_05 {TRUE} \
   CONFIG.USER_MC_ENABLE_06 {TRUE} \
   CONFIG.USER_MC_ENABLE_07 {TRUE} \
   CONFIG.USER_MC_ENABLE_08 {TRUE} \
   CONFIG.USER_MC_ENABLE_09 {TRUE} \
   CONFIG.USER_MC_ENABLE_10 {TRUE} \
   CONFIG.USER_MC_ENABLE_11 {TRUE} \
   CONFIG.USER_MC_ENABLE_12 {TRUE} \
   CONFIG.USER_MC_ENABLE_13 {TRUE} \
   CONFIG.USER_MC_ENABLE_14 {TRUE} \
   CONFIG.USER_MC_ENABLE_15 {TRUE} \
   CONFIG.USER_MC_ENABLE_APB_01 {TRUE} \
   CONFIG.USER_PHY_ENABLE_08 {TRUE} \
   CONFIG.USER_PHY_ENABLE_09 {TRUE} \
   CONFIG.USER_PHY_ENABLE_10 {TRUE} \
   CONFIG.USER_PHY_ENABLE_11 {TRUE} \
   CONFIG.USER_PHY_ENABLE_12 {TRUE} \
   CONFIG.USER_PHY_ENABLE_13 {TRUE} \
   CONFIG.USER_PHY_ENABLE_14 {TRUE} \
   CONFIG.USER_PHY_ENABLE_15 {TRUE} \
   CONFIG.USER_SAXI_00 {true}  \
   CONFIG.USER_SAXI_01 {true}  \
   CONFIG.USER_SAXI_02 {false} \
   CONFIG.USER_SAXI_03 {false} \
   CONFIG.USER_SAXI_04 {false} \
   CONFIG.USER_SAXI_05 {false} \
   CONFIG.USER_SAXI_06 {false} \
   CONFIG.USER_SAXI_07 {false} \
   CONFIG.USER_SAXI_08 {false} \
   CONFIG.USER_SAXI_09 {false} \
   CONFIG.USER_SAXI_10 {false} \
   CONFIG.USER_SAXI_11 {false} \
   CONFIG.USER_SAXI_12 {false} \
   CONFIG.USER_SAXI_13 {false} \
   CONFIG.USER_SAXI_14 {false} \
   CONFIG.USER_SAXI_15 {false} \
   CONFIG.USER_SAXI_16 {false} \
   CONFIG.USER_SAXI_17 {false} \
   CONFIG.USER_SAXI_18 {false} \
   CONFIG.USER_SAXI_19 {false} \
   CONFIG.USER_SAXI_20 {false} \
   CONFIG.USER_SAXI_21 {false} \
   CONFIG.USER_SAXI_22 {false} \
   CONFIG.USER_SAXI_23 {false} \
   CONFIG.USER_SAXI_24 {false} \
   CONFIG.USER_SAXI_25 {false} \
   CONFIG.USER_SAXI_26 {false} \
   CONFIG.USER_SAXI_27 {false} \
   CONFIG.USER_SAXI_28 {false} \
   CONFIG.USER_SAXI_29 {false} \
   CONFIG.USER_SAXI_30 {false} \
   CONFIG.USER_SAXI_31 {true}  \
   CONFIG.USER_SWITCH_ENABLE_01 {TRUE} \
 ] $hbm_0

  # Extending setting for PCIe channel
  set_property -dict [ list \
   CONFIG.NUM_READ_THREADS {16} \
   CONFIG.NUM_WRITE_THREADS {16} \
 ] [get_bd_intf_pins /hbm_0/SAXI_31$hbm_axi_sfx]

  # A function distributing extra HBM channels
  # here linearly
  set distHBMchan {2 + $idx}
  # here evenly around center channel of the switch
  # set distHBMchan {16 + ($idx%2 ? $idx/2+1 : -$idx/2-1)}
  for {set idx 0} {$idx < $PITON_EXTRA_MEMS} {incr idx} {
    set_property CONFIG.USER_SAXI_[format {%02d} [expr $distHBMchan]] {true} [get_bd_cells hbm_0]
  }

  # Create instance: mem_refclk_buf, and set properties
  set mem_refclk_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 mem_refclk_buf ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDS} \
 ] $mem_refclk_buf

  # Create instance: hbm_cattrip_comb, and set properties
  set hbm_cattrip_comb [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 hbm_cattrip_comb ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {or} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_orgate.png} \
 ] $hbm_cattrip_comb

} else {

  # Create instance: ddr4_0, and set properties
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] && $::env(PROTOSYN_RUNTIME_BOARD)=="alveou280"} {
    set DDR4_InClk "9996"
  }
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] && $::env(PROTOSYN_RUNTIME_BOARD)=="alveou250"} {
    set DDR4_InClk "3332"
  }
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [ list \
   CONFIG.ADDN_UI_CLKOUT1_FREQ_HZ {100} \
   CONFIG.C0.DDR4_AUTO_AP_COL_A3 {true} \
   CONFIG.C0.DDR4_AxiAddressWidth $DRAM_addr_width \
   CONFIG.C0.DDR4_AxiDataWidth {512} \
   CONFIG.C0.DDR4_CLKFBOUT_MULT {15} \
   CONFIG.C0.DDR4_CLKOUT0_DIVIDE {5} \
   CONFIG.C0.DDR4_CasLatency {17} \
   CONFIG.C0.DDR4_CasWriteLatency {12} \
   CONFIG.C0.DDR4_DataMask {NONE} \
   CONFIG.C0.DDR4_DataWidth {72} \
   CONFIG.C0.DDR4_EN_PARITY {true} \
   CONFIG.C0.DDR4_Ecc {true} \
   CONFIG.C0.DDR4_InputClockPeriod $DDR4_InClk \
   CONFIG.C0.DDR4_Mem_Add_Map {ROW_COLUMN_BANK_INTLV} \
   CONFIG.C0.DDR4_MemoryPart {MTA18ASF2G72PZ-2G3} \
   CONFIG.C0.DDR4_MemoryType {RDIMMs} \
   CONFIG.C0.DDR4_TimePeriod {833} \
   CONFIG.C0_CLOCK_BOARD_INTERFACE {Custom} \
   CONFIG.C0_DDR4_BOARD_INTERFACE {Custom} \
   CONFIG.RESET_BOARD_INTERFACE {Custom} \
 ] $ddr4_0

  # Create instance: gndx1, and set properties
  set gndx1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gndx1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $gndx1
}

  # Create instance: gndx32, and set properties
  set gndx32 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 gndx32 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {32} \
 ] $gndx32

  # Create instance: rst_inv, and set properties
  set rst_inv [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 rst_inv ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $rst_inv

  # Create instance: mem_calib_sync, and set properties
  set mem_calib_sync [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 mem_calib_sync ]
  set_property -dict [ list \
   CONFIG.C_AUX_RESET_HIGH {0} \
 ] $mem_calib_sync

  # Create instance: pcie_refclk_buf, and set properties
  set pcie_refclk_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 pcie_refclk_buf ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $pcie_refclk_buf

  # Create instance: qdma_0, and set properties
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] &&
                  $::env(PROTOSYN_RUNTIME_BOARD)=="alveou250"} {
    set pcie_blk_locn "X0Y1"
  } else {
    set pcie_blk_locn "PCIE4C_X1Y0"
  }
  set qdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:qdma:5.0 qdma_0 ]
  set_property -dict [ list \
   CONFIG.MAILBOX_ENABLE {true} \
   CONFIG.PF0_SRIOV_CAP_INITIAL_VF {4} \
   CONFIG.PF1_MSIX_CAP_TABLE_SIZE_qdma {000} \
   CONFIG.PF1_SRIOV_CAP_INITIAL_VF {0} \
   CONFIG.PF1_SRIOV_FIRST_VF_OFFSET {0} \
   CONFIG.PF2_MSIX_CAP_TABLE_SIZE_qdma {000} \
   CONFIG.PF2_SRIOV_CAP_INITIAL_VF {0} \
   CONFIG.PF2_SRIOV_FIRST_VF_OFFSET {0} \
   CONFIG.PF3_MSIX_CAP_TABLE_SIZE_qdma {000} \
   CONFIG.PF3_SRIOV_CAP_INITIAL_VF {0} \
   CONFIG.PF3_SRIOV_FIRST_VF_OFFSET {0} \
   CONFIG.SRIOV_CAP_ENABLE {true} \
   CONFIG.SRIOV_FIRST_VF_OFFSET {4} \
   CONFIG.barlite_mb_pf0 {1} \
   CONFIG.barlite_mb_pf1 {0} \
   CONFIG.barlite_mb_pf2 {0} \
   CONFIG.barlite_mb_pf3 {0} \
   CONFIG.dma_intf_sel_qdma {AXI_MM} \
   CONFIG.en_axi_st_qdma {false} \
   CONFIG.flr_enable {true} \
   CONFIG.mode_selection {Advanced} \
   CONFIG.pcie_blk_locn $pcie_blk_locn \
   CONFIG.pf0_ari_enabled {true} \
   CONFIG.pf0_bar0_prefetchable_qdma {true} \
   CONFIG.pf0_bar2_prefetchable_qdma {true} \
   CONFIG.pf1_bar0_prefetchable_qdma {true} \
   CONFIG.pf1_bar2_prefetchable_qdma {true} \
   CONFIG.pf1_msix_enabled_qdma {false} \
   CONFIG.pf2_bar0_prefetchable_qdma {true} \
   CONFIG.pf2_bar2_prefetchable_qdma {true} \
   CONFIG.pf2_msix_enabled_qdma {false} \
   CONFIG.pf3_bar0_prefetchable_qdma {true} \
   CONFIG.pf3_bar2_prefetchable_qdma {true} \
   CONFIG.pf3_msix_enabled_qdma {false} \
   CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
   CONFIG.pl_link_cap_max_link_width {X16} \
   CONFIG.testname {mm} \
   CONFIG.tl_pf_enable_reg {1} \
 ] $qdma_0
if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  set_property CONFIG.pl_link_cap_max_link_speed {5.0_GT/s} [get_bd_cells qdma_0]
}

  # Create instance: vccx1, and set properties
  set vccx1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 vccx1 ]

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {5} \
 ] $axi_gpio_0

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_CLKS {3} \
   CONFIG.NUM_SI {3} \
   CONFIG.NUM_MI {1} \
 ] $smartconnect_0
if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  set_property CONFIG.NUM_CLKS {1} [get_bd_cells smartconnect_0]
  set_property CONFIG.NUM_SI   {1} [get_bd_cells smartconnect_0]
}

  # Create interface connections
  connect_bd_intf_net [get_bd_intf_ports pcie_refclk]      [get_bd_intf_pins pcie_refclk_buf/CLK_IN_D]
  connect_bd_intf_net [get_bd_intf_pins qdma_0/M_AXI]      [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net [get_bd_intf_pins qdma_0/M_AXI_LITE] [get_bd_intf_pins axi_gpio_0/S_AXI]
  connect_bd_intf_net [get_bd_intf_pins qdma_0/pcie_mgt]   [get_bd_intf_ports pci_express_x16]

if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  connect_bd_intf_net [get_bd_intf_ports mem_refclk] [get_bd_intf_pins mem_refclk_buf/CLK_IN_D]
  connect_bd_intf_net [get_bd_intf_ports pci2hbm_saxi] [get_bd_intf_pins hbm_0/SAXI_31$hbm_axi_sfx]
  connect_bd_intf_net [get_bd_intf_ports m_axi]        [get_bd_intf_pins hbm_0/SAXI_00$hbm_axi_sfx]
  connect_bd_intf_net [get_bd_intf_ports ncmem_axi]    [get_bd_intf_pins hbm_0/SAXI_01$hbm_axi_sfx]
  connect_bd_intf_net [get_bd_intf_ports pci2hbm_maxi] [get_bd_intf_pins smartconnect_0/M00_AXI]
  for {set idx 0} {$idx < $PITON_EXTRA_MEMS} {incr idx} {
    connect_bd_intf_net [get_bd_intf_ports mcx_axi$idx] [get_bd_intf_pins hbm_0/SAXI_[format {%02d} [expr $distHBMchan]]$hbm_axi_sfx]
  }
} else {
  connect_bd_intf_net [get_bd_intf_ports mem_refclk]    [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net [get_bd_intf_ports ddr4_sdram_c0] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net [get_bd_intf_ports m_axi]               [get_bd_intf_pins smartconnect_0/S01_AXI]
  connect_bd_intf_net [get_bd_intf_ports ncmem_axi]           [get_bd_intf_pins smartconnect_0/S02_AXI]
  connect_bd_intf_net [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]
}

  # Create port connections
  connect_bd_net [get_bd_ports pcie_perstn] [get_bd_pins qdma_0/soft_reset_n] [get_bd_pins qdma_0/sys_rst_n]
  connect_bd_net [get_bd_pins qdma_0/sys_clk]    [get_bd_pins pcie_refclk_buf/IBUF_DS_ODIV2]
  connect_bd_net [get_bd_pins qdma_0/sys_clk_gt] [get_bd_pins pcie_refclk_buf/IBUF_OUT]
  connect_bd_net [get_bd_pins qdma_0/qsts_out_rdy] [get_bd_pins qdma_0/tm_dsc_sts_rdy] [get_bd_pins vccx1/dout]
  connect_bd_net [get_bd_pins qdma_0/axi_aclk]    [get_bd_pins axi_gpio_0/s_axi_aclk]
  connect_bd_net [get_bd_pins qdma_0/axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn]
  connect_bd_net [get_bd_ports pcie_gpio]         [get_bd_pins axi_gpio_0/gpio_io_o]
  connect_bd_net [get_bd_pins mem_calib_sync/slowest_sync_clk]   [get_bd_ports mem_clk]
  connect_bd_net [get_bd_pins mem_calib_sync/mb_debug_sys_rst]   [get_bd_pins rst_inv/Op1]
  connect_bd_net [get_bd_pins mem_calib_sync/dcm_locked]         [get_bd_pins rst_inv/Res]
  connect_bd_net [get_bd_pins mem_calib_sync/peripheral_aresetn] [get_bd_ports mem_calib_complete]

if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  connect_bd_net [get_bd_pins mem_refclk_buf/IBUF_OUT] [get_bd_pins hbm_0/HBM_REF_CLK_0] [get_bd_pins hbm_0/HBM_REF_CLK_1] [get_bd_pins hbm_0/APB_0_PCLK] [get_bd_pins hbm_0/APB_1_PCLK]
  connect_bd_net [get_bd_pins hbm_0/DRAM_0_STAT_CATTRIP] [get_bd_pins hbm_cattrip_comb/Op1]
  connect_bd_net [get_bd_pins hbm_0/DRAM_1_STAT_CATTRIP] [get_bd_pins hbm_cattrip_comb/Op2]
  connect_bd_net [get_bd_ports hbm_cattrip]              [get_bd_pins hbm_cattrip_comb/Res]
  connect_bd_net [get_bd_pins hbm_0/apb_complete_0] [get_bd_pins mem_calib_sync/ext_reset_in]
  connect_bd_net [get_bd_pins hbm_0/apb_complete_1] [get_bd_pins mem_calib_sync/aux_reset_in]
  connect_bd_net [get_bd_pins qdma_0/axi_aclk]    [get_bd_pins smartconnect_0/aclk]    [get_bd_pins hbm_0/AXI_31_ACLK] 
  connect_bd_net [get_bd_pins qdma_0/axi_aresetn] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins hbm_0/AXI_31_ARESET_N]
  connect_bd_net [get_bd_pins gndx32/dout] [get_bd_pins hbm_0/AXI_31_WDATA_PARITY] [get_bd_pins hbm_0/AXI_00_WDATA_PARITY] [get_bd_pins hbm_0/AXI_01_WDATA_PARITY]
  connect_bd_net [get_bd_ports sys_clk] [get_bd_ports mem_clk] [get_bd_pins hbm_0/AXI_00_ACLK] [get_bd_pins hbm_0/AXI_01_ACLK]
  connect_bd_net [get_bd_ports sys_rst] [get_bd_ports mem_rst] [get_bd_pins rst_inv/Op1]
  connect_bd_net [get_bd_pins rst_inv/Res] [get_bd_pins hbm_0/APB_0_PRESET_N] [get_bd_pins hbm_0/APB_1_PRESET_N] [get_bd_pins hbm_0/AXI_00_ARESET_N] [get_bd_pins hbm_0/AXI_01_ARESET_N]
  for {set idx 0} {$idx < $PITON_EXTRA_MEMS} {incr idx} {
    set hbm_port [format {%02d} [expr $distHBMchan]]
    connect_bd_net [get_bd_pins gndx32/dout] [get_bd_pins hbm_0/AXI_${hbm_port}_WDATA_PARITY]
    connect_bd_net [get_bd_ports sys_clk]    [get_bd_pins hbm_0/AXI_${hbm_port}_ACLK]
    connect_bd_net [get_bd_pins rst_inv/Res] [get_bd_pins hbm_0/AXI_${hbm_port}_ARESET_N]
  }
  # After all connections set PCIe clock to drive HBM cross-switch
  set_property CONFIG.USER_CLK_SEL_LIST1 AXI_31_ACLK [get_bd_cells hbm_0]
} else {
  connect_bd_net [get_bd_pins gndx32/dout] [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_araddr]  [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_awaddr]  [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_wdata]
  connect_bd_net [get_bd_pins gndx1/dout]  [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_arvalid] [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_awvalid] [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_bready] [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_rready] [get_bd_pins ddr4_0/c0_ddr4_s_axi_ctrl_wvalid]
  connect_bd_net [get_bd_pins ddr4_0/c0_ddr4_ui_clk]          [get_bd_ports mem_clk]    [get_bd_pins smartconnect_0/aclk]
  connect_bd_net [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_ports mem_rst]    [get_bd_pins rst_inv/Op1]
  connect_bd_net [get_bd_pins ddr4_0/c0_ddr4_aresetn]         [get_bd_pins rst_inv/Res] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net [get_bd_pins ddr4_0/c0_init_calib_complete] [get_bd_pins mem_calib_sync/ext_reset_in] [get_bd_pins mem_calib_sync/aux_reset_in]
  connect_bd_net [get_bd_pins qdma_0/axi_aclk] [get_bd_pins smartconnect_0/aclk1]
  connect_bd_net [get_bd_ports sys_clk] [get_bd_pins smartconnect_0/aclk2]
  connect_bd_net [get_bd_ports sys_rst] [get_bd_pins ddr4_0/sys_rst]
}


  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces qdma_0/M_AXI_LITE] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force
if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
  set hbm_mems 32
  set hbm_range [expr ((1 << $DRAM_addr_width)/$hbm_mems)]
  assign_bd_address -offset 0x0 -range [expr ($hbm_mems * $hbm_range)] -target_address_space [get_bd_addr_spaces qdma_0/M_AXI] [get_bd_addr_segs pci2hbm_maxi/Reg] -force
  for {set hbm_mem 0} {$hbm_mem < $hbm_mems} {incr hbm_mem} {
    assign_bd_address -offset [expr ($hbm_mem * $hbm_range)] -range $hbm_range -target_address_space [get_bd_addr_spaces m_axi]        [get_bd_addr_segs hbm_0/SAXI_00$hbm_axi_sfx/HBM_MEM[format {%02d} $hbm_mem]] -force
    assign_bd_address -offset [expr ($hbm_mem * $hbm_range)] -range $hbm_range -target_address_space [get_bd_addr_spaces ncmem_axi]    [get_bd_addr_segs hbm_0/SAXI_01$hbm_axi_sfx/HBM_MEM[format {%02d} $hbm_mem]] -force
    assign_bd_address -offset [expr ($hbm_mem * $hbm_range)] -range $hbm_range -target_address_space [get_bd_addr_spaces pci2hbm_saxi] [get_bd_addr_segs hbm_0/SAXI_31$hbm_axi_sfx/HBM_MEM[format {%02d} $hbm_mem]] -force
    for {set idx 0} {$idx < $PITON_EXTRA_MEMS} {incr idx} {
      set hbm_port [format {%02d} [expr $distHBMchan]]
      assign_bd_address -offset [expr ($hbm_mem * $hbm_range)] -range $hbm_range -target_address_space [get_bd_addr_spaces mcx_axi$idx] [get_bd_addr_segs hbm_0/SAXI_$hbm_port$hbm_axi_sfx/HBM_MEM[format {%02d} $hbm_mem]] -force
    }
  }
} else {
  set ddr_range [expr (1 << $DRAM_addr_width)]
  assign_bd_address -offset 0x00000000 -range $ddr_range -target_address_space [get_bd_addr_spaces qdma_0/M_AXI] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x00000000 -range $ddr_range -target_address_space [get_bd_addr_spaces m_axi]        [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x00000000 -range $ddr_range -target_address_space [get_bd_addr_spaces ncmem_axi]    [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_meep_shell()

cr_bd_meep_shell ""
