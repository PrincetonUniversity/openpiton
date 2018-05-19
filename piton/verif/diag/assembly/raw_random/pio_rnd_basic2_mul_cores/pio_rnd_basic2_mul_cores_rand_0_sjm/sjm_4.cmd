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
#==================================================
#==================================================

WRITEMSKIO  0x00000613b8ceab40 0x0f00  0x00000000 0xb528bda5 0x00000000 0x00000000 

WRITEBLKIO  0x0000061abace0c80 +
        0x63ba8e5b 0xa0d48672 0x2e0f47f5 0x5deb92b8 +
        0x2b6faad8 0x915da3f9 0xd2328857 0xc77c7c60 +
        0xa00e3315 0x6c69077a 0x6c102b37 0xa81e4b86 +
        0x12dd547e 0x6453db06 0xa6a118e5 0x5fc7e6fe 

WRITEMSKIO  0x000006069a866600 0x00ff  0x00000000 0x00000000 0xe6638a8a 0xda62cf91 

READBLKIO  0x0000061abace0c80 +
        0x63ba8e5b 0xa0d48672 0x2e0f47f5 0x5deb92b8 +
        0x2b6faad8 0x915da3f9 0xd2328857 0xc77c7c60 +
        0xa00e3315 0x6c69077a 0x6c102b37 0xa81e4b86 +
        0x12dd547e 0x6453db06 0xa6a118e5 0x5fc7e6fe 

WRITEBLKIO  0x0000060b8813a4c0 +
        0xa2f3374f 0xb778c8a5 0x192945f3 0x7b25f712 +
        0x4c9306c2 0x3b987d8e 0x85eedb23 0x04e1b355 +
        0xa7035405 0x3b9605f4 0x4aaa55ee 0xa0924d5b +
        0x8b081ac0 0x8d9db3de 0xbc9cb083 0xd1c91ca0 

READBLKIO  0x0000060b8813a4c0 +
        0xa2f3374f 0xb778c8a5 0x192945f3 0x7b25f712 +
        0x4c9306c2 0x3b987d8e 0x85eedb23 0x04e1b355 +
        0xa7035405 0x3b9605f4 0x4aaa55ee 0xa0924d5b +
        0x8b081ac0 0x8d9db3de 0xbc9cb083 0xd1c91ca0 

WRITEIO  0x0000060ff5d1c5c0 4 0xd3a4068f 

READIO  0x0000060ff5d1c5c0 4 0xd3a4068f 
READMSKIO   0x00000613b8ceab40 0x0f00  0x00000000 0xb528bda5 0x00000000 0x00000000 

WRITEMSKIO  0x00000613b2533100 0xf0f0  0x53a6f330 0x00000000 0x43d751fa 0x00000000 

WRITEIO  0x0000060bf3676480 4 0xf4514405 

READMSKIO   0x000006069a866600 0x00ff  0x00000000 0x00000000 0xe6638a8a 0xda62cf91 

READMSKIO   0x00000613b2533100 0xf0f0  0x53a6f330 0x00000000 0x43d751fa 0x00000000 

WRITEBLKIO  0x0000060539198580 +
        0x715921e4 0x08f3d7d6 0x8e1a2abc 0xf25efada +
        0x49e9b8f2 0x756701db 0xa7402e21 0x5a250fc2 +
        0xf000a3f5 0x35a779b1 0x689deda5 0x67d596ca +
        0x0ba6c815 0x23c415c1 0x55aa7c5a 0xdceaa8bf 

READIO  0x0000060bf3676480 4 0xf4514405 
READBLKIO  0x0000060539198580 +
        0x715921e4 0x08f3d7d6 0x8e1a2abc 0xf25efada +
        0x49e9b8f2 0x756701db 0xa7402e21 0x5a250fc2 +
        0xf000a3f5 0x35a779b1 0x689deda5 0x67d596ca +
        0x0ba6c815 0x23c415c1 0x55aa7c5a 0xdceaa8bf 

WRITEBLK  0x00000016b854ab40 +
        0x0060d6b2 0x04637f79 0x7039f3b9 0x916a726d +
        0x078fe5da 0x63591c08 0x5debe287 0x2e585913 +
        0x6529299a 0x68dabd9f 0x95903426 0x08cd03c8 +
        0xf41ed4ca 0xb0f52818 0x2bb585b3 0xbd65b3db 

WRITEIO  0x0000060cc4231a00 4 0xbd95cc27 

READBLK  0x00000016b854ab40 +
        0x0060d6b2 0x04637f79 0x7039f3b9 0x916a726d +
        0x078fe5da 0x63591c08 0x5debe287 0x2e585913 +
        0x6529299a 0x68dabd9f 0x95903426 0x08cd03c8 +
        0xf41ed4ca 0xb0f52818 0x2bb585b3 0xbd65b3db 

WRITEIO  0x0000060ee3ec0cc0 8 0xd92ac04a 0xcb7e274b 

READIO  0x0000060cc4231a00 4 0xbd95cc27 
WRITEBLKIO  0x0000060bf2637940 +
        0x02e721f7 0x045888e3 0xc6db39b6 0xa7fe9c8d +
        0x78792dc5 0x9678c907 0xf5259b9c 0xb9ce41fc +
        0xc74d4d1e 0x37decdc7 0xa23d118b 0x550e3e28 +
        0x3382df25 0xf7ac8ea4 0x2dcffb72 0x9c5439f2 

WRITEBLKIO  0x0000061300c7b300 +
        0x16405cc8 0xa378b881 0xf39e9e5b 0xe9756f53 +
        0xae6e477e 0x105bc84f 0xe812365e 0xd114ece9 +
        0x2399cb8f 0x28880437 0x7c536e5a 0x4b77744c +
        0xad9e3456 0xb456ef18 0xea3004e5 0xdfa62974 
