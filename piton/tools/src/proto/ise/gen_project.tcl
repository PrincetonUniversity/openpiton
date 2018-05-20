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
# for creating a ISE project
#

# Boiler plate startup
set DV_ROOT $::env(DV_ROOT)
source $DV_ROOT/tools/src/proto/ise/setup.tcl

# Close any open project
project close

# Delete any existing project
if {[file exists ${ISE_PROJECT_FILE}]} {
    file delete ${ISE_PROJECT_FILE}
}

# Create project
project new ${ISE_PROJECT_FILE}

# Set project propoerties
project set family ${DEVICE_FAMILY}
project set device ${DEVICE_ID}
project set package ${DEVICE_PACKAGE}
project set speed ${DEVICE_SPEED}
project set top_level_module_type "HDL"
project set synthesis_tool "XST (VHDL/Verilog)"
project set simulator "ISim (VHDL/Verilog)"
project set "Preferred Language" "Verilog"
project set "Enable Message Filtering" "false"

foreach prj_file ${ALL_FILES} {
    if {[file exists $prj_file]} {
        xfile add $prj_file
    }
}
# Add constraints files
xfile add "${BOARD_DIR}/constraints.ucf"

# Set top module
project set top ${DESIGN_NAME}

# Set project process properties
project set "Compiled Library Directory" "\$XILINX/<language>/<simulator>"
project set "Global Optimization" "Off" -process "Map"
project set "Pack I/O Registers/Latches into IOBs" "Off" -process "Map"
project set "Place And Route Mode" "Route Only" -process "Place & Route"
project set "Regenerate Core" "Under Current Project Setting" -process "Regenerate Core"
project set "Filter Files From Compile Order" "true"
project set "Last Applied Goal" "Balanced"
project set "Last Applied Strategy" "Xilinx Default (unlocked)"
project set "Last Unlock Status" "false"
project set "Manual Compile Order" "false"
project set "Placer Effort Level" "High" -process "Map"
project set "Extra Cost Tables" "0" -process "Map"
project set "LUT Combining" "Off" -process "Map"
project set "Combinatorial Logic Optimization" "false" -process "Map"
project set "Starting Placer Cost Table (1-100)" "1" -process "Map"
project set "Power Reduction" "Off" -process "Map"
project set "Report Fastest Path(s) in Each Constraint" "true" -process "Generate Post-Place & Route Static Timing"
project set "Generate Datasheet Section" "true" -process "Generate Post-Place & Route Static Timing"
project set "Generate Timegroups Section" "false" -process "Generate Post-Place & Route Static Timing"
project set "Report Fastest Path(s) in Each Constraint" "true" -process "Generate Post-Map Static Timing"
project set "Generate Datasheet Section" "true" -process "Generate Post-Map Static Timing"
project set "Generate Timegroups Section" "false" -process "Generate Post-Map Static Timing"
project set "Project Description" ""
project set "Property Specification in Project File" "Store all values"
project set "Reduce Control Sets" "Auto" -process "Synthesize - XST"
project set "Shift Register Minimum Size" "2" -process "Synthesize - XST"
project set "Case Implementation Style" "None" -process "Synthesize - XST"
project set "RAM Extraction" "true" -process "Synthesize - XST"
project set "ROM Extraction" "true" -process "Synthesize - XST"
project set "FSM Encoding Algorithm" "Auto" -process "Synthesize - XST"
project set "Optimization Goal" "Speed" -process "Synthesize - XST"
project set "Optimization Effort" "Normal" -process "Synthesize - XST"
project set "Resource Sharing" "false" -process "Synthesize - XST"
project set "Shift Register Extraction" "true" -process "Synthesize - XST"
project set "User Browsed Strategy Files" ""
project set "VHDL Source Analysis Standard" "VHDL-200X"
project set "Analysis Effort Level" "Standard" -process "Analyze Power Distribution (XPower Analyzer)"
project set "Analysis Effort Level" "Standard" -process "Generate Text Power Report"
project set "Input TCL Command Script" "" -process "Generate Text Power Report"
project set "Load Physical Constraints File" "Default" -process "Analyze Power Distribution (XPower Analyzer)"
project set "Load Physical Constraints File" "Default" -process "Generate Text Power Report"
project set "Load Simulation File" "Default" -process "Analyze Power Distribution (XPower Analyzer)"
project set "Load Simulation File" "Default" -process "Generate Text Power Report"
project set "Load Setting File" "" -process "Analyze Power Distribution (XPower Analyzer)"
project set "Load Setting File" "" -process "Generate Text Power Report"
project set "Setting Output File" "" -process "Generate Text Power Report"
project set "Produce Verbose Report" "false" -process "Generate Text Power Report"
project set "Other XPWR Command Line Options" "" -process "Generate Text Power Report"
project set "Essential Bits" "false" -process "Generate Programming File"
project set "Other Bitgen Command Line Options" "" -process "Generate Programming File"
project set "Maximum Signal Name Length" "20" -process "Generate IBIS Model"
project set "Show All Models" "false" -process "Generate IBIS Model"
project set "VCCAUX Voltage Level" "2.5V" -process "Generate IBIS Model"
project set "Disable Detailed Package Model Insertion" "false" -process "Generate IBIS Model"
project set "Launch SDK after Export" "true" -process "Export Hardware Design To SDK with Bitstream"
project set "Launch SDK after Export" "true" -process "Export Hardware Design To SDK without Bitstream"
project set "Target UCF File Name" "" -process "Back-annotate Pin Locations"
project set "Ignore User Timing Constraints" "false" -process "Map"
project set "Register Ordering" "4" -process "Map"
project set "Use RLOC Constraints" "Yes" -process "Map"
project set "Other Map Command Line Options" "" -process "Map"
project set "Use LOC Constraints" "true" -process "Translate"
project set "Other Ngdbuild Command Line Options" "" -process "Translate"
project set "Use 64-bit PlanAhead on 64-bit Systems" "true" -process "Floorplan Area/IO/Logic (PlanAhead)"
project set "Use 64-bit PlanAhead on 64-bit Systems" "true" -process "I/O Pin Planning (PlanAhead) - Pre-Synthesis"
project set "Use 64-bit PlanAhead on 64-bit Systems" "true" -process "I/O Pin Planning (PlanAhead) - Post-Synthesis"
project set "Ignore User Timing Constraints" "false" -process "Place & Route"
project set "Other Place & Route Command Line Options" "" -process "Place & Route"
project set "Use DSP Block" "Auto" -process "Synthesize - XST"
project set "UserID Code (8 Digit Hexadecimal)" "0xFFFFFFFF" -process "Generate Programming File"
project set "Configuration Pin Done" "Pull Up" -process "Generate Programming File"
project set "Enable External Master Clock" "false" -process "Generate Programming File"
project set "Create ASCII Configuration File" "false" -process "Generate Programming File"
project set "Create Bit File" "true" -process "Generate Programming File"
project set "Enable BitStream Compression" "false" -process "Generate Programming File"
project set "Run Design Rules Checker (DRC)" "true" -process "Generate Programming File"
project set "Enable Cyclic Redundancy Checking (CRC)" "true" -process "Generate Programming File"
project set "Create IEEE 1532 Configuration File" "false" -process "Generate Programming File"
project set "Create ReadBack Data Files" "false" -process "Generate Programming File"
project set "Configuration Pin Program" "Pull Up" -process "Generate Programming File"
project set "Place MultiBoot Settings into Bitstream" "false" -process "Generate Programming File"
project set "Configuration Rate" "2" -process "Generate Programming File"
project set "Set SPI Configuration Bus Width" "1" -process "Generate Programming File"
project set "JTAG Pin TCK" "Pull Up" -process "Generate Programming File"
project set "JTAG Pin TDI" "Pull Up" -process "Generate Programming File"
project set "JTAG Pin TDO" "Pull Up" -process "Generate Programming File"
project set "JTAG Pin TMS" "Pull Up" -process "Generate Programming File"
project set "Unused IOB Pins" "Pull Down" -process "Generate Programming File"
project set "Watchdog Timer Value" "0xFFFF" -process "Generate Programming File"
project set "Security" "Enable Readback and Reconfiguration" -process "Generate Programming File"
project set "FPGA Start-Up Clock" "CCLK" -process "Generate Programming File"
project set "Done (Output Events)" "Default (4)" -process "Generate Programming File"
project set "Drive Done Pin High" "false" -process "Generate Programming File"
project set "Enable Outputs (Output Events)" "Default (5)" -process "Generate Programming File"
project set "Wait for DCM and PLL Lock (Output Events)" "Default (NoWait)" -process "Generate Programming File"
project set "Release Write Enable (Output Events)" "Default (6)" -process "Generate Programming File"
project set "Enable Internal Done Pipe" "true" -process "Generate Programming File"
project set "Drive Awake Pin During Suspend/Wake Sequence" "false" -process "Generate Programming File"
project set "Enable Suspend/Wake Global Set/Reset" "false" -process "Generate Programming File"
project set "Enable Multi-Pin Wake-Up Suspend Mode" "false" -process "Generate Programming File"
project set "GTS Cycle During Suspend/Wakeup Sequence" "4" -process "Generate Programming File"
project set "GWE Cycle During Suspend/Wakeup Sequence" "5" -process "Generate Programming File"
project set "Wakeup Clock" "Startup Clock" -process "Generate Programming File"
project set "Allow Logic Optimization Across Hierarchy" "false" -process "Map"
project set "Maximum Compression" "false" -process "Map"
project set "Generate Detailed MAP Report" "false" -process "Map"
project set "Map Slice Logic into Unused Block RAMs" "false" -process "Map"
project set "Perform Timing-Driven Packing and Placement" "false"
project set "Trim Unconnected Signals" "true" -process "Map"
project set "Create I/O Pads from Ports" "false" -process "Translate"
project set "Macro Search Path" "" -process "Translate"
project set "Netlist Translation Type" "Timestamp" -process "Translate"
project set "User Rules File for Netlister Launcher" "" -process "Translate"
project set "Allow Unexpanded Blocks" "false" -process "Translate"
project set "Allow Unmatched LOC Constraints" "false" -process "Translate"
project set "Allow Unmatched Timing Group Constraints" "false" -process "Translate"
project set "Perform Advanced Analysis" "false" -process "Generate Post-Place & Route Static Timing"
project set "Report Paths by Endpoint" "3" -process "Generate Post-Place & Route Static Timing"
project set "Report Type" "Verbose Report" -process "Generate Post-Place & Route Static Timing"
project set "Number of Paths in Error/Verbose Report" "3" -process "Generate Post-Place & Route Static Timing"
project set "Stamp Timing Model Filename" "" -process "Generate Post-Place & Route Static Timing"
project set "Report Unconstrained Paths" "" -process "Generate Post-Place & Route Static Timing"
project set "Perform Advanced Analysis" "false" -process "Generate Post-Map Static Timing"
project set "Report Paths by Endpoint" "3" -process "Generate Post-Map Static Timing"
project set "Report Type" "Verbose Report" -process "Generate Post-Map Static Timing"
project set "Number of Paths in Error/Verbose Report" "3" -process "Generate Post-Map Static Timing"
project set "Report Unconstrained Paths" "" -process "Generate Post-Map Static Timing"
project set "Number of Clock Buffers" "16" -process "Synthesize - XST"
project set "Add I/O Buffers" "true" -process "Synthesize - XST"
project set "Global Optimization Goal" "AllClockNets" -process "Synthesize - XST"
project set "Keep Hierarchy" "No" -process "Synthesize - XST"
project set "Max Fanout" "100000" -process "Synthesize - XST"
project set "Register Balancing" "No" -process "Synthesize - XST"
project set "Register Duplication" "true" -process "Synthesize - XST"
project set "Library for Verilog Sources" "" -process "Synthesize - XST"
project set "Export Results to XPower Estimator" "" -process "Generate Text Power Report"
project set "Asynchronous To Synchronous" "false" -process "Synthesize - XST"
project set "Automatic BRAM Packing" "false" -process "Synthesize - XST"
project set "BRAM Utilization Ratio" "100" -process "Synthesize - XST"
project set "Bus Delimiter" "<>" -process "Synthesize - XST"
project set "Case" "Maintain" -process "Synthesize - XST"
project set "Cores Search Directories" "" -process "Synthesize - XST"
project set "Cross Clock Analysis" "false" -process "Synthesize - XST"
project set "DSP Utilization Ratio" "100" -process "Synthesize - XST"
project set "Equivalent Register Removal" "true" -process "Synthesize - XST"
project set "FSM Style" "LUT" -process "Synthesize - XST"
project set "Generate RTL Schematic" "Yes" -process "Synthesize - XST"
project set "Generics, Parameters" "" -process "Synthesize - XST"
project set "Hierarchy Separator" "/" -process "Synthesize - XST"
project set "HDL INI File" "" -process "Synthesize - XST"
project set "LUT Combining" "Auto" -process "Synthesize - XST"
project set "Library Search Order" "" -process "Synthesize - XST"
project set "Netlist Hierarchy" "As Optimized" -process "Synthesize - XST"
project set "Optimize Instantiated Primitives" "false" -process "Synthesize - XST"
project set "Pack I/O Registers into IOBs" "Auto" -process "Synthesize - XST"
project set "Power Reduction" "false" -process "Synthesize - XST"
project set "Read Cores" "true" -process "Synthesize - XST"
project set "Use Clock Enable" "Auto" -process "Synthesize - XST"
project set "Use Synchronous Reset" "Auto" -process "Synthesize - XST"
project set "Use Synchronous Set" "Auto" -process "Synthesize - XST"
project set "Use Synthesis Constraints File" "true" -process "Synthesize - XST"
project set "Verilog Include Directories" "[join ${ALL_INCLUDE_DIRS} " | "]" -process "Synthesize - XST"
project set "Verilog Macros" "[join ${ALL_DEFAULT_VERILOG_MACROS} " | "]" -process "Synthesize - XST"
project set "Work Directory" "${PROJECT_DIR}" -process "Synthesize - XST"
project set "Write Timing Constraints" "false" -process "Synthesize - XST"
project set "Other XST Command Line Options" "" -process "Synthesize - XST"
project set "Timing Mode" "Performance Evaluation" -process "Map"
project set "Generate Asynchronous Delay Report" "false" -process "Place & Route"
project set "Generate Clock Region Report" "false" -process "Place & Route"
project set "Generate Post-Place & Route Power Report" "false" -process "Place & Route"
project set "Generate Post-Place & Route Simulation Model" "false" -process "Place & Route"
project set "Power Reduction" "false" -process "Place & Route"
project set "Place & Route Effort Level (Overall)" "High" -process "Place & Route"
project set "Auto Implementation Compile Order" "true"
project set "Equivalent Register Removal" "true" -process "Map"
project set "Placer Extra Effort" "None" -process "Map"
project set "Power Activity File" "" -process "Map"
project set "Register Duplication" "Off" -process "Map"
project set "Generate Constraints Interaction Report" "false" -process "Generate Post-Map Static Timing"
project set "Synthesis Constraints File" "" -process "Synthesize - XST"
project set "RAM Style" "Auto" -process "Synthesize - XST"
project set "Maximum Number of Lines in Report" "1000" -process "Generate Text Power Report"
project set "MultiBoot: Insert IPROG CMD in the Bitfile" "Enable" -process "Generate Programming File"
project set "Output File Name" "${PROJECT_NAME}" -process "Generate IBIS Model"
project set "Timing Mode" "Performance Evaluation" -process "Place & Route"
project set "Create Binary Configuration File" "false" -process "Generate Programming File"
project set "Enable Debugging of Serial Mode BitStream" "false" -process "Generate Programming File"
project set "Create Logic Allocation File" "false" -process "Generate Programming File"
project set "Create Mask File" "false" -process "Generate Programming File"
project set "Retry Configuration if CRC Error Occurs" "false" -process "Generate Programming File"
project set "MultiBoot: Starting Address for Next Configuration" "0x00000000" -process "Generate Programming File"
project set "MultiBoot: Starting Address for Golden Configuration" "0x00000000" -process "Generate Programming File"
project set "MultiBoot: Use New Mode for Next Configuration" "true" -process "Generate Programming File"
project set "MultiBoot: User-Defined Register for Failsafe Scheme" "0x0000" -process "Generate Programming File"
project set "Setup External Master Clock Division" "1" -process "Generate Programming File"
project set "Allow SelectMAP Pins to Persist" "false" -process "Generate Programming File"
project set "Mask Pins for Multi-Pin Wake-Up Suspend Mode" "0x00" -process "Generate Programming File"
project set "Enable Multi-Threading" "Off" -process "Map"
project set "Generate Constraints Interaction Report" "false" -process "Generate Post-Place & Route Static Timing"
project set "Move First Flip-Flop Stage" "true" -process "Synthesize - XST"
project set "Move Last Flip-Flop Stage" "true" -process "Synthesize - XST"
project set "ROM Style" "Auto" -process "Synthesize - XST"
project set "Safe Implementation" "No" -process "Synthesize - XST"
project set "Power Activity File" "" -process "Place & Route"
project set "Extra Effort (Highest PAR level only)" "None" -process "Place & Route"
project set "MultiBoot: Next Configuration Mode" "001" -process "Generate Programming File"
project set "Encrypt Bitstream" "false" -process "Generate Programming File"
project set "Enable Multi-Threading" "Off" -process "Place & Route"
project set "AES Initial Vector" "" -process "Generate Programming File"
project set "Encrypt Key Select" "BBRAM" -process "Generate Programming File"
project set "AES Key (Hex String)" "" -process "Generate Programming File"
project set "Input Encryption Key File" "" -process "Generate Programming File"
project set "Functional Model Target Language" "Verilog" -process "View HDL Source"
project set "Change Device Speed To" "${DEVICE_SPEED}" -process "Generate Post-Place & Route Static Timing"
project set "Change Device Speed To" "${DEVICE_SPEED}" -process "Generate Post-Map Static Timing"

# Save and close project
project save
project close
