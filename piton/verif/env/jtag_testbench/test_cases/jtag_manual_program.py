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

import libjtag
import re

# tests jtag writing the whole program to icache
# and running program without ever accessing the L2
# in case the network on chip doesn't work

# testname: manual_program
# meant to be used with test_fail.s

# 1. start the simulation without wake up packet
# 2. write icache with noops and good_traps (then re-read written data)
# 3. write icache tags and valid array
# 4. manually start the thread
# 5. hope that the simulation gets to good trap

# 2a data to write to icache
# - each cache line is 128b (16B), and contains 4 instructions
# - noop is 01_00 00 00
# - so 0000_0001_0000 0000 000....
# - 4 noop instructions would be
#     0x0800000202000000
#     0x8000002020000008
#     0xxxxxxxxxxxxxxx80
#     (x's are don't care)
# - a goodtrap inst is 91d02000
# - 4 goodtraps would be
#     0x8E81000523A04001
#     0xE81000523A040014
#     0xxxxxxxxxxxxxxx48
# - index is actually 2 and 3

# 3 write to valid array
# - targetting address is 0x40020, so icache index is 2 (if 16B cache line)
# - However, valid array for icache is based on 32B granularity, so the valid index is actually 1
# - write to way0, therefore index == 1, and way == 0
# - index to the valid array is a bit more complicated, and is of the form wr_adr[6:2]
# - should still set it to 1

# 3a write to tag
# - tag at 32B granularity is 0x2001, or 16b'0010_0000_0000_0001
# - the first 8b are indexes, so that makes the tag 0010_0000
# - at index 1
# - tag data layout: {4'b0, parity, address[39:12]}, total 33b, 28b address
# - ie: 0_0001_0000__0010_0000

jtag = libjtag.JtagGen()
jtag.CommitWait(2000)
# jtag.CommandStallCore(coreid=0, threadid=0, stall=1)
jtag.CommandStallCore(coreid=1, threadid=0, stall=1)
jtag.CommandStallCore(coreid=2, threadid=0, stall=1)
jtag.CommandStallCore(coreid=3, threadid=0, stall=1)
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_ICACHE_EN_REG'],
                        data='11111') # enable icache on all 4 threads, b4 is the "lock" bit

valid_bits = [[0, 0, 0, 0] for i in range(128)]
icache0 = [[''.zfill(136), ''.zfill(136), ''.zfill(136), ''.zfill(136)] for i in range(128)]
icache1 = [[''.zfill(136), ''.zfill(136), ''.zfill(136), ''.zfill(136)] for i in range(128)]
itags = [[''.zfill(33), ''.zfill(33), ''.zfill(33), ''.zfill(33)]  for i in range(128)]

def WriteICache(address, instructions):

  ind = address >> 5
  ind = ind % 128
  if valid_bits[ind][0] == 0:
    way = 0;
  elif valid_bits[ind][1] == 0:
    way = 1;
  elif valid_bits[ind][2] == 0:
    way = 2;
    # assert(0)
  elif valid_bits[ind][3] == 0:
    way = 3;
  else:
    assert(0) # out of cache space :(

  print "address 0x%x" % address
  print " cache index %d" % ind
  print " cache way %d" % way

  binary = jtag.MakeL1InstructionCacheLine(instructions[0:4])
  assert(len(binary) == 136)
  icache0[ind][way] = binary;
  binary = jtag.MakeL1InstructionCacheLine(instructions[4:8])
  assert(len(binary) == 136)
  icache1[ind][way] = binary;

  tag = bin(address>>12)[2:].zfill(28)
  parity = jtag.CalculateParity(tag)
  tag = str(parity) + tag
  tag = tag.zfill(33)
  itags[ind][way] = tag

  valid_bits[ind][way] = 1


def WriteICacheStream(address, instructions):
  ii = []
  count = 0;
  for i in instructions:
    count += 1
    ii.append(i)
    if (len(ii) == 8):
      WriteICache(address + (16 * ((count/8 - 1) * 2)), ii)
      ii = []


def ParseObjCode(text):
  text = text.split("\n")
  regex_op = re.compile("^\s*[0-9a-f]*: (.. .. .. ..) ")
  instlist = []
  for l in text:
    m = regex_op.match(l)
    if m:
      # print l
      instlist.append(m.group(1))
  m = len(instlist) % 8
  l = 8 - m

  if m != 0:
    l = 8 - m
    for i in range(l):
      instlist.append("01 00 00 00");

  # print instlist
  return instlist

