# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: sjm_5.cmd
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================
CONFIG id=30 iosyncadr=0x7EF00BEEF00
TIMEOUT 100000
IOSYNC


LABEL_0:
PRINT waiting 500 cycles
WAIT 500
#==================================================
# id=1, alg=11, addr=0x1240, loopaddr=0x1280, size=0x9, type=writer, data=0x25749
#==================================================
PRINT id=1, alg=11, addr=0x1240, loopaddr=0x1280, size=0x9, type=writer, data=0x25749

WRITEBLK 0x01170001240 +
	0x00000000 0x00006495 0x00000000 0x00006496 +
	0x00000000 0x00006497 0x00000000 0x00006498 +
	0x00000000 0x00006499 0x00000000 0x0000649a +
	0x00000000 0x0000649b 0x00000000 0x0000649c

WRITEIO 0x61170001280 8 0xF0F0F0F0 0xF0F0F0F0

#==================================================
# id=5, alg=10, addr=0x1b00, loopaddr=0x1b38, size=0x8, type=writer, data=0x18867
#==================================================
PRINT id=5, alg=10, addr=0x1b00, loopaddr=0x1b38, size=0x8, type=writer, data=0x18867

WRITEBLK 0x01170001b00 +
	0x00000000 0x000049b3 0x00000000 0x000049b4 +
	0x00000000 0x000049b5 0x00000000 0x000049b6 +
	0x00000000 0x000049b7 0x00000000 0x000049b8 +
	0x00000000 0x000049b9 0x00000000 0x000049ba

#==================================================
# id=10, alg=12, addr=0x0dc0, loopaddr=0x0e00, size=0x9, type=writer, data=0x25869
#==================================================
PRINT id=10, alg=12, addr=0x0dc0, loopaddr=0x0e00, size=0x9, type=writer, data=0x25869

WRITEBLK 0x01170000dc0 +
	0x00000000 0x0000650d 0x00000000 0x0000650e +
	0x00000000 0x0000650f 0x00000000 0x00006510 +
	0x00000000 0x00006511 0x00000000 0x00006512 +
	0x00000000 0x00006513 0x00000000 0x00006514

WRITEMSK 0x01170000e00 0xFF00000000000000 +
	0xf0f0f0f0 0xf0f0f0f0 0xdddddddd 0xdddddddd +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xa6a6a6a6 0xa6a6a6a6 0xf1f1f1f1 0xf1f1f1f1 

#==================================================
# id=11, alg=0, addr=0x04f0, loopaddr=0x04f0, size=0x2, type=writer, data=0x12523
#==================================================
PRINT id=11, alg=0, addr=0x04f0, loopaddr=0x04f0, size=0x2, type=writer, data=0x12523

WRITEIO 0x611700004f0  8 0x000030eb 0x000030ec

#==================================================
# id=13, alg=10, addr=0x0340, loopaddr=0x0378, size=0x8, type=writer, data=0x25265
#==================================================
PRINT id=13, alg=10, addr=0x0340, loopaddr=0x0378, size=0x8, type=writer, data=0x25265

WRITEBLK 0x01170000340 +
	0x00000000 0x000062b1 0x00000000 0x000062b2 +
	0x00000000 0x000062b3 0x00000000 0x000062b4 +
	0x00000000 0x000062b5 0x00000000 0x000062b6 +
	0x00000000 0x000062b7 0x00000000 0x000062b8

#==================================================
# id=18, alg=12, addr=0x0480, loopaddr=0x04c0, size=0x9, type=writer, data=0x14636
#==================================================
PRINT id=18, alg=12, addr=0x0480, loopaddr=0x04c0, size=0x9, type=writer, data=0x14636

WRITEBLK 0x01170000480 +
	0x00000000 0x0000392c 0x00000000 0x0000392d +
	0x00000000 0x0000392e 0x00000000 0x0000392f +
	0x00000000 0x00003930 0x00000000 0x00003931 +
	0x00000000 0x00003932 0x00000000 0x00003933

WRITEMSK 0x011700004c0 0xFF00000000000000 +
	0xf0f0f0f0 0xf0f0f0f0 0xdddddddd 0xdddddddd +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xa6a6a6a6 0xa6a6a6a6 0xf1f1f1f1 0xf1f1f1f1 

