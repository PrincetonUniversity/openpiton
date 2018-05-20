# Modified by Princeton University on April 3, 2016

# Need stuff from both ICC and DC
source -echo ${DV_ROOT}/tools/synopsys/script/common/icc_setup.tcl
source -echo ${DV_ROOT}/tools/synopsys/script/common/dc_setup_filenames.tcl

puts "RM-Info: Running script [info script]\n"

# Reference and implemented design sources
set DC_REFERENCE_DESIGN_SOURCES         $RTL_SOURCE_FILES

# The ICC reference design and DC implemented design to use
# are determined by how ICC reads in the design
set ICC_REFERENCE_DESIGN_SOURCES        ""
set DC_IMPLEMENTED_DESIGN_SOURCES       ""
if {$ICC_INIT_DESIGN_INPUT == "VERILOG"} {
    set ICC_REFERENCE_DESIGN_SOURCES    $ICC_IN_VERILOG_NETLIST_FILE
    set DC_IMPLEMENTED_DESIGN_SOURCES   $DCRM_FINAL_VERILOG_OUTPUT_FILE
} elseif {$ICC_INIT_DESIGN_INPUT == "DDC"} {
    set ICC_REFERENCE_DESIGN_SOURCES    $ICC_IN_DDC_FILE
    set DC_IMPLEMENTED_DESIGN_SOURCES   $DCRM_FINAL_DDC_OUTPUT_FILE
} elseif {$ICC_INIT_DESIGN_INPUT == "MW"} {
    set ICC_REFERENCE_DESIGN_SOURCES    $MW_DESIGN_LIBRARY
    set DC_IMPLEMENTED_DESIGN_SOURCES   $DCRM_MW_LIBRARY_NAME
}

set ICC_IMPLEMENTED_DESIGN_SOURCES      ${DESIGN_NAME}.output.v

# SVF file from DC
set FMRM_SVF_FILES                      $DCRM_SVF_OUTPUT_FILE

# Even for a top-level only verification, read in the RTL/gate-level for the complete
# design.  Formality needs the interface info for the modules being black-boxed.
if {${HIERARCHICAL}} {
    # Save these variables as they will get overwritten by
    # sub-module module_setup.tcl
    set HIERARCHICAL_DESIGN_DIRS_SAVE $HIERARCHICAL_DESIGNS_DIRS
    set HIERARCHICAL_DESIGNS_SAVE $HIERARCHICAL_DESIGNS
    set PWD_SAVE [pwd]
    foreach DESIGN_DIR $HIERARCHICAL_DESIGN_DIRS_SAVE DESIGN $HIERARCHICAL_DESIGNS_SAVE {
        cd ../${DESIGN_DIR}/synopsys/
        # Get necessary sub-module variables, we will restore
        # these to the top-level variables later
        source ${DV_ROOT}/tools/synopsys/script/common/icc_setup.tcl
        source ${DV_ROOT}/tools/synopsys/script/common/dc_setup_filenames.tcl
        
        # Append sub-module RTL to DC reference design sources
        set DC_REFERENCE_DESIGN_SOURCES         "$RTL_SOURCE_FILES $DC_REFERENCE_DESIGN_SOURCES"

        # Append sub-module ICC reference design and DC implemented design sources
        if {$ICC_INIT_DESIGN_INPUT == "VERILOG"} {
            set ICC_REFERENCE_DESIGN_SOURCES    "$ICC_IN_VERILOG_NETLIST_FILE $ICC_REFERENCE_DESIGN_SOURCES"
            set DC_IMPLEMENTED_DESIGN_SOURCES   "$DCRM_FINAL_VERILOG_OUTPUT_FILE $DC_IMPLEMENTED_DESIGN_SOURCES"
        } elseif {$ICC_INIT_DESIGN_INPUT == "DDC"} {
            set ICC_REFERENCE_DESIGN_SOURCES    "$ICC_IN_DDC_FILE $ICC_REFERENCE_DESIGN_SOURCES"
            set DC_IMPLEMENTED_DESIGN_SOURCES   "$DCRM_FINAL_DDC_OUTPUT_FILE $DC_IMPLEMENTED_DESIGN_SOURCES"
        } 
        # Milkyway should have reference libraries set in it already, no need to read in
        #elseif {$ICC_INIT_DESIGN_INPUT == "MW"} {
        #    set ICC_REFERENCE_DESIGN_SOURCES    "$MW_DESIGN_LIBRARY $ICC_REFERENCE_DESIGN_SOURCES"
        #    set DC_IMPLEMENTED_DESIGN_SOURCES   "$DCRM_MW_LIBRARY_NAME $DC_IMPLEMENTED_DESIGN_SOURCES"
        #}

        # Append sub-module ICC implemented design sources
        set ICC_IMPLEMENTED_DESIGN_SOURCES      "${DESIGN_NAME}.output.v $ICC_IMPLEMENTED_DESIGN_SOURCES"

        # Append sub-module SVF file
        set FMRM_SVF_FILES                      "$DCRM_SVF_OUTPUT_FILE $FMRM_SVF_FILES"
    }
    
    # Get back top-level variables for the rest of the flow
    cd ${PWD_SAVE}
    source ${DV_ROOT}/tools/synopsys/script/common/icc_setup.tcl
    source ${DV_ROOT}/tools/synopsys/script/common/dc_setup_filenames.tcl
}

