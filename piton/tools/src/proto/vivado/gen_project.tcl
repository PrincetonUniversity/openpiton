# Modified by Barcelona Supercomputing Center on March 3rd, 2022
# Copyright (c) 2016 Princeton University
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Princeton University nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#
# This script performs general actions
# for creating a Vivado project
#

# Boiler plate startup
set DV_ROOT $::env(DV_ROOT)
source $DV_ROOT/tools/src/proto/vivado/setup.tcl

# Create project
create_project -force ${PROJECT_NAME} ${PROJECT_DIR}

# Set project properties
set proj [get_projects ${PROJECT_NAME}]
set_property "board_part" "${BOARD_PART}" $proj
set_property "compxlib.activehdl_compiled_library_dir" "${PROJECT_DIR}/${PROJECT_NAME}.cache/compile_simlib/activehdl" $proj
set_property "compxlib.funcsim" "1" $proj
set_property "compxlib.ies_compiled_library_dir" "${PROJECT_DIR}/${PROJECT_NAME}.cache/compile_simlib/ies" $proj
set_property "compxlib.modelsim_compiled_library_dir" "${PROJECT_DIR}/${PROJECT_NAME}.cache/compile_simlib/modelsim" $proj
set_property "compxlib.overwrite_libs" "0" $proj
set_property "compxlib.questa_compiled_library_dir" "${PROJECT_DIR}/${PROJECT_NAME}.cache/compile_simlib/questa" $proj
set_property "compxlib.riviera_compiled_library_dir" "${PROJECT_DIR}/${PROJECT_NAME}.cache/compile_simlib/riviera" $proj
set_property "compxlib.timesim" "1" $proj
set_property "compxlib.vcs_compiled_library_dir" "${PROJECT_DIR}/${PROJECT_NAME}.cache/compile_simlib" $proj
set_property "corecontainer.enable" "0" $proj
set_property "default_lib" "xil_defaultlib" $proj
set_property "enable_optional_runs_sta" "0" $proj
set_property "ip_cache_permissions" "" $proj
set_property "ip_output_repo" "" $proj
set_property "managed_ip" "0" $proj
if {[string equal ${BOARD_PART} ""] != 0} {
    set_property "part" "${FPGA_PART}" $proj
}
set_property "sim.ip.auto_export_scripts" "1" $proj
set_property "simulator_language" "Mixed" $proj
set_property "source_mgmt_mode" "All" $proj
set_property "target_language" "Verilog" $proj
set_property "target_simulator" "VCS" $proj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Add files
set fileset_obj [get_filesets sources_1]
set files_to_add [list ]
foreach prj_file ${ALL_FILES} {
    if {[file exists $prj_file]} {
        lappend files_to_add $prj_file
    }
}
add_files -norecurse -fileset $fileset_obj $files_to_add

