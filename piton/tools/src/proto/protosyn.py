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

#####################################################################
#  Filename      : protosyn.py
#  Created On    : 2014-05-10
#  Last Modified : 2015-05-10 16:52:02
#  Revision      :
#  Author        : Alexey Lavrov
#  Company       : Princeton University
#  Email         : alavrov@princeton.edu
#
#  Description   : top level script for Piton synthesis flow
#
#
#####################################################################

import os, sys, re, make_mem_map
from optparse import OptionParser

DV_ROOT = os.environ['DV_ROOT']
MODEL_DIR = os.environ['MODEL_DIR']

def usage():
    print "Usage: protosyn.py -t <testName> [genip]"

def main():
    parser = OptionParser()
    parser.add_option("-t", "--test", dest="test_name", action="store", help="Name of the test (.s) to put in memory")
    parser.add_option("--genip", dest="gen_ip", action="store_true", default=False, help="Generate Xilinx's IP blocks")

    (options, args) = parser.parse_args()

    if options.test_name == None:
        print "No test name"
        usage()
        exit(2)

    ##################################
    # Get a trace
    ##################################
    print "Synthesizing a test: %s" % options.test_name
    # os.chdir(MODEL_DIR)
    # os.system('mkdir -p fpga/protosyn_logs')
    # print "Compilation started"
    # os.system('sims -sys=manycore -x_tiles=1 -y_tiles=1 -vcs_build > fpga/protosyn_logs/compilation.log')
    # print "Simulation started"
    # os.system('sims -sys=manycore -vcs_run %s > fpga/protosyn_logs/simulation.log' % test_name)

    # f = open('fpga/protosyn_logs/simulation.log', 'r')
    # cont = f.read()
    # f.close()
    # match = re.search(r'(HIT GOOD TRAP)', cont)
    # if match == None:
    #     print "Test failed!"
    # else:
    #     print "Test Passed!"


    # ###################################
    # # Make Mapping
    # ###################################
    # print "Starting mapping of a test"
    # make_mem_map.makeMapping(test_name)
    # os.system('mv make_mem_map.log fpga/protosyn_logs/')

    # ##################################
    # # Generate Xilinx IPs
    # ##################################
    if options.gen_ip:
        os.chdir(DV_ROOT + '/tools/src/proto')
        print "Generating XILINX IPs"
        # os.system('./generate_ip')

    # ##################################
    # # Run FPGA flow
    # ##################################
    # os.chdir(DV_ROOT + '/../build')
    # os.system('mkdir -p fpga/protosyn_logs')
    # os.chdir('fpga')
    # os.system('cp $DV_ROOT/tools/src/proto/xilinx_conf/* .')
    # os.system('mkdir -p xst/projnav.tmp') # needed to be because ise supposes that is already exists
    # os.system('$DV_ROOT/tools/src/proto/xilinx_flow')


main()
