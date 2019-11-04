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

import os, sys, re, subprocess, shlex, time
import dbg

PROJECT_BUILD_LOG = "make_project.log"
PROJECT_IMPL_LOG = "implementation.log"
DV_ROOT = os.environ['DV_ROOT']
MODEL_DIR = os.environ['MODEL_DIR']
DESIGN_BLOCK_LIST = os.path.join(DV_ROOT, "tools/src/proto/block.list")
MAP_MODULE_NAME = "storage_addr_trans.v"
NOC_PAYLOAD_WIDTH = 512
STORAGE_BLOCK_BIT_WIDTH         =   {   "ddr":  {   "vc707":512,
                                                    "vcu118":512,
                                                    "xupp3r":512,
                                                    "nexys4ddr":128,
                                                    "genesys2":256,
                                                    "nexysVideo":128,
                                                    "f1":512
                                                },
                                        "bram": {   "vc707":512,
                                                    "vcu118":512,
                                                    "xupp3r":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512,
                                                    "f1":512
                                                },
                                        "dmw":  {   "vc707":512,
                                                    "vcu118":512,
                                                    "xupp3r":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512,
                                                    "f1":512
                                                }
                                    }

STORAGE_ADDRESSABLE_BIT_WIDTH   =   {   "ddr":  {   "vc707":64,
                                                    "vcu118":64,
                                                    "xupp3r":64,
                                                    "nexys4ddr":16,
                                                    "genesys2":32,
                                                    "nexysVideo":16,
                                                    "f1":64
                                                },
                                        "bram": {   "vc707":512,
                                                    "vcu118":512,
                                                    "xupp3r":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512,
                                                    "f1":512
                                                },
                                        "dmw": {    "vc707":512,
                                                    "vcu118":512,
                                                    "xupp3r":512,
                                                    "nexys4ddr":512,
                                                    "genesys2":512,
                                                    "nexysVideo":512,
                                                    "piton_board":512,
                                                    "f1":512
                                                }
                                    }

STORAGE_BIT_SIZE                =   {   "ddr":  {   "vc707":8*2**30,
                                                    "vcu118":2*8*2**30,
                                                    "xupp3r":32*8*2**30,
                                                    "nexys4ddr":8*128*2**20,
                                                    "genesys2":8*2**30,
                                                    "nexysVideo":8*512*2**20,
                                                    "f1":8*4*2**30
                                                },
                                        "bram": {   "vc707":16384*512,
                                                    "vcu118":16384*512,
                                                    "xupp3r":16384*512,
                                                    "nexys4ddr":16384*512,
                                                    "genesys2":16384*512,
                                                    "nexysVideo":16384*512,
                                                    "piton_board":256*512,
                                                    "f1":256*512
                                                },
                                        "dmw":  {   "vc707":8*2**30,
                                                    "vcu118":2*8*2**30,
                                                    "xupp3r":32*8*2**30,
                                                    "nexys4ddr":8*128*2**20,
                                                    "genesys2":8*2**30,
                                                    "nexysVideo":8*512*2**20,
                                                    "f1":8*4*2**30
                                                }
                                    }
DW_BIT_SIZE     = 64
DW_BYTE_SIZE    = DW_BIT_SIZE / 8


UART_BAUD_RATE = 115200
# UART_BAUD_RATE = 921600

OLED_STRING_LEN = 64

class StorageBoard:
    def __init__ (self, storage, board):
        self.storage = storage
        self.board = board

