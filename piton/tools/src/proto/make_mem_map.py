#!/usr/bin/env python

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
#  Filename      : make_mem_map.py
#  Created On    : 2014-05-10
#  Author        : Alexey Lavrov
#  Company       : Princeton University
#  Email         : openpiton@princeton.edu
#
#  Description   : Maps a test which passes VCS simulation
#                  to BRAM on FPGA. Outputs two files to MODEL_DIR:
#                  test_proto.coe - coefficient file for BRAM
#                  bram_map.v - mapping between physical and BRAM
#                               addresses
#
#####################################################################
import re, os, sys, math
from optparse import OptionParser
from fpga_lib import *
from dbg import *

HEX_ADDR_WIDTH = 16
OUT = 0
IN = 1
BRAM_SIZE = 16384


def printAddrDataMap(addr_data_map):
    for key in addr_data_map.keys():
        print "Addr: %x Data: %s" % (key, addr_data_map[key])

class Section:
    def __init__(self, start, end, mem_trace, st_brd):

        bin_start = bin(start)
        if (len(bin_start) > 8):
            cl_addr = int(bin_start[2:-6],2)
        else:
            cl_addr = 0
        self.s_start = cl_addr << 6

        bin_end = bin(end)
        if (len(bin_end) > 8):
            cl_addr = int(bin_end[2:-6],2)
        else:
            cl_addr= 0
        self.s_end = (cl_addr + 1) << 6

        self.blocks = self.createBlocks(self.s_start, self.s_end, mem_trace, st_brd)
        self.bram_addr = None

    def createBlocks(self, start, end, mem_trace, st_brd):
        block_list = list()
        block_data = ''
        addr = start
        word_cnt = 0
        blk_bit_width = STORAGE_BLOCK_BIT_WIDTH[st_brd.storage][st_brd.board]
        dw_in_block = blk_bit_width / DW_BIT_SIZE
        while addr < end:
            data = mem_trace.get(addr, 16*'0')
            # print "Adding data %s for address: %x" % (data, addr)
            block_data = data + block_data
            # print addr % 64
            if ((word_cnt % dw_in_block) == (dw_in_block - 1)):
                block_list.append(block_data)
                block_data = ''
                word_cnt = 0
            else:
                word_cnt += 1
            addr += DW_BYTE_SIZE
        return block_list

    def setBramAddr(self, addr):
        self.bram_addr = addr

    def getBlockNum(self):
        return len(self.blocks)

    def getBlocks(self):
        return self.blocks


    def __str__(self):
        s = "Start: @%s, End: @%s, bram addr: %s" % (fullAddr(self.s_start), fullAddr(self.s_end), str(self.bram_addr))
        s += '\n'
        for i in range(0,len(self.blocks)):
            s += str(self.blocks[i]) + '\n'
        return s

class TestSections:
    def __init__(self):
        self.sections = list()

    def getSections(self):
        return self.sections

    def addSection(self, new_sect, flog):
        print >> flog, "Adding new section: [%x, %x]" % (new_sect.s_start, new_sect.s_end)
        for s in self.sections:
            if (((new_sect.s_start >= s.s_start) and (new_sect.s_start <= s.s_end)) or
                ((new_sect.s_end   >= s.s_start) and (new_sect.s_end   <= s.s_end))):
                print >> flog, "Error: Trying to add a section which overlaps with an existant one!"
                print >> flog, "New section: [%x, %x]" % (new_sect.s_start, new_sect.s_end)
                print >> flog, "Existant section: [%x, %x]" % (s.s_start, s.s_end)
                print_error("Error: Trying to add a section which overlaps with existant!")
                print_error("New section: [%x, %x]" % (new_sect.s_start, new_sect.s_end))
                print_error("Existant section: [%x, %x]" % (s.s_start, s.s_end))
                exit(1)
        self.sections.append(new_sect)

def usage():
    print >> sys.stderr
    print >> sys.stderr, "Usage:\nmake_mem_map -b <board type> -s <storage type> -t <test name>"
    print >> sys.stderr
    print >> sys.stderr, "\n        -b, --board <board type>"
    print >> sys.stderr, "              Name of a supported Xilinx's development board. Available options are:"
    print >> sys.stderr, "                  nexys4ddr*"
    print >> sys.stderr, "                  vc707"
    print >> sys.stderr, "                  genesys2"
    print >> sys.stderr, "                  nexysVideo"
    print >> sys.stderr, "\n                  * current configuration of design doesn't fit on this board"
    print >> sys.stderr, "\n        -s, --storage <storage type>"
    print >> sys.stderr, "              Type of a storage to store an assembly test in"
    print >> sys.stderr, "                  bram - default"
    print >> sys.stderr, "                  ddr"
    print >> sys.stderr, "\n        -t, --test <test name>"
    print >> sys.stderr, "              Name of an assembly test to put into storage"

def checkCmdOptions(options):
    if options.tname == None:
        print >> sys.stderr,  "ERROR: provide a test name"
        usage()
        exit(2)


