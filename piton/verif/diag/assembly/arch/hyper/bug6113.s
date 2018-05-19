// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: bug6113.s
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
/***************************************************************************
***
***  Program File: @(#)fplogic.s
***
****************************************************************************/

#define CREGS_FPRS_FEF 1
#define  H_HT0_Mem_Address_Not_Aligned_0x34 
#define My_HT0_Mem_Address_Not_Aligned_0x34 done;
#include "boot.s"


/****************START OF TEST*********************************************/


.text
.global main
ALIGN_PAGE_8K

user_text_start:

main:
	setx 0xe91ecee933bb2528, %l1, %i3
        setx 0xe91ecee933bb20ec, %l1, %o6
       .word   0xf1bec4ce

	ta	GOOD_TRAP

user_text_end:

.seg "data"
ALIGN_PAGE_8K

user_data_start:




sp_data_start:
	 .word 0x3f840041
	 .word 0x40284144
	 .word 0xf67890ab
	 .word 0x264fd879

sp_data_end:

dp_data_start:
.align 8
	 .word 0x56565656
	 .word 0x78787878
	 .word 0x4b4b4b4b
	 .word 0xc3c3c3c3
	 .word 0xdeadbeef
	 .word 0xdeadbeef
	 .word 0x21524110
	 .word 0x21345879

dp_data_end:


fsr_data_start:
.align 8

	 .word 0x0
	 .word 0x80000000


user_result_start:

user_data_end:

