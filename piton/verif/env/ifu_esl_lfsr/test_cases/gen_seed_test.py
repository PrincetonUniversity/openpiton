#!/usr/bin/python
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


import sys, getopt
import math

def bin16 (num):
    s = ""
    for i in range (0, 16):
        if (i > 0 and i % 4 == 0) :
            s += "_"
        mask = int(math.pow(2, 16 - i - 1))
        binVal = (num & mask) >> (16 - i - 1)
        s += str(binVal)
    return s

def main():
    # Src bits file
    srcBitsFile = open ("test_seed_src.vmh", "w")

    # Write header
    srcBitsFile.write("/*\n");
    srcBitsFile.write(" * Execution Drafting LFSR test case seed source bits file.\n");
    srcBitsFile.write(" * Provides stimuli to the module.\n");
    srcBitsFile.write(" *\n");
    srcBitsFile.write(" * Format of bits:\n");
    srcBitsFile.write(" *      * 0 - 15: lfsr_seed\n");
    srcBitsFile.write(" *      * 16: lfsr_ld\n");
    srcBitsFile.write(" *      * 17: lfsr_step\n");
    srcBitsFile.write(" */\n");

    # Load every possible seed
    for seed in range(0, 65536) :
        if seed == 0 :
            srcBitsFile.write("01_" + bin16(seed) + "        // Load every possible seed\n")
        else :
            srcBitsFile.write("01_" + bin16(seed) + "\n")

    srcBitsFile.close()

    # Sink bits file
    sinkBitsFile = open ("test_seed_sink.vmh", "w")

    # Write header
    sinkBitsFile.write("/*\n");
    sinkBitsFile.write(" * Execution Drafting LFSR test case seed sink bits file.\n");
    sinkBitsFile.write(" * Provides the bits for the monitor to check against.\n");
    sinkBitsFile.write(" *\n");
    sinkBitsFile.write(" * Format of bits:\n");
    sinkBitsFile.write(" *      * 0 - 15: lfsr_state_f\n");
    sinkBitsFile.write(" *      * 16: lfsr_out_f\n");
    sinkBitsFile.write(" */\n");

    # Cycle after reset
    sinkBitsFile.write("0_" + bin16(0) + "        // Cycle after reset, signals applied to load seed\n");
    # Cycle the seed is loaded
    sinkBitsFile.write("0_" + bin16(0) + "        // Seed is latched on this cycle, but monitor will " + \
                       "not see it on the output yet\n")

    # Check seeds get loaded
    lfsrOutMask = int(math.pow(2, 15))
    for seed in range (0, 65536) :
        lfsrOut = (seed & lfsrOutMask) >> 15
        if seed == 0:
            sinkBitsFile.write(str(lfsrOut) + "_" + bin16(seed) + \
                               "        // Check every possible seed is loaded\n")
        else :
            sinkBitsFile.write(str(lfsrOut) + "_" + bin16(seed) + "\n");

    sinkBitsFile.close ()

if __name__ == "__main__" :
    main ()