#Generating IP cores for Alveo boards
if { $BOARD_DEFAULT_VERILOG_MACROS == "ALVEO_BOARD" } {

  # Create IP of Xilix MMCM and frequency setup
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)] && $::env(PROTOSYN_RUNTIME_BOARD)=="alveou250"} {
    set BRD_FREQ 300
  } else {
    set BRD_FREQ 100
  }
  puts "Setting MMCM input frequency to ${BRD_FREQ}MHz "
  set SYS_FREQ $env(SYSTEM_FREQ)
  puts "Setting MMCM output frequency to ${SYS_FREQ}MHz "
  create_ip -vendor xilinx.com -library ip -name clk_wiz -version 6.0 -module_name       clk_mmcm
  set_property -dict [list CONFIG.PRIM_SOURCE {Differential_clock_capable_pin}] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.PRIM_IN_FREQ                     "$BRD_FREQ"] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.OPTIMIZE_CLOCKING_STRUCTURE_EN        {true}] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.CLKOUT2_USED                          {true}] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.CLK_OUT1_PORT                  {chipset_clk}] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.CLK_OUT2_PORT                   {mc_sys_clk}] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ       "$SYS_FREQ"] [get_ips clk_mmcm]
  set_property -dict [list CONFIG.CLKOUT2_REQUESTED_OUT_FREQ             {100}] [get_ips clk_mmcm]

  # Create IP of Xilinx UART
  create_ip -vendor xilinx.com -library ip -name axi_uart16550 -version 2.0 -module_name uart_16550

  # Create IP of Xilinx AXI traffic generator
  create_ip -vendor xilinx.com -library ip -name axi_traffic_gen -version 3.0 -module_name atg_uart_init
  set_property -dict [list CONFIG.C_ATG_SYSTEM_INIT_ADDR_MIF "$DV_ROOT/design/chipset/io_ctrl/xilinx/$BOARD/ip_cores/atg_uart_init/uart_addr.coe"] [get_ips atg_uart_init]
  set_property -dict [list CONFIG.C_ATG_SYSTEM_INIT_DATA_MIF "$DV_ROOT/design/chipset/io_ctrl/xilinx/$BOARD/ip_cores/atg_uart_init/uart_data.coe"] [get_ips atg_uart_init]
  set_property -dict [list CONFIG.C_ATG_MODE {AXI4-Lite}]                                                                                          [get_ips atg_uart_init]

  # Create IP of Xilinx async FIFO
  create_ip -vendor xilinx.com -library ip -name fifo_generator -version 13.2 -module_name     afifo_w64_d128_std
  set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Block_RAM}] [get_ips afifo_w64_d128_std]
  set_property -dict [list CONFIG.Input_Data_Width                              {64}] [get_ips afifo_w64_d128_std]
  set_property -dict [list CONFIG.Input_Depth                                  {128}] [get_ips afifo_w64_d128_std]
  set_property -dict [list CONFIG.Use_Embedded_Registers                     {false}] [get_ips afifo_w64_d128_std]
  set_property -dict [list CONFIG.Enable_Safety_Circuit                      {false}] [get_ips afifo_w64_d128_std]

  # Generating PCIe-based Shell
  # (to save BD: write_bd_tcl -force -no_project_wrapper ../piton/design/chipset/meep/meep_shell.tcl)
  source $DV_ROOT/design/chipset/meep/meep_shell.tcl

  # Generating JTAG Shell
  # (to save BD: write_bd_tcl -force -no_project_wrapper ../piton/design/chipset/meep/jtag_shell.tcl)
  source $DV_ROOT/design/chipset/meep/jtag_shell.tcl

  # Generating Ethernet system
  if {[info exists ::env(PROTOSYN_RUNTIME_BOARD)]} {
    set g_board_part [string map {"alveo" ""} $::env(PROTOSYN_RUNTIME_BOARD)]
  }
  if {[info exists ::env(PROTOSYN_RUNTIME_ETHPORT)] && $::env(PROTOSYN_RUNTIME_ETHPORT)=="1"} {
    set g_eth_port "qsfp1"
  } else {
    set g_eth_port "qsfp0"
  }
  if {[info exists ::env(PROTOSYN_RUNTIME_HBM)] &&
                  $::env(PROTOSYN_RUNTIME_HBM)=="TRUE"} {
    set g_dma_mem "hbm"
  } else {
    set g_dma_mem "ddr"
  }
  set g_saxi_prot "AXI4-512"
  set g_saxi_freq "split"
  set g_max_dma_addr_width "40"
  set g_root_dir "./"
  puts "Generating 100GbE on port `${g_eth_port}` with AXI slave `${g_saxi_prot}` and DMA memory at `${g_dma_mem}` for board `${g_board_part}`"
  # set argv [list $g_board_part $g_eth_port $g_dma_mem $g_saxi_freq $g_saxi_prot]
  # set argc 5
  # source $DV_ROOT/design/chipset/io_ctrl/xilinx/common/ip_cores/eth_cmac_syst/tcl/gen_project.tcl
  # first adding the IP repository path of the Ehternet RX FIFO
  set ip_repo_paths [get_property ip_repo_paths [current_project]]
  lappend ip_repo_paths $DV_ROOT/design/chipset/io_ctrl/xilinx/common/ip_cores/eth_cmac_syst/ip_repo/eth_rx_fifo
  set_property ip_repo_paths $ip_repo_paths [current_project]
  update_ip_catalog -rebuild
  source $DV_ROOT/design/chipset/io_ctrl/xilinx/common/ip_cores/eth_cmac_syst/tcl/eth_cmac_syst.tcl
}

