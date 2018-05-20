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

# testname: jtag_sram_write_frf
# simple write and verify
# the frf is 128x77

jtag = libjtag.JtagGen()
jtag.CommitWait(1000)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)

#######################################################
# now overwrite the data so that the next 4 instructions are all nops (no br)
writedata1 =   jtag.HexToBin('deadbeef', length=64)
jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.defines['BIST_ID_L1_FRF'], index=0,
                        way=jtag.WAYID_MASK_0, wrdata=writedata1)
writedata2 =   jtag.HexToBin('c001cafe', length=64)
jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.defines['BIST_ID_L1_FRF'], index=127,
                        way=jtag.WAYID_MASK_0, wrdata=writedata2)

#######################################################
# verifying the data in the cache by reading out
jtag.CommandReadSram(coreid=0, threadid=0, sramid=jtag.defines['BIST_ID_L1_FRF'], index=0,
                        way=jtag.WAYID_MASK_0)
jtag.CommandRead(register='data', expected=writedata1.zfill(128))
jtag.CommandReadSram(coreid=0, threadid=0, sramid=jtag.defines['BIST_ID_L1_FRF'], index=127,
                        way=jtag.WAYID_MASK_0)
jtag.CommandRead(register='data', expected=writedata2.zfill(128))


jtag.Pass(100)

jtag.WriteToFile('jtag_sram_write_frf_in.vmh', 'jtag_sram_write_frf_out.vmh')