dcache_val = [False for i in range(128)]
def WriteDCache(address, data):
  ind = address >> 4
  ind = ind % 128
  way = 0
  if (dcache_val[ind] == False):
    dcache_val[ind] = True
  else:
    way = 2

  print "address 0x%x" % address
  print " cache index %d" % ind
  print " cache way %d" % way

  binary = jtag.MakeL1DataCacheLine(data)
  assert(len(binary) == 144)
  data0 = binary[144-64*1:144-64*0]
  assert(len(data0) == 64)
  data1 = binary[144-64*2:144-64*1]
  assert(len(data1) == 64)
  data2 = binary[0:144-64*2]
  assert(len(data2) == 16)
  if (way == 0):
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCACHE_W01, index=ind,
                        way=jtag.WAYID_MASK_0, wrdata=data0)
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCACHE_W01, index=ind,
                        way=jtag.WAYID_MASK_1, wrdata=data1)
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCACHE_W01, index=ind,
                        way=jtag.WAYID_MASK_2, wrdata=data2)
  else:
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCACHE_W23, index=ind,
                        way=jtag.WAYID_MASK_0, wrdata=data0)
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCACHE_W23, index=ind,
                        way=jtag.WAYID_MASK_1, wrdata=data1)
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCACHE_W23, index=ind,
                        way=jtag.WAYID_MASK_2, wrdata=data2)

  tag = bin(address>>11)[2:].zfill(29)
  print ' tag %s' % hex(int(tag, 2))
  parity = jtag.CalculateParity(tag)
  tag = str(parity) + tag
  tag = tag.zfill(33)
  print ' tag w parity %s' % hex(int(tag, 2))
  if (way == 0):
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DTAG, index=ind,
                      way=jtag.WAYID_MASK_0, wrdata=tag)
  else:
    tag = tag + '00'
    jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DTAG, index=ind,
                      way=jtag.WAYID_MASK_1, wrdata=tag)

  if way == 0:
    valid_bits = '0001000100010001'
  else:
    valid_bits = '0101010101010101'
  jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_DCV, index=ind/4,
                          way=jtag.WAYID_MASK_0, wrdata=valid_bits)

def WriteDCacheStream(text):
  address_re = re.compile("^0x(\w+)");
  data_re = re.compile("^   Data.: 0x(\w+)")

  data = []
  address = 0
  for l in text.split('\n'):
    m = address_re.match(l)
    if m:
      if (address != 0):
        WriteDCache(address, data)
        data = []
      address = int(m.group(0), 16)
      continue

    m = data_re.match(l)
    if m:
      data.append(m.group(1))
      assert(len(data) <= 4)
      continue


def FinalizeWriting():
  for i in range(128):
    # writing valid bits
    if i % 4 == 0:
      data = ''
      for j in range(16):
        data += `valid_bits[i + j/4][j%4]`

      assert(len(data) == 16)
      data = data[::-1]
      if data != '0000000000000000':
        ind = i / 4
        print "writing to valid index %d" % ind
        print " %s" % data
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICV, index=ind,
                                way=jtag.WAYID_MASK_0, wrdata=data)
        # print "writing valid array"
        # print " index %d" % ind
        # print " %s" % data

    # writing tags
    # vals = ''
    # for j in range(4):
    #   vals += `valid_bits[i][j]`
    # if 
    if 1 in valid_bits[i]:
      data = ''
      data += itags[i][3]
      data += itags[i][2]
      data += itags[i][1]
      data += itags[i][0]
      # print data
      assert(len(data) == 4*33)
      data0 = data[132-64:132]
      assert(len(data0) == 64)
      data1 = data[4:68]
      assert(len(data1) == 64)
      data2 = data[0:4]
      assert(len(data2) == 4)
      jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ITAG, index=i,
                          way=jtag.WAYID_MASK_0, wrdata=data0)
      jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ITAG, index=i,
                          way=jtag.WAYID_MASK_1, wrdata=data1)
      jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ITAG, index=i,
                          way=jtag.WAYID_MASK_2, wrdata=data2)

      # writing icache data
      data = ''
      data += icache0[i][1]
      data += icache0[i][0]
      assert(len(data) == 272)
      data0 = data[272-64:272]
      assert(len(data0) == 64)
      data1 = data[272-64*2:272-64*1]
      assert(len(data1) == 64)
      data2 = data[272-64*3:272-64*2]
      assert(len(data2) == 64)
      data3 = data[272-64*4:272-64*3]
      assert(len(data3) == 64)
      data4 = data[0:272-64*4]
      # print data4
      assert(len(data4) == 16)
      if valid_bits[i][0]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2,
                            way=jtag.WAYID_MASK_0, wrdata=data0)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2,
                            way=jtag.WAYID_MASK_1, wrdata=data1)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2,
                            way=jtag.WAYID_MASK_2, wrdata=data2)
      if valid_bits[i][1]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2,
                            way=jtag.WAYID_MASK_3, wrdata=data3)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2,
                            way=jtag.WAYID_MASK_4, wrdata=data4)

      data = ''
      data += icache0[i][3]
      data += icache0[i][2]
      assert(len(data) == 272)
      data0 = data[272-64:272]
      assert(len(data0) == 64)
      data1 = data[272-64*2:272-64*1]
      assert(len(data1) == 64)
      data2 = data[272-64*3:272-64*2]
      assert(len(data2) == 64)
      data3 = data[272-64*4:272-64*3]
      assert(len(data3) == 64)
      data4 = data[0:272-64*4]
      assert(len(data4) == 16)
      if valid_bits[i][2]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2,
                            way=jtag.WAYID_MASK_0, wrdata=data0)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2,
                            way=jtag.WAYID_MASK_1, wrdata=data1)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2,
                            way=jtag.WAYID_MASK_2, wrdata=data2)
      if valid_bits[i][3]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2,
                            way=jtag.WAYID_MASK_3, wrdata=data3)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2,
                            way=jtag.WAYID_MASK_4, wrdata=data4)

      data = ''
      data += icache1[i][1]
      data += icache1[i][0]
      assert(len(data) == 272)
      data0 = data[272-64:272]
      assert(len(data0) == 64)
      data1 = data[272-64*2:272-64*1]
      assert(len(data1) == 64)
      data2 = data[272-64*3:272-64*2]
      assert(len(data2) == 64)
      data3 = data[272-64*4:272-64*3]
      assert(len(data3) == 64)
      data4 = data[0:272-64*4]
      assert(len(data4) == 16)
      if valid_bits[i][0]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2+1,
                            way=jtag.WAYID_MASK_0, wrdata=data0)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2+1,
                            way=jtag.WAYID_MASK_1, wrdata=data1)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2+1,
                            way=jtag.WAYID_MASK_2, wrdata=data2)
      if valid_bits[i][1]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2+1,
                            way=jtag.WAYID_MASK_3, wrdata=data3)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W10, index=i*2+1,
                            way=jtag.WAYID_MASK_4, wrdata=data4)

      data = ''
      data += icache1[i][3]
      data += icache1[i][2]
      assert(len(data) == 272)
      data0 = data[272-64:272]
      assert(len(data0) == 64)
      data1 = data[272-64*2:272-64*1]
      assert(len(data1) == 64)
      data2 = data[272-64*3:272-64*2]
      assert(len(data2) == 64)
      data3 = data[272-64*4:272-64*3]
      assert(len(data3) == 64)
      data4 = data[0:272-64*4]
      assert(len(data4) == 16)
      if valid_bits[i][2]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2+1,
                            way=jtag.WAYID_MASK_0, wrdata=data0)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2+1,
                            way=jtag.WAYID_MASK_1, wrdata=data1)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2+1,
                            way=jtag.WAYID_MASK_2, wrdata=data2)
      if valid_bits[i][3]:
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2+1,
                            way=jtag.WAYID_MASK_3, wrdata=data3)
        jtag.CommandWriteSram(coreid=0, threadid=0, sramid=jtag.BIST_ID_L1_ICACHE_W32, index=i*2+1,
                            way=jtag.WAYID_MASK_4, wrdata=data4)


