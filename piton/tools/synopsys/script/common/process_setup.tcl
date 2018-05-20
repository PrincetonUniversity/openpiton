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

# Process specific variables

# Height of standard cell rows (in um)
set std_cells_height        0.9

# Mins spacing rules
set min_spacing_mx_low      0.05
set min_spacing_bx          0.1
set min_spacing_mx_high     0.8

# The following variables are space separated lists and 
# should follow the same order for each library included
# i.e.  set TARGET_LIBRARY_FILES   "<HVT_DB_PATH> <RVT_DB_PATH> <LVT_DB_PATH>"
#       set TARGET_LIBRARY_VERILOG "<HVT_V_PATH> <RVT_V_PATH> <LVT_V_PATH>"
#       set MIN_LIBRARY_FILES      "<HVT_SLOW_DB_PATH> <HVT_FAST_DB_PATH> <RVT_SLOW_DB_PATH> <RVT_FAST_DB_PATH> <LVT_SLOW_DB_PATH> <LVT_FAST_DB_PATH>"

# Do not include module specifc SRAMs in the below lists, these variables
# should only include standard cell libraries.  Module specific SRAMs are
# handled in module specific TCL scripts

# Target standard cell technology libraries
set TARGET_LIBRARY_FILES        "TARGET_STDCELL_LIBRARIES_HERE (.db, put multiple Vt as space separated list)"

# Target standard cell technology verilog
set TARGET_LIBRARY_VERILOG      "TARGET_STDCELL_LIBRARY_TEST_SIMULATION_VERILOG_HERE (.v)"

# List of max min library pairs for setup and hold analysis
# List should follow this format: "max1 min1 max2 min2 max3 min3..."
# Should follow same order as target libraries, but two here for each one in target library
set MIN_LIBRARY_FILES           "MAX_SETUP_STDCELL_LIBRARY_HERE (.db) MIN_HOLD_STDCELL_LIBRARY_HERE (.db)"

# Target standard cell Milkyway reference libraries
set MW_REFERENCE_LIB_DIRS       "TARGET_STDCELL_MW_REFERENCE_LIBRARIES_HERE (MW directory)"

# Target standard cell GDS merge files if necessary 
# (depends on if CEL views were extracted for above MW libs.
#  This may depend on how they were provided to you, but to be
#  safe you can place the GDS for stdcells here, it may just increase
#  runtime in merge_gds
set TARGET_LIBRARY_GDSII        "" ; # Optional

# Target standard cell libarry SP merge files for LVS
set TARGET_LIBRARY_SP           "TARGET_STDCELL_LIBRARY_LVS_SPICE_HERE (.cdl/.sp)"

# MW reference control file (not really used, do not need to set)
set MW_REFERENCE_CONTROL_FILE   ""

# Tcl script with library modifications to set don't use cells (not necessary)
set LIBRARY_DONT_USE_FILE       ""

# Milkyway technology file for process
set TECH_FILE                   "TARGET_STDCELL_TECH_FILE_HERE (.tf)"
# Mapping file for TLUplus
set MAP_FILE                    "PDK_TLUPLUS_MAP_FILE_HERE (.map)"
# TLUplus max and min files
set TLUPLUS_MAX_FILE            "PDK_TLUPLUS_MAX_FILE_HERE (.tluplus)"
set TLUPLUS_MIN_FILE            "PDK_TLUPLUS_MIN_FILE_HERE (.tluplus)"

# Antenna rules file
set ANTENNA_RULES_FILE          "ANTENNA_RULES_FILE_HERE (.tcl)"

# Stream out layer map file for writing out GDSII
set MAP_LAYER_FILE              "STDCELL_GDSII_STREAM_OUT_LAYER_FILE_HERE (stream_out_layer_file)"

#
# Special standard cells referenced by scripts
#

# Tie high and tie low cells
set TIEHIGHCELL                 "TIE_HIGH_STDCELL_HERE"
set TIELOWCELL                  "TIE_LOW_STDCELL_HERE"

# End cap cells (Optional)
set HORIZONTAL_END_CAP_CELL     ""
set VERTICAL_END_CAP_CELL       ""

# Generic drivng buffer cell for constraints estimation
set CONSTRAINTS_DRIVING_CELL    ""
set CONSTRAINTS_DRIVING_CELLLIB ""

# Antenna fixing diodes 
set ICC_ANTENNA_FIX_DIODES      "ANTENNA_DIODE_STDCELL(S)_HERE"

# Filler cells list
set FILLER_CELLS_LIST           "FILLER_STDCELLS_HERE"

# Primetime ECO allowable buffers for DRC and hold fixing
# does not need to be in a separate file, but we had a lot
# so it made this script easier to read.  These should be changed
# for a given process/std. cell library
source ${DV_ROOT}/tools/synopsys/script/common/pt_eco_drc_buf.tcl

#
# Important routing layers generally the same for all modules
#

# List of metal layers where standard cell pins are placed
set STD_CELL_PIN_LAYERS         "M1"

# Clock tree layers list, usually M3 and above
set CLOCK_TREE_LAYERS           "M3 M4 M5 M6 M7 M8 M9"

# Max standard cell rail routing layer
set STD_CELL_RAIL_MAX_LAYER     "M3"

# The top metal layer, used to reset max routing layer
# after routing standard cell rails
set TOP_METAL_LAYER             "M11"

#
# Library timing unit specific 
# These variables depend on the timing unit in your libraries
#

# Setup slack threshold for timing driven ICV metal fill and timing driven wire spreading/widening
set TIMING_PRESERVE_SLACK_SETUP "100"
# Hold slack threshold for timing driven wire spreading/widening
set TIMING_PRESERVE_SLACK_HOLD "100"

#
# GDS database unit used for merge_gds
#

set GDS_DB_UNIT 1e-9

#
# Additional process specific settings
#
