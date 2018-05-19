// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ld_starve3.s
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
***  Test Description : interrupts
***
**********************************************************************/

#include "boot.s"

.text
.global main

main:

ta      T_CHANGE_PRIV
setx	0x80, %l1, %l7
th_fork(th_main, %l0)

!----------------------
th_main_0:
	setx	user_data_start, %l0, %o0
	ld	[%o0], %l1
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	nop; nop; nop; nop;
	setx	my_data0, %l0, %o0
	ld	[%o0], %l1
	setx	my_data1, %l0, %o0
	ld	[%o0], %l1
	setx	my_data2, %l0, %o0
	ld	[%o0], %l1
	setx	my_data3, %l0, %o0
	ld	[%o0], %l1
	setx	my_data4, %l0, %o0
	ld	[%o0], %l1
	setx	my_data5, %l0, %o0
	ld	[%o0], %l1
	setx	my_data6, %l0, %o0
	ld	[%o0], %l1
	setx	my_data7, %l0, %o0
	ld	[%o0], %l1

	ba 	normal_end
	nop

!----------------------
th_main_1:
	setx	user_data_start, %l0, %o0

loop1:
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	ba	loop1
	stxa    %o0,    [%o0] 0x22

th_main_2:
	setx	user_data_start, %l0, %o0
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22

loop2:
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	ba	loop2
	stxa    %o0,    [%o0] 0x22

th_main_3:

	setx	user_data_start, %l0, %o0
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22

loop3:
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	stxa    %o0,    [%o0] 0x22
	ba	loop3
	stxa    %o0,    [%o0] 0x22

th_main_4:
th_main_5:
th_main_6:
th_main_7:
th_main_8:
th_main_9:
th_main_10:
th_main_11:
th_main_12:
th_main_13:
th_main_14:
th_main_15:
th_main_16:
th_main_17:
th_main_18:
th_main_19:
th_main_20:
th_main_21:
th_main_22:
th_main_23:
th_main_24:
th_main_25:
th_main_26:
th_main_27:
th_main_28:
th_main_29:
th_main_30:
th_main_31:


normal_end:
        ta      T_GOOD_TRAP
bad_end:
        ta      T_BAD_TRAP


user_text_end:

/***********************************************************************
   Test case data start
 ***********************************************************************/
.data
user_data_start:
	.skip 1000
user_data_end:

SECTION .MY_DATA0  DATA_VA=0xd0100000
attr_data {
        Name = .MY_DATA0,
        VA= 0x0d0100000
        RA= 0x1d0100000
        PA= ra2pa(0x1d0100000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data0
my_data0:
        .xword 0x0

SECTION .MY_DATA1  DATA_VA=0xd1110000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1110000,
        RA= 0x1d1110000,
        PA= ra2pa(0x1d1110000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data1
my_data1:
        .xword 0x0


SECTION .MY_DATA2  DATA_VA=0xd1210000
attr_data {
        Name = .MY_DATA2,
        VA= 0x0d1210000,
        RA= 0x1d1210000,
        PA= ra2pa(0x1d1210000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data2
my_data2:
        .xword 0x0


SECTION .MY_DATA3  DATA_VA=0xd1310000
attr_data {
        Name = .MY_DATA3,
        VA= 0x0d1310000,
        RA= 0x1d1310000,
        PA= ra2pa(0x1d1310000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data3
my_data3:
        .xword 0x0


SECTION .MY_DATA4  DATA_VA=0xd1410000
attr_data {
        Name = .MY_DATA4,
        VA= 0x0d1410000,
        RA= 0x1d1410000,
        PA= ra2pa(0x1d1410000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data4
my_data4:
        .xword 0x0


SECTION .MY_DATA5  DATA_VA=0xd1510000
attr_data {
        Name = .MY_DATA5,
        VA= 0x0d1510000,
        RA= 0x1d1510000,
        PA= ra2pa(0x1d1510000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data5
my_data5:
        .xword 0x0


SECTION .MY_DATA6  DATA_VA=0xd1610000
attr_data {
        Name = .MY_DATA6,
        VA= 0x0d1610000,
        RA= 0x1d1610000,
        PA= ra2pa(0x1d1610000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data6
my_data6:
        .xword 0x0


SECTION .MY_DATA7  DATA_VA=0xd1710000
attr_data {
        Name = .MY_DATA7,
        VA= 0x0d1710000,
        RA= 0x1d1710000,
        PA= ra2pa(0x1d1710000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data
.global my_data7
my_data7:
        .xword 0x0

.end