#==================================================
# id=20, alg=0, addr=0x1e90, loopaddr=0x1e90, size=0x2, type=writer, data=0x31662
#==================================================
PRINT id=20, alg=0, addr=0x1e90, loopaddr=0x1e90, size=0x2, type=writer, data=0x31662

WRITEIO 0x61170001e90  8 0x00007bae 0x00007baf

#==================================================
# id=21, alg=10, addr=0x19c0, loopaddr=0x19f8, size=0x8, type=writer, data=0x18718
#==================================================
PRINT id=21, alg=10, addr=0x19c0, loopaddr=0x19f8, size=0x8, type=writer, data=0x18718

WRITEBLK 0x011700019c0 +
	0x00000000 0x0000491e 0x00000000 0x0000491f +
	0x00000000 0x00004920 0x00000000 0x00004921 +
	0x00000000 0x00004922 0x00000000 0x00004923 +
	0x00000000 0x00004924 0x00000000 0x00004925

#==================================================
# id=24, alg=0, addr=0x18a0, loopaddr=0x18a0, size=0x2, type=writer, data=0x23694
#==================================================
PRINT id=24, alg=0, addr=0x18a0, loopaddr=0x18a0, size=0x2, type=writer, data=0x23694

WRITEIO 0x611700018a0  8 0x00005c8e 0x00005c8f

#==================================================
# id=27, alg=10, addr=0x1680, loopaddr=0x16b8, size=0x8, type=writer, data=0x3973
#==================================================
PRINT id=27, alg=10, addr=0x1680, loopaddr=0x16b8, size=0x8, type=writer, data=0x3973

WRITEBLK 0x01170001680 +
	0x00000000 0x00000f85 0x00000000 0x00000f86 +
	0x00000000 0x00000f87 0x00000000 0x00000f88 +
	0x00000000 0x00000f89 0x00000000 0x00000f8a +
	0x00000000 0x00000f8b 0x00000000 0x00000f8c

#==================================================
# id=31, alg=0, addr=0x12c8, loopaddr=0x12c8, size=0x2, type=writer, data=0x15644
#==================================================
PRINT id=31, alg=0, addr=0x12c8, loopaddr=0x12c8, size=0x2, type=writer, data=0x15644

WRITEIO 0x611700012c8  8 0x00003d1c 0x00003d1d

#==================================================
# id=32, alg=12, addr=0x1840, loopaddr=0x1880, size=0x9, type=writer, data=0x4185
#==================================================
PRINT id=32, alg=12, addr=0x1840, loopaddr=0x1880, size=0x9, type=writer, data=0x4185

WRITEBLK 0x01170001840 +
	0x00000000 0x00001059 0x00000000 0x0000105a +
	0x00000000 0x0000105b 0x00000000 0x0000105c +
	0x00000000 0x0000105d 0x00000000 0x0000105e +
	0x00000000 0x0000105f 0x00000000 0x00001060

WRITEMSK 0x01170001880 0xFF00000000000000 +
	0xf0f0f0f0 0xf0f0f0f0 0xdddddddd 0xdddddddd +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
	0xa6a6a6a6 0xa6a6a6a6 0xf1f1f1f1 0xf1f1f1f1 

#==================================================
# id=33, alg=0, addr=0x1000, loopaddr=0x1000, size=0x2, type=writer, data=0x27681
#==================================================
PRINT id=33, alg=0, addr=0x1000, loopaddr=0x1000, size=0x2, type=writer, data=0x27681

WRITEIO 0x61170001000  8 0x00006c21 0x00006c22

#==================================================
# id=34, alg=11, addr=0x02c0, loopaddr=0x0300, size=0x9, type=writer, data=0x28106
#==================================================
PRINT id=34, alg=11, addr=0x02c0, loopaddr=0x0300, size=0x9, type=writer, data=0x28106

WRITEBLK 0x011700002c0 +
	0x00000000 0x00006dca 0x00000000 0x00006dcb +
	0x00000000 0x00006dcc 0x00000000 0x00006dcd +
	0x00000000 0x00006dce 0x00000000 0x00006dcf +
	0x00000000 0x00006dd0 0x00000000 0x00006dd1

WRITEIO 0x61170000300 8 0xF0F0F0F0 0xF0F0F0F0

#==================================================
# id=40, alg=0, addr=0x0e90, loopaddr=0x0e90, size=0x2, type=writer, data=0x27355
#==================================================
PRINT id=40, alg=0, addr=0x0e90, loopaddr=0x0e90, size=0x2, type=writer, data=0x27355

