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

# tests reading out sscan processor states
# meant to be used with test.s
# remember to set the plusarg jtag_iob_send_wakeup
# ie: -sim_run_args=+jtag_iob_send_wakeup=0

jtag = libjtag.JtagGen()

jtag.CommitWait(1000)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommandStallCore(coreid=1, threadid=0, stall=1)

pc = jtag.HexToBin('000020000040', length=48)
# pc = jtag.HexToBin('0x00000400c0', length=48)
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_BREAKPOINT_PC_REG'],
                        data=pc)

jtag.CommandStallCore(coreid=0, threadid=0, stall=0)

jtag.CommitWait(5000)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)

# shadow scan oscillates between these two values depending on the timing
'''
00000000001902000040000039000140
00000000001902000040000039000640
00000000001902000040000001000640
000000000099100000001083a1000080
00000000004b82000040000071000080
'''

jtag.CommandReadRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_SHADOWSCAN_REG'])
expecteddata =   jtag.HexToBin('00000000004b82000040000071000080', length=128)
# expecteddata = expecteddata + 'x'*32
jtag.CommandRead(register='data', expected=expecteddata)
# jtag.CommandRead(register='data', expected='00000011')
jtag.WriteToFile('jtag_shadowscan_in.vmh', 'jtag_shadowscan_out.vmh')