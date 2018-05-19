# Copyright (c) 2015 Princeton University
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

import libjtag

# testname: jtag_read_irf

jtag = libjtag.JtagGen()
jtag.CommitWait(3700)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)

#######################################################
# verifying the data in the cache by reading out
# jtag.CommandReadRtap(coreid=0, threadid=0, 
#                         rtapid=jtag.defines['JTAG_RTAP_ID_IRF_REG'], 
#                         address='00001', # index 0
#                         )
# expected = jtag.HexToBin('27_0000_0000_0500_21a0', length=128)
# expected = jtag.HexToBin('0', length=128)
# jtag.CommandRead(register='data', expected=expected)

jtag.CommandReadRtap(coreid=0, threadid=0, 
                        rtapid=jtag.defines['JTAG_RTAP_ID_IRF_REG'], 
                        address='00010', # index 0
                        )
expected = jtag.HexToBin('870000000001c34028', length=128)
jtag.CommandRead(register='data', expected=expected)

jtag.CommandReadRtap(coreid=0, threadid=0, 
                        rtapid=jtag.defines['JTAG_RTAP_ID_IRF_REG'], 
                        address='00011', # index 0
                        )
expected = jtag.HexToBin('b40000000068020000', length=128)
jtag.CommandRead(register='data', expected=expected)


jtag.Pass(100)

jtag.WriteToFile('jtag_read_irf_in.vmh', 'jtag_read_irf_out.vmh')