# Set 'sources_1' fileset file properties for local files
foreach inc_file $ALL_INCLUDE_FILES {
    if {[file exists $inc_file]} {
        set file_obj [get_files -of_objects $fileset_obj [list "$inc_file"]]
        set_property "file_type" "Verilog Header" $file_obj
        set_property "is_enabled" "1" $file_obj
        set_property "is_global_include" "1" $file_obj
        set_property "library" "xil_defaultlib" $file_obj
        set_property "path_mode" "RelativeFirst" $file_obj
        set_property "used_in" "synthesis simulation" $file_obj
        set_property "used_in_simulation" "1" $file_obj
        set_property "used_in_synthesis" "1" $file_obj
    }
}
foreach impl_file $ALL_RTL_IMPL_FILES {
    if {[file exists $impl_file]} {
        set file_obj [get_files -of_objects $fileset_obj [list "$impl_file"]]
        if {[file extension $impl_file] == ".sv"} {
          set_property "file_type" "SystemVerilog" $file_obj
        } else {
          set_property "file_type" "Verilog" $file_obj
        }
        set_property "is_enabled" "1" $file_obj
        set_property "is_global_include" "0" $file_obj
        set_property "library" "xil_defaultlib" $file_obj
        set_property "path_mode" "RelativeFirst" $file_obj
        set_property "used_in" "synthesis implementation simulation" $file_obj
        set_property "used_in_implementation" "1" $file_obj
        set_property "used_in_simulation" "1" $file_obj
        set_property "used_in_synthesis" "1" $file_obj
    }
}
foreach coe_file $ALL_COE_FILES {
    if {[file exists $coe_file]} {
        set file_obj [get_files -of_objects $fileset_obj [list "$coe_file"]]
        set_property "is_enabled" "1" $file_obj
        set_property "is_global_include" "0" $file_obj
        set_property "library" "xil_defaultlib" $file_obj
        set_property "path_mode" "RelativeFirst" $file_obj
        set_property "scoped_to_cells" "" $file_obj
        set_property "scoped_to_ref" "" $file_obj
        set_property "used_in" "synthesis simulation" $file_obj
        set_property "used_in_simulation" "1" $file_obj
        set_property "used_in_synthesis" "1" $file_obj
    }
}
foreach prj_file $ALL_PRJ_IP_FILES {
    if {[file exists $prj_file]} {
        set file_obj [get_files -of_objects $fileset_obj [list "$prj_file"]]
        set_property "is_enabled" "1" $file_obj
        set_property "is_global_include" "0" $file_obj
        set_property "library" "xil_defaultlib" $file_obj
        set_property "path_mode" "RelativeFirst" $file_obj
        set_property "scoped_to_cells" "" $file_obj
        set_property "scoped_to_ref" "" $file_obj
        set_property "used_in" "synthesis" $file_obj
        set_property "used_in_synthesis" "1" $file_obj
    }
}
foreach xci_file $ALL_XCI_IP_FILES {
    if {[file exists $xci_file]} {
        set file_obj [get_files -of_objects $fileset_obj [list "$xci_file"]]
        if { ![get_property "is_locked" $file_obj] } {
          set_property "generate_synth_checkpoint" "1" $file_obj
        }
        set_property "is_enabled" "1" $file_obj
        set_property "is_global_include" "0" $file_obj
        set_property "library" "xil_defaultlib" $file_obj
        set_property "path_mode" "RelativeFirst" $file_obj
        set_property "used_in" "synthesis implementation simulation" $file_obj
        set_property "used_in_implementation" "1" $file_obj
        set_property "used_in_simulation" "1" $file_obj
        set_property "used_in_synthesis" "1" $file_obj
    }
}

# Set 'sources_1' fileset properties
set_property "design_mode" "RTL" $fileset_obj
set_property "edif_extra_search_paths" "" $fileset_obj
set_property "elab_link_dcps" "1" $fileset_obj
set_property "elab_load_timing_constraints" "1" $fileset_obj
set_property "generic" "" $fileset_obj
set_property "include_dirs" "${ALL_INCLUDE_DIRS}" $fileset_obj
set_property "lib_map_file" "" $fileset_obj
set_property "loop_count" "1000" $fileset_obj
set_property "name" "sources_1" $fileset_obj
set_property "top" "${DESIGN_NAME}" $fileset_obj
set_property "verilog_define" "${ALL_DEFAULT_VERILOG_MACROS}" $fileset_obj
set_property "verilog_uppercase" "0" $fileset_obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set fileset_obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set constraints_file "${BOARD_DIR}/constraints.xdc"
add_files -norecurse -fileset $fileset_obj $constraints_file
set file_obj [get_files -of_objects $fileset_obj [list "$constraints_file"]]
set_property "file_type" "XDC" $file_obj
set_property "is_enabled" "1" $file_obj
set_property "is_global_include" "0" $file_obj
set_property "library" "xil_defaultlib" $file_obj
set_property "path_mode" "RelativeFirst" $file_obj
set_property "processing_order" "NORMAL" $file_obj
set_property "scoped_to_cells" "" $file_obj
set_property "scoped_to_ref" "" $file_obj
set_property "used_in" "synthesis implementation" $file_obj
set_property "used_in_implementation" "1" $file_obj
set_property "used_in_synthesis" "1" $file_obj