t = '''
   40020: 03 00 00 00   sethi  %hi(0), %g1
   40024: 05 00 01 00   sethi  %hi(0x40000), %g2
   40028: 82 10 60 00   mov  %g1, %g1
   4002c: 84 10 a0 c0   or  %g2, 0xc0, %g2
   40030: 83 28 70 20   sllx  %g1, 0x20, %g1
   40034: 84 10 80 01   or  %g2, %g1, %g2
   40038: 81 c0 80 00   jmp  %g2
   4003c: 01 00 00 00   nop 
'''
instructions = ParseObjCode(t)
# print instructions
WriteICacheStream(0x40020, instructions)

t = '''
00000000000400c0 <HRedmode_Reset_Handler>:
   400c0: b5 80 20 05   wr  %g0, 5, %thread_stat
   400c4: 25 20 00 00   sethi  %hi(0x80000000), %l2
   400c8: a5 2c b0 20   sllx  %l2, 0x20, %l2
   400cc: 82 10 20 10   mov  0x10, %g1
   400d0: e4 f0 43 40   stxa  %l2, [ %g1 ] (26)
   400d4: 01 00 00 00   nop 
   400d8: 01 00 00 00   nop 
   400dc: 82 10 20 18   mov  0x18, %g1  ! 18 <*ABS*+0x18>
   400e0: e4 f0 43 40   stxa  %l2, [ %g1 ] (26)
   400e4: a2 10 20 03   mov  3, %l1
   400e8: e2 f0 08 a0   stxa  %l1, [ %g0 ] (69)
   400ec: a3 48 00 00   rdhpr  %hpstate, %l1
   400f0: 81 9c 68 20   wrhpr  %l1, 0x820, %hpstate
   400f4: 87 80 20 25   wr  %g0, 0x25, %asi
   400f8: c0 f0 23 c0   stxa  %g0, [ 0x3c0 ] %asi
   400fc: c0 f0 23 c8   stxa  %g0, [ 0x3c8 ] %asi
   40100: c0 f0 23 d0   stxa  %g0, [ 0x3d0 ] %asi
   40104: c0 f0 23 d8   stxa  %g0, [ 0x3d8 ] %asi
   40108: c0 f0 23 e0   stxa  %g0, [ 0x3e0 ] %asi
   4010c: c0 f0 23 e8   stxa  %g0, [ 0x3e8 ] %asi
   40110: c0 f0 23 f0   stxa  %g0, [ 0x3f0 ] %asi
   40114: c0 f0 23 f8   stxa  %g0, [ 0x3f8 ] %asi
   40118: 8f 90 20 00   wrpr  0, %tl
   4011c: a1 90 20 00   wrpr  0, %gl
   40120: 8d 80 20 00   wr  %g0, 0, %fprs
   40124: 85 80 20 00   wr  %g0, 0, %ccr
   40128: 87 80 20 00   wr  %g0, 0, %asi
   4012c: 84 10 20 00   clr  %g2
   40130: 89 90 80 00   wrpr  %g2, %tick
   40134: 84 10 20 00   clr  %g2
   40138: b1 80 80 00   wr  %g2, %g0, %sys_tick
   4013c: 84 10 20 01   mov  1, %g2
   40140: 85 28 b0 3f   sllx  %g2, 0x3f, %g2
   40144: af 80 80 00   wr  %g2, %g0, %tick_cmpr
   40148: b3 80 80 00   wr  %g2, %g0, %sys_tick_cmpr
   4014c: bf 98 80 00   wrhpr  %g2, %hsys_tick_cmpr
   40150: 81 80 00 00   mov  %g0, %y
   40154: 91 90 20 0f   wrpr  0xf, %pil
   40158: 93 90 20 00   wrpr  0, %cwp
   4015c: 95 90 20 06   wrpr  6, %cansave
   40160: 97 90 20 00   wrpr  0, %canrestore
   40164: 9b 90 20 00   wrpr  0, %otherwin
   40168: 99 90 20 07   wrpr  7, %cleanwin
   4016c: 9d 90 20 07   wrpr  7, %wstate
   # 40170: 82 10 20 ba   mov  0xba, %g1
   # 40174: 83 28 70 20   sllx  %g1, 0x20, %g1
   # 40178: c2 58 40 00   ldx  [ %g1 ], %g1
   # 4017c: a3 30 70 05   srlx  %g1, 5, %l1
   # 40180: 82 04 40 01   add  %l1, %g1, %g1
   # 40184: a2 10 20 3f   mov  0x3f, %l1
   # 40188: 82 08 40 11   and  %g1, %l1, %g1
   # 4018c: 83 28 70 01   sllx  %g1, 1, %g1
   # 40190: a3 46 80 00   rd  %thread_stat, %l1
   # 40194: a3 34 70 08   srlx  %l1, 8, %l1
   # 40198: a2 04 40 01   add  %l1, %g1, %l1
   # 4019c: 82 10 20 7f   mov  0x7f, %g1
   # 401a0: a2 0c 40 01   and  %l1, %g1, %l1
   40170: a2 10 20 00   clr  %l1
   401a4: 03 00 00 00   sethi  %hi(0), %g1
   401a8: 05 00 01 30   sethi  %hi(0x4c000), %g2
   401ac: 82 10 60 00   mov  %g1, %g1
   401b0: 84 10 a0 00   mov  %g2, %g2
   401b4: 83 28 70 20   sllx  %g1, 0x20, %g1
   401b8: 84 10 80 01   or  %g2, %g1, %g2
   401bc: a3 2c 70 03   sllx  %l1, 3, %l1
   401c0: c4 58 80 11   ldx  [ %g2 + %l1 ], %g2
   401c4: 82 10 20 80   mov  0x80, %g1
   401c8: c4 f0 4b 00   stxa  %g2, [ %g1 ] (88)
   401cc: 2f 00 02 00   sethi  %hi(0x80000), %l7
   401d0: 8b 9d c0 00   wrhpr  %l7, %htba
   401d4: 21 00 00 00   sethi  %hi(0), %l0
   401d8: 03 00 01 30   sethi  %hi(0x4c000), %g1
   401dc: a0 14 20 00   mov  %l0, %l0
   401e0: 82 10 61 40   or  %g1, 0x140, %g1
   401e4: a1 2c 30 20   sllx  %l0, 0x20, %l0
   401e8: 82 10 40 10   or  %g1, %l0, %g1
   401ec: 85 28 b0 07   sllx  %g2, 7, %g2
   401f0: 82 00 40 02   add  %g1, %g2, %g1
   401f4: e2 58 40 00   ldx  [ %g1 ], %l1
   401f8: e2 f0 06 e0   stxa  %l1, [ %g0 ] (55)
   401fc: e2 58 60 08   ldx  [ %g1 + 8 ], %l1
   40200: e2 f0 07 e0   stxa  %l1, [ %g0 ] (63)
   40204: e2 58 60 10   ldx  [ %g1 + 0x10 ], %l1
   40208: e2 f0 06 a0   stxa  %l1, [ %g0 ] (53)
   4020c: e2 58 60 20   ldx  [ %g1 + 0x20 ], %l1
   40210: e2 f0 06 c0   stxa  %l1, [ %g0 ] (54)
   40214: e2 58 60 18   ldx  [ %g1 + 0x18 ], %l1
   40218: e2 f0 07 a0   stxa  %l1, [ %g0 ] (61)
   4021c: e2 58 60 28   ldx  [ %g1 + 0x28 ], %l1
   40220: e2 f0 07 c0   stxa  %l1, [ %g0 ] (62)
   40224: e2 58 60 40   ldx  [ %g1 + 0x40 ], %l1
   40228: e2 f0 06 60   stxa  %l1, [ %g0 ] (51)
   4022c: e2 58 60 48   ldx  [ %g1 + 0x48 ], %l1
   40230: e2 f0 07 60   stxa  %l1, [ %g0 ] (59)
   40234: e2 58 60 50   ldx  [ %g1 + 0x50 ], %l1
   40238: e2 f0 06 20   stxa  %l1, [ %g0 ] (49)
   4023c: e2 58 60 60   ldx  [ %g1 + 0x60 ], %l1
   40240: e2 f0 06 40   stxa  %l1, [ %g0 ] (50)
   40244: e2 58 60 58   ldx  [ %g1 + 0x58 ], %l1
   40248: e2 f0 07 20   stxa  %l1, [ %g0 ] (57)
   4024c: e2 58 60 68   ldx  [ %g1 + 0x68 ], %l1
   40250: e2 f0 07 40   stxa  %l1, [ %g0 ] (58)
   40254: 94 10 20 80   mov  0x80, %o2
   40258: c0 f2 8a e0   stxa  %g0, [ %o2 ] (87)
   4025c: c0 f2 8b e0   stxa  %g0, [ %o2 ] (95)
   40260: a2 10 20 08   mov  8, %l1
   40264: c0 f4 44 20   stxa  %g0, [ %l1 ] (33)
   40268: a2 10 20 10   mov  0x10, %l1
   4026c: c0 f4 44 20   stxa  %g0, [ %l1 ] (33)
   40270: a2 10 20 0f   mov  0xf, %l1
   40274: e2 f0 08 a0   stxa  %l1, [ %g0 ] (69)
   40278: 03 00 00 00   sethi  %hi(0), %g1
   4027c: 05 00 05 10   sethi  %hi(0x144000), %g2
   40280: 82 10 60 00   mov  %g1, %g1
   40284: 84 10 a0 00   mov  %g2, %g2
   40288: 83 28 70 20   sllx  %g1, 0x20, %g1
   4028c: 84 10 80 01   or  %g2, %g1, %g2
   40290: 87 48 00 00   rdhpr  %hpstate, %g3
   40294: 8f 90 20 01   wrpr  1, %tl
   40298: 88 10 20 00   clr  %g4
   4029c: 83 99 00 00   wrhpr  %g4, %htstate
   402a0: 8f 90 20 00   wrpr  0, %tl
   402a4: 90 10 20 00   clr  %o0
   402a8: 81 c0 80 00   jmp  %g2
   402ac: 81 98 28 00   wrhpr  0x800, %hpstate
   402b0: 01 00 00 00   nop 
   402b4: 01 00 00 00   nop 
'''
instructions = ParseObjCode(t)
# print instructions
WriteICacheStream(0x400c0, instructions)


