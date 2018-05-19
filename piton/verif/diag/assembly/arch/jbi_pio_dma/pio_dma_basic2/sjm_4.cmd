# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: sjm_4.cmd
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
CONFIG id=28 iosyncadr=0x7CF00BEEF00
TIMEOUT 10000000
IOSYNC

LABEL_0:

WRITEBLK 0x1170000040  +
	0x00000000 0x00000000 0x00000000 0x00000000 +
	0x00000000 0x00000000 0x00000000 0x00000000 +
	0x00000000 0x00000000 0x00000000 0x00000000 +
	0x00000000 0x00000000 0x00000000 0x00000000

WRITEMSK 0x1170000040 0xFF00000000000000 +
	0xdeadbee0 0xdeadbee1 0x08234567 0xc1234567 +
	0x11234567 0x51234567 0x09234567 0xd1234567 +
	0x21234567 0x61234567 0x0A234567 0xe1234567 +
	0x31234567 0x71234567 0x0b234567 0xF0F0F0F0 

WRITEMSK 0x1170000040 0xFF0F0F0F0F0FF00F +
	0x01234567 0x11234567 0x08234567 0xc1234567 +
	0x11234567 0x51234567 0x09234567 0xd1234567 +
	0x21234567 0x61234567 0x0A234567 0xe1234567 +
	0x31234567 0x71234567 0x0b234567 0xF0F0F0F0 

READBLK 0x1170000040  +
	0x01234567 0x11234567 0x00000000 0xc1234567 +
	0x00000000 0x51234567 0x00000000 0xd1234567 +
	0x00000000 0x61234567 0x00000000 0xe1234567 +
	0x31234567 0x00000000 0x00000000 0xF0F0F0F0


WRITEBLK 0x1170000080  +
	0x00000000 0x00000000 0x00000000 0x00000000 +
	0x00000000 0x00000000 0x00000000 0x00000000 +
	0x00000000 0x00000000 0x00000000 0x00000000 +
	0x00000000 0x00000000 0x00000000 0x00000000

WRITEMSK 0x1170000080 0xFFFFFFFFFFFFFFFF +
	0xdeadbee0 0xdeadbee0 0xdeaddea8 0xdeaddea1 +
	0xdeaddeae 0xdeaddea9 0xdeaddea7 0xdeaddea2 +
	0xdeaddead 0xdeaddeaa 0xdeaddea6 0xdeaddea3 +
	0xdeaddeac 0xdeaddeab 0xdeaddea5 0xdeaddea4 

WRITEMSK 0x1170000080 0xFF0F0F0F0F0FF00F +
	0x01234567 0x11234567 0x08234567 0xc1234567 +
	0x11234567 0x51234567 0x09234567 0xd1234567 +
	0x21234567 0x61234567 0x0A234567 0xe1234567 +
	0x31234567 0x71234567 0x0b234567 0xF0F0F0F0 

READBLK 0x1170000080  +
	0x01234567 0x11234567 0xdeaddea8 0xc1234567 +
	0xdeaddeae 0x51234567 0xdeaddea7 0xd1234567 +
	0xdeaddead 0x61234567 0xdeaddea6 0xe1234567 +
	0x31234567 0xdeaddeab 0xdeaddea5 0xF0F0F0F0


BA LABEL_0