def fullAddr(val):
    short_addr = hex(val)[2:]
    full_addr = (HEX_ADDR_WIDTH-len(short_addr))*'0' + short_addr
    return full_addr

# Input: list of Sections
# Output: test_proto.coe file in $MODEL_DIR folder
def genCoe(section_list):
    dir_path = os.environ['MODEL_DIR']
    f = open(dir_path + '/test_proto.coe', 'w')
    print >> f, "memory_initialization_radix=16;"
    print >> f, "memory_initialization_vector="


    for j in range(0,len(section_list)):
        s = section_list[j]
        blocks = s.getBlocks()
        blocks_len = len(blocks)
        for i in range(0,blocks_len):
            if ((i == (blocks_len-1)) and (j == (len(section_list)-1))):
                term = ';'
            else:
                term = ','
            print >> f, blocks[i]+term

    f.close()

def genVerilogMapping(section_list, st_brd, fname=MAP_MODULE_NAME, tname="unknown"):
    # f = sys.stderr
    f = open(fname, 'w')
    l = len(section_list)

    print >> f, "//-----------------------------------------"
    print >> f, "// Auto generated mapping module"
    print >> f, "// It is provided for test: %s " % tname
    print >> f, "//-----------------------------------------"
    print >> f, """ module storage_addr_trans #(parameter MEM_ADDR_WIDTH=64, VA_ADDR_WIDTH=40, STORAGE_ADDR_WIDTH=12)
(
    input       [VA_ADDR_WIDTH-1:0]         va_byte_addr,

    output      [STORAGE_ADDR_WIDTH-1:0]    storage_addr_out,
    output                                  hit_any_section
);
"""

    print >> f, "wire [63:0] storage_addr;"
    print >> f

    for i in range(0,l):
        print >> f, "wire [63:0] %30s_%d;" % ('bram_addr', i)

    print >> f

    for i in range(0,l):
        print >> f, "wire %35s_%d;" % ('in_section', i)

    print >> f

    block_byte_width = STORAGE_BLOCK_BIT_WIDTH[st_brd.storage][st_brd.board] / 8
    block_byte_offset_w = math.log(block_byte_width, 2)
    for i in range(0,l):
        s = section_list[i]
        print >> f, "assign bram_addr_%d = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h%x) >> %d) + %d;" % \
                    (i, s.s_start, block_byte_offset_w, s.bram_addr)

    print >> f

    for i in range(0,l):
        s = section_list[i]
        print >> f, "assign in_section_%d = (va_byte_addr >= 64'h%x) & (va_byte_addr < 64'h%x);" % \
                    (i, s.s_start, s.s_end)

    print >> f

    print >> f, "assign storage_addr ="
    for i in range(0,l):
        s = section_list[i]
        term = ';' if i == (l-1) else '|'
        print >> f, "({STORAGE_ADDR_WIDTH{in_section_%d}} & bram_addr_%d[STORAGE_ADDR_WIDTH-1:0])%s" % \
                (i, i, term)


    print >> f
    # number of addressable chunks in storage / storage block
    block_bit_size = STORAGE_BLOCK_BIT_WIDTH[st_brd.storage][st_brd.board]
    addressable_bit_size = STORAGE_ADDRESSABLE_BIT_WIDTH[st_brd.storage][st_brd.board]
    addres_chunks_in_block = int(math.log(block_bit_size / addressable_bit_size, 2))
    if addres_chunks_in_block > 0:
        print >> f, "assign storage_addr_out = {storage_addr, %d'b0};" % addres_chunks_in_block
    else:
        print >> f, "assign storage_addr_out = storage_addr;"


    print >> f
    print >> f, "assign hit_any_section = "
    for i in range(0,l):
        term = ';' if i == (l-1) else '|'
        print >> f, "in_section_%d %s" % (i, term)

    print >> f
    print >> f, "endmodule"
    print >> f, "//-----------------------------------------"
    print >> f, "// End of auto generated mapping"
    print >> f, "//-----------------------------------------"
    f.close()


##################################################################
# Name:     memImageData
# Input:    fname           -   name of mem.image file
# Output:   addr_val_dict   -   dictionary { addr : data}
#                               addr -int
#                               data - 16 hex char string
##################################################################
def memImageData(fname):
    addr_val_dict = dict()
    # section_list = list()
    state = OUT

    f = open(fname, 'r')
    for line in f:
        m = re.search(r'@([0-9a-fA-F]{16})', line)
        if (m != None):
            state = IN
            start = m.group(1)
            addr = int(start,16)
            continue
        data =  re.findall(r'[0-9a-f]{16}', line)
        if len(data) > 0:
            for el in data:
                addr_val_dict[addr] = el
                addr += 8
        elif (state == IN):
            state = OUT
            # section_list.append(Section(start,fullAddr(addr-8),addr_val_dict))
    f.close()

    # printAddrDataMap(addr_val_dict)
    return addr_val_dict