t = '''
00000000000841a0 <immu_trap_done>:
   841a0: 84 10 00 05   mov  %g5, %g2
   841a4: 85 28 b0 18   sllx  %g2, 0x18, %g2
   841a8: 85 30 b0 3f   srlx  %g2, 0x3f, %g2
   841ac: 0a c8 80 0c   brnz  %g2, 841dc <immu_skip_part_base>
   841b0: 01 00 00 00   nop 
   841b4: 07 00 00 00   sethi  %hi(0), %g3
   841b8: 05 00 01 30   sethi  %hi(0x4c000), %g2
   841bc: 86 10 e0 00   mov  %g3, %g3
   841c0: 84 10 a1 00   or  %g2, 0x100, %g2
   841c4: 87 28 f0 20   sllx  %g3, 0x20, %g3
   841c8: 84 10 80 03   or  %g2, %g3, %g2
   841cc: c6 d8 4b 00   ldxa  [ %g1 ] (88), %g3
   841d0: 87 28 f0 03   sllx  %g3, 3, %g3
   841d4: c2 58 80 03   ldx  [ %g2 + %g3 ], %g1
   841d8: 8a 01 40 01   add  %g5, %g1, %g5
   841dc: 8c 10 24 00   mov  0x400, %g6
   841e0: ca f1 8a 80   stxa  %g5, [ %g6 ] (84)
   841e4: 83 f0 00 00   retry 
   841e8: 88 10 00 02   mov  %g2, %g4
   841ec: 85 28 b0 18   sllx  %g2, 0x18, %g2
   841f0: 85 30 b0 3f   srlx  %g2, 0x3f, %g2
   841f4: 0a c8 80 10   brnz  %g2, 84234 <immu_real_skip_part_base>
   841f8: 82 10 00 00   mov  %g0, %g1
   841fc: 84 10 00 04   mov  %g4, %g2
'''
instructions = ParseObjCode(t)
# print instructions
WriteICacheStream(0x841a0, instructions)

