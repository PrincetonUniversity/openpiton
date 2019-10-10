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
import xml.etree.ElementTree as ET

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

PITON_ARIANE   = int(os.environ.get('PITON_ARIANE', '0'))
PITON_PICO     = int(os.environ.get('PITON_PICO', '0'))
PITON_PICO_HET = int(os.environ.get('PITON_PICO_HET', '0'))

if PITON_ARIANE or PITON_PICO:
    NUM_THREADS = NUM_TILES
else:
    NUM_THREADS = 2 * NUM_TILES

# cache configurations
CONFIG_L15_SIZE = int(os.environ.get('CONFIG_L15_SIZE', '8192'))
CONFIG_L15_ASSOCIATIVITY = int(os.environ.get('CONFIG_L15_ASSOCIATIVITY', '4'))
CONFIG_L1D_SIZE = int(os.environ.get('CONFIG_L1D_SIZE', '8192'))
CONFIG_L1D_ASSOCIATIVITY = int(os.environ.get('CONFIG_L1D_ASSOCIATIVITY', '4'))
CONFIG_L1I_SIZE = int(os.environ.get('CONFIG_L1I_SIZE', '16384'))
CONFIG_L1I_ASSOCIATIVITY = int(os.environ.get('CONFIG_L1I_ASSOCIATIVITY', '4'))
CONFIG_L2_SIZE = int(os.environ.get('CONFIG_L2_SIZE', '65536'))
# CONFIG_L2_SIZE = 65536*2 # test, make L2 128KB
# CONFIG_L2_SIZE = 65536*4 # test, make L2 512KB
# CONFIG_L2_SIZE = 65536*8 # test, make L2 512KB
# CONFIG_L2_SIZE = 65536*16 # test, make L2 1MB
CONFIG_L2_ASSOCIATIVITY = int(os.environ.get('CONFIG_L2_ASSOCIATIVITY', '4'))
# CONFIG_L2_ASSOCIATIVITY = 8
# constants, not configurable
L15_LINE_SIZE = 16
L2_LINE_SIZE = 64

#########################################################
# BRAM configurations
#########################################################
class BramCfg:
    def __init__(self, d, w):
        self.depth = d
        self.width = w

BRAM_CONFIG = dict()
# linesize = 16   # TODO: magic number from lsu.h.pyv?
# bram_l1d_tag_entries = CONFIG_L1D_SIZE / linesize
# bram_l1d_depth = bram_l1d_tag_entries /  CONFIG_L1D_ASSOCIATIVITY
bram_l15_entries = CONFIG_L15_SIZE / L15_LINE_SIZE
bram_l15_depth = bram_l15_entries / CONFIG_L15_ASSOCIATIVITY
bram_l2_entries = CONFIG_L2_SIZE / L2_LINE_SIZE
bram_l2_depth = bram_l2_entries / CONFIG_L2_ASSOCIATIVITY

# # TODO: change magic numbers to defines/parameters
BRAM_CONFIG["fp_regfile"] = BramCfg(128, 78)
BRAM_CONFIG["l1d_data"]   = BramCfg(128, 576)
BRAM_CONFIG["l1i_data"]   = BramCfg(256, 272)
BRAM_CONFIG["l1d_tag"]    = BramCfg(128, 132)
BRAM_CONFIG["l1i_tag"]    = BramCfg(128, 132)
BRAM_CONFIG["l15_data"]   = BramCfg(bram_l15_entries, 128)
BRAM_CONFIG["l15_tag"]    = BramCfg(bram_l15_depth, 132)
BRAM_CONFIG["l15_hmt"]    = BramCfg(bram_l15_entries, 32)
BRAM_CONFIG["l2_data"]    = BramCfg(bram_l2_entries*4, 144) # *4 because entries are 16B instead of 64B
BRAM_CONFIG["l2_tag"]     = BramCfg(bram_l2_depth, 104)
BRAM_CONFIG["l2_dir"]     = BramCfg(bram_l2_entries, 64)
BRAM_CONFIG["bram_boot"]  = BramCfg(256, 512)

# CONFIG_SRAM_L2_TAG_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_TAG_HEIGHT', '256'))
# CONFIG_SRAM_L2_TAG_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_TAG_WIDTH', '104'))
# CONFIG_SRAM_L2_DATA_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_DATA_HEIGHT', '4096'))
# CONFIG_SRAM_L2_DATA_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_DATA_WIDTH', '144'))
# CONFIG_SRAM_L2_STATE_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_STATE_HEIGHT', '256'))
# CONFIG_SRAM_L2_STATE_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_STATE_WIDTH', '66'))
# CONFIG_SRAM_L2_DIR_HEIGHT = int(os.environ.get('CONFIG_SRAM_L2_DIR_HEIGHT', '1024'))
# CONFIG_SRAM_L2_DIR_WIDTH = int(os.environ.get('CONFIG_SRAM_L2_DIR_WIDTH', '64'))

from pyhplib_sram import *

