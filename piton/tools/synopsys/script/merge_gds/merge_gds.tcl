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
# Script to merge GDS designs together.  Usually used for
# IP macros for which the CEL view was not imported into
# IC compiler (only FRAM view was imported)
#

# Get design variables
set DV_ROOT $::env(DV_ROOT)
source ${DV_ROOT}/tools/synopsys/script/common/common_setup.tcl

# GDS merge files from module specific script plus generated
# GDS from IC compiler
set gds_files [concat $RESULTS_DIR/$DESIGN_NAME.gds "$TARGET_LIBRARY_GDSII $GDSII_MERGE_FILES"]

# Remove existing merged design if it exists
if {[file exists $RESULTS_DIR/${DESIGN_NAME}.merged.gds]} {
    file delete $RESULTS_DIR/${DESIGN_NAME}.merged.gds
}


default layout_cache read

# Create GDS layout_with_parameters to pass to merge command
set gds_layouts_merge ""
foreach gds $gds_files {
    set gds_layouts_merge "$gds_layouts_merge {layout  $gds}"
}

# Merge overwriting modules with the same name
eval layout merge overwrite $gds_layouts_merge -dbu $GDS_DB_UNIT -format gds -output $RESULTS_DIR/$DESIGN_NAME.merged.gds

# Check if merge was successful
if {[file exists $RESULTS_DIR/${DESIGN_NAME}.merged.gds]} {
    puts "INFO : Merge GDSII successful!"
} else {
    puts "ERROR : Merge GDSII failed!"
}

if {[file exists $RESULTS_DIR/${DESIGN_NAME}.unmerged.gds]} {
    file delete $RESULTS_DIR/${DESIGN_NAME}.unmerged.gds
}

file rename $RESULTS_DIR/${DESIGN_NAME}.gds $RESULTS_DIR/${DESIGN_NAME}.unmerged.gds
file rename $RESULTS_DIR/${DESIGN_NAME}.merged.gds $RESULTS_DIR/${DESIGN_NAME}.gds

exit