t = '''
0000000000144000 <HPriv_Reset_Handler>:
  144000: 8f 90 20 01   wrpr  1, %tl
  144004: 05 00 60 d0   sethi  %hi(0x1834000), %g2
  144008: 81 90 80 00   wrpr  %g2, %tpc
  14400c: 83 90 80 00   wrpr  %g2, %tnpc
  144010: 05 00 00 05   sethi  %hi(0x1400), %g2
  144014: 84 10 a2 00   or  %g2, 0x200, %g2 ! 1600 <*ABS*+0x1600>
  144018: 85 90 80 00   wrpr  %g2, %tstate
  14401c: 81 f0 00 00   done 
  144020: 01 00 00 00   nop  # trin: prevent fetching the next instruction from dram
'''
# WriteICacheStream(0x144000, ParseObjCode(t))
WriteICacheStream(0x1000144000, ParseObjCode(t))

# t = '''
# '''
# WriteICacheStream(, ParseObjCode(t))

t = '''
0000000001834000 <kernel>:
 1834000: 2f 00 04 80   sethi  %hi(0x120000), %l7
 1834004: 8b 95 c0 00   wrpr  %l7, %tba
 1834008: 92 10 20 44   mov  0x44, %o1
 183400c: 94 10 20 55   mov  0x55, %o2
 1834010: 96 10 20 00   clr  %o3
 1834014: 98 10 20 00   clr  %o4
 1834018: 03 00 00 00   sethi  %hi(0), %g1
 183401c: 05 00 70 d0   sethi  %hi(0x1c34000), %g2
 1834020: 82 10 60 00   mov  %g1, %g1
 1834024: 84 10 a0 28   or  %g2, 0x28, %g2
 1834028: 83 28 70 20   sllx  %g1, 0x20, %g1
 183402c: 84 10 80 01   or  %g2, %g1, %g2
 1834030: 9b 2b 70 03   sllx  %o5, 3, %o5
 1834034: da 58 80 0d   ldx  [ %g2 + %o5 ], %o5
 1834038: 91 d0 20 2a   ta  0x2a
 183403c: 01 00 00 00   nop 
'''
# WriteICacheStream(0x1834000, ParseObjCode(t))
WriteICacheStream(0x1101834000, ParseObjCode(t))

