# Copyright (c) 2017 Princeton University
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

import re

MAX_BLOCK_NUM   = 255
BLOCK_SIZE      = 512    # size in bits
BYTES_PER_BLOCK = BLOCK_SIZE / 8
ADDR_WIDTH      = 10    # in # of hex digits, 5 bytes = 10 hex digits
BLOCK_NUM_WIDTH = 2     # in # of hex digits, 1 byte = 2 hex digits
BLOCK_WIDTH     = BLOCK_SIZE / 4 # in # of hex digits
START_TRIGGER   = 0xaaaaaaaaaa
PA_WIDTH        = 16
STOP_ADDR       = 0xffffffffff
DWORD_SIZE      = 16   # # of hex digits

def flushGroup(fptr, addr_str, gr_blocks):
    if int(addr_str, 16) > 2**40 - 1:
        print "ERROR: address %s exceeds maximum possible addres" % addr_str
        exit(2)

    # print >> fptr, addr_str
    # print >> fptr, strFromAddr(len(gr_blocks),BLOCK_NUM_WIDTH)
    # for b in gr_blocks:
    #   print >> fptr, b

    blk_cnt = 0
    for b in gr_blocks:
        blk_addr = int(addr_str,16) + blk_cnt*BYTES_PER_BLOCK
        blk_cnt += 1
        print >> fptr, strFromAddr(blk_addr,ADDR_WIDTH)
        for i in range(0,BLOCK_SIZE/(DWORD_SIZE*4)):
          print >> fptr, b[i*DWORD_SIZE:(i+1)*DWORD_SIZE]

def strFromAddr(addr, width):
    s = str(hex(addr))
    h = s[2:]
    return (width-len(h))*'0' + h

def makeStreamFile():
    fin = open('obp.coe', 'r')
    fout = open('obp.stream', 'w')
    block_ovrfl = 0
    block_total = 0
    gr_total = 0
    gr_blocks = list()
    gr_addr = 0

    print >> fout, strFromAddr(START_TRIGGER,ADDR_WIDTH)

    block_pattern = re.compile('([0-9a-fA-F]{%d})' % BLOCK_WIDTH)
    for line in fin:
        m = re.search(r'@([0-9a-fA-F]{16})', line)
        if (m != None):
            if (len(gr_blocks) > 0):
                gr_total += 1
                flushGroup(fout, strFromAddr(gr_addr,ADDR_WIDTH), gr_blocks)

            tmp = m.group(1)
            gr_addr = int(tmp, 16)
            gr_blocks = list()
            continue

        blocks = block_pattern.findall(line)
        blk_num = len(blocks)
        block_total += blk_num
        if blk_num > 0:
            if (len(gr_blocks) + blk_num) > MAX_BLOCK_NUM:
                gr_total += 1
                block_ovrfl += 1
                flushGroup(fout, strFromAddr(gr_addr,ADDR_WIDTH), gr_blocks)
                gr_addr = gr_addr + len(gr_blocks)*BYTES_PER_BLOCK
                gr_blocks = blocks
            else:
                gr_blocks = gr_blocks + blocks


    if (len(gr_blocks) > 0):
        gr_total += 1
        flushGroup(fout, strFromAddr(gr_addr,ADDR_WIDTH), gr_blocks)

    print >> fout, strFromAddr(STOP_ADDR,ADDR_WIDTH)
    print >> fout, '00'

    print "DEBUG: # groups %d" % gr_total
    print "DEBUG: total # of blocks: %d" % block_total
    print "DEBUG: # groups with overflow: %d" % block_ovrfl

    fin.close()
    fout.close()

def main():
    makeStreamFile()

if __name__ == '__main__':
    main()
