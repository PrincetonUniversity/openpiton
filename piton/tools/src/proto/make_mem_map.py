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
#  Last Modified : 2015-05-10 16:52:02
#  Revision      :
#  Author        : Alexey Lavrov
#  Company       : Princeton University
#  Email         : alavrov@princeton.edu
#
#  Description   : mapping of a test to BRAM on FPGA
#
#
#####################################################################


import re, os, sys

HEX_ADDR_WIDTH = 16
OUT = 0
IN = 1
BRAM_SIZE = 4096

class Section:
    def __init__(self, start, end, mem_trace):
        self.s_start =  int(bin(int(start,16))[2:-6],2) << 6
        self.s_end = (int(bin(int(end,16))[2:-6],2) + 1) << 6
        self.blocks = self.createBlocks(self.s_start, self.s_end, mem_trace)
        self.bram_addr = None

    def createBlocks(self, start, end, mem_trace):
        block_list = list()
        block_data = ''
        addr = start
        word_cnt = 0
        while addr < end:
            full_addr = fullAddr(addr)
            data = mem_trace.get(full_addr, 16*'0')
            # print "Adding data %s for address: %s" % (data, full_addr)
            block_data = data + block_data
            # print addr % 64
            if ((word_cnt % 8) == 7):
                block_list.append(block_data)
                block_data = ''
                word_cnt = 0
            else:
                word_cnt += 1
            addr += 8
        return block_list

    def setBramAddr(self, addr):
        self.bram_addr = addr

    def getBlockNum(self):
        return len(self.blocks)

    def getBlocks(self):
        return self.blocks


    def __str__(self):
        s = "Start: @%s, End: @%s, bram addr: %d" % (fullAddr(self.s_start), fullAddr(self.s_end), self.bram_addr)
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
        for s in self.sections:
            if (((new_sect.s_start >= s.s_start) and (new_sect.s_start <= s.s_end)) or
                ((new_sect.s_end   >= s.s_start) and (new_sect.s_end   <= s.s_end))):
                print >> flog, "Error: Trying to add a section which overlaps with existant!"
                print >> flog, "New section: [%x, %x]" % (new_sect.s_start, new_sect.s_end)
                exit(1)
        self.sections.append(new_sect)


def fullAddr(val):
    short_addr = hex(val)[2:]
    full_addr = (HEX_ADDR_WIDTH-len(short_addr))*'0' + short_addr
    return full_addr

def genCoe(section_list):
    f = open(os.environ['MODEL_DIR'] + '/fpga/xilinx_ip/test_proto.coe', 'w')
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

def genVerilogMapping(section_list, fname):
    # f = sys.stderr
    f = open(fname, 'w')
    l = len(section_list)

    print >> f, "//-----------------------------------------"
    print >> f, "// Auto generated mapping module"
    print >> f, "//-----------------------------------------"
    print >> f, """ module bram_map #(parameter MEM_ADDR_WIDTH=64, PHY_ADDR_WIDTH=40, BRAM_ADDR_WIDTH=12)
(
    input       [PHY_ADDR_WIDTH-1:0]    msg_addr,
    
    output      [BRAM_ADDR_WIDTH-1:0]   bram_blk_addr,
    output                              hit_any_section
);
"""

    for i in range(0,l):
        print >> f, "wire [63:0] %30s_%d;" % ('bram_addr', i)

    print >> f

    for i in range(0,l):
        print >> f, "wire %35s_%d;" % ('in_section', i)

    print >> f

    for i in range(0,l):
        s = section_list[i]
        print >> f, "assign bram_addr_%d = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h%x) >> 6) + %d;" % \
                    (i, s.s_start, s.bram_addr)

    print >> f

    for i in range(0,l):
        s = section_list[i]
        print >> f, "assign in_section_%d = (msg_addr >= 64'h%x) & (msg_addr < 64'h%x);" % \
                    (i, s.s_start, s.s_end)

    print >> f

    print >> f, "assign bram_blk_addr ="
    for i in range(0,l):
        s = section_list[i]
        term = ';' if i == (l-1) else '|'
        print >> f, "({BRAM_ADDR_WIDTH{in_section_%d}} & bram_addr_%d[BRAM_ADDR_WIDTH-1:0])%s" % \
                (i, i, term)


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
                addr_val_dict[fullAddr(addr)] = el
                addr += 8
        elif (state == IN):
            state = OUT
            # section_list.append(Section(start,fullAddr(addr-8),addr_val_dict))
    f.close()

    return addr_val_dict

def mapToBram(section_list):
    bram_addr = 0
    f = open("bram_map.log", 'w')
    for s in section_list:
        s.setBramAddr(bram_addr)
        bram_addr += s.getBlockNum()
        if (bram_addr > BRAM_SIZE):
            print >> sys.stderr, "Error: Limit of BRAM is exeeded!"
            exit(1)
        print >> f, s

    f.close()