t = '''
0000000000080c80 <HT0_Fast_Instr_Access_MMU_Miss_0x64>:
   80c80: 8e 10 20 30   mov  0x30, %g7  ! 30 <*ABS*+0x30>
   80c84: c4 d9 ca 00   ldxa  [ %g7 ] (80), %g2 #144000, 1834000, 0000000000122000, 0000000020000044
   80c88: c2 d8 0a 20   ldxa  [ %g0 ] (81), %g1 #1000a20, 10001a0, 0000000001000910, 0000000002000000
   # 80c8c: c8 98 44 80   ldda  [ %g1 ] (36), %g4 #144540, 8000000101834540, 8000000000122540, 8000000130000440
   80c8c: c8 58 40 00   ldx  [ %g1 ], %g4
   80c90: ca 58 60 08   ldx  [ %g1 + 8 ], %g5
   80c90: 80 a0 80 04   cmp  %g2, %g4
   80c94: 12 68 0d 03   bne  %xcc, 840a0 <immu_miss_handler_ext>
   80c98: 01 00 00 00   nop 
   80c9c: 10 80 0d 41   b  841a0 <immu_trap_done>
   80ca0: 82 10 20 80   mov  0x80, %g1  ! 80 <*ABS*+0x80>
   80ca4: 30 68 00 17   b,a   %xcc, 80d00 <HT0_Fast_Data_Access_MMU_Miss_0x68>
   80c98: 01 00 00 00   nop 
'''
instructions = ParseObjCode(t)
# print instructions
WriteICacheStream(0x80c80, instructions)

t = '''
0000000000080d00 <HT0_Fast_Data_Access_MMU_Miss_0x68>:
   80d00: 8e 10 20 30   mov  0x30, %g7  ! 30 <*ABS*+0x30>
   80d04: c4 d9 cb 00   ldxa  [ %g7 ] (88), %g2 #0000000001c34000
   80d08: c2 d8 0b 20   ldxa  [ %g0 ] (89), %g1 #00000000050021a0
   80d0c: c8 58 40 00   ldx  [ %g1 ], %g4
   80d10: ca 58 60 08   ldx  [ %g1 + 8 ], %g5
   80d10: 80 a0 80 04   cmp  %g2, %g4
   80d14: 12 68 0d 55   bne  %xcc, 84268 <dmmu_miss_handler_ext>
   80d18: 01 00 00 00   nop 
   80d1c: 10 80 0d 93   b  84368 <dmmu_trap_done>
   80d20: 82 10 20 80   mov  0x80, %g1  ! 80 <*ABS*+0x80>
   80d24: 30 68 00 17   b,a   %xcc, 80d80 <HT0_Fast_Data_Access_Protection_0x6c>
   80d28: 01 00 00 00   nop 
'''
WriteICacheStream(0x0000080d00, ParseObjCode(t))