if { $BOARD_DEFAULT_VERILOG_MACROS == "ALVEO_BOARD" } {
  if {[info exists ::env(PROTOSYN_RUNTIME_ETH)] &&
                  $::env(PROTOSYN_RUNTIME_ETH)=="TRUE"} {
    add_files -fileset [get_filesets constrs_1] "$DV_ROOT/design/chipset/io_ctrl/xilinx/common/ip_cores/eth_cmac_syst/xdc/eth_syst_$g_board_part.xdc"
  }
  if {![info exists ::env(PROTOSYN_RUNTIME_HBM)] ||
                   $::env(PROTOSYN_RUNTIME_HBM)!="TRUE"} {
    add_files -fileset [get_filesets constrs_1] "$BOARD_DIR/ddr4.xdc"
  }
}

# Set 'constrs_1' fileset properties
set_property "name" "constrs_1" $fileset_obj
set_property "target_constrs_file" "$constraints_file" $fileset_obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set fileset_obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set_property "generic" "" $fileset_obj
set_property "include_dirs" "${ALL_INCLUDE_DIRS}" $fileset_obj
set_property "name" "sim_1" $fileset_obj
set_property "nl.cell" "" $fileset_obj
set_property "nl.incl_unisim_models" "0" $fileset_obj
set_property "nl.process_corner" "slow" $fileset_obj
set_property "nl.rename_top" "" $fileset_obj
set_property "nl.sdf_anno" "1" $fileset_obj
set_property "nl.write_all_overrides" "0" $fileset_obj
set_property "runtime" "" $fileset_obj
set_property "source_set" "sources_1" $fileset_obj
set_property "top" "${DESIGN_NAME}" $fileset_obj
set_property "unit_under_test" "" $fileset_obj
set_property "vcs.compile.load_glbl" "1" $fileset_obj
set_property "vcs.compile.vhdlan.more_options" "" $fileset_obj
set_property "vcs.compile.vlogan.more_options" -value "-v2005" -object $fileset_obj
set_property "vcs.elaborate.debug_pp" "1" $fileset_obj
set_property "vcs.elaborate.vcs.more_options" "" $fileset_obj
set_property "vcs.simulate.runtime" "1000ns" $fileset_obj
set_property "vcs.simulate.saif" "" $fileset_obj
set_property "vcs.simulate.uut" "" $fileset_obj
set_property "vcs.simulate.vcs.more_options" "" $fileset_obj
set_property "verilog_define" "${ALL_DEFAULT_VERILOG_MACROS}" $fileset_obj
set_property "verilog_uppercase" "0" $fileset_obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  if {$VIVADO_FLOW_PERF_OPT} {
    create_run -name synth_1 -part ${FPGA_PART} -flow "Vivado Synthesis $VIVADO_VERSION" -strategy "Flow_PerfOptimized_high" -constrset constrs_1
  } else {
    create_run -name synth_1 -part ${FPGA_PART} -flow "Vivado Synthesis $VIVADO_VERSION" -strategy "Vivado Synthesis Defaults" -constrset constrs_1
  }
} else {
  if {$VIVADO_FLOW_PERF_OPT} {
    set_property strategy "Flow_PerfOptimized_high" [get_runs synth_1]
  } else {
    set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  }
  set_property flow "Vivado Synthesis $VIVADO_VERSION" [get_runs synth_1]
}
set fileset_obj [get_runs synth_1]
set_property "constrset" "constrs_1" $fileset_obj
set_property "flow" "Vivado Synthesis $VIVADO_VERSION" $fileset_obj
set_property "name" "synth_1" $fileset_obj
set_property "needs_refresh" "0" $fileset_obj
set_property "part" "${FPGA_PART}" $fileset_obj
set_property "srcset" "sources_1" $fileset_obj
if {$VIVADO_FLOW_PERF_OPT} {
  set_property "strategy" "Flow_PerfOptimized_high" $fileset_obj
} else {
  set_property "strategy" "Vivado Synthesis Defaults" $fileset_obj
}

