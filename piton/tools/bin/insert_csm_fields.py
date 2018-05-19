#!/usr/bin/python

###########################################################################
#Copyright (c) 2015 Princeton University
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#    * Neither the name of Princeton University nor the
#      names of its contributors may be used to endorse or promote products
#      derived from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
#ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
#DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##############################################################################


import sys
import shutil
import re
import string
import os
import random

num_tiles = int(os.environ.get('PTON_NUM_TILES', -1))
x_tiles = int(os.environ.get('PTON_X_TILES', -1))
y_tiles = int(os.environ.get('PTON_Y_TILES', -1))
dynamic_csm = int(os.environ.get('PTON_DYNAMIC_CSM', -1))
if x_tiles == -1 or y_tiles == -1:
    print "ERROR: cannot get x_tiles or y_tiles"
if dynamic_csm == -1:
    print "ERROR: cannot get dynamic_csm"
    

f = open(sys.argv[1])
lines = f.readlines()
skip = False
first_blank = False
sys.stdout = open('temp.s', 'w')
tte_count = 1
main_flag = 0

for i, l in enumerate(lines):
    
    if skip == True:
        skip = False
        continue
   
    if re.match(r'.*Name = .MAIN.*', l):
        main_flag = 1

    if dynamic_csm == 0:
        if re.match(r'.*TTE_W.*', l.strip()):
            print  "        TTE_HDID=" + str(tte_count) + ", TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=" + str(tte_count) +", TTE_LSID=0,"
            print l 
            tte_count += 1


        elif re.match(r'part_[0-7]_[id]_ctx_(non)?zero_ps[01]_tsb', l.strip()):
            print l,
            print string.replace(l, 'tsb', 'tsb_csm'),

        else:
            print l,
    else:
        print l,

print "SECTION .DATA_CSM DATA_VA=0x0000008150040000"
print "   attr_data {"
print "        Name = .DATA_CSM,"
print "        hypervisor"
print "        }"
print ".data"
for k in range(0, tte_count):
    print "clump_" + str(k) + ":" 
    x_order = range(0, x_tiles)
    y_order = range(0, y_tiles)
    if main_flag == 0 and k != 0: 
        random.shuffle(x_order)
        random.shuffle(y_order)
    for y_index in range(0,y_tiles):      
        for x_index in range(0,x_tiles,2):     
            if x_index+1 >= x_tiles: 
                print '    .xword 0x80000'+str(y_order[y_index])+'0'+str(x_order[x_index+1])+'00000000'
            else:
                print '    .xword 0x80000'+str(y_order[y_index])+'0'+str(x_order[x_index+1])+'80000'+str(y_order[y_index])+'0'+str(x_order[x_index])
    print "\n.align 256"
print ".end"



f.close()
shutil.move('temp.s',sys.argv[1])