# devices file
fileName = "devices.xml"
# check if we have to use an alternative configuration
if os.getenv("PITON_ARIANE") is not None:
    if int(os.getenv("PITON_ARIANE")):
        fileName = "devices_ariane.xml"

DEVICES_XML_FILENAME = os.path.join(os.getenv("PROTOSYN_RUNTIME_DESIGN_PATH", ""),
                                    os.getenv("PROTOSYN_RUNTIME_BOARD", ""),
                                    fileName)

print "// " + DEVICES_XML_FILENAME

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


def GenMux(inputs, sels, output, num):
  print "always @ *"
  print "begin"
  print "%s = 0;" % output
  for i in range (num):
    if (i == 0):
      print "if (%s)" % (sels.replace("__WAY", `i`))
    else:
      print "else if (%s)" % (sels.replace("__WAY", `i`))
    print "   %s = %s;" % (output, inputs.replace("__WAY", `i`))
  print "end"

def GenOr(inputs, sels, output, num):
  print "always @ *"
  print "begin"
  print "%s = 0;" % output
  for i in range (num):
    print "if (%s)" % (sels.replace("__WAY", `i`))
    print "   %s = %s | %s;" % (output, output, inputs.replace("__WAY", `i`))
  print "end"

def GenEncoder(sels, output, num):
  print "%s = 0;" % output
  for i in range (num):
    if (i == 0):
      print "if (%s)" % (sels.replace("__WAY", `i`))
    else:
      print "else if (%s)" % (sels.replace("__WAY", `i`))
    print "   %s = %d;" % (output, i)

def GenInversedMux(inputs, sels, output, num):
  for i in range (num):
    if (i == 0):
      print "if (%s)" % (sels.replace("__WAY", `i`))
    else:
      print "else if (%s)" % (sels.replace("__WAY", `i`))
    print "   %s = %s;" % (output.replace("__WAY", `i`), inputs.replace("__WAY", `i`))


# <%
#   template = '''
#   '''
#   GenFor(template, CONFIG_L1D_ASSOCIATIVITY);
# %>

def GenFor(inputs, num, low=0):
  for i in range(low, num):
    print inputs.replace("__WAY", `i`)

def GenPriorityEncoder(inputs, out, num):
  print "always @ *"
  print "begin"
  print "%s = 0;" % out
  for i in range (num):
    if i == 0:
      print "if (%s[%d])" % (inputs, i)
    else:
      print "else if (%s[%d])" % (inputs, i)
    print "   %s = %d;" % (out, i)
  print "end"


def GenPriorityDecoder(inputs, out, num):
  print "always @ *"
  print "begin"
  print "%s = 0;" % out
  for i in range (num):
    if i == 0:
      print "if (%s == %d)" % (inputs, i)
    else:
      print "else if (%s == %d)" % (inputs, i)
    print "   %s[%d] = 1'b1;" % (out, i)
  print "end"

def ReadDevicesXMLFile():
  devicesInfo = []
  if DEVICES_XML_FILENAME == "":
    return devicesInfo

  tree = ET.parse(DEVICES_XML_FILENAME)
  devices = tree.getroot()

  cur_portnum = 0
  for i in range(0, len(devices)):
    # go through each field of device
    base = 0
    length = 0
    name = ""
    noc2_in = False
    virtual = False
    stream_accessible = False
    for j in range(0, len(devices[i])):
      tag = devices[i][j].tag
      text = devices[i][j].text
      if tag == "base":
        base = int(text, 0)
      elif tag == "length":
        length = int(text, 0)
      elif tag == "name":
        name = text
      elif tag == "noc2in":
        noc2_in = True
      elif tag == "virtual":
        virtual = True
      elif tag == "stream_accessible":
        stream_accessible = True

    if not virtual:
      portnum = cur_portnum
      cur_portnum += 1
    else:
      portnum = -1

    if name == "chip":
        devicesInfo.insert(0, {"name": name, "portnum": portnum, "base": base, "length": length, "noc2_in": noc2_in, "virtual": virtual, "stream_accessible":stream_accessible})
    else:
        devicesInfo.append({"name": name, "portnum": portnum, "base": base, "length": length, "noc2_in": noc2_in, "virtual": virtual, "stream_accessible":stream_accessible})

  return devicesInfo

def GenBramFPGA(depth, width):
    depth_log2 = math.log(depth,2);
    print """
      module inferred_bram_%dx%d (clk, ena, wea, addra, dina, enb, addrb, doutb);
        input clk;
        input ena;
        input wea;
        input [%d-1:0] addra;
        input [%d-1:0] dina;
        input enb;
        input [%d-1:0] addrb;
        output [%d-1:0] doutb;

        reg [%d-1:0] ram [%d-1:0];
        reg [%d-1:0] doutb;
        always @(posedge clk) begin
          if (ena) begin
            if (wea) begin
              ram[addra] <= dina;
            end
          end
          if (enb) begin
            doutb <= ram[addrb];
          end
        end
      endmodule
    """ % (depth, width, depth_log2, width, depth_log2, width, width, depth, width)