class ProtoDir:
    def __init__(self, board, design, design_data):
        self.board = os.path.join(MODEL_DIR, board)
        self.work = os.path.join(self.board, design_data["ID"])
        self.log = os.path.join(self.work, "protosyn_logs")
        proj_name = board + "_" + design
        self.run = os.path.join(self.work, proj_name, proj_name + ".runs")

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
#           ariane          -   if true, this will only consider the first
#                               entry. if flase, the first entry will be skipped
# Output:   True
# Description: Tests if $DV_ROOT/chipset/rtl/storage_addr_trans.tmp.v
#              can be used for mapping of addr:map address
############################################################################
def isTranslatorOK(addr_data_map, flog, ariane):
    map_loc = DV_ROOT + "/design/chipset/rtl/storage_addr_trans_unified.tmp.v"
    fname = os.path.join(map_loc)
    f = open(fname, 'r')

    trans_sections = list()
    cnt = 0
    for line in f:
        m = re.search(r"in_section.*>=\s+64'h([0-9a-fA-F]+).*<\s+64'h([0-9a-fA-F]+)", line)
        if m != None:
            if ariane:
                if cnt == 0:
                    trans_sections.append((int(m.group(1), 16), int(m.group(2), 16)))
            else:
                if cnt >= 0:
                    trans_sections.append((int(m.group(1), 16), int(m.group(2), 16)))
            cnt+=1

    f.close()

    uart_base = 0xfff0c2c000
    for addr in addr_data_map.keys():
        # Skip UART address mapped in hboot.s
        if uart_base <= addr < (uart_base + 2**12):
            continue
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
    suff = "ustr" if ustr_files else "([s|S|c]|riscv)"
    for line in f:
        mstr = "([0-9a-zA-Z_-]+\.%s)" % suff
        m = re.search(mstr, line)
        if m != None:
            tname = m.group(1)
            test_list.append(tname)
            print tname
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
def runMidas(tname, uart_div_latch, flog, midas_args=None, coreType="sparc", precompiled=False, x_tiles=1, y_tiles=1):
    cmd = ""
    if midas_args is None:
        cmd = "sims -sys=manycore -novcs_build -midas_only \
              -midas_args='-DUART_DIV_LATCH=0x%x -DFPGA_HW -DCIOP -DNO_SLAN_INIT_SPC' %s" % (uart_div_latch, tname)
    else:
       	cmd = "sims -sys=manycore -novcs_build -midas_only \
              -midas_args='-DUART_DIV_LATCH=0x%x -DFPGA_HW -DCIOP -DNO_SLAN_INIT_SPC %s' %s" % \
              (uart_div_latch, midas_args, tname)

    if coreType == "ariane":
        # specify uart_dmw in order to include load instructions for PASS/FAIL
        cmd += " -ariane -uart_dmw -x_tiles=%d -y_tiles=%d" % (int(x_tiles), int(y_tiles))
    elif coreType == "sparc":
        # nothing to add at the moment
        pass
    else:
        raise Exception("unknown core type " + coreType)

    if precompiled:
        # used to run precompiled riscv tests
        cmd += " -precompiled"

    rv = subprocess.call(shlex.split(cmd), stdout=flog, stderr=flog)
    print cmd
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

# Blocks execution until all jobs in job_ids are finished
def waitSlurmJobs(job_ids) :
    user = os.environ.get("USER")
    while (len(job_ids) > 0) :
        # Find finished jobs
        remove_jobs = []
        for job in job_ids :
            squeue_proc = subprocess.Popen(["squeue", "-u", user, "-j", job], \
                                           stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            wc_proc = subprocess.Popen(["wc", "-l"], stdin=squeue_proc.stdout, \
                                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = wc_proc.communicate()
            if out == "1\n" or out == "0\n":
                remove_jobs.append(job)

        # Remove finished jobs from list we are waiting on
        for job in remove_jobs :
            job_ids.remove(job)

        # Sleep for a bit
        time.sleep(10)


def strInFile(fpath, str_l):
    f = open(fpath, 'r')
    fdata = f.read()
    f.close()

    for s in str_l:
        m = re.search(s, fdata)
        if m == None:
            return False

    return True

def buildProjectSuccess(log_dir):
    fpath = os.path.join(log_dir, PROJECT_BUILD_LOG)
    if not strInFile(fpath, ["Project created"]):
        dbg.print_error("Vivado Project was not created properly!")
        dbg.print_error("Check: %s" % fpath)
        return False

    dbg.print_info("Project was build successfully!")
    return True


def implFlowSuccess(log_dir, run_dir):
    syn_dir = os.path.join(run_dir, "synth_1")
    impl_dir = os.path.join(run_dir, "impl_1")

    # check that implementation was started
    fpath = os.path.join(log_dir, PROJECT_IMPL_LOG)
    if not strInFile(fpath, ["Implementation launched for project"]):
        dbg.print_error("Implementation wasn't launched properly!")
        dbg.print_error("Check: %s" % fpath)
        return False

    # check synthesis results
    fpath = os.path.join(syn_dir, "runme.log")
    if not strInFile(fpath, ["synth_design completed successfully"]):
        dbg.print_error("FPGA synthesis failed!")
        dbg.print_error("Check: %s" % fpath)
        return False

    # check implementation results
    fpath = os.path.join(impl_dir, "runme.log")
    if not strInFile(fpath, ["Bitgen Completed Successfully"]):
        dbg.print_error("FPGA implementation failed!")
        dbg.print_error("Check: %s" % fpath)
        return False

    # check timing
    fname = [f for f in os.listdir(impl_dir) if f.endswith("timing_summary_routed.rpt")][0]
    fpath = os.path.join(impl_dir, fname)
    if not strInFile(fpath, ["timing constraints are met"]):
        dbg.print_error("Implemented design has timing violations!")
        dbg.print_error("Check: %s" % fpath)
        return False

    dbg.print_info("Design was implemented successfully!")
    return True