# Preprocess the RTL with PyHP
source -echo ${DV_ROOT}/tools/synopsys/script/common/pyhp_preprocess_setup.tcl
set DC_REFERENCE_DESIGN_SOURCES [pyhp_preprocess -rtl ${DC_REFERENCE_DESIGN_SOURCES}]

# Use the most recent data.  If the ICC output netlist is available
# compare ICC output to ICC input (DC output, gate to gate comparison),
# otherwise compare DC input to DC output (RTL to gate comparison)
set INPUT_FROM "NONE"
if {[files_exist -files ${ICC_REFERENCE_DESIGN_SOURCES}] && 
    [files_exist -files ${ICC_IMPLEMENTED_DESIGN_SOURCES}] &&
    [files_exist -files ${FMRM_SVF_FILES}]} {
    set INPUT_FROM "ICC"
} elseif {[files_exist -files ${DC_REFERENCE_DESIGN_SOURCES}] && 
          [files_exist -files ${DC_IMPLEMENTED_DESIGN_SOURCES}] &&
          [files_exist -files ${FMRM_SVF_FILES}]} {
    set INPUT_FROM "DC"
} else {
    puts "RM-Error: Input from neither ICC nor DC is available"
    exit
}
puts "RM-Info: Using outputs from $INPUT_FROM"

if {$INPUT_FROM == "ICC"} {
    set REPORTS_DIR "reports/fm_shell_icc"
} else {
    set REPORTS_DIR "reports/fm_shell_dc"
}
if {![file exists ${REPORTS_DIR}]} {
    file mkdir $REPORTS_DIR
}

# Output reporting files/variables
set FMRM_MATCH_STATUS_REPORT            ${DESIGN_NAME}.fmv_status.rpt
set FMRM_UNMATCHED_POINTS_REPORT        ${DESIGN_NAME}.fmv_unmatched_points.rpt
set FMRM_FAILING_SESSION_NAME           ${DESIGN_NAME}
set FMRM_FAILING_POINTS_REPORT          ${DESIGN_NAME}.fmv_failing_points.rpt
set FMRM_ABORTED_POINTS_REPORT          ${DESIGN_NAME}.fmv_aborted_points.rpt
set FMRM_ANALYZE_POINTS_REPORT          ${DESIGN_NAME}.fmv_analyze_points.rpt

# Not sure if we should really be doing this, these warnings lead to errors. This
# was done by someone else and would need to look into furher to actually
# see if its a good idea
set_mismatch_message_filter -warn "FMR_ELAB-147"
# Not sure we should have these either really
set_mismatch_message_filter -warn "FMR_VLOG-079"
set_mismatch_message_filter -warn "FMR_ELAB-079"
# This one is only in tile, but also probably not great to have
set_mismatch_message_filter -warn "FMR_ELAB-117"

######################################
# End
######################################

puts "RM-Info: Completed script [info script]\n"
