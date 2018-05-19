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

# testname: thread_start_manual
# test starting threads without a wakeup packet from the IOB by manually overwriting the thread state from sleeping to active
# not sure if we need to write the PC first or not

# use with test.s

jtag = libjtag.JtagGen()
# jtag.CommitWait(3700)
# jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommitWait(2000)
# jtag.CommandRead(register='interruptbit', expected='1111')
# jtag.CommandClearInterrupt()

# pc = '0xffff_f000_0020'
# jtag.CommandWritePC(coreid=0, threadid=0, wrdata=pc, hex=True)
# jtag.CommandRead(register='interruptbit', expected='1111')
# jtag.CommandClearInterrupt()

# jtag.CommitWait(250)
# jtag.CommandClearInterrupt()
# jtag.CommandRead(register='interruptbit', expected='1111')

# make an interrupt to wake up thread 0
# interrupt = ['0' for i in range(64)]
# print (''.join(interrupt))
# interrupt[17:16] = '01' # reset
# print (''.join(interrupt))
# interrupt[5:0] = '000001' # POR

# print (''.join(interrupt))

interrupt = '0000000000000000000000000000000000000000000000010000000000000001'
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CPX_INTERRUPT'],
                        data=interrupt)

# jtag.CommandWriteThreadState(coreid=0, threadid=0, wrdata=jtag.THRFSM_RUN)
# jtag.CommandWriteThreadState(coreid=0, threadid=0, wrdata=jtag.THRFSM_RDY)
# jtag.CommandRead(register='interruptbit', expected='1111')
# jtag.CommandClearInterrupt()

# jtag.CommandStallCore(coreid=0, threadid=0, stall=0)
jtag.Fail(12000)

jtag.WriteToFile('jtag_thread_start_manual_in.vmh', 'jtag_thread_start_manual_out.vmh')