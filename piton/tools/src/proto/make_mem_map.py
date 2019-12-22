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
    for key in list(addr_data_map.keys()):
        print("Addr: %x Data: %s" % (key, addr_data_map[key]))

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
        print("Adding new section: [%x, %x]" % (new_sect.s_start, new_sect.s_end), file=flog)
        for s in self.sections:
            if (((new_sect.s_start >= s.s_start) and (new_sect.s_start <= s.s_end)) or
                ((new_sect.s_end   >= s.s_start) and (new_sect.s_end   <= s.s_end))):
                print("Error: Trying to add a section which overlaps with an existant one!", file=flog)
                print("New section: [%x, %x]" % (new_sect.s_start, new_sect.s_end), file=flog)
                print("Existant section: [%x, %x]" % (s.s_start, s.s_end), file=flog)
                print_error("Error: Trying to add a section which overlaps with existant!")
                print_error("New section: [%x, %x]" % (new_sect.s_start, new_sect.s_end))
                print_error("Existant section: [%x, %x]" % (s.s_start, s.s_end))
                exit(1)
        self.sections.append(new_sect)

def usage():
    print(file=sys.stderr)
    print("Usage:\nmake_mem_map -b <board type> -s <storage type> -t <test name>", file=sys.stderr)
    print(file=sys.stderr)
    print("\n        -b, --board <board type>", file=sys.stderr)
    print("              Name of a supported Xilinx's development board. Available options are:", file=sys.stderr)
    print("                  nexys4ddr*", file=sys.stderr)
    print("                  vc707", file=sys.stderr)
    print("                  genesys2", file=sys.stderr)
    print("                  nexysVideo", file=sys.stderr)
    print("\n                  * current configuration of design doesn't fit on this board", file=sys.stderr)
    print("\n        -s, --storage <storage type>", file=sys.stderr)
    print("              Type of a storage to store an assembly test in", file=sys.stderr)
    print("                  bram - default", file=sys.stderr)
    print("                  ddr", file=sys.stderr)
    print("\n        -t, --test <test name>", file=sys.stderr)
    print("              Name of an assembly test to put into storage", file=sys.stderr)

def checkCmdOptions(options):
    if options.tname == None:
        print("ERROR: provide a test name", file=sys.stderr)
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
    print("memory_initialization_radix=16;", file=f)
    print("memory_initialization_vector=", file=f)


    for j in range(0,len(section_list)):
        s = section_list[j]
        blocks = s.getBlocks()
        blocks_len = len(blocks)
        for i in range(0,blocks_len):
            if ((i == (blocks_len-1)) and (j == (len(section_list)-1))):
                term = ';'
            else:
                term = ','
            print(blocks[i]+term, file=f)

    f.close()

def genVerilogMapping(section_list, st_brd, fname=MAP_MODULE_NAME, tname="unknown"):
    # f = sys.stderr
    f = open(fname, 'w')
    l = len(section_list)

    print("//-----------------------------------------", file=f)
    print("// Auto generated mapping module", file=f)
    print("// It is provided for test: %s " % tname, file=f)
    print("//-----------------------------------------", file=f)
    print(""" module storage_addr_trans #(parameter MEM_ADDR_WIDTH=64, VA_ADDR_WIDTH=40, STORAGE_ADDR_WIDTH=12)
(
    input       [VA_ADDR_WIDTH-1:0]         va_byte_addr,

    output      [STORAGE_ADDR_WIDTH-1:0]    storage_addr_out,
    output                                  hit_any_section
);
""", file=f)

    print("wire [63:0] storage_addr;", file=f)
    print(file=f)

    for i in range(0,l):
        print("wire [63:0] %30s_%d;" % ('bram_addr', i), file=f)

    print(file=f)

    for i in range(0,l):
        print("wire %35s_%d;" % ('in_section', i), file=f)

    print(file=f)

    block_byte_width = STORAGE_BLOCK_BIT_WIDTH[st_brd.storage][st_brd.board] / 8
    block_byte_offset_w = math.log(block_byte_width, 2)
    for i in range(0,l):
        s = section_list[i]
        print("assign bram_addr_%d = (({{(MEM_ADDR_WIDTH-VA_ADDR_WIDTH){1'b0}}, va_byte_addr} - 64'h%x) >> %d) + %d;" % \
                    (i, s.s_start, block_byte_offset_w, s.bram_addr), file=f)

    print(file=f)

    for i in range(0,l):
        s = section_list[i]
        print("assign in_section_%d = (va_byte_addr >= 64'h%x) & (va_byte_addr < 64'h%x);" % \
                    (i, s.s_start, s.s_end), file=f)

    print(file=f)

    print("assign storage_addr =", file=f)
    for i in range(0,l):
        s = section_list[i]
        term = ';' if i == (l-1) else '|'
        print("({STORAGE_ADDR_WIDTH{in_section_%d}} & bram_addr_%d[STORAGE_ADDR_WIDTH-1:0])%s" % \
                (i, i, term), file=f)


    print(file=f)
    # number of addressable chunks in storage / storage block
    block_bit_size = STORAGE_BLOCK_BIT_WIDTH[st_brd.storage][st_brd.board]
    addressable_bit_size = STORAGE_ADDRESSABLE_BIT_WIDTH[st_brd.storage][st_brd.board]
    addres_chunks_in_block = int(math.log(block_bit_size / addressable_bit_size, 2))
    if addres_chunks_in_block > 0:
        print("assign storage_addr_out = {storage_addr, %d'b0};" % addres_chunks_in_block, file=f)
    else:
        print("assign storage_addr_out = storage_addr;", file=f)


    print(file=f)
    print("assign hit_any_section = ", file=f)
    for i in range(0,l):
        term = ';' if i == (l-1) else '|'
        print("in_section_%d %s" % (i, term), file=f)

    print(file=f)
    print("endmodule", file=f)
    print("//-----------------------------------------", file=f)
    print("// End of auto generated mapping", file=f)
    print("//-----------------------------------------", file=f)
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
        print(s, file=f)

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
                if addr in memimage_map:
                    test_map[addr] = memimage_map.get(addr)
                    # print "Adding Addr: %x Data: %s to test dictionary" % (addr, memimage_map.get(addr))
                else:
                    # print >> sys.stderr, "Warning: %x is not in memimage file" % addr
                    # print >> sys.stderr, "Mapping with 0's"
                    print("Warning: %x is not in memimage file" % addr, file=flog)
                    print("Mapping with 0's", file=flog)
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
    accessed_addr = list(test_map.keys())
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
    for k in list(test_map.keys()):
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
    print_info("Length of image file: %d" % len(list(mem_image_data.keys())))
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
