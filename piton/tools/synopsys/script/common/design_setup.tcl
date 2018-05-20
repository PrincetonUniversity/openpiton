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

# Design variables

# Clock periods in ps
set CPU_CLOCK_PERIOD                1428.57 ; # .7 Ghz
set IO_CLOCK_PERIOD                 2857.15 ; # 350 Mhz
set JTAG_CLOCK_PERIOD               10000.0 ; # 100 Mhz
set CPU_REF_CLOCK_PERIOD            10000.0 ; # 100 Mhz

# Tile/Mesh configuration
set PITON_X_TILES                   5
set PITON_Y_TILES                   5
set PITON_NUM_TILES                 [expr $PITON_X_TILES * $PITON_Y_TILES]

# NoC configuration
set PITON_NETWORK_CONFIG            "2dmesh_config"

# Cache Configurations
set PITON_CONFIG_L15_SIZE           8192
set PITON_CONFIG_L15_ASSOCIATIVITY  4
set PITON_CONFIG_L1D_SIZE           8192
set PITON_CONFIG_L1D_ASSOCIATIVITY  4
set PITON_CONFIG_L1I_SIZE           16384
set PITON_CONFIG_L1I_ASSOCIATIVITY  4
set PITON_CONFIG_L2_SIZE            65536
set PITON_CONFIG_L2_ASSOCIATIVITY   4

# Any Verilog macros that should be set when reading in (non design-specific)
# Module specific macros can be put in the module_setup.tcl for that module
set DEFAULT_MACROS                  "RUNDC NO_SCAN TOTAL_NUM_TILE=${PITON_NUM_TILES}"

# Default min and max routing layers
# Can be overridden from module specific scripts
set MIN_ROUTING_LAYER               "M1"
set MAX_ROUTING_LAYER               "M9"

# Default block-level pin layers
# Can be overridden from module specific scripts
set MODULE_PIN_LAYERS               "M8 M9"

# Power and ground net/port setup
# Setup different chip voltages and power/ground nets here.
# Feel free to set variables for any number of voltages you need,
# these are just the ones that were used in the Piton tapeout.  If
# you add/remove or change the name of these variables, the places
# where they are used will need to be updated also
set MW_POWER_NET                    "VDD"
set MW_POWER_PORT                   "VDD"
set MW_SRAM_POWER_NET               "VCS"
set MW_SRAM_POWER_PORT              "VCS"
set MW_IO_POWER_NET                 "VDD180"
set MW_IO_POWER_PORT                "VDD180"
set MW_GROUND_NET                   "VSS"
set MW_GROUND_PORT                  "VSS"
set MW_PLL_POWER_NET                "AVDD"
set MW_PLL_POWER_PORT               "AVDD"
set MW_PLL_GROUND_NET               "AVSS"
set MW_PLL_GROUND_PORT              "AVSS"

# Global macros for timing constraints
# for now the overlap between input/output should be around 100ps for routing
# values with the prefix AUTOCON should not be used manually by the user

## input to register can have a lot of slack

set RESET_INPUT_DELAY               [expr $CPU_CLOCK_PERIOD * .25]
set RESET_INPUT_DELAY_LATE          [expr $CPU_CLOCK_PERIOD * .75]

set REG_INPUT_DELAY                 [expr $CPU_CLOCK_PERIOD * .85]
set REG_OUTPUT_DELAY                [expr $CPU_CLOCK_PERIOD * .85]
set INFERRED_REG_OUTPUT_DELAY       [expr $CPU_CLOCK_PERIOD * .25]
set INFERRED_REG_INPUT_DELAY        [expr $CPU_CLOCK_PERIOD * .25]

set HOLD_DELAY_MARGIN               [expr $CPU_CLOCK_PERIOD * .075]

# combinational 
set COM_INPUT_DELAY_0               [expr $CPU_CLOCK_PERIOD * .10]
set COM_INPUT_DELAY_1               [expr $CPU_CLOCK_PERIOD * .20]
set COM_INPUT_DELAY_2               [expr $CPU_CLOCK_PERIOD * .30]
set COM_INPUT_DELAY_3               [expr $CPU_CLOCK_PERIOD * .40]
set COM_INPUT_DELAY_4               [expr $CPU_CLOCK_PERIOD * .50]
set COM_INPUT_DELAY_5               [expr $CPU_CLOCK_PERIOD * .60]
set COM_INPUT_DELAY_6               [expr $CPU_CLOCK_PERIOD * .70]
set COM_INPUT_DELAY_7               [expr $CPU_CLOCK_PERIOD * .80]
set COM_INPUT_DELAY_8               [expr $CPU_CLOCK_PERIOD * .90]
set COM_INPUT_DELAY_9               [expr $CPU_CLOCK_PERIOD * 1.0]

set COM_OUTPUT_DELAY_0              [expr $CPU_CLOCK_PERIOD * 1.0]
set COM_OUTPUT_DELAY_1              [expr $CPU_CLOCK_PERIOD * .90]
set COM_OUTPUT_DELAY_2              [expr $CPU_CLOCK_PERIOD * .80]
set COM_OUTPUT_DELAY_3              [expr $CPU_CLOCK_PERIOD * .70]
set COM_OUTPUT_DELAY_4              [expr $CPU_CLOCK_PERIOD * .60]
set COM_OUTPUT_DELAY_5              [expr $CPU_CLOCK_PERIOD * .50]
set COM_OUTPUT_DELAY_6              [expr $CPU_CLOCK_PERIOD * .40]
set COM_OUTPUT_DELAY_7              [expr $CPU_CLOCK_PERIOD * .30]
set COM_OUTPUT_DELAY_8              [expr $CPU_CLOCK_PERIOD * .20]
set COM_OUTPUT_DELAY_9              [expr $CPU_CLOCK_PERIOD * .10]