def memTestData(fname, memimage_map, tname, flog):
    known_mapping = ['princeton-test-test.s', 'exu_muldiv.s']
    if tname not in known_mapping:
        print "Error: not know how to make test mapping to BRAM storage"
        print "Read documentation on PITON prototyping"
        sys.exit(2)

    f = open(fname, 'r')
    test_map = dict()
    
    for line in f:
        m = re.search(r'MemRead:[\s]+([0-9a-fA-F]+)[\s]*:[\s]*([0-9a-fA-F]+)', line)
        if (m != None):
            if m.group(1) not in test_map:
                if memimage_map.has_key(m.group(1)):
                    test_map[m.group(1)] = memimage_map.get(m.group(1))
                else:
                    print >> flog, "Warning: %s is not in memimage file" % m.group(1)
                    print >> flog, "Mapping with 0's"
                    test_map[m.group(1)] = 16*'0'
    # print test_map
    f.close()

    test_sections = TestSections()

    #######################################################
    # Section for Princeton_test_test
    #######################################################
    if tname == 'princeton-test-test.s':
        test_sections.addSection(Section('000000fff0000000','000000fff0000038', test_map), flog)
        test_sections.addSection(Section('000000fff0000380','000000fff00003f8', test_map), flog)
        test_sections.addSection(Section('00000000000400c0','00000000000402b8', test_map), flog)
        test_sections.addSection(Section('000000000004c000','000000000004c038', test_map), flog)
        test_sections.addSection(Section('000000000004c400','000000000004c4b8', test_map), flog)
        test_sections.addSection(Section('0000000001000900','0000000001000a38', test_map), flog)
        test_sections.addSection(Section('0000000000080c80','0000000000080cb8', test_map), flog)
        test_sections.addSection(Section('0000000000084180','00000000000841f8', test_map), flog)
        test_sections.addSection(Section('0000001100144000','0000001100144038', test_map), flog)
        test_sections.addSection(Section('0000000001000180','00000000010001b8', test_map), flog)
        test_sections.addSection(Section('0000001101834000','00000011018340b8', test_map), flog)
        test_sections.addSection(Section('00000010001225c0','00000010001225f8', test_map), flog)
        test_sections.addSection(Section('0000000000083140','00000000000831f8', test_map), flog)
        test_sections.addSection(Section('0000000000084340','0000000000084438', test_map), flog)
        test_sections.addSection(Section('0000000000080d00','0000000000080d38', test_map), flog)
        test_sections.addSection(Section('0000000005002180','00000000050021b8', test_map), flog)
        test_sections.addSection(Section('0000001101c34000','0000001101c34038', test_map), flog)
        test_sections.addSection(Section('0000001000122540','0000001000122578', test_map), flog)
        test_sections.addSection(Section('0000000002000000','0000000002000038', test_map), flog)
        test_sections.addSection(Section('0000001130000000','0000001130000078', test_map), flog)
        test_sections.addSection(Section('0000000006000000','0000000006000038', test_map), flog)
        test_sections.addSection(Section('0000001170000000','0000001170000078', test_map), flog)
        test_sections.addSection(Section('0000001000122000','0000001000122038', test_map), flog)
        test_sections.addSection(Section('00000000000807e0','00000000000807f8', test_map), flog)
    #######################################################
    # Section for exu_muldiv.s
    #######################################################
    elif tname == 'exu_muldiv.s':
        test_sections.addSection(Section('000000fff0000000','000000fff0000038', test_map), flog)
        test_sections.addSection(Section('000000fff0000380','000000fff00003f8', test_map), flog)
        test_sections.addSection(Section('00000000000400c0','00000000000402b8', test_map), flog)
        test_sections.addSection(Section('000000000004c000','000000000004c4b8', test_map), flog)
        test_sections.addSection(Section('00000000000807c0','0000000000080d38', test_map), flog)
        test_sections.addSection(Section('0000000001000900','0000000001000a38', test_map), flog)
        test_sections.addSection(Section('0000000000083140','0000000000084438', test_map), flog)
        test_sections.addSection(Section('0000001100144000','0000001100144038', test_map), flog)
        test_sections.addSection(Section('0000000001000180','00000000010001b8', test_map), flog)
        test_sections.addSection(Section('0000001101834000','00000011018340b8', test_map), flog)
        test_sections.addSection(Section('0000001000122540','00000010001225f8', test_map), flog)
        test_sections.addSection(Section('0000000005002180','00000000050021b8', test_map), flog)
        test_sections.addSection(Section('0000001101c34000','0000001101c34038', test_map), flog)
        test_sections.addSection(Section('0000000002000000','0000000002000038', test_map), flog)
        test_sections.addSection(Section('0000001130000000','0000001130000c78', test_map), flog)
        test_sections.addSection(Section('0000000006000000','0000000006000038', test_map), flog)
        test_sections.addSection(Section('0000001170000000','00000011700007b8', test_map), flog)
        test_sections.addSection(Section('0000001000120500','0000001000120538', test_map), flog)
        test_sections.addSection(Section('0000001000122000','0000001000122038', test_map), flog)
    else:
        print >> sys.stderr, "Error: Mapping for a test '%s' is not known" % tname
        exit(1)

    sections = test_sections.getSections()
    for k in test_map.keys():
        k_is_found = False
        for s in sections:
            if ((int(k,16) >= s.s_start) and (int(k,16) < s.s_end)):
                k_is_found = True
                break
        if not k_is_found:
            print "Error: %s is not mapped!" % k
            exit(1)

    return sections


def makeMapping(tname):
    # os.chdir('/tigress/alavrov/chip/fpga/OpenSPARCT1_model')
    flog = open('make_mem_map.log', 'w')

    fname_image     = os.environ['DV_ROOT'] + '/../build/mem.image'
    fsim_log        = os.environ['DV_ROOT'] + '/../build/sims.log'

    bram_map_file   = os.environ['DV_ROOT'] + '/design/proto/bram_map.v'

    
    mem_image_data = memImageData(fname_image)
    # print "Length of image file: %d" % len(mem_image_data.keys())
    sections = memTestData(fsim_log, mem_image_data, tname, flog)
    # print "Length of used data: %d" % len(sections)
    mapToBram(sections)
    

    # should be ordered list - does it still true?
    genCoe(sections)
    genVerilogMapping(sections, bram_map_file)

    flog.close()
    # print block_list
      
def main():
    makeMapping()   


if __name__ == '__main__':
    main()
