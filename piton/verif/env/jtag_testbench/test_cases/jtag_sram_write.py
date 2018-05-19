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
# meant to be used with jtag_infiniteloop.s
# basically, what we do here is modifying a branch instruction to nop in the icache

# testname: sram_write

jtag = libjtag.JtagGen()
jtag.CommitWait(3700)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)

# at this point, icache at index 0 & 1, way 2, should have the 8 instructions:
'''
label_back:
nop
nop
nop
nop
nop
nop
nop
br label_back
'''

# the next few instructions are nops and then ta GOOD_TRAP

# this test will try to modify the instructions to be 
'''
label_back:
nop
nop
nop
nop
nop
nop
nop
nop
'''
# so the instruction stream goes through to the good_trap

# each entry is 128b (136b including crc), so it would take 3 read each index to get all 136b
'''
0x08000002_02000000
0x8000002020000008
0xxxxxxxxxxxxxxx80
'''


#######################################################
# verifying the data in the cache by reading out
jtag.CommandReadSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=0,
                        way=jtag.WAYID_MASK_0)
expecteddata = jtag.HexToBin('0800000202000000', length = 128, fillx=True)
# jtag.CommandRead(register='data', expected=expecteddata)

jtag.CommandReadSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=0,
                        way=jtag.WAYID_MASK_1)
expecteddata =   jtag.HexToBin('8000002020000008', length = 128, fillx=True)
# jtag.CommandRead(register='data', expected=expecteddata)

jtag.CommandReadSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=0,
                        way=jtag.WAYID_MASK_2)
expecteddata = jtag.HexToBin('80', length = 128, fillx=True)
# jtag.CommandRead(register='data', expected=expecteddata)


#######################################################
# now overwrite the data so that the next 4 instructions are all nops (no br)
writedata =   '0800000202000000'
writedata = bin(int(writedata, 16))[2:].zfill(64)
jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=1,
                        way=jtag.WAYID_MASK_0, wrdata=writedata)

writedata =   '8000002020000008'
writedata = bin(int(writedata, 16))[2:].zfill(64)
jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=1,
                        way=jtag.WAYID_MASK_1, wrdata=writedata)

writedata =   '80'
writedata = bin(int(writedata, 16))[2:].zfill(64)
jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=1,
                        way=jtag.WAYID_MASK_2, wrdata=writedata)


#######################################################
# wait for a while for test to finish
# this will fail if the test does not hit good trap first
jtag.CommandStallCore(coreid=0, threadid=0, stall=0)
jtag.CommitWait(250)
jtag.CommandClearInterrupt()
jtag.CommandRead(register='interruptbit', expected='1111')
jtag.CommandClearInterrupt()

jtag.WriteToFile('jtag_sram_write_in.vmh', 'jtag_sram_write_out.vmh')