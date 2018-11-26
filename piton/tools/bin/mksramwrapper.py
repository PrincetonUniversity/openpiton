#!/usr/bin/python

import sys
import os
import math

try:
   filename = sys.argv[1].split('/')[-1]
except:
   print "Usage: mksramwrapper.py sramfile [sramname] > wrappername"
   exit(1)

sramserialname = filename.split('.')[0];
try:
   sramname = sys.argv[2]
except:
   sramname = sramserialname + '_wrapper'

sramtype = ""
sramtrait = ""
if "RF1D" in sramserialname:
   sramtype = "rf"
   sramtrait = sramserialname[4:]
   sramporttype = "1rw"
   ports = [""]
elif "RF2D" in sramserialname:
   sramtype = "rf"
   sramtrait = sramserialname[4:]
   sramporttype = "1r1w"
   ports = [""]
elif "SRAM1D" in sramserialname:
   sramtype = "sram"
   sramtrait = sramserialname[6:]
   sramporttype = "1rw"
   ports = [""]
elif "SRAM2D" in sramserialname:
   sramtype = "sram"
   sramtrait = sramserialname[6:]
   sramporttype = "1r1w"
   ports = [""]
elif "SRAM2S" in sramserialname:
   sramtype = "sram"
   sramtrait = sramserialname[6:]
   sramporttype = "2rw"
   ports = ["A", "B"]
else:
   print "sram type (%s) not supported" % (sramserialname);
   exit(1)

latency = sramtrait[0];
redundancytype = sramtrait[1]
voltagetype = sramtrait[2]
powergatingtype = sramtrait[3]

numwords = int(sramtrait[4:9])
addresswidth = int(math.ceil(math.log(float(numwords), 2)))

assert sramtrait[9] == "X"
datawidth = int(sramtrait[10:13])
assert sramtrait[13] == "D"
numdecode = int(sramtrait[14:16])
assert numdecode >= 2
assert sramtrait[16] == "C"
cellsperline = int(sramtrait[17:20])


print r'''
/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
'''

# write current date and time
import time
print "// %s %s" % ((time.strftime("%d/%m/%Y")), (time.strftime("%H:%M:%S")))
print "// This file is auto-generated"
print "// Author: Tri Nguyen"

# from reference file
# trin: disable this so timescales are consistent across different modules, especially for IBM clocks
# print "`timescale 1ns/100ps"

print "`include \"define.tmp.h\""

print "`ifdef DEFAULT_NETTYPE_NONE"
print "`default_nettype none"
print "`endif"
print "module %s" % sramname
print "("
print "input wire MEMCLK,"
print "input wire RESET_N,"
if sramporttype == "1r1w":
   print "input wire CER,"
   print "input wire CEW,"
   print "input wire [%d:0] AR," % (addresswidth-1)
   print "input wire [%d:0] AW," % (addresswidth-1)
else:
   for port in ports:
      print "input wire CE%s," % (port)
      print "input wire [%d:0] A%s," % (addresswidth-1, port)
      print "input wire RDWEN%s," % (port)

for port in ports:
   print "input wire [%d:0] BW%s," % (datawidth-1, port)
   print "input wire [%d:0] DIN%s," % (datawidth-1, port)
   print "output wire [%d:0] DOUT%s," % (datawidth-1, port)

# debug ports
print "input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,"
print "input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,"
print "output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,"

print "input wire [`BIST_ID_WIDTH-1:0] SRAMID" 
print ");"

simulation_text = ''
simulation_text += "reg [%d:0] cache [%d:0];" % (datawidth - 1, numwords - 1)

simulation_text += r'''

integer i;
initial
begin
   for (i = 0; i < %d; i = i + 1)
   begin
      cache[i] = 0;
   end
end

''' % numwords

if sramporttype == "1rw":
   simulation_text += r'''

   reg [%d:0] dout_f;

   assign DOUT = dout_f;

   always @ (posedge MEMCLK)
   begin
      if (CE)
      begin
         if (RDWEN == 1'b0)
            cache[A] <= (DIN & BW) | (cache[A] & ~BW);
         else
            dout_f <= cache[A];
      end
   end
   ''' % (datawidth - 1)

   print simulation_text

elif sramporttype == "1r1w":
   simulation_text += r'''

   reg [%d:0] dout_f;
   assign DOUT = dout_f;

   always @ (posedge MEMCLK)
   begin
      if (CEW)
         cache[AW] <= (DIN & BW) | (cache[AW] & ~BW);
      if (CER)
         dout_f <= cache[AR];
   end

   ''' % (datawidth - 1)

   print simulation_text


elif sramporttype == "2rw":

   simulation_text += r'''

   reg [%d:0] dout_f0;

   assign DOUTA = dout_f0;

   always @ (posedge MEMCLK)
   begin
      if (CEA)
      begin
         if (RDWENA == 1'b0)
            cache[AA] <= (DINA & BWA) | (cache[AA] & ~BWA);
         else
            dout_f0 <= cache[AA];
      end
   end

   ''' % (datawidth - 1)

   simulation_text += r'''

   reg [%d:0] dout_f1;

   assign DOUTB = dout_f1;

   always @ (posedge MEMCLK)
   begin
      if (CEB)
      begin
         if (RDWENB == 1'b0)
            cache[AB] <= (DINB & BWB) | (cache[AB] & ~BWB);
         else
            dout_f1 <= cache[AB];
      end
   end

   ''' % (datawidth - 1)
   print simulation_text

else:
   print "there's an error with mkibmwrapper.py;"

print "endmodule"
