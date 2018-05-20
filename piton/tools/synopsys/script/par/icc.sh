#!/bin/bash
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

ICC_EXEC="icc_shell -64bit"
LOGS_DIR="logs"
REPORTS_DIR="reports"
RESULTS_DIR="results"
PNA_OUTPUT_DIR="pna_output"
OPTIONS="-no_log"

# Init design icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/common/init_design_icc.tcl | tee -i ${LOGS_DIR}/init_design_icc.log

# Place opt icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/place_opt_icc.tcl | tee -i ${LOGS_DIR}/place_opt_icc.log

# Clock opt cts icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/clock_opt_cts_icc.tcl | tee -i ${LOGS_DIR}/clock_opt_cts_icc.log

# Clock opt psyn icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/clock_opt_psyn_icc.tcl | tee -i ${LOGS_DIR}/clock_opt_psyn_icc.log

# Clock opt route icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/clock_opt_route_icc.tcl | tee -i ${LOGS_DIR}/clock_opt_route_icc.log

# Route icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/route_icc.tcl | tee -i ${LOGS_DIR}/route_icc.log

# Route opt icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/route_opt_icc.tcl | tee -i ${LOGS_DIR}/route_opt_icc.log

# Focal opt icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/focal_opt_icc.tcl | tee -i ${LOGS_DIR}/focal_opt_icc.log

# Chip finish icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/chip_finish_icc.tcl | tee -i ${LOGS_DIR}/chip_finish_icc.log

# Metal fill icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/metal_fill_icc.tcl | tee -i ${LOGS_DIR}/metal_fill_icc.log

# Signoff drc icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/par/signoff_drc_icc.tcl | tee -i ${LOGS_DIR}/signoff_drc_icc.log

# Outputs icc
mkdir -p ${REPORTS_DIR} ${RESULTS_DIR} ${LOGS_DIR}
${ICC_EXEC} ${OPTIONS} -f ${DV_ROOT}/tools/synopsys/script/common/outputs_icc.tcl | tee -i ${LOGS_DIR}/outputs_icc.log
