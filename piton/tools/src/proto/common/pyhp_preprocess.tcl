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

proc pyhp_preprocess {RTL_IMPL_FILES} {
    set GEN_RTL_IMPL_FILES ""
    foreach RTL_IMPL_FILE ${RTL_IMPL_FILES} {
        set PYV_IMPL_FILE "${RTL_IMPL_FILE}.pyv"
        # File gets preprocessed if a PYV version exists
        if {[file exists ${PYV_IMPL_FILE}]} {
            puts "Info: ${PYV_IMPL_FILE} exists! Preprocessing..."
    
            # Setup temporary filename for preprocessed verilog
            set RTL_IMPL_FILENAME_LEN [string length ${RTL_IMPL_FILE}]
            set GEN_RTL_IMPL_FILE [string range ${RTL_IMPL_FILE} 0 [expr ${RTL_IMPL_FILENAME_LEN} - 2]]
            append GEN_RTL_IMPL_FILE "tmp."
            append GEN_RTL_IMPL_FILE [string index ${RTL_IMPL_FILE} [expr ${RTL_IMPL_FILENAME_LEN} - 1]]
    
            # Run PyHP
            exec pyhp.py ${PYV_IMPL_FILE} > ${GEN_RTL_IMPL_FILE}
    
            # Append to new source file list
            set GEN_RTL_IMPL_FILES "${GEN_RTL_IMPL_FILES} ${GEN_RTL_IMPL_FILE}"
        } else {
            # If no PYV version exists, this file does not get preprocessed
            set GEN_RTL_IMPL_FILES "${GEN_RTL_IMPL_FILES} ${RTL_IMPL_FILE}"
        }
    }

    return ${GEN_RTL_IMPL_FILES}
}