t = '''
   84300: 82 10 20 80   mov  0x80, %g1
   84304: 91 d0 20 01   ta  1
   84308: 01 00 00 00   nop 

000000000008430c <dmmu_ptr_chase>:
   8430c: 8c 11 40 00   mov  %g5, %g6

0000000000084310 <dmmu_ptr_chase_loop>:
   84310: c8 99 84 80   ldda  [ %g6 ] (36), %g4
   84314: 83 29 70 3d   sllx  %g5, 0x3d, %g1
   84318: 83 30 70 3d   srlx  %g1, 0x3d, %g1
   8431c: 82 48 60 03   mulx  %g1, 3, %g1
   84320: 86 20 20 01   sub  %g0, 1, %g3
   84324: 87 28 f0 0d   sllx  %g3, 0xd, %g3
   84328: 87 28 d0 01   sllx  %g3, %g1, %g3
   8432c: 03 00 00 07   sethi  %hi(0x1c00), %g1
   84330: 82 10 6f ff   or  %g1, 0xfff, %g1 ! 1fff <*ABS*+0x1fff>
   84334: 86 10 c0 01   or  %g3, %g1, %g3
   84338: 86 08 80 03   and  %g2, %g3, %g3
   8433c: 80 a0 c0 04   cmp  %g3, %g4
   84340: 22 68 00 0a   be,a   %xcc, 84368 <dmmu_trap_done>
   84344: 82 10 20 80   mov  0x80, %g1
   84348: cc 59 a0 10   ldx  [ %g6 + 0x10 ], %g6
   8434c: 80 a1 bf ff   cmp  %g6, -1
   84350: 12 6f ff f0   bne  %xcc, 84310 <dmmu_ptr_chase_loop>
   84354: 01 00 00 00   nop 
   84358: 02 f9 ff d6   brz  %g7, 842b0 <dmmu_ps1>
   8435c: 01 00 00 00   nop 
   84360: 91 d0 20 01   ta  1
   84364: 01 00 00 00   nop 

0000000000084368 <dmmu_trap_done>:
   84368: 86 10 00 05   mov  %g5, %g3
   8436c: 87 28 f0 18   sllx  %g3, 0x18, %g3
   84370: 87 30 f0 3f   srlx  %g3, 0x3f, %g3
   84374: 0a c8 c0 0b   brnz  %g3, 843a0 <dmmu_skip_part_base>
   84378: 07 00 00 00   sethi  %hi(0), %g3
   8437c: 05 00 01 30   sethi  %hi(0x4c000), %g2
   84380: 86 10 e0 00   mov  %g3, %g3
   84384: 84 10 a1 00   or  %g2, 0x100, %g2
   84388: 87 28 f0 20   sllx  %g3, 0x20, %g3
   8438c: 84 10 80 03   or  %g2, %g3, %g2
   84390: c6 d8 4b 00   ldxa  [ %g1 ] (88), %g3
   84394: 87 28 f0 03   sllx  %g3, 3, %g3
   84398: c2 58 80 03   ldx  [ %g2 + %g3 ], %g1
   8439c: 8a 01 40 01   add  %g5, %g1, %g5

00000000000843a0 <dmmu_skip_part_base>:
   843a0: 8c 10 24 00   mov  0x400, %g6
   843a4: ca f1 8b 80   stxa  %g5, [ %g6 ] (92)
   843a8: 83 f0 00 00   retry 

00000000000843ac <dmmu_real_miss_handler_ext>:
   843ac: 88 10 00 02   mov  %g2, %g4
   843b0: 85 28 b0 18   sllx  %g2, 0x18, %g2
   843b4: 85 30 b0 3f   srlx  %g2, 0x3f, %g2
   843b8: 0a c8 80 10   brnz  %g2, 843f8 <dmmu_real_skip_part_base>
   843bc: 82 10 00 00   mov  %g0, %g1
   843c0: 84 10 00 04   mov  %g4, %g2
   843c4: 85 30 b0 21   srlx  %g2, 0x21, %g2
   843c8: 80 a0 80 00   cmp  %g2, %g0
   843cc: 93 d0 30 01   tne  %xcc, -4095
   843d0: 03 00 00 00   sethi  %hi(0), %g1
   843d4: 05 00 01 30   sethi  %hi(0x4c000), %g2
   843d8: 82 10 60 00   mov  %g1, %g1
   843dc: 84 10 a1 00   or  %g2, 0x100, %g2
   843e0: 83 28 70 20   sllx  %g1, 0x20, %g1
   843e4: 84 10 80 01   or  %g2, %g1, %g2
   843e8: 82 10 20 80   mov  0x80, %g1
   843ec: c6 d8 4b 00   ldxa  [ %g1 ] (88), %g3
   843f0: 87 28 f0 03   sllx  %g3, 3, %g3
   843f4: c2 58 80 03   ldx  [ %g2 + %g3 ], %g1

00000000000843f8 <dmmu_real_skip_part_base>:
   843f8: 05 20 00 00   sethi  %hi(0x80000000), %g2
   843fc: 8a 10 24 40   mov  0x440, %g5
'''
WriteICacheStream(0x84300, ParseObjCode(t))

t = '''
0000000000122540 <T0_ChangeCtx_0x12a>:
  122540: 91 d0 20 8a   ta  0x8a
  122544: 81 f0 00 00   done 
  122548: 01 00 00 00   nop 
  12254c: 01 00 00 00   nop 
  122550: 01 00 00 00   nop 
  122554: 01 00 00 00   nop 
  122558: 01 00 00 00   nop 
  12255c: 01 00 00 00   nop 
'''
WriteICacheStream(0x1000122540, ParseObjCode(t))

