#!/usr/bin/python
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


import random

CORE_NUM = 24
SECTION_SIZE = 0x2000
XW_IN_CL = 8

# MODE = "ld_l2"
MODE = "ld_mem"

if MODE == "ld_mem":
	BASE_ADDR = 0xa8202000
	CORE_NUM = 1
	CL_IN_SECTION = 8
	SECTIONS_PER_CORE = 16
	ALIGN_MODE = "PITON_L2_LOW_SIZE"
	fname = "user_data_ldx_mem_max.s"
else:
	BASE_ADDR = 0xa8200000
	CORE_NUM = 1
	CL_IN_SECTION = 4
	SECTIONS_PER_CORE = 2
	ALIGN_MODE = "PITON_L1D_WAY_SIZE"
	fname = "user_data_ldx_l2_max.s"

f = open(fname, 'w')

for cn in range(CORE_NUM):
	xw_in_c = 0
	for sn in range(SECTIONS_PER_CORE):
		if MODE == "ld_mem":
			section_address = BASE_ADDR + (sn*2)*SECTION_SIZE
		else:
			section_address = BASE_ADDR + (cn*SECTIONS_PER_CORE + sn)*SECTION_SIZE
		print >> f, "SECTION .DATA_CORE%d_%d DATA_VA=%s" % (cn, sn, hex(section_address))
		print >> f, "attr_data {"
		print >> f, "    Name = .DATA_CORE%d_%d," % (cn, sn)
		print >> f, "    VA = %s," % hex(section_address)
		print >> f, "    PA = ra2pa(%s,0)," % hex(section_address)
		print >> f, "    RA = %s," % hex(section_address)
		print >> f, """    part_0_d_ctx_nonzero_ps0_tsb,
    TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
    TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=1, TTE_E=0, TTE_P=0, TTE_W=1
}\n
.data\n"""

		if (sn == 0):
			print >> f, "    .global data_core_%d" % cn
			print >> f, "data_core_%d:" % cn
		for cl in range(CL_IN_SECTION):
			xw_id_str = "%02d" % xw_in_c
			cn_str = "%02d" % cn
			print >> f, "    .align  %s" % ALIGN_MODE
			for xw in range(XW_IN_CL):
				# xw_data = "0x" + 4*(cn_str+xw_id_str)
				if sn % 2:
					xw_data = 0x0
				else:
					xw_data = 0xffffffffffffffff
				print >> f, "    .xword 0x%s" % format(xw_data, 'x')
			print >> f
			xw_in_c += 1
		print >> f
		print >> f


f.close()