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

# tests reading out icache data
# meant to be used with test.s

# testname: sram_read
# 12/17: this test is not reliable because it relies on timing too much

jtag = libjtag.JtagGen()
jtag.CommitWait(2500)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommandClearInterrupt()
jtag.CommandReadSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=6,
                        way=jtag.WAYID_MASK_1)
jtag.CommandRead(register='interruptbit', expected='1111')
jtag.CommandClearInterrupt()
# 64b will be read out
# expecteddata =    '0000000000000000'
expecteddata =   '384000324204088c'
expecteddata = bin(int(expecteddata, 16))[2:].zfill(64)
print expecteddata
jtag.CommandRead(register='data', expected=expecteddata)
# jtag.CommandRead(register='data', expected='00000011')
jtag.WriteToFile('jtag_sram_read_in.vmh', 'jtag_sram_read_out.vmh')