t = '''
0000000000083140 <HT0_ChangeCtx_0x18a>:
   83140: 83 51 c0 00   rdpr  %tl, %g1
   83144: 82 20 60 01   dec  %g1
   83148: 8f 90 40 00   wrpr  %g1, %tl
   8314c: 82 10 20 08   mov  8, %g1
   83150: d2 f0 44 20   stxa  %o1, [ %g1 ] (33)
   83154: 82 10 20 10   mov  0x10, %g1
   83158: d4 f0 44 20   stxa  %o2, [ %g1 ] (33)
   8315c: 96 1a e0 01   xor  %o3, 1, %o3
   83160: 98 1b 20 01   xor  %o4, 1, %o4
   83164: 97 2a f0 0a   sllx  %o3, 0xa, %o3
   83168: 99 2b 30 02   sllx  %o4, 2, %o4
   8316c: 83 50 80 00   rdpr  %tstate, %g1
   83170: 82 10 64 00   or  %g1, 0x400, %g1
   83174: 85 90 40 0b   wrpr  %g1, %o3, %tstate
   83178: 83 48 40 00   rdhpr  %htstate, %g1
   8317c: 82 10 60 04   or  %g1, 4, %g1
   83180: 83 98 40 0c   wrhpr  %g1, %o4, %htstate
   83184: 83 93 40 00   wrpr  %o5, %tnpc
   83188: 81 f0 00 00   done 
   8318c: 01 00 00 00   nop 
   83190: 01 00 00 00   nop 
   83194: 01 00 00 00   nop 
   83198: 30 68 00 0a   b,a   %xcc, 831c0 <HT0_RdThId_0x18e>
   8319c: 01 00 00 00   nop 
'''
WriteICacheStream(0x0000083140, ParseObjCode(t))

t = '''
0000000020000000 <main>:
    20000018: 91 d0 20 00   ta  0
    20000018: 91 d0 20 00   ta  0
    20000018: 91 d0 20 00   ta  0
    20000018: 91 d0 20 00   ta  0
'''
WriteICacheStream(0x1130000000, ParseObjCode(t))

t = '''
0000000000122000 <good_trap>:
  122000: 83 46 80 00   rd  %thread_stat, %g1
  122004: b5 80 60 01   wr  %g1, 1, %thread_stat
  122008: 01 00 00 00   nop 
  12200c: 10 bf ff fd   b  122000 <good_trap>
  122010: 01 00 00 00   nop 
  122014: 01 00 00 00   nop 
  122018: 01 00 00 00   nop 
  12201c: 01 00 00 00   nop 
'''
WriteICacheStream(0x1000122000, ParseObjCode(t))


# write to Addr 0x000004c000, all 0s
t = '''
0x000004c000
0x000004c100
   Data0: 0x0000001000000000
   Data1: 0x0000001200000000
0x000004c140
0x000004c150 
   Data0: 0x0000000001000001
   Data1: 0x0000000002000001
0x000004c160
   Data0: 0x0000000003000001
   Data1: 0x0000000004000001
0x000004c180
0x000004c190
   Data0: 0x0000000005000001
   Data1: 0x0000000006000001
0x000004c1a0
   Data0: 0x0000000007000001
   Data1: 0x0000000008000001
0x1101c34028
   Data0: 0x0000000000000000
   Data1: 0x0000000020000000
0xdeadbeef00
'''
WriteDCacheStream(t);

#TSB
t = '''
0x0001000a20
   Data0: 0x0000000000144000
   Data1: 0x8000000000144540
0x00010001a0
   Data0: 0x0000000001834000
   Data1: 0x8000000101834540
0x00050021a0
   Data0: 0x0000000001c34000
   Data1: 0x8000000101c34540
0x0001000910
   Data0: 0x0000000000122000
   Data1: 0x8000000000122540
0x0002000000
   Data0: 0x0000000020000044
   Data1: 0x8000000130000440
0x0002000000
'''
t = '''
0x0001000a20
   Data0: 0x0000000000144000
   Data1: 0x8000000000144540
0x00010001a0
   Data0: 0x0000000001834000
   Data1: 0x8000000101834540
0x00050021a0
   Data0: 0x0000000001c34000
   Data1: 0x8000000101c34540
0x0002000000
'''
WriteDCacheStream(t);

FinalizeWriting();

# set PC to cacheable start address
pc = '0x0_0000_0010'
pc = jtag.HexToBin(pc)
# jtag.CommandWritePC(coreid=0, threadid=0, wrdata=pc, hex=True, reset_vector=True)
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_RESETVECTOR_REG'],
                        data=pc)
# send interrupt to the core to run!
interrupt = '0000000000000000000000000000000000000000000000010000000000000001'
jtag.CommandWriteRtap(coreid=0, threadid=0, rtapid=jtag.defines['JTAG_RTAP_ID_CPX_INTERRUPT'],
                        data=interrupt)
# jtag.Fail(100)

jtag.WriteToFile('jtag_manual_program_in.vmh', 'jtag_manual_program_out.vmh')