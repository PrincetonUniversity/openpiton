#!/usr/bin/python
# Copyright (c) 2019 Princeton University
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

import subprocess
from optparse import OptionParser
import sys
import os
script_folder = os.path.join(os.environ["DV_ROOT"], "tools/src/xdma")
sys.path.insert(0, os.path.join(script_folder, "../proto"))
from dbg import *


def usage():
    print >> sys.stderr
    print >> sys.stderr, "Usage:\n"
    print >> sys.stderr, "piton_reset -b <board type>",
    print >> sys.stderr
    print >> sys.stderr, "\n       -b, --board  <board_type>"
    print >> sys.stderr, "              Name of a supported Xilinx's development board. Available options are:"
    print >> sys.stderr, "                  xupp3r"
    print >> sys.stderr, "                  f1"
    print >> sys.stderr, "\n"


def setParserOptions(parser):
    parser.add_option("-b", "--board", dest="board", action="store")
    parser.add_option("-h", "--help", dest="help", action="store_true", default=False)

    return parser

def checkCmdOptions(options):
    if options.help:
        usage()
        return False

    if not options.board:
        print_error("Board name is not provided")
        usage()
        return False

    # Check if board is supported
    if (options.board not in ["f1", "xupp3r"]):
        print_error("Unsupported board")
        usage()
        return False

    return True

def writeSTDOUT(s):
    sys.stdout.write(s)
    sys.stdout.flush()


def exitProgram(exit_code):
    writeSTDOUT("\nExiting...\n\n")
    exit(exit_code)

def main():
    parser = OptionParser(add_help_option=False)
    parser = setParserOptions(parser)
    (options, args) = parser.parse_args()

    # Check input options
    rv = checkCmdOptions(options)
    if not rv:
        exitProgram(1)

    if options.board == "xupp3r":
        subprocess.call(["sudo", os.path.join(script_folder, "./piton_off_pci.py")])
    elif options.board == "f1":
        subprocess.call(["sudo", os.path.join(script_folder, "./piton_off_f1.py")])


if __name__ == '__main__':
    main()

