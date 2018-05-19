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

# test name: oram_read
# tests reading out oram internal states

# build & run command
# buildargs='-sys=jtag_testbench -x_tiles=1 -y_tiles=1'
# runargs='-sys=jtag_testbench -sim_run_args=+test_case_base=oram_read -sim_run_args=+jtag_iob_send_wakeup=0'
# sims -vcs_build $buildargs -vcs_build_args=-debug_all > build_out
# sims -vcs_run $runargs -rtl_timeout=500000 > out

jtag = libjtag.JtagGen()
jtag.CommitWait(1000)

# read oram
misc_bin = '0110'
jtag.CommandReadOram(misc_bin)

jtag.CommitWait(100)

# check the data gotten from oram
# until it's implemented, the read out will be misc_bin (0110)
# note: data is unpredictable until the last 4 bits
expecteddata = 'x' * 64 + jtag.HexToBin('deadbeef', length=32) + 'x' * 32
jtag.CommandRead(register='data', expected=expecteddata)

# pass the test
jtag.Pass(100);

jtag.WriteToFile('jtag_oram_read_in.vmh', 'jtag_oram_read_out.vmh')