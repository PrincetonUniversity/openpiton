# Copyright (c) 2017 Princeton University
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
# Design specific variables.
# Not intended to be run standalone.
#

set DESIGN_NAME "chipset"

set DESIGN_INCLUDE_DIRS ""

set DESIGN_DEFAULT_VERILOG_MACROS "PITONSYS_MEM_ZEROER"

set DESIGN_RTL_IMPL_FILES [concat \
    ${CHIPSET_RTL_IMPL_FILES} \
]

set DESIGN_INCLUDE_FILES [concat \
    ${CHIPSET_INCLUDE_FILES}
]

set DESIGN_IP_FILE_PREFIXES [concat \
    ${CHIPSET_IP_FILE_PREFIXES} \
]

set DESIGN_COE_IP_FILES [concat \
    ${CHIPSET_COE_IP_FILES} \
]

set DESIGN_PRJ_IP_FILES [concat \
    ${CHIPSET_PRJ_IP_FILES} \
]
