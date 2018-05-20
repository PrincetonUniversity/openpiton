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

# http://www.fpga4fun.com/JTAG2.html


# jtag is shifting in IR lowest bit first

import re

class JtagGen():
  # constant declaration
  # JTAG register selects
  IR_REGSEL_INSTRUCTION = '001000'
  IR_REGSEL_DATA = '001001'
  IR_REGSEL_ADDRESS = '001010'
  IR_REGSEL_INTERRUPT = '001011'

  INST_READ_SHADOWSCAN = '00000001'
  INST_CLEAR_INTERRUPT = '00000010'
  INST_STALL_CORE = '00000011'
  INST_READ_SRAM= '00000100'
  INST_WRITE_SRAM = '00000101'
  INST_WRITE_PC = '00000110'
  INST_WRITE_THREADSTATE = '00000111'
  INST_WRITE_INTERRUPT = '00001000'
  INST_READ_ORAM = '00001001'

  BIST_ID_L1_ICACHE_W10 =    1
  BIST_ID_L1_ICACHE_W32 =    2
  BIST_ID_L1_DCACHE_W01 =    3
  BIST_ID_L1_DCACHE_W23 =    4
  BIST_ID_L1_FRF =           5
  BIST_ID_L15_DTAG =         6
  BIST_ID_L15_DCACHE =       7
  BIST_ID_L15_HMT =          8
  BIST_ID_L1_ITAG =          9
  BIST_ID_L1_DTAG =          10
  BIST_ID_L1_ICV =           11
  BIST_ID_L1_DCV =           12


  # `define JTAG_RTAP_ID_PC_REG 16'd1
  # `define JTAG_RTAP_ID_STALL_REG 16'd2
  # `define JTAG_RTAP_ID_THREADSTATE_REG 16'd3
  # `define JTAG_RTAP_ID_CPX_INTERRUPT 16'd4
  # `define JTAG_RTAP_ID_RESETVECTOR_REG 16'd5
  # `define JTAG_RTAP_ID_LSU_CONTROL_REG 16'd6
  # `define JTAG_RTAP_ID_CONFIGREGS_REG 16'd7

  defines = {};


  WAYID_MASK_0 = '00000001'
  WAYID_MASK_1 = '00000010'
  WAYID_MASK_2 = '00000100'
  WAYID_MASK_3 = '00001000'
  WAYID_MASK_4 = '00010000'
  WAYID_MASK_5 = '00100000'
  WAYID_MASK_6 = '01000000'
  WAYID_MASK_7 = '10000000'

  THRFSM_DEAD     = '00000'
  THRFSM_IDLE     = '00000'
  THRFSM_HALT     = '00010'
  THRFSM_RDY      = '11001'
  THRFSM_SPEC_RDY = '10011'
  THRFSM_RUN      = '00101'
  THRFSM_SPEC_RUN = '00111'
  THRFSM_WAIT     = '00001'

  def __init__(self):
    self.inputstring = []
    self.outputstring = []
    # self.currentstate = "RESET"
    self.modebit = 0
    self.datainbit = 0
    self.dataoutbit = 0
    self.datacheckbit = 0
    self.resetbit = 1 # reset is low active
    self.init = 0
    self.ir_data = ''
    self.dr_data = ''
    self.expected_dr_data = ''

    readme = '// checkdataout | datain | modeselect | reset'
    self.inputstring.append(readme)

    # inputting definitions
    text = '''
`define JTAG_RTAP_ID_PC_REG 16'd1
`define JTAG_RTAP_ID_STALL_REG 16'd2
`define JTAG_RTAP_ID_THREADSTATE_REG 16'd3
`define JTAG_RTAP_ID_CPX_INTERRUPT 16'd4
`define JTAG_RTAP_ID_RESETVECTOR_REG 16'd5
`define JTAG_RTAP_ID_LSU_CONTROL_REG 16'd6
`define JTAG_RTAP_ID_CONFIGREGS_REG 16'd7
`define JTAG_RTAP_ID_SHADOWSCAN_REG 16'd8
`define JTAG_RTAP_ID_IRF_REG 16'd9
`define JTAG_RTAP_ID_ICACHE_EN_REG 16'd10
`define JTAG_RTAP_ID_BREAKPOINT_PC_REG 16'd11
    '''
    search = re.compile('`define (\w+) 16\'d(\w+)')
    for l in text.split('\n'):
      m = search.search(l)
      if m:
        key = m.group(1)
        value = m.group(2)
        value = bin(int(value))[2:].zfill(16)
        self.defines[key] = value

    text = '''
`define JTAG_REQ_OP_READ_SHADOWSCAN 8'd1
`define JTAG_REQ_OP_CLEAR_INTERRUPT 8'd2
`define JTAG_REQ_OP_STALL_CORE 8'd3
`define JTAG_REQ_OP_READ_SRAM 8'd4
`define JTAG_REQ_OP_WRITE_SRAM 8'd5
`define JTAG_REQ_OP_WRITE_PC 8'd6
`define JTAG_REQ_OP_WRITE_THREADSTATE 8'd7
`define JTAG_REQ_OP_CPX_INTERRUPT 8'd8
`define JTAG_REQ_OP_READ_ORAM 8'd9
`define JTAG_REQ_OP_READ_RTAP 8'd10
`define JTAG_REQ_OP_WRITE_RTAP 8'd11
`define JTAG_REQ_OP_WRITE_CLK_EN 8'd12
`define JTAG_REQ_OP_WRITE_ORAM_CLK_EN 8'd13
    '''
    search = re.compile('`define (\w+) 8\'d(\w+)')
    for l in text.split('\n'):
      m = search.search(l)
      if m:
        key = m.group(1)
        value = m.group(2)
        value = bin(int(value))[2:].zfill(8)
        self.defines[key] = value

    # print self.defines

    text = '''
`define CONFIG_REG_CHIPID_ADDRESS           8'd0
`define CONFIG_REG_CSM_EN_ADDRESS           8'd1
`define CONFIG_REG_DMBR_REG1_ADDRESS        8'd2
`define CONFIG_REG_HMT_BASE_REG           8'd3
`define CONFIG_REG_CSM_CLUMP_TILE_COUNT_ADDRESS   8'd4
`define CONFIG_REG_DMBR_REG2_ADDRESS        8'd5
    '''
    search = re.compile('`define (\w+)\s+8\'d(\w+)')
    for l in text.split('\n'):
      m = search.search(l)
      if m:
        key = m.group(1)
        value = m.group(2)
        value = bin(int(value))[2:].zfill(8)
        self.defines[key] = value

    text = '''
`define THRFSM_DEAD     5'b00000
`define THRFSM_IDLE     5'b00000
`define THRFSM_HALT     5'b00010
`define THRFSM_RDY      5'b11001
`define THRFSM_SPEC_RDY 5'b10011
`define THRFSM_RUN      5'b00101
`define THRFSM_SPEC_RUN 5'b00111
`define THRFSM_WAIT     5'b00001
    '''
    search = re.compile('`define (\w+)\s+5\'b(\w+)')
    for l in text.split('\n'):
      m = search.search(l)
      if m:
        key = m.group(1)
        value = m.group(2)
        self.defines[key] = value

    text = '''
`define BIST_ID_L1_ICACHE_W10   8'd1
`define BIST_ID_L1_ICACHE_W32   8'd2
`define BIST_ID_L1_DCACHE_W01   8'd3
`define BIST_ID_L1_DCACHE_W23   8'd4
`define BIST_ID_L1_FRF          8'd5
`define BIST_ID_L15_DTAG        8'd6
`define BIST_ID_L15_DCACHE      8'd7
`define BIST_ID_L15_HMT         8'd8
`define BIST_ID_L1_ITAG         8'd9
`define BIST_ID_L1_DTAG         8'd10
`define BIST_ID_L1_ICV          8'd11
`define BIST_ID_L1_DCV          8'd12
    '''
    search = re.compile('`define (\w+)\s+8\'d(\w+)')
    for l in text.split('\n'):
      m = search.search(l)
      if m:
        key = m.group(1)
        value = m.group(2)
        value = bin(int(value))[2:].zfill(8)
        self.defines[key] = value

