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

# testname: jtag_rw_configregs
# tests reading/writing config registers
# remember to set the plusarg jtag_iob_send_wakeup
# ie: -sim_run_args=+jtag_iob_send_wakeup=0

jtag = libjtag.JtagGen()
jtag.CommitWait(100)
# jtag.CommandStallCore(coreid=0, threadid=0, stall=1)

jtag.CommandReadRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'],
    address=jtag.defines['CONFIG_REG_CHIPID_ADDRESS'])
expecteddata =   jtag.HexToBin('0', length=32)
jtag.CommandRead(register='data', expected=expecteddata)

x = '00000001'
y = '00000001'
chip = '00000000000000'
writedata = chip + y + x
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'], 
    address=jtag.defines['CONFIG_REG_CHIPID_ADDRESS'],
    data=writedata)

jtag.CommandReadRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'],
    address=jtag.defines['CONFIG_REG_CHIPID_ADDRESS'])
expecteddata = writedata.zfill(128)
jtag.CommandRead(register='data', expected=expecteddata)

jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'], 
    address=jtag.defines['CONFIG_REG_CSM_EN_ADDRESS'],
    data='1')

jtag.CommandReadRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'],
    address=jtag.defines['CONFIG_REG_CSM_EN_ADDRESS'])
expecteddata = '1'.zfill(128)
jtag.CommandRead(register='data', expected=expecteddata)

# test writing '11111111' to CSM_EN, should still be 1
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'], 
    address=jtag.defines['CONFIG_REG_CSM_EN_ADDRESS'],
    data='11111111')

jtag.CommandReadRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CONFIGREGS_REG'],
    address=jtag.defines['CONFIG_REG_CSM_EN_ADDRESS'])
expecteddata = '1'.zfill(128)
jtag.CommandRead(register='data', expected=expecteddata)

jtag.Pass(100)


# jtag.CommandRead(register='data', expected='00000011')
jtag.WriteToFile('jtag_rw_configregs_in.vmh', 'jtag_rw_configregs_out.vmh')