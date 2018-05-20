#!/usr/bin/python
! Copyright (c) 2017 Princeton University
! All rights reserved.
! 
! Redistribution and use in source and binary forms, with or without
! modification, are permitted provided that the following conditions are met:
!     * Redistributions of source code must retain the above copyright
!       notice, this list of conditions and the following disclaimer.
!     * Redistributions in binary form must reproduce the above copyright
!       notice, this list of conditions and the following disclaimer in the
!       documentation and/or other materials provided with the distribution.
!     * Neither the name of Princeton University nor the
!       names of its contributors may be used to endorse or promote products
!       derived from this software without specific prior written permission.
! 
! THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
! DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import random

DATA_SIZE = 7200
BIN_NUMBER = 5

data_array = []
f = open("../../../include/parallel-hist-data.s", 'w')



bin0 = 0
bin1 = 0
bin2 = 0
bin3 = 0
bin4 = 0
for i in range(DATA_SIZE):
    word = random.randint(0,0xffffffff)
    data_array.append(word)
    if 0x80000000 <= word and word < 0xc0000000:
        bin0 = bin0 + 1
    elif 0xc0000000 <= word:
        bin1 = bin1 + 1
    elif word < 0x20000000:
        bin2 = bin2 + 1
    elif word < 0x40000000:
        bin3 = bin3 + 1
    else:
        bin4 = bin4 + 1

print >> f, "#define    DATA_SIZE       %d" % DATA_SIZE
print >> f, "#define    BIN_NUMBER      %d" % BIN_NUMBER
print >> f, "#define    BIN0_EXPECTED   %d" % bin0
print >> f, "#define    BIN1_EXPECTED   %d" % bin1
print >> f, "#define    BIN2_EXPECTED   %d" % bin2
print >> f, "#define    BIN3_EXPECTED   %d" % bin3
print >> f, "#define    BIN4_EXPECTED   %d" % bin4
print >> f
print >> f, "SECTION .HIST_DATA DATA_VA=0x10a8200000"
print >> f, "attr_data {"
print >> f, "    Name = .HIST_DATA,"
print >> f, "    hypervisor"
print >> f, "}"
print >> f
print >> f, ".data"
print >> f
print >> f, ".global data_array"
print >> f, "data_array:"
    
for d in data_array:
    print >> f, '    .word 0x00000000, %s' % hex(d)

print >> f
print >> f, "    .align 64"

f.close()