set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.FSM_EXTRACTION auto [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.KEEP_EQUIVALENT_REGISTERS false [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RESOURCE_SHARING auto [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.NO_LC false [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.CONTROL_SET_OPT_THRESHOLD auto [get_runs synth_1]

#set_property "incremental_checkpoint" "" $fileset_obj
set_property "include_in_archive" "1" $fileset_obj
set_property "steps.synth_design.tcl.pre" "" $fileset_obj
set_property "steps.synth_design.tcl.post" "" $fileset_obj

# set the current synth run
current_run -synthesis $fileset_obj

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  if {$VIVADO_FLOW_PERF_OPT} {
    create_run -name impl_1 -part ${FPGA_PART} -flow "Vivado Implementation $VIVADO_VERSION" -strategy "Performance_ExtraTimingOpt" -constrset constrs_1 -parent_run synth_1
  } else {
    create_run -name impl_1 -part ${FPGA_PART} -flow "Vivado Implementation $VIVADO_VERSION" -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
  }
} else {
  if {$VIVADO_FLOW_PERF_OPT} {
    set_property strategy "Performance_Explore" [get_runs impl_1]
  } else {
    set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  }
  set_property flow "Vivado Implementation $VIVADO_VERSION" [get_runs impl_1]
}
set fileset_obj [get_runs impl_1]
set_property "constrset" "constrs_1" $fileset_obj
set_property "flow" "Vivado Implementation $VIVADO_VERSION" $fileset_obj
set_property "name" "impl_1" $fileset_obj
set_property "needs_refresh" "0" $fileset_obj
if {[string equal ${BOARD_PART} ""] != 0} {
  set_property "part" "${FPGA_PART}" $fileset_obj
}
set_property "srcset" "sources_1" $fileset_obj
if {$VIVADO_FLOW_PERF_OPT} {
  set_property "strategy" "Performance_Explore" $fileset_obj
} else {
  set_property "strategy" "Vivado Implementation Defaults" $fileset_obj
}

#set_property "incremental_checkpoint" "" $fileset_obj
set_property "include_in_archive" "1" $fileset_obj
set_property "steps.opt_design.is_enabled" "1" $fileset_obj
set_property "steps.opt_design.tcl.pre" "" $fileset_obj
set_property "steps.opt_design.tcl.post" "" $fileset_obj
set_property "steps.opt_design.args.verbose" "0" $fileset_obj
if {$VIVADO_FLOW_PERF_OPT} {
  set_property "steps.opt_design.args.directive" "ExploreWithRemap" $fileset_obj
} else {
  set_property "steps.opt_design.args.directive" "Default" $fileset_obj
}
set_property -name {steps.opt_design.args.more options} -value {} -objects $fileset_obj
set_property "steps.place_design.tcl.pre" "" $fileset_obj
set_property "steps.place_design.tcl.post" "" $fileset_obj
if {$VIVADO_FLOW_PERF_OPT} {
  set_property "steps.place_design.args.directive" "Explore" $fileset_obj
} else {
  set_property "steps.place_design.args.directive" "Default" $fileset_obj
}
set_property -name {steps.place_design.args.more options} -value {} -objects $fileset_obj

set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]

set_property "steps.route_design.tcl.pre" "" $fileset_obj
set_property "steps.route_design.tcl.post" "" $fileset_obj
if {$VIVADO_FLOW_PERF_OPT} {
 set_property "steps.route_design.args.directive" "AggressiveExplore" $fileset_obj
} else {
 set_property "steps.route_design.args.directive" "Default" $fileset_obj
}

set VIVADO_POSTROUTEPHYSOPT $::env(VIVADO_POSTROUTEPHYSOPT)
if {$VIVADO_POSTROUTEPHYSOPT} {
  set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
  set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.TCL.POST {} [get_runs impl_1]
  set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE ExploreWithAggressiveHoldFix [get_runs impl_1]
} else {
  set_property "steps.post_route_phys_opt_design.is_enabled" "0" $fileset_obj
  set_property "steps.post_route_phys_opt_design.tcl.pre" "" $fileset_obj
  set_property "steps.post_route_phys_opt_design.tcl.post" "" $fileset_obj
  set_property "steps.post_route_phys_opt_design.args.directive" "Default" $fileset_obj
  set_property -name {steps.post_route_phys_opt_design.args.more options} -value {} -objects $fileset_obj
}

set_property -name {steps.route_design.args.more options} -value {} -objects $fileset_obj
set_property "steps.write_bitstream.tcl.pre" "" $fileset_obj
set_property "steps.write_bitstream.tcl.post" "" $fileset_obj
set_property "steps.write_bitstream.args.raw_bitfile" "0" $fileset_obj
set_property "steps.write_bitstream.args.mask_file" "0" $fileset_obj
set_property "steps.write_bitstream.args.no_binary_bitfile" "0" $fileset_obj
set_property "steps.write_bitstream.args.bin_file" "0" $fileset_obj
set_property "steps.write_bitstream.args.readback_file" "0" $fileset_obj
set_property "steps.write_bitstream.args.logic_location_file" "0" $fileset_obj
set_property "steps.write_bitstream.args.verbose" "0" $fileset_obj
set_property -name {steps.write_bitstream.args.more options} -value {} -objects $fileset_obj

# set the current impl run
current_run -implementation $fileset_obj

puts "INFO: Project created:${PROJECT_NAME}"


