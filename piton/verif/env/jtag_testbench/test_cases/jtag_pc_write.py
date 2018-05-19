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

# testname: pc_write
# meant to be used with jtag_infinite_loop1.s
# this test tries to jump out of the inifinite loop to good trap by overwriting the PC
# 1. wait for program to be in loop
# 2. stall core
# 3. overwrite PC to 000020000020
# 4. unstall core
# 5. force bad_trap if the program does not get into good_trap first

# note: with infinite loop, there's a chance this test will give a false positive error
#  when the PC is overwritten right when the branch is being resolved.


jtag = libjtag.JtagGen()
jtag.CommitWait(3700)
jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommitWait(101)
jtag.CommandRead(register='interruptbit', expected='1111')
jtag.CommandClearInterrupt()

pc = '0000200000b0'
pc = bin(int(pc, 16))[2:].zfill(48)
# jtag.CommandWritePC(coreid=0, threadid=0, wrdata=pc)
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_PC_REG'],
                        data=pc)
jtag.CommandRead(register='interruptbit', expected='1111')
jtag.CommandClearInterrupt()

# pc = '0xffff_f000_0020'
# jtag.CommandWritePC(coreid=0, threadid=0, wrdata=pc, hex=True)
# jtag.CommandRead(register='interruptbit', expected='1111')
# jtag.CommandClearInterrupt()
# jtag.CommitWait(250)
# jtag.CommandClearInterrupt()
# jtag.CommandRead(register='interruptbit', expected='1111')

jtag.CommandStallCore(coreid=0, threadid=0, stall=0)
jtag.Fail(250)

jtag.WriteToFile('jtag_pc_write_in.vmh', 'jtag_pc_write_out.vmh')