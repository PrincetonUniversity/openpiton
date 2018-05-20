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

# Function to preprocess a list of verilog files with PyHP
proc pyhp_preprocess { args } {
    parse_proc_arguments -args $args arguments

    if {[info exists arguments(-rtl)]} {
        set RTL_SOURCE_FILES $arguments(-rtl)
    } else {
        puts "Error: pyhp_preprocess no RTL files provided."
        return 1
    }

    set GEN_RTL_SOURCE_FILES ""
    foreach RTL_SOURCE_FILE ${RTL_SOURCE_FILES} {
        set PYV_SOURCE_FILE  "${RTL_SOURCE_FILE}.pyv"
        # File gets preprocessed if a PYV version exists
        if {[file exists ${PYV_SOURCE_FILE}]} {
            puts "RM-Info: ${PYV_SOURCE_FILE} exists! Preprocessing..."

            # Setup temporary filename for preprocessed verilog
            set RTL_SOURCE_FILENAME_LEN [string length ${RTL_SOURCE_FILE}]
            set GEN_RTL_SOURCE_FILE [string range ${RTL_SOURCE_FILE} 0 [expr ${RTL_SOURCE_FILENAME_LEN} - 2]]
            append GEN_RTL_SOURCE_FILE "tmp."
            append GEN_RTL_SOURCE_FILE [string index ${RTL_SOURCE_FILE} [expr ${RTL_SOURCE_FILENAME_LEN} - 1]]

            # Run PyHP
            sh pyhp.py ${PYV_SOURCE_FILE} > ${GEN_RTL_SOURCE_FILE}
           
            # Append to new source file list
            set GEN_RTL_SOURCE_FILES "${GEN_RTL_SOURCE_FILES} ${GEN_RTL_SOURCE_FILE}"
        } else {
            # If no PYV version exists, this file does not get preprocessed
            set GEN_RTL_SOURCE_FILES "${GEN_RTL_SOURCE_FILES} ${RTL_SOURCE_FILE}"
        }
    }

    return $GEN_RTL_SOURCE_FILES
}

if {[info exists synopsys_program_name]} {
    define_proc_attributes pyhp_preprocess \
        -info "Pre-process source RTL with PyHP preprocessor." \
        -define_args {
            {-rtl "List of RTL source files to be preprocessed" "<rtl source files list>" list {required}}
        }
}
