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

# testname: reset_vector
# test setting the reset vector so the core doesn't have to start at the non-cacheable addresses
# mainly 0x0000040020

# use with test.s
# and no automatic IOB wakeup packet

jtag = libjtag.JtagGen()
# jtag.CommitWait(3700)
# jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommitWait(2000)
# jtag.CommandRead(register='interruptbit', expected='1111')
# jtag.CommandClearInterrupt()
# jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommandStallCore(coreid=1, threadid=0, stall=1)
jtag.CommandStallCore(coreid=2, threadid=0, stall=1)
jtag.CommandStallCore(coreid=3, threadid=0, stall=1)

control = '00000000001111' # enable icache, dcache, immu, dmmu
# jtag.CommandWriteThreadState(coreid=0, threadid=0, wrdata=control, mode='lsu_control')
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_LSU_CONTROL_REG'],
                        data=control)
jtag.CommandRead(register='interruptbit', expected='1111')
jtag.CommandClearInterrupt()

pc = '0x0_0000_0010'
pc = jtag.HexToBin(pc)
# pc = '0x3_ffff_c000'
# jtag.CommandWritePC(coreid=0, threadid=0, wrdata=pc, hex=True, reset_vector=True)
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_RESETVECTOR_REG'],
                        data=pc)
jtag.CommandRead(register='interruptbit', expected='1111')
jtag.CommandClearInterrupt()

interrupt = '0000000000000000000000000000000000000000000000010000000000000001'
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CPX_INTERRUPT'],
                        data=interrupt)

# jtag.CommandWriteThreadState(coreid=0, threadid=0, wrdata=jtag.THRFSM_RUN)
# jtag.CommandWriteThreadState(coreid=0, threadid=0, wrdata=jtag.THRFSM_RDY)
# jtag.CommandRead(register='interruptbit', expected='1111')
# jtag.CommandClearInterrupt()

# jtag.CommandStallCore(coreid=0, threadid=0, stall=0)
jtag.Fail(12000)

jtag.WriteToFile('jtag_reset_vector_in.vmh', 'jtag_reset_vector_out.vmh')