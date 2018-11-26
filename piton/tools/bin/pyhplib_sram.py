# Copyright (c) 2018 Princeton University
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

# def MakeGenericCacheDefine(modulename, type, height_define, heightlog2_define, width_define):
#    if type == "1rw":
#       t = Get1RWTemplate()
#    elif type == "1r1w":
#       # t = Get1R1WTemplate()
#       assert(0)
#    elif type == "2rw":
#       t = Get2RWTemplate()
#    else:
#       assert(0)

#    t = t.replace("_PARAMS_HEIGHT_LOG", heightlog2_define)
#    t = t.replace("_PARAMS_HEIGHT", height_define)
#    t = t.replace("_PARAMS_WIDTH", width_define)
#    t = t.replace("_PARAMS_NAME", str(modulename))
#    print(t)

def MakeGenericCacheHeader(modulename, type, height_define, heightlog2_define, width_define):
   if type == "1rw":
      t = Get1RWHeader()
   elif type == "1r1w":
      t = Get1R1WHeader()
   elif type == "2rw":
      t = Get2RWHeader()
   else:
      assert(0)

   t = t.replace("_PARAMS_HEIGHT_LOG", heightlog2_define)
   t = t.replace("_PARAMS_HEIGHT", height_define)
   t = t.replace("_PARAMS_WIDTH", width_define)
   t = t.replace("_PARAMS_NAME", str(modulename))
   print(t)

   # if type == "1rw":
   #    t = Get1RWCache()
   # elif type == "1r1w":
   #    t = Get1R1WCache()
   # elif type == "2rw":
   #    t = Get2RWCache()
   # else:
   #    assert(0)

   # t = t.replace("_PARAMS_HEIGHT_LOG", heightlog2_define)
   # t = t.replace("_PARAMS_HEIGHT", height_define)
   # t = t.replace("_PARAMS_WIDTH", width_define)
   # t = t.replace("_PARAMS_NAME", str(modulename))
   # print(t)


def MakeGenericCache(modulename, type, height_define, heightlog2_define, width_define):
   if type == "1rw":
      t = Get1RWCache()
   elif type == "1r1w":
      t = Get2RWCache()
   elif type == "2rw":
      t = Get2RWCache()
   else:
      assert(0)

   t = t.replace("_PARAMS_HEIGHT_LOG", heightlog2_define)
   t = t.replace("_PARAMS_HEIGHT", height_define)
   t = t.replace("_PARAMS_WIDTH", width_define)
   t = t.replace("_PARAMS_NAME", str(modulename))
   print(t)


def MakeSynthesizableBram(modulename, type, height_define, heightlog2_define, width_define):
   if type == "1rw":
      t = '''
bram_1rw_wrapper #(
   .NAME          (""             ),
   .DEPTH         (%s),
   .ADDR_WIDTH    (%s),
   .BITMASK_WIDTH (%s),
   .DATA_WIDTH    (%s)
)   %s (
   .MEMCLK        (MEMCLK     ),
   .RESET_N        (RESET_N     ),
   .CE            (CE         ),
   .A             (A          ),
   .RDWEN         (RDWEN      ),
   .BW            (BW         ),
   .DIN           (DIN        ),
   .DOUT          (DOUT_bram       )
);
      ''' % (height_define, heightlog2_define, width_define, width_define, modulename)

   elif type == "1r1w":
      t = '''
bram_1r1w_wrapper #(
   .NAME          (""             ),
   .DEPTH         (%s),
   .ADDR_WIDTH    (%s),
   .BITMASK_WIDTH (%s),
   .DATA_WIDTH    (%s)
)   %s (
   .MEMCLK        (MEMCLK     ),
   .RESET_N        (RESET_N     ),
   .CEA        (CEA     ),
   .AA        (AA     ),
   .AB        (AB     ),
   .RDWENA        (RDWENA     ),
   .CEB        (CEB     ),
   .RDWENB        (RDWENB     ),
   .BWA        (BWA     ),
   .DINA        (DINA     ),
   .DOUTA        (DOUTA_bram     ),
   .BWB        (BWB     ),
   .DINB        (DINB     ),
   .DOUTB        (DOUTB_bram     )
);
      ''' % (height_define, heightlog2_define, width_define, width_define, modulename)

   elif type == "2rw":
      assert(0) # unimplemented

   print(t)

def MakeGenericCacheDefine(modulename, type, height_define, heightlog2_define, width_define):
  MakeGenericCacheHeader(modulename, type, height_define, heightlog2_define, width_define)
  print("`ifdef SYNTHESIZABLE_BRAM")
  if type == "1rw":
     print("wire [%s-1:0] DOUT_bram;" % width_define)
     print("assign DOUT = DOUT_bram;")
  else:
     print("wire [%s-1:0] DOUTA_bram;" % width_define)
     print("wire [%s-1:0] DOUTB_bram;" % width_define)
     print("assign DOUTA = DOUTA_bram;")
     print("assign DOUTB = DOUTB_bram;")
  MakeSynthesizableBram(modulename, type, height_define, heightlog2_define, width_define)
  print("`else")
  MakeGenericCache(modulename, type, height_define, heightlog2_define, width_define)
  print("`endif \n\n endmodule")

# def MakeGenericCacheDefine(modulename, type, height_define, heightlog2_define, width_define):
#   MakeGenericCacheHeader(modulename, type, height_define, heightlog2_define, width_define)

#   if type == "1rw":
#      print("wire [%s-1:0] DOUT_bram;" % width_define)
#   else:
#      print("wire [%s-1:0] DOUTA_bram;" % width_define)
#      print("wire [%s-1:0] DOUTB_bram;" % width_define)
#   MakeSynthesizableBram(modulename, type, height_define, heightlog2_define, width_define)

#   MakeGenericCache(modulename, type, height_define, heightlog2_define, width_define)

#   if type == "1rw":
#      print('''
#          // comparing correctness
#          always @ (negedge MEMCLK) begin
#             if (DOUT_bram != DOUT) begin
#                $display("Mismatch %s");
#                repeat(5)@(posedge MEMCLK);
#                `MONITOR_PATH.fail("Mismatch L2 state");
#             end
#          end
#       ''' % modulename)
#   else:
#      print('''
#          // comparing correctness
#          always @ (negedge MEMCLK) begin
#             if (DOUTA_bram != DOUTA || DOUTB_bram != DOUTB) begin
#                $display("Mismatch %s");
#                repeat(5)@(posedge MEMCLK);
#                `MONITOR_PATH.fail("Mismatch L2 state");
#             end
#          end
#       ''' % modulename)
#   print("endmodule")

def Get1RWTemplate():
  return '''
`include "define.tmp.h"
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

def Get1RWHeader():
  return '''
`include "define.tmp.h"
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
'''


def Get1RWCache():
  return '''
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
'''


def Get2RWTemplate():
  return '''
`include "define.tmp.h"
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

def Get2RWHeader():
  return '''
`include "define.tmp.h"
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
  '''

def Get2RWCache():
  return '''
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
  '''


def Get1R1WHeader():
  return '''
`include "define.tmp.h"
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
  '''

def Get1R1WCache():
  return '''
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
  '''
