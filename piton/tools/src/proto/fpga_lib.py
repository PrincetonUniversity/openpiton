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
#  Filename      : fpga_lib.py
#  Version       : 1.0
#  Created On    : 2016-07-10
#  Author        : Alexey Lavrov
#  Company       : Princeton University
#  Email         : openpiton@princeton.edu
#
#  Description   : common function for Piton FPGA implementations
#
#####################################################################

import os, sys, re, subprocess, shlex

DV_ROOT = os.environ['DV_ROOT']
MODEL_DIR = os.environ['MODEL_DIR']
DESIGN_BLOCK_LIST = os.path.join(DV_ROOT, "tools/src/proto/block.list")
MAP_MODULE_NAME = "storage_addr_trans.v"
NOC_PAYLOAD_WIDTH = 512
STORAGE_BLOCK_BIT_WIDTH         =   {   "ddr":  {   "vc707":512,
                                                    "nexys4ddr":128,
                                                    "genesys2":256,
                                                    "nexysVideo":128
                                                },
                                        "bram": {   "vc707":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512
                                                },
                                        "dmw":  {   "vc707":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512
                                                }
                                    }

STORAGE_ADDRESSABLE_BIT_WIDTH   =   {   "ddr":  {   "vc707":64,
                                                    "nexys4ddr":16,
                                                    "genesys2":32,
                                                    "nexysVideo":16
                                                },
                                        "bram": {   "vc707":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512
                                                },
                                        "dmw": {   "vc707":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512
                                                }
                                    }

STORAGE_BIT_SIZE                =   {   "ddr":  {   "vc707":8*2**30,
                                                    "nexys4ddr":8*128*2**20,
                                                    "genesys2":8*2**30,
                                                    "nexysVideo":8*512*2**20
                                                },
                                        "bram": {   "vc707":16384*512,
                                                    "nexys4ddr":16384*512,
                                                    "genesys2":16384*512,
                                                    "nexysVideo":16384*512,
                                                    "piton_board":256*512
                                                },
                                        "dmw":  {   "vc707":8*2**30,
                                                    "nexys4ddr":8*128*2**20,
                                                    "genesys2":8*2**30,
                                                    "nexysVideo":8*512*2**20
                                                }
                                    }
DW_BIT_SIZE     = 64
DW_BYTE_SIZE    = DW_BIT_SIZE / 8


UART_BAUD_RATE = 115200
# UART_BAUD_RATE = 921600

class StorageBoard:
    def __init__ (self, storage, board):
        self.storage = storage
        self.board = board

def find_design_block(design_block):
    fp = open(DESIGN_BLOCK_LIST, 'r')
    for line in fp:
        # Check for comments
        if not re.match('\s*#.*', line) :
            # Process the block line
            line_split = line.split()
            block_data = dict()
            block_data["ID"] = line_split[0]
            if block_data["ID"] == design_block :
                design_dir = os.path.join(DV_ROOT, "design")
                block_data["PATH"] = os.path.join(os.path.join(design_dir, line_split[1]), "xilinx")
                board_support = dict()
                for board_string in line_split[2].split(';'):
                    if board_string != "":
                        board_string_split = board_string.split(',')
                        board_support[board_string_split[0]] = {"FREQ": board_string_split[1],
                                                                "DDRSIZE": board_string_split[2]}
                block_data["BOARDS"] = board_support

                fp.close()
                return block_data
    fp.close()

    return None

############################################################################
# Name:     calcUARTLatch
# Input:    design_data -   output of find_design_block function
#           board       -   string
# Output:   div         -   int - uart divider latch
############################################################################
def calcUARTLatch(design_data, board):
    div = (float(design_data["BOARDS"][board]["FREQ"]) * 10**6) / (16 * UART_BAUD_RATE);
    div = int(round(div))

    return div


############################################################################
# Name:     isTranslatorOK
# Input:    addr_data_map   -   addr:data map for a test to check
#           flog            -   file descriptor for loggin
# Output:   True
# Description: Tests if $DV_ROOT/chipset/rtl/storage_addr_trans.v
#              can be used for mapping of addr:map address
############################################################################
def isTranslatorOK(addr_data_map, flog):
    map_loc = DV_ROOT + "/design/chipset/rtl/storage_addr_trans_unified.v"
    fname = os.path.join(map_loc)
    f = open(fname, 'r')

    trans_sections = list()
    for line in f:
        m = re.search(r"in_section.*>=\s+64'h([0-9a-fA-F]+).*<\s+64'h([0-9a-fA-F]+)", line)
        if m != None:
            trans_sections.append((int(m.group(1), 16), int(m.group(2), 16)))

    f.close()

    for addr in addr_data_map.keys():
        addr_mapped = False
        for sec in trans_sections:
            if (addr >= sec[0]) and (addr < sec[1]):
                addr_mapped = True
                break
        if not addr_mapped:
            print >> flog, "ERROR: Address %s is not mapped in %s" % (hex(addr), map_loc)
            print >> sys.stderr, "ERROR: Address %s is not mapped in %s" % (hex(addr), map_loc)
            return False
 
    return True


def getTestList(fname, flog, ustr_files=False):
    f = open(fname, 'r')
    
    test_list = list()
    suff = "ustr" if ustr_files else "s"
    for line in f:
        mstr = "([0-9a-zA-Z_-]+\.%s)" % suff
        m = re.search(mstr, line)
        if m != None:
            tname = m.group(1)
            test_list.append(tname)

    f.close()
    return test_list

############################################################################
# Name:     runMidas
# Input:    tname           - filename with assembly test
#           uart_div_latch  - UART dividor latch value for UART16550 config
#           flog            - log file descriptor
# Output:   rv              - return value from midas
# Description: compile assebly test using midas tool
############################################################################
def runMidas(tname, uart_div_latch, flog):
    cmd = "sims -sys=manycore -novcs_build -novera_build -midas_only \
          -midas_args='-DUART_DIV_LATCH=0x%x -DFPGA_HW -DCIOP -DNO_SLAN_INIT_SPC' %s" % (uart_div_latch, tname)
    rv = subprocess.call(shlex.split(cmd), stdout=flog, stderr=flog)

    return rv


############################################################################
# Name:     runGenmemimage
# Input:    tname           - file name with assembly test
#           flog            - log file descriptor
# Output:   rv              - return value from genmemimage.pl script
# Description: generates mem.image file with memory sections and data
#              using genmemimage.pl script from OpenSPARCT1
############################################################################
def runGenmemimage(tname, flog):
    tool = os.path.join(DV_ROOT, "design/chipset/edk/scripts/genmemimage.pl")
    cmd = tool + " -single -f mem.image"
    rv = subprocess.call(shlex.split(cmd), stdout=flog, stderr=flog)

    return rv
