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

WRITEMSK 0x1170000040 0x0000FF0000000000 +
        0xdeadbee0 0xdeadbee1 0xdeadbee0 0xdeadbee0 +
        0xa5a5a5a5 0xa5a5a5a5 0xdeadbee0 0xdeadbee0 +
        0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
        0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0

READIO 0x61170000050 8 0xa5a5a5a5 0xa5a5a5a5

WRITEMSK 0x1170000040 0x00000000000000FF +
        0xdeadbee0 0xdeadbee1 0xdeadbee0 0xdeadbee0 +
        0xaddddddd 0xdddddddd 0xdeadbee0 0xdeadbee0 +
        0xdeadbee0 0xdeadbee0 0xdeadbee0 0xdeadbee0 +
        0xdeadbee0 0xdeadbee0 0xa7a7a7a7 0xa7a7a7a7

READIO 0x61170000078 8 0xa7a7a7a7 0xa7a7a7a7
