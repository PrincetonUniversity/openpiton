// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: iob_tap.s
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/
/***********************************************************************
 * Name:   iob_tap.s
 *
 *  Description: Dummy wait sparc while tap accesses iob.
 *
 **********************************************************************/
#define MAIN_PAGE_HV_ALSO
#include "iob_defines.h"
#include "boot.s"
        
.text
.align 64
.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing. No need to run more than one core,
	! and no need to differentiate the threads because nobody stores
	! anything.
th_main_31:    
th_main_30:    
th_main_29:    
th_main_28:    
th_main_27:    
th_main_26:    
th_main_25:    
th_main_24:    
th_main_23:    
th_main_22:    
th_main_21:    
th_main_20:    
th_main_19:    
th_main_18:    
th_main_17:    
th_main_16:    
th_main_15:    
th_main_14:    
th_main_13:    
th_main_12:    
th_main_11:    
th_main_10:    
th_main_9:    
th_main_8:    
th_main_7:    
th_main_6:    
th_main_5:    
th_main_4:    
th_main_3:    
th_main_2:    
th_main_1:
th_main_0:

        ta      T_CHANGE_HPRIV  ! Operations can only be done in hyper visor priv mode.
        nop

        setx    0x0000009800000800,     %l0,    %g1     ! Register address.

        set     1,              %g2     ! Number of threads.
        set     0,              %g6     ! Thread stride.
        rdth_id        
        mov     %o1,            %g3     ! Current threads to receive request.
        
        ! Issue idle request.	
issue_idl:		
	set     IOB_INT_IOB_VEC,        %l1
        set     0x0,    %l2
        sll     %g3,    0x8,    %l2
        set     0x2,    %g4
        set     0x0,    %l3
        sll     %g4,    0x10,   %l3
        or      %l2,    %l3,    %l4
        or      %l1,    %l4,    %l5
        stx     %l5,    [%g1]

.data
	 .word 0x1ff63767
	 .word 0x50b49bf0
	 .word 0x5c3e701
	 .word 0x739374a4
	 .word 0x33f9a808
	 .word 0x8d3bace5
	 .word 0x2b5a9266
	 .word 0x36857cf7
	 .word 0xffdbc2eb
	 .word 0x24f415e4
	 .word 0x2d82e3e1
	 .word 0x5dd7dd28
	 .word 0x712dc6f6
	 .word 0x1869ce6a
	 .word 0xe08013ab
	 .word 0x13f37d8e
	 .word 0xb21b985f
	 .word 0xc8fde7
	 .word 0x86b069a8
	 .word 0xaeac6759
	 .word 0x337efaa7
	 .word 0xa50ee0a0
	 .word 0xfe338a70
	 .word 0xeec08e1d
	 .word 0xdc97f5c5
	 .word 0x5a6996d7
	 .word 0xb0001ac
	 .word 0x42bb2d92
	 .word 0x34c9daa6
	 .word 0x4ea3422a
	 .word 0x13169da2
	 .word 0xd189bf94
