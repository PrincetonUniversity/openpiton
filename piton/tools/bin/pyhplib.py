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

import os
import math

#MAX_THREAD = 128;
MAX_TILE = 64;
MAX_X = 8;
MAX_Y = 8;

X_TILES = int(os.environ.get('PTON_X_TILES', '-1'))
#print "//x_tiles:", num_tiles

Y_TILES = int(os.environ.get('PTON_Y_TILES', '-1'))
#print "//y_tiles:", num_tiles

NUM_TILES = int(os.environ.get('PTON_NUM_TILES', '-1'))
#print "//num_tiles:", num_tiles

NETWORK_CONFIG = (os.environ.get("PTON_NETWORK_CONFIG", "2dmesh_config"))

if X_TILES == -1:
    print "//x_tiles not defined!"
    X_TILES = MAX_X

if Y_TILES == -1:
    print "//y_tiles not defined!"
    Y_TILES = MAX_Y

if NUM_TILES == -1:
    print "//num_tile not defined!"
    if X_TILES != -1 and Y_TILES != -1:
        NUM_TILES = X_TILES*Y_TILES
    else:
        NUM_TILES = MAX_TILE

NUM_THREADS = 2 * NUM_TILES

# cache configurations
CONFIG_L15_SIZE = int(os.environ.get('CONFIG_L15_SIZE', '8192'))
CONFIG_L15_ASSOCIATIVITY = int(os.environ.get('CONFIG_L15_ASSOCIATIVITY', '4'))
CONFIG_L1D_SIZE = int(os.environ.get('CONFIG_L1D_SIZE', '8192'))
CONFIG_L1D_ASSOCIATIVITY = int(os.environ.get('CONFIG_L1D_ASSOCIATIVITY', '4'))
CONFIG_L1I_SIZE = int(os.environ.get('CONFIG_L1I_SIZE', '16384'))
CONFIG_L1I_ASSOCIATIVITY = int(os.environ.get('CONFIG_L1I_ASSOCIATIVITY', '4'))
CONFIG_L2_SIZE = int(os.environ.get('CONFIG_L2_SIZE', '65536'))
CONFIG_L2_ASSOCIATIVITY = int(os.environ.get('CONFIG_L2_ASSOCIATIVITY', '4'))


# CONFIG_SRAM_L2_TAG_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_TAG_HEIGHT', '256'))
# CONFIG_SRAM_L2_TAG_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_TAG_WIDTH', '104'))
# CONFIG_SRAM_L2_DATA_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_DATA_HEIGHT', '4096'))
# CONFIG_SRAM_L2_DATA_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_DATA_WIDTH', '144'))
# CONFIG_SRAM_L2_STATE_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_STATE_HEIGHT', '256'))
# CONFIG_SRAM_L2_STATE_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_STATE_WIDTH', '66'))
# CONFIG_SRAM_L2_DIR_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_DIR_HEIGHT', '1024'))
# CONFIG_SRAM_L2_DIR_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_DIR_WIDTH', '64'))

def Replicate(text):
    newtext = ''
    for i in range(NUM_TILES):
        t = text.replace("0", `i`);
        newtext += t + '\n';
    return newtext;

#import re
#def ReplicateRE(text):
#    regex = " ([^\.:]+)0"
#    newtext = ''
#    for i in range(NUM_TILES):
#        t = re.sub(regex, " \1" + `i`, text)
#        newtext += t + '\n';
#    return newtext;

def ReplicatePattern(text, patterns):
	regex = " ([^\.:]+)0"
	newtext = ''
	for i in range(NUM_TILES):
		t = text
		for p in patterns:
			replacement = p[:-1] + `i`;
			t = t.replace(p, replacement);
		newtext += t + '\n';
	return newtext;

# only difference is that this looks for patterns start with 1 not 0
def ReplicatePattern1(text, patterns):
	regex = " ([^\.:]+)1"
	newtext = ''
	for i in range(NUM_TILES):
		t = text
		for p in patterns:
			replacement = p[:-1] + `i`;
			t = t.replace(p, replacement);
		newtext += t + '\n';
	return newtext;

def MakeGenericCache(modulename, type, height, width):
   if type == "1rw":
      t = Get1RWTemplate()
   elif type == "1r1w":
      # t = Get1R1WTemplate()
      assert(0)
   elif type == "2rw":
      t = Get2RWTemplate()
   else:
      assert(0)

   height_log = int(math.log(height) / math.log(2))
   t = t.replace("_PARAMS_HEIGHT_LOG", str(height_log))
   t = t.replace("_PARAMS_HEIGHT", str(height))
   t = t.replace("_PARAMS_WIDTH", str(width))
   t = t.replace("_PARAMS_NAME", str(modulename))
   print(t)

def MakeGenericCacheDefine(modulename, type, height_define, heightlog2_define, width_define):
   if type == "1rw":
      t = Get1RWTemplate()
   elif type == "1r1w":
      # t = Get1R1WTemplate()
      assert(0)
   elif type == "2rw":
      t = Get2RWTemplate()
   else:
      assert(0)

   t = t.replace("_PARAMS_HEIGHT_LOG", heightlog2_define)
   t = t.replace("_PARAMS_HEIGHT", height_define)
   t = t.replace("_PARAMS_WIDTH", width_define)
   t = t.replace("_PARAMS_NAME", str(modulename))
   print(t)

def Get1RWTemplate():
  return '''
`include "define.vh"
`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none
`endif
module _PARAMS_NAME
(
input wire MEMCLK,
input wire RESET_N,
input wire CE,
input wire [_PARAMS_HEIGHT_LOG-1:0] A,
input wire RDWEN,
input wire [_PARAMS_WIDTH-1:0] BW,
input wire [_PARAMS_WIDTH-1:0] DIN,
output wire [_PARAMS_WIDTH-1:0] DOUT,
input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
input wire [`BIST_ID_WIDTH-1:0] SRAMID
);
reg [_PARAMS_WIDTH-1:0] cache [_PARAMS_HEIGHT-1:0];

integer i;
initial
begin
   for (i = 0; i < _PARAMS_HEIGHT; i = i + 1)
   begin
      cache[i] = 0;
   end
end



   reg [_PARAMS_WIDTH-1:0] dout_f;

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
   
endmodule
'''



def Get2RWTemplate():
  return '''
`include "define.vh"
`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none
`endif
module _PARAMS_NAME
(
input wire MEMCLK,
input wire RESET_N,
input wire CEA,
input wire [_PARAMS_HEIGHT_LOG-1:0] AA,
input wire RDWENA,
input wire CEB,
input wire [_PARAMS_HEIGHT_LOG-1:0] AB,
input wire RDWENB,
input wire [_PARAMS_WIDTH-1:0] BWA,
input wire [_PARAMS_WIDTH-1:0] DINA,
output wire [_PARAMS_WIDTH-1:0] DOUTA,
input wire [_PARAMS_WIDTH-1:0] BWB,
input wire [_PARAMS_WIDTH-1:0] DINB,
output wire [_PARAMS_WIDTH-1:0] DOUTB,
input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
input wire [`BIST_ID_WIDTH-1:0] SRAMID
);
reg [_PARAMS_WIDTH-1:0] cache [_PARAMS_HEIGHT-1:0];

integer i;
initial
begin
   for (i = 0; i < _PARAMS_HEIGHT; i = i + 1)
   begin
      cache[i] = 0;
   end
end



   reg [_PARAMS_WIDTH-1:0] dout_f0;

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

   

   reg [_PARAMS_WIDTH-1:0] dout_f1;

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

   
endmodule
  '''