def mapToBram(section_list, st_brd):
    st_size = STORAGE_BIT_SIZE[st_brd.storage][st_brd.board]
    blk_size = STORAGE_BLOCK_BIT_WIDTH[st_brd.storage][st_brd.board]
    max_block_num = st_size / blk_size

    bram_addr = 0
    f = open("bram_map.log", 'w')
    limit_exceeded = False
    for s in section_list:
        s.setBramAddr(bram_addr)
        bram_addr += s.getBlockNum()
        if (bram_addr > max_block_num):
            limit_exceeded = True
        print >> f, s

    f.close()

    print_info("Used %d out of %d blocks of storage" % (bram_addr, max_block_num))
    if limit_exceeded:
        print_error("Error: Limit of storage is exceeded!")
        return 1

    return 0

def makeAddrDataTestDict(fname, memimage_map, flog):
    try:
        f = open(fname, 'r')
    except:
        print_error("Can't open file %s" % fname)
        exit(2)

    test_map = dict()

    for line in f:
        m = re.search(r'MemRead:[\s]+([0-9a-fA-F]+)[\s]*:[\s]*([0-9a-fA-F]+)', line)
        if (m != None):
            addr = int(m.group(1), 16)
            # print "Looking for addr %d" % addr
            if addr not in test_map:
                if memimage_map.has_key(addr):
                    test_map[addr] = memimage_map.get(addr)
                    # print "Adding Addr: %x Data: %s to test dictionary" % (addr, memimage_map.get(addr))
                else:
                    # print >> sys.stderr, "Warning: %x is not in memimage file" % addr
                    # print >> sys.stderr, "Mapping with 0's"
                    print >> flog, "Warning: %x is not in memimage file" % addr
                    print >> flog, "Mapping with 0's"
                    test_map[addr] = 16*'0'
    # print test_map
    # print >> sys.stderr, "Closing a file: %s" % fname
    f.close()

    return test_map

###########################################################
# Name:     memTestData
# Input:    test_map    -   dictionary { addr : data}
#                           addr - int
#                           data - 16 hex char string
#           flog        -   log file name
# Output:   sections    -   list of Section for a test
###########################################################
def memTestData(st_brd, test_map, flog):
    test_sections = TestSections()
    # print "TEST_MAP"
    # printAddrDataMap(test_map)

    #####################################################################
    # Test version - automatic section creation
    #####################################################################
    max_unacc_interv = 512*16   #  10 cache lines == 10 rows in bram
    accessed_addr = test_map.keys()
    accessed_addr.sort()
    addr_prev = accessed_addr[0]
    sect_first = addr_prev
    for addr in accessed_addr[1:]:
        diff = 8*(addr - addr_prev)
        if diff > max_unacc_interv:
            test_sections.addSection(Section(sect_first, addr_prev, test_map, st_brd), flog)
            sect_first = addr
        addr_prev = addr

    # last interval must be mappend in any case
    test_sections.addSection(Section(sect_first, addr, test_map, st_brd), flog)
    # print >> sys.stderr, "Created %d sections for test in memory" % len(test_sections.getSections())

    print_info("Checking correctness of section mapping... ")

    sections = test_sections.getSections()
    for k in test_map.keys():
        k_is_found = False
        for s in sections:
            if ((k >= s.s_start) and (k < s.s_end)):
                k_is_found = True
                break
        if not k_is_found:
            print_error("Error: %s is not mapped!" % k)
            exit(1)

    print_info("Correct!")

    return sections


def makeMapping(st_brd, tname="unknown"):
    flog = open('make_mem_map.log', 'w')

    fname_image     = os.path.join(MODEL_DIR, "mem.image")
    fsim_log        = os.path.join(MODEL_DIR, "sims.log")

    bram_map_file   = os.path.join(MODEL_DIR, MAP_MODULE_NAME)


    mem_image_data = memImageData(fname_image)
    print_info("Length of image file: %d" % len(mem_image_data.keys()))
    addr_data_test_map = makeAddrDataTestDict(fsim_log, mem_image_data, flog)
    sections = memTestData(st_brd, addr_data_test_map, flog)
    # print "Length of used data: %d" % len(sections)
    # TODO: check if used. Will be error withoug the second argument so far
    rv = mapToBram(sections, st_brd)
    if rv != 0:
        flog.close()
        return 1


    # should be ordered list - does it still true?
    genCoe(sections)
    genVerilogMapping(sections, st_brd, bram_map_file, tname)

    flog.close()
    # print block_list

def setParserOptions(parser):
    parser.add_option("-t", "--test", dest="tname", action="store", help="Name of a test")
    parser.add_option("-b", "--board", dest="board", action="store", default="genesys2")
    parser.add_option("-s", "--storage", dest="storage", action="store", default="bram")

    return parser


def main():
    parser = OptionParser(add_help_option=False)
    parser = setParserOptions(parser)
    (options, args) = parser.parse_args()

    checkCmdOptions(options)

    print_info("Using board type: %s" % options.board)
    print_info("Using storage type: %s" % options.storage)

    st_brd = StorageBoard(options.storage, options.board)

    makeMapping(st_brd, options.tname)
    print_info("Completed!")


if __name__ == '__main__':
    main()
