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

def usage():
    print "Usage: " + sys.argv[0] + " --seed=<seed>"

def parseCmdArgs():
    seed = None

    try:
        opts, args = getopt.getopt (sys.argv[1:], "h", ["seed="])
    except getopt.GetoptError:
        usage ()
        sys.exit (2)

    for opt, arg in opts:
        if opt == '-h':
            usage ()
            sys.exit ()
        elif opt == "--seed":
            seed = int (arg)

    if (seed == None) :
        print "Incorrect number of arguments or invalid arguments"
        usage ()
        sys.exit (2)

    return seed

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
    seed = parseCmdArgs ()

    # Src bits file
    srcBitsFile = open ("test_exhaust_src.vmh", "w")

    # Write header
    srcBitsFile.write("/*\n");
    srcBitsFile.write(" * Execution Drafting LFSR test case exhaust source bits file.\n");
    srcBitsFile.write(" * Provides stimuli to the module.\n");
    srcBitsFile.write(" *\n");
    srcBitsFile.write(" * Format of bits:\n");
    srcBitsFile.write(" *      * 0 - 15: lfsr_seed\n");
    srcBitsFile.write(" *      * 16: lfsr_ld\n");
    srcBitsFile.write(" *      * 17: lfsr_step\n");
    srcBitsFile.write(" */\n");

    # Load the seed on the first cycle
    srcBitsFile.write("01_" + bin16(seed) + "        // Load seed of " + str(seed) + "\n");

    # Step for 65535 cycles to cover all 16 bit states
    for i in range(0, 65535) :
        if i == 0 :
            srcBitsFile.write("10_" + bin16(0) + "        // Step for 65535 cycles\n")
        else :
            srcBitsFile.write("10_" + bin16(0) + "\n")

    srcBitsFile.close()

    # Sink bits file
    sinkBitsFile = open ("test_exhaust_sink.vmh", "w")

    # Write header
    sinkBitsFile.write("/*\n");
    sinkBitsFile.write(" * Execution Drafting LFSR test case exhaust sink bits file.\n");
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
    # Seed should have been loaded
    lfsrOutMask = int(math.pow(2, 15))
    lfsrOutFirst = (seed & lfsrOutMask) >> 15
    sinkBitsFile.write(str(lfsrOutFirst) + "_" + bin16(seed) + \
                       "        // Check seed of " + str(seed) + " got loaded\n")
    # Setup masks
    lfsrMask = int(math.pow(2, 16)) - 1
    lfsrState15Mask = int(math.pow(2, 15))
    lfsrState13Mask = int(math.pow(2, 13))
    lfsrState12Mask = int(math.pow(2, 12))
    lfsrState10Mask = int(math.pow(2, 10))

    # Current lfsr state
    lfsrState = seed;

    # Check 65534 cycles for correct output (the last output, 65535, should be the seed again)
    for i in range(0,65534) :
        lfsrState15 = (lfsrState & lfsrState15Mask) >> 15
        lfsrState13 = (lfsrState & lfsrState13Mask) >> 13
        lfsrState12 = (lfsrState & lfsrState12Mask) >> 12
        lfsrState10 = (lfsrState & lfsrState10Mask) >> 10

        lfsrNextState0 = lfsrState15 ^ lfsrState13 ^ lfsrState12 ^ lfsrState10;
        lfsrNextState = (lfsrState << 1) & lfsrMask
        lfsrNextState = lfsrNextState | lfsrNextState0
        
        lfsrNextOut = (lfsrNextState & lfsrOutMask) >> 15

        if i == 0:
            sinkBitsFile.write(str(lfsrNextOut) + "_" + bin16(lfsrNextState) + \
                               "        // Check each step for 65535 cycles\n")
        else :
            sinkBitsFile.write(str(lfsrNextOut) + "_" + bin16(lfsrNextState) + "\n")

        lfsrState = lfsrNextState

    # Check the last cycle is the seed again
    sinkBitsFile.write(str(lfsrOutFirst) + "_" + bin16(seed) + \
                       "        // Check the last output is the seed again\n");

    sinkBitsFile.close ()

if __name__ == "__main__" :
    main ()