WRITEIO 0x61170000e90  8 0x00006adb 0x00006adc

#==================================================
# id=43, alg=10, addr=0x0440, loopaddr=0x0478, size=0x8, type=writer, data=0x20383
#==================================================
PRINT id=43, alg=10, addr=0x0440, loopaddr=0x0478, size=0x8, type=writer, data=0x20383

WRITEBLK 0x01170000440 +
	0x00000000 0x00004f9f 0x00000000 0x00004fa0 +
	0x00000000 0x00004fa1 0x00000000 0x00004fa2 +
	0x00000000 0x00004fa3 0x00000000 0x00004fa4 +
	0x00000000 0x00004fa5 0x00000000 0x00004fa6

#==================================================
# id=47, alg=0, addr=0x0390, loopaddr=0x0390, size=0x2, type=writer, data=0x28970
#==================================================
PRINT id=47, alg=0, addr=0x0390, loopaddr=0x0390, size=0x2, type=writer, data=0x28970

WRITEIO 0x61170000390  8 0x0000712a 0x0000712b

#==================================================
# id=61, alg=11, addr=0x16c0, loopaddr=0x1700, size=0x9, type=writer, data=0x29064
#==================================================
PRINT id=61, alg=11, addr=0x16c0, loopaddr=0x1700, size=0x9, type=writer, data=0x29064

WRITEBLK 0x011700016c0 +
	0x00000000 0x00007188 0x00000000 0x00007189 +
	0x00000000 0x0000718a 0x00000000 0x0000718b +
	0x00000000 0x0000718c 0x00000000 0x0000718d +
	0x00000000 0x0000718e 0x00000000 0x0000718f

WRITEIO 0x61170001700 8 0xF0F0F0F0 0xF0F0F0F0

#==================================================
# id=40, alg=0, addr=0x0e90, loopaddr=0x0e90, size=0x2, type=checker, data=0x27355
#==================================================
PRINT id=40, alg=0, addr=0x0e90, loopaddr=0x0e90, size=0x2, type=checker, data=0x27355

READIO 0x61170000e90 8 0x00006adb 0x00006adc

#==================================================
# id=47, alg=0, addr=0x0390, loopaddr=0x0390, size=0x2, type=checker, data=0x28970
#==================================================
PRINT id=47, alg=0, addr=0x0390, loopaddr=0x0390, size=0x2, type=checker, data=0x28970

READIO 0x61170000390 8 0x0000712a 0x0000712b

#==================================================
# id=33, alg=0, addr=0x1000, loopaddr=0x1000, size=0x2, type=checker, data=0x27681
#==================================================
PRINT id=33, alg=0, addr=0x1000, loopaddr=0x1000, size=0x2, type=checker, data=0x27681

READIO 0x61170001000 8 0x00006c21 0x00006c22

#==================================================
# id=11, alg=0, addr=0x04f0, loopaddr=0x04f0, size=0x2, type=checker, data=0x12523
#==================================================
PRINT id=11, alg=0, addr=0x04f0, loopaddr=0x04f0, size=0x2, type=checker, data=0x12523

READIO 0x611700004f0 8 0x000030eb 0x000030ec

#==================================================
# id=20, alg=0, addr=0x1e90, loopaddr=0x1e90, size=0x2, type=checker, data=0x31662
#==================================================
PRINT id=20, alg=0, addr=0x1e90, loopaddr=0x1e90, size=0x2, type=checker, data=0x31662

READIO 0x61170001e90 8 0x00007bae 0x00007baf

#==================================================
# id=24, alg=0, addr=0x18a0, loopaddr=0x18a0, size=0x2, type=checker, data=0x23694
#==================================================
PRINT id=24, alg=0, addr=0x18a0, loopaddr=0x18a0, size=0x2, type=checker, data=0x23694

READIO 0x611700018a0 8 0x00005c8e 0x00005c8f

#==================================================
# id=31, alg=0, addr=0x12c8, loopaddr=0x12c8, size=0x2, type=checker, data=0x15644
#==================================================
PRINT id=31, alg=0, addr=0x12c8, loopaddr=0x12c8, size=0x2, type=checker, data=0x15644

READIO 0x611700012c8 8 0x00003d1c 0x00003d1d

BA LABEL_0
