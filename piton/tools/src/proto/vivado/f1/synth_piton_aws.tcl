# Amazon FPGA Hardware Development Kit
#
# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions and
# limitations under the License.

#Param needed to avoid clock name collisions
set_param sta.enableAutoGenClkNamePersistence 0
set CL_MODULE $CL_MODULE
set VDEFINES $VDEFINES

create_project -in_memory -part [DEVICE_TYPE] -force ${PROJECT_NAME}
#

########################################
## Generate clocks based on Recipe 
########################################

puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Calling aws_gen_clk_constraints.tcl to generate clock constraints from developer's specified recipe.";

source $scriptDir/aws_gen_clk_constraints.tcl

#############################
## Read design files
#############################

puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Reading developer's Custom Logic files post encryption.";

#---- User would replace this section -----

#foreach DIR $ALL_INCLUDE_DIRS {
#  foreach FILE [glob -nocomplain -dir $DIR *.*h] {
#    lappend -ifmissing ALL_INCLUDE_FILES $FILE
#  }
#}

foreach FILE $ALL_INCLUDE_FILES {
  read_verilog $FILE
  set_property is_global_include true [get_files $FILE]
}

# concat include dirs here because we don't want files from piton_aws 
# include dirs to be global include

foreach FILE $ALL_RTL_IMPL_FILES {
  read_verilog -quiet $FILE
}



foreach FILE $ALL_XCI_IP_FILES {
  if { [file exists $FILE] == 1 } {
    set IPNAME [file tail [file rootname $FILE]]
    read_ip $FILE
#    upgrade_ip [get_ips $IPNAME]
#    generate_target all [get_ips $IPNAME]
#    synth_ip [get_ips $IPNAME]
  }
}

upgrade_ip [get_ips -all]

#---- End of section replaced by User ----

puts "AWS FPGA: Reading AWS Shell design";

#Read AWS Design files
read_verilog -sv [ list \
  $HDK_SHELL_DESIGN_DIR/lib/lib_pipe.sv \
  $HDK_SHELL_DESIGN_DIR/lib/bram_2rw.sv \
  $HDK_SHELL_DESIGN_DIR/lib/flop_fifo.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sync.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/flop_ccf.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/ccf_ctl.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_acc_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_gen_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sh_ddr.sv \
  $HDK_SHELL_DESIGN_DIR/interfaces/cl_ports.vh 
]

puts "AWS FPGA: Reading IP blocks";

#Read DDR IP
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/ip/ddr4_core/ddr4_core.xci 
]

#Read IP for axi register slices
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/ip/src_register_slice/src_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/ip/dest_register_slice/dest_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/ip/axi_clock_converter_0/axi_clock_converter_0.xci \
  $HDK_SHELL_DESIGN_DIR/ip/axi_register_slice/axi_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/ip/axi_register_slice_light/axi_register_slice_light.xci
]

#Read IP for virtual jtag / ILA/VIO
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/ip/cl_debug_bridge/cl_debug_bridge.xci \
  $HDK_SHELL_DESIGN_DIR/ip/ila_1/ila_1.xci \
  $HDK_SHELL_DESIGN_DIR/ip/ila_0/ila_0.xci 
]

# Additional IP's that might be needed if using the DDR
read_bd [ list \
  $HDK_SHELL_DESIGN_DIR/ip/cl_axi_interconnect/cl_axi_interconnect.bd
]

puts "AWS FPGA: Reading AWS constraints";

#Read all the constraints
#
#  cl_clocks_aws.xdc  - AWS auto-generated clock constraint.   ***DO NOT MODIFY***
#  cl_ddr.xdc         - AWS provided DDR pin constraints.      ***DO NOT MODIFY***
#  cl_synth_user.xdc  - Developer synthesis constraints.
read_xdc [ list \
   $PROTOSYN_RUNTIME_DESIGN_PATH/f1/cl_clocks_aws.xdc \
   $HDK_SHELL_DIR/build/constraints/cl_ddr.xdc \
   $HDK_SHELL_DIR/build/constraints/cl_synth_aws.xdc \
   $PROTOSYN_RUNTIME_DESIGN_PATH/f1/cl_synth_user.xdc
]

#Do not propagate local clock constraints for clocks generated in the SH
set_property USED_IN {synthesis implementation OUT_OF_CONTEXT} [get_files cl_clocks_aws.xdc]
set_property PROCESSING_ORDER EARLY  [get_files cl_clocks_aws.xdc]

########################
# CL Synthesis
########################
puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Start design synthesis.";

#update_compile_order -fileset sources_1
puts "\nRunning synth_design for $CL_MODULE $scriptDir \[[clock format [clock seconds] -format {%a %b %d %H:%M:%S %Y}]\]"


set fileset_obj [get_filesets sources_1]
source additional_defines.tcl
set ALL_VERILOG_MACROS [concat "XSDB_SLV_DIS" $ALL_DEFAULT_VERILOG_MACROS $PROTOSYN_RUNTIME_DEFINES]
set_property "verilog_define" "${ALL_VERILOG_MACROS}" $fileset_obj
set VDEFINES [concat $VDEFINES $ALL_VERILOG_MACROS]
reorder_files -auto -disable_unused
eval [concat synth_design -top $CL_MODULE -part [DEVICE_TYPE] -mode out_of_context $synth_options -directive $synth_directive -include_dirs {$ALL_INCLUDE_DIRS}]

set failval [catch {exec grep "FAIL" failfast.csv}]
if { $failval==0 } {
	puts "AWS FPGA: FATAL ERROR--Resource utilization error; check failfast.csv for details"
	exit 1
}

puts "AWS FPGA: ([clock format [clock seconds] -format %T]) writing post synth checkpoint.";

write_checkpoint -force $implDir/${timestamp}.CL.post_synth.dcp

close_project
#Set param back to default value
set_param sta.enableAutoGenClkNamePersistence 1
