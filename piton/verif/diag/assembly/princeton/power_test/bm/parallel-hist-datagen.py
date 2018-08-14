#!/usr/bin/env python
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

# 2**18 + 2**17
# number of double words
DATA_SIZE = 2**18 + 2**17
BIN_NUMBER = 5

data_array = []
fdef = open("../../../include/parallel-hist-def.h", 'w')
fdat = open("../../../include/parallel-hist-data.s", 'w')



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

# Put defines to a separate files
print >> fdef, "#define    DATA_SIZE       %d" % DATA_SIZE
print >> fdef, "#define    BIN_NUMBER      %d" % BIN_NUMBER
print >> fdef, "#define    BIN0_EXPECTED   %d" % bin0
print >> fdef, "#define    BIN1_EXPECTED   %d" % bin1
print >> fdef, "#define    BIN2_EXPECTED   %d" % bin2
print >> fdef, "#define    BIN3_EXPECTED   %d" % bin3
print >> fdef, "#define    BIN4_EXPECTED   %d" % bin4

# Put data to another file
addr_start = "0xa8100000"
print >> fdat, "SECTION .HIST_DATA DATA_VA=%s" % addr_start
print >> fdat, "attr_data {"
print >> fdat, "    Name = .HIST_DATA,"
print >> fdat, "    VA = %s," % addr_start
print >> fdat, "    PA = ra2pa(%s,0)," % addr_start
print >> fdat, "    RA = %s," % addr_start
print >> fdat, "    part_0_d_ctx_nonzero_ps0_tsb,"
print >> fdat, "    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,"
print >> fdat, "    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,"
print >> fdat, "    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1"
print >> fdat, "}"
print >> fdat
print >> fdat, ".data"
print >> fdat
print >> fdat, ".global data_array"
print >> fdat, "data_array:"
    
for d in data_array:
    print >> fdat, "    .word 0x00000000, %s" % hex(d)

print >> fdat
print >> fdat, "    .align 64"

fdef.close()
fdat.close()