#     text = '''
# `define JTAG_CORE_ID_LSU_CONTROL_BITS       4'd1
# `define JTAG_CORE_ID_IFU_THRFSM             4'd2
# `define JTAG_CORE_ID_IFU_PC                 4'd3
# `define JTAG_CORE_ID_TLU_RSTVADDR_BASE      4'd4
# `define JTAG_CORE_ID_IFU_SSCAN              4'd5
# `define JTAG_CORE_ID_IRF                    4'd6
#     '''
#     search = re.compile('`define (\w+)\s+4\'d(\w+)')
#     for l in text.split('\n'):
#       m = search.search(l)
#       if m:
#         key = m.group(1)
#         value = m.group(2)
#         value = bin(int(value))[2:].zfill(4)
#         self.defines[key] = value

  def CommandStallCore(self, coreid, threadid, stall):
    if stall == 0:
      wrstate = self.defines['THRFSM_RDY'];
    elif stall == 1:
      wrstate = self.defines['THRFSM_HALT'];
    else:
      assert(0)

    self.SetRegisterSelect('data')
    self.SetRegisterData(wrstate)
    self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    data = ''
    data += self.defines['JTAG_REQ_OP_WRITE_RTAP'] + self.GetCoreIdMask(coreid) \
            + self.GetThreadIdMask(threadid) + self.defines['JTAG_RTAP_ID_THREADSTATE_REG']
    assert(len(data) == 32)
    self.SetRegisterData(data)
    self.CommitWriteRegister()

  def CommandSetClockGatingMask(self, mask):
    self.SetRegisterSelect('data')
    self.SetRegisterData(mask)
    self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    inst = ''
    inst += self.defines['JTAG_REQ_OP_WRITE_CLK_EN'] + 24*'0'
    assert(len(inst) == 32)
    self.SetRegisterData(inst)
    self.CommitWriteRegister()

  def CommandReadClockGatingMask(self, expected):
    self.SetRegisterSelect('instruction')
    inst = ''
    inst += self.defines['JTAG_REQ_OP_WRITE_CLK_EN'] + 24*'0'
    assert(len(inst) == 32)
    self.SetRegisterData(inst)
    self.CommitWriteRegister()

  def CommandSetOramClockGatingMask(self, mask):
    self.SetRegisterSelect('data')
    self.SetRegisterData(mask)
    self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    inst = ''
    inst += self.defines['JTAG_REQ_OP_WRITE_ORAM_CLK_EN'] + 24*'0'
    assert(len(inst) == 32)
    self.SetRegisterData(inst)
    self.CommitWriteRegister()

  def CommandReadSram(self, coreid, threadid, sramid, index, way):
    inst = ''
    inst += self.INST_READ_SRAM + self.GetCoreIdMask(coreid) \
            + self.GetThreadIdMask(threadid) + '0000000000000000'
    # sram read needs another 32b for addressing
    index_str = bin(index)
    index_str = int(index_str[2:])
    # print index_str
    index_str = '%016d' % index_str
    # print index_str
    assert(len(index_str) == 16)
    try:
      sramid = bin(sramid)[2:].zfill(8)
    except:
      pass
    assert(len(sramid) == 8)
    assert(len(way) == 8)
    address = sramid + way + index_str

    assert(len(address) == 32);
    assert(len(inst) == 32)

    self.SetRegisterSelect('address')
    self.SetRegisterData(address)
    self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    self.SetRegisterData(inst)
    self.CommitWriteRegister()

  def CommandWriteSram(self, coreid, threadid, sramid, index, way, wrdata):

    # check inputs
    wrdata = wrdata.replace('_', '')
    assert(len(wrdata) <= 64)

    data = ''
    data += self.INST_WRITE_SRAM + self.GetCoreIdMask(coreid) \
            + self.GetThreadIdMask(threadid) + '0000000000000000'
    # sram read needs another 32b for addressing
    index_str = bin(index).lstrip('0b').zfill(16)
    # print index_str
    # index_str = index_str.lstrip('0b')
    # index_str = '%016d' % index_str
    # print index_str
    assert(len(index_str) == 16)
    try:
      sramid = bin(sramid)[2:].zfill(8)
    except:
      pass
    assert(len(sramid) == 8)
    assert(len(way) == 8)
    address = sramid + way + index_str

    assert(len(address) == 32);
    assert(len(data) == 32)

    self.SetRegisterSelect('data')
    self.SetRegisterData(wrdata)
    self.CommitWriteRegister()

    self.SetRegisterSelect('address')
    self.SetRegisterData(address)
    self.CommitWriteRegister()
    
    self.SetRegisterSelect('instruction')
    self.SetRegisterData(data)
    self.CommitWriteRegister()

  # def CommandWritePC(self, coreid, threadid, wrdata, hex=False, reset_vector=False):

  #   if reset_vector == False:
  #     data_length = 48
  #   else:
  #     data_length = 34

  #   # check inputs
  #   if hex == True:
  #     wrdata = wrdata.replace('_', '')
  #     wrdata = bin(int(wrdata, 16))[2:].zfill(data_length)

  #   # wrdata = wrdata.replace('_', '')
  #   assert(len(wrdata) == data_length)

  #   if (reset_vector == False):
  #     inst = ''
  #     inst += self.INST_WRITE_PC + self.GetCoreIdMask(coreid) \
  #             + self.GetThreadIdMask(threadid) + '0000000000000000'
  #   else:
  #     inst = ''
  #     inst += self.INST_WRITE_PC + self.GetCoreIdMask(coreid) \
  #             + self.GetThreadIdMask(threadid) + '0000000000000001'

  #   assert(len(inst) == 32)

  #   self.SetRegisterSelect('data')
  #   self.SetRegisterData(wrdata)
  #   self.CommitWriteRegister()
    
  #   self.SetRegisterSelect('instruction')
  #   self.SetRegisterData(inst)
  #   self.CommitWriteRegister()

  # def CommandWriteThreadState(self, coreid, threadid, wrdata, mode='thrfsm'):

  #   if (mode == 'thrfsm'):
  #     assert(len(wrdata) == 5)
  #     inst = ''
  #     inst += self.INST_WRITE_THREADSTATE + self.GetCoreIdMask(coreid) \
  #             + self.GetThreadIdMask(threadid) + '00000000000' + wrdata
  #     assert(len(inst) == 32)

  #   elif (mode == 'lsu_control'):
  #     assert(len(wrdata) == 14)
  #     inst = ''
  #     inst += self.INST_WRITE_THREADSTATE + self.GetCoreIdMask(coreid) \
  #             + self.GetThreadIdMask(threadid) + '10' + wrdata
  #     assert(len(inst) == 32)

  #   else:
  #     assert(0);

  #   self.SetRegisterSelect('instruction')
  #   self.SetRegisterData(inst)
  #   self.CommitWriteRegister()

  def CommandWriteInterrupt(self, coreid, threadid, wrdata):
    assert(len(wrdata) == 64)

    inst = ''
    inst += self.INST_WRITE_INTERRUPT + self.GetCoreIdMask(coreid) \
            + self.GetThreadIdMask(threadid) + '0000000000000000'
    assert(len(inst) == 32)

    self.SetRegisterSelect('data')
    self.SetRegisterData(wrdata)
    self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    self.SetRegisterData(inst)
    self.CommitWriteRegister()

  def CommandClearInterrupt(self):
    self.SetRegisterSelect('instruction')
    data = ''
    data += self.INST_CLEAR_INTERRUPT + self.GetCoreIdMask(0) \
            + self.GetThreadIdMask(0) + '0000000000000000'
    assert(len(data) == 32)
    self.SetRegisterData(data)
    self.CommitWriteRegister()

  # def CommandReadShadowscan(self, coreid, threadid):
  #   self.SetRegisterSelect('instruction')
  #   data = ''
  #   data += self.defines['JTAG_REQ_OP_READ_RTAP'] + self.GetCoreIdMask(coreid) \
  #           + self.GetThreadIdMask(threadid) + self.defines['JTAG_RTAP_ID_SHADOWSCAN_REG']

  #   # print data
  #   assert(len(data) == 32)
  #   self.SetRegisterData(data)
  #   self.CommitWriteRegister()

  def CommandReadOram(self, misc):
    self.SetRegisterSelect('instruction')
    inst = ''
    inst += self.INST_READ_ORAM + '00000000000000000000' + misc

    # print inst
    assert(len(inst) == 32)
    self.SetRegisterData(inst)
    self.CommitWriteRegister()

  def CommandReadRtap(self, coreid, threadid, rtapid, address=''):
    if len(address) != 0:
      self.SetRegisterSelect('address')
      self.SetRegisterData(address)
      self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    data = ''
    data += self.defines['JTAG_REQ_OP_READ_RTAP'] + self.GetCoreIdMask(coreid) \
            + self.GetThreadIdMask(threadid) + rtapid
    assert(len(data) == 32)
    self.SetRegisterData(data)
    self.CommitWriteRegister()

  def CommandWriteRtap(self, coreid, threadid, rtapid, data, address=''):
    if len(address) != 0:
      self.SetRegisterSelect('address')
      self.SetRegisterData(address)
      self.CommitWriteRegister()

    self.SetRegisterSelect('data')
    self.SetRegisterData(data)
    self.CommitWriteRegister()

    self.SetRegisterSelect('instruction')
    data = ''
    data += self.defines['JTAG_REQ_OP_WRITE_RTAP'] + self.GetCoreIdMask(coreid) \
            + self.GetThreadIdMask(threadid) + rtapid

    # print data
    assert(len(data) == 32)
    self.SetRegisterData(data)
    self.CommitWriteRegister()

  def CommandRead(self, register, expected):
    expected = expected.replace('_', '')
    self.SetRegisterSelect(register)
    self.SetExpectedData(expected)
    self.CommitReadRegesiter()

  def SetRegisterSelect(self, reg):
    post = ''
    if reg == 'instruction':
      post = self.IR_REGSEL_INSTRUCTION
    elif reg == 'data':
      post = self.IR_REGSEL_DATA
    elif reg == 'address':
      post = self.IR_REGSEL_ADDRESS
    elif reg == 'interruptbit':
      post = self.IR_REGSEL_INTERRUPT
    else:
      assert (0)

    full = '000000000000' + post
    full = full[::-1] # instruction is written lowest bit first
    # print full
    assert(len(full) == 18)

    self.ir_data = full

  def SetRegisterData(self, data):
    self.dr_data = data

  def SetExpectedData(self, data):
    self.expected_dr_data = data

  def CommitWait(self, num_cycle):
    if not self.init:
      self.Reset()
    self.inputstring.append("// Waiting for %d cycles" % num_cycle)
    self.modebit = 0
    self.datacheckbit = 0
    for i in range(num_cycle):
      self.PushInput() # wait
    self.inputstring.append("// Done waiting")

  def CommitReadRegesiter(self):
    self.WriteIR()
    self.ReadDR()

  def WriteToFile(self, inputname, outputname):
    f = open(inputname, 'w')
    f.write("\n".join(self.inputstring))
    f.close()
    f = open(outputname, 'w')
    f.write("\n".join(self.outputstring))
    f.close()

  def CommitWriteRegister(self):
    # assuming that jtag state is "idle"
    if not self.init:
      self.Reset()
    self.WriteIR()
    self.WriteDR()

  def WriteIR(self):
    self.inputstring.append("// Writing IR %s" % self.ir_data)
    self.datacheckbit = 0
    self.modebit = 1
    self.PushInput() # to dr-scan
    self.PushInput() # to ir-scan
    self.modebit = 0
    self.PushInput() # to capture-ir
    self.PushInput() # to shift-ir
    # now we shift in
    assert(len(self.ir_data) > 0)
    for (i,b) in enumerate(self.ir_data):
      if b == "0":
        self.datainbit = 0
      else:
        self.datainbit = 1
      if (i == len(self.ir_data) - 1):
        self.modebit = 1
      self.PushInput()

    # now get back to idle
    # self.PushInput() # to exit1-ir
    self.PushInput() # to update-ir
    self.PushInput() # to sel-dr-scan

    # and reset ir_data
    self.ir_data = ''

  def ReadDR(self):
    self.inputstring.append("// Reading DR %s" % self.expected_dr_data)
    self.outputstring.append("// Reading DR %s" % self.expected_dr_data)
    self.datacheckbit = 0
    # assume that we're in dr-scan now
    self.modebit = 0
    self.PushInput() # to capture-dr
    self.PushInput() # to shift-dr
    # now we shift out
    assert(len(self.expected_dr_data) > 0)
    for (i,b) in enumerate(self.expected_dr_data):
      self.datacheckbit = 1
      if b == "0":
        self.dataoutbit = 0
      else:
        self.dataoutbit = 1
      if (i == len(self.expected_dr_data) - 1):
        self.modebit = 1
      if b == 'x':
        self.datacheckbit = 0
      else:
        self.PushOutput()
      self.PushInput()

    # now get back to idle
    self.datacheckbit = 0
    # self.modebit = 1
    # self.PushInput() # to exit1-dr
    self.PushInput() # to update-dr
    self.modebit = 0
    self.PushInput() # to idle

    self.expected_dr_data = ''

  def WriteDR(self):
    self.inputstring.append("// Writing DR %s" % self.dr_data)
    self.datacheckbit = 0
    # assume that we're in dr-scan now
    self.modebit = 0
    self.PushInput() # to capture-dr
    self.PushInput() # to shift-dr
    # now we shift in
    assert(len(self.dr_data) > 0)
    for (i,b) in enumerate(self.dr_data):
      if b == "0":
        self.datainbit = 0
      else:
        self.datainbit = 1
      if (i == len(self.dr_data) - 1):
        self.modebit = 1
      self.PushInput()

    # now get back to idle
    # self.modebit = 1
    # self.PushInput() # to exit1-dr
    self.PushInput() # to update-dr
    self.modebit = 0
    self.PushInput() # to idle

    self.dr_data = ''

  def Reset(self):
    self.inputstring.append("// Resetting")
    self.resetbit = 0
    self.modebit = 0
    self.datacheckbit = 0
    # hold reset for 5 cycles
    self.PushInput()
    self.PushInput()
    self.PushInput()
    self.PushInput()
    self.PushInput()
    self.resetbit = 1 # disable reset
    self.inputstring.append("// IDLE for 5 cycles")
    self.PushInput()
    self.PushInput()
    self.PushInput()
    self.PushInput()
    self.PushInput()
    self.init = 1

  def PushInput(self):
    s = '' + `self.datacheckbit` \
        + `self.datainbit` + `self.modebit` + `self.resetbit`
    self.inputstring.append(s)

  def PushOutput(self):
    s = `self.dataoutbit`
    self.outputstring.append(s)

  def GetCoreIdMask(self, coreid):
    return "{0:06b}".format(coreid)

  def GetThreadIdMask(self, threadid):
    return "{0:02b}".format(threadid)

  def Fail(self, timeout):
    self.CommitWait(timeout)
    self.CommandClearInterrupt()
    self.CommandRead(register='interruptbit', expected='1111')

  def Pass(self, timeout):
    self.CommitWait(timeout)
    self.CommandClearInterrupt()
    self.CommandRead(register='interruptbit', expected='0000')

  def HexToBin(self, hexdata, length=0, fillx=False):
    hexdata = hexdata.replace('_', '');
    if (length != 0):
      if (fillx):
        binary = bin(int(hexdata, 16))[2:]
        more = length - len(binary)
        if more > 0:
          binary = "x" * more + binary
      else:
        binary = bin(int(hexdata, 16))[2:].zfill(length)
    else:
      binary = bin(int(hexdata, 16))[2:]
    return binary

  def VerilogBitSelect(self, ins, high, low):
    max = len(ins)
    # print ins
    mylow = max - 1 - high;
    assert(mylow >= 0)
    # print mylow
    myhigh = max - low
    assert(myhigh < max)
    # print myhigh
    assert(mylow <= myhigh)
    out = ins[mylow:myhigh]
    # print out
    return out

  def PredecodeSwitchBit(self, ins):
    # adaptive from module sparc_ifu_swpla
    assert(len(ins) == 32)
    out = "0"

    if (self.VerilogBitSelect(ins, 31,30) == "01"):            # call
      out = "1";
    elif (self.VerilogBitSelect(ins, 31,30) == "00"):       # branch, sethi, nop
      if (self.VerilogBitSelect(ins, 24,22) == "100"): # nop/sethi
        out = "0";
      else: # branch
        out = "1";
    elif (self.VerilogBitSelect(ins, 31,30) == "10"):        # arith, shift, mem#, mov
      if (self.VerilogBitSelect(ins, 24,23) == "11"):  # wrpr, vis, save, jmpl
        out = "1";
      elif (self.VerilogBitSelect(ins, 24, 24) == "0"): # arith
        if (self.VerilogBitSelect(ins, 22, 22) == "0"): # alu op
          out = "0";
        elif ((self.VerilogBitSelect(ins, 22, 22) == "1") and (self.VerilogBitSelect(ins, 20,19) == "00")):
          # subc or addc
          out = "0";
        else: # mul, div
          out = "1";
      else: # if (self.VerilogBitSelect(ins, 24,23) == "10")  shft, mov, rdpr, tag
        if (self.VerilogBitSelect(ins, 22,19) == "0100"): # mulscc
          out = "1";
        elif (self.VerilogBitSelect(ins, 22, 22) == "0"):  # shft, tag
          out = "0";
        elif  ((self.VerilogBitSelect(ins, 22,19) == "1100") or  (self.VerilogBitSelect(ins, 22,19) == "1111")): # mov
          out = "0";
        else: # rdsr, mem#, popc, flushw, rdpr
          out = "1";
    else: # ld st
      if (int(self.VerilogBitSelect(ins, 24, 24)) or int(self.VerilogBitSelect(ins, 23, 23)) or ~int(self.VerilogBitSelect(ins, 21, 21))): # fp, alt space or ld
        out = "1";
      elif ((~self.VerilogBitSelect(ins, 23, 23)) and (self.VerilogBitSelect(ins, 22,19) == "1110")):  # stx
        out = "0";
      elif (self.VerilogBitSelect(ins, 22,21) == "01"): # other st
        out = "0";
      else: # other atomic
        out = "1";
    return out

  def CalculateParity(self, binary):
    sum = 0
    for c in binary:
      sum += int(c)
    if sum % 2:
      return 1
    else:
      return 0

  def MakeL1InstructionCacheLine(self, ilist):
    out = ""

    for i in ilist:
      i = i.replace(" ", "")
      binary = self.HexToBin(i, 32)
      assert(len(binary) == 32)
      switchbit = self.PredecodeSwitchBit(binary,)
      parity = self.CalculateParity(binary + switchbit)
      newbin = str(parity) + binary + switchbit
      assert(len(newbin) == 34)
      out = out + newbin

    return out

  def split_len(self, seq, length):
    return [seq[i:i+length] for i in range(0, len(seq), length)]

  def MakeL1DataCacheLine(self, data):
    out = []
    parities = []
    # print data

    for d in data:
      s = self.split_len(d, 2)
      # print s
      for ss in s:
        b = bin(int(ss, 16))[2:].zfill(8)
        assert(len(b) == 8)
        out.append(b)
        parities.append(`self.CalculateParity(b)`)

    # 16 bytes in a cache line
    for i in range(16-len(out)):
      out.append('00000000')
      parities.append('0')

    # print parities
    outbin = "".join(out) + "".join(parities)
    # print outbin
    assert(len(outbin) == 144)

    return outbin
