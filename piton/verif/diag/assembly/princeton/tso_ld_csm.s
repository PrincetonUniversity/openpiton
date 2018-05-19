// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tso_ld_starve1.s
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

setx	0x80, %l1, %l7
th_fork(th_main, %l0)

!----------------------
th_main_0:

	setx	my_data0, %l0, %o0
    st	%l0, [%o0]

	setx	my_data1, %l0, %o0
    st	%l0, [%o0]

	setx	my_data2, %l0, %o0
    st	%l0, [%o0]

	setx	my_data3, %l0, %o0
    st	%l0, [%o0]

	setx	my_data4, %l0, %o0
    st	%l0, [%o0]

	setx	my_data5, %l0, %o0
    st	%l0, [%o0]

	setx	my_data6, %l0, %o0
    st	%l0, [%o0]

	setx	my_data7, %l0, %o0
    st	%l0, [%o0]

	setx	my_data8, %l0, %o0
    st	%l0, [%o0]

	setx	my_data9, %l0, %o0
    st	%l0, [%o0]

	setx	my_data10, %l0, %o0
    st	%l0, [%o0]

	setx	my_data11, %l0, %o0
    st	%l0, [%o0]

	setx	my_data12, %l0, %o0
    st	%l0, [%o0]

	setx	my_data13, %l0, %o0
    st	%l0, [%o0]

	setx	my_data14, %l0, %o0
    st	%l0, [%o0]

	setx	my_data15, %l0, %o0
    st	%l0, [%o0]

	setx	my_data16, %l0, %o0
    st	%l0, [%o0]

	setx	my_data17, %l0, %o0
    st	%l0, [%o0]

	setx	my_data18, %l0, %o0
    st	%l0, [%o0]

	setx	my_data19, %l0, %o0
    st	%l0, [%o0]

	setx	my_data20, %l0, %o0
    st	%l0, [%o0]

	setx	my_data21, %l0, %o0
    st	%l0, [%o0]

	setx	my_data22, %l0, %o0
    st	%l0, [%o0]

	setx	my_data23, %l0, %o0
    st	%l0, [%o0]

	setx	my_data24, %l0, %o0
    st	%l0, [%o0]

	setx	my_data25, %l0, %o0
    st	%l0, [%o0]

	setx	my_data26, %l0, %o0
    st	%l0, [%o0]

	setx	my_data27, %l0, %o0
    st	%l0, [%o0]

	setx	my_data28, %l0, %o0
    st	%l0, [%o0]

	setx	my_data29, %l0, %o0
    st	%l0, [%o0]

	setx	my_data30, %l0, %o0
    st	%l0, [%o0]

	setx	my_data31, %l0, %o0
    st	%l0, [%o0]

	setx	my_data32, %l0, %o0
    st	%l0, [%o0]

	setx	my_data33, %l0, %o0
    st	%l0, [%o0]

	setx	my_data34, %l0, %o0
    st	%l0, [%o0]

	setx	my_data35, %l0, %o0
    st	%l0, [%o0]

	setx	my_data36, %l0, %o0
    st	%l0, [%o0]

	setx	my_data37, %l0, %o0
    st	%l0, [%o0]

	setx	my_data38, %l0, %o0
    st	%l0, [%o0]

	setx	my_data39, %l0, %o0
    st	%l0, [%o0]

	setx	my_data40, %l0, %o0
    st	%l0, [%o0]

	setx	my_data41, %l0, %o0
    st	%l0, [%o0]

	setx	my_data42, %l0, %o0
    st	%l0, [%o0]

	setx	my_data43, %l0, %o0
    st	%l0, [%o0]

	setx	my_data44, %l0, %o0
    st	%l0, [%o0]

	setx	my_data45, %l0, %o0
    st	%l0, [%o0]

	setx	my_data46, %l0, %o0
    st	%l0, [%o0]

	setx	my_data47, %l0, %o0
    st	%l0, [%o0]

	setx	my_data48, %l0, %o0
    st	%l0, [%o0]

	setx	my_data49, %l0, %o0
    st	%l0, [%o0]

	setx	my_data50, %l0, %o0
    st	%l0, [%o0]

	setx	my_data51, %l0, %o0
    st	%l0, [%o0]

	setx	my_data52, %l0, %o0
    st	%l0, [%o0]

	setx	my_data53, %l0, %o0
    st	%l0, [%o0]

	setx	my_data54, %l0, %o0
    st	%l0, [%o0]

	setx	my_data55, %l0, %o0
    st	%l0, [%o0]

	setx	my_data56, %l0, %o0
    st	%l0, [%o0]

	setx	my_data57, %l0, %o0
    st	%l0, [%o0]

	setx	my_data58, %l0, %o0
    st	%l0, [%o0]

	setx	my_data59, %l0, %o0
    st	%l0, [%o0]

	setx	my_data60, %l0, %o0
    st	%l0, [%o0]

	setx	my_data61, %l0, %o0
    st	%l0, [%o0]

	setx	my_data62, %l0, %o0
    st	%l0, [%o0]

	setx	my_data63, %l0, %o0
    st	%l0, [%o0]

	setx	my_data0, %l0, %o0
    st	%l0, [%o0]

	setx	my_data1, %l0, %o0
    st	%l0, [%o0]

	setx	my_data2, %l0, %o0
    st	%l0, [%o0]

	setx	my_data3, %l0, %o0
    st	%l0, [%o0]

	setx	my_data4, %l0, %o0
    st	%l0, [%o0]

	setx	my_data5, %l0, %o0
    st	%l0, [%o0]

	setx	my_data6, %l0, %o0
    st	%l0, [%o0]

	setx	my_data7, %l0, %o0
    st	%l0, [%o0]

	setx	my_data8, %l0, %o0
    st	%l0, [%o0]

	setx	my_data9, %l0, %o0
    st	%l0, [%o0]

	setx	my_data10, %l0, %o0
    st	%l0, [%o0]

	setx	my_data11, %l0, %o0
    st	%l0, [%o0]

	setx	my_data12, %l0, %o0
    st	%l0, [%o0]

	setx	my_data13, %l0, %o0
    st	%l0, [%o0]

	setx	my_data14, %l0, %o0
    st	%l0, [%o0]

	setx	my_data15, %l0, %o0
    st	%l0, [%o0]

	setx	my_data16, %l0, %o0
    st	%l0, [%o0]

	setx	my_data17, %l0, %o0
    st	%l0, [%o0]

	setx	my_data18, %l0, %o0
    st	%l0, [%o0]

	setx	my_data19, %l0, %o0
    st	%l0, [%o0]

	setx	my_data20, %l0, %o0
    st	%l0, [%o0]

	setx	my_data21, %l0, %o0
    st	%l0, [%o0]

	setx	my_data22, %l0, %o0
    st	%l0, [%o0]

	setx	my_data23, %l0, %o0
    st	%l0, [%o0]

	setx	my_data24, %l0, %o0
    st	%l0, [%o0]

	setx	my_data25, %l0, %o0
    st	%l0, [%o0]

	setx	my_data26, %l0, %o0
    st	%l0, [%o0]

	setx	my_data27, %l0, %o0
    st	%l0, [%o0]

	setx	my_data28, %l0, %o0
    st	%l0, [%o0]

	setx	my_data29, %l0, %o0
    st	%l0, [%o0]

	setx	my_data30, %l0, %o0
    st	%l0, [%o0]

	setx	my_data31, %l0, %o0
    st	%l0, [%o0]

	setx	my_data32, %l0, %o0
    st	%l0, [%o0]

	setx	my_data33, %l0, %o0
    st	%l0, [%o0]

	setx	my_data34, %l0, %o0
    st	%l0, [%o0]

	setx	my_data35, %l0, %o0
    st	%l0, [%o0]

	setx	my_data36, %l0, %o0
    st	%l0, [%o0]

	setx	my_data37, %l0, %o0
    st	%l0, [%o0]

	setx	my_data38, %l0, %o0
    st	%l0, [%o0]

	setx	my_data39, %l0, %o0
    st	%l0, [%o0]

	setx	my_data40, %l0, %o0
    st	%l0, [%o0]

	setx	my_data41, %l0, %o0
    st	%l0, [%o0]

	setx	my_data42, %l0, %o0
    st	%l0, [%o0]

	setx	my_data43, %l0, %o0
    st	%l0, [%o0]

	setx	my_data44, %l0, %o0
    st	%l0, [%o0]

	setx	my_data45, %l0, %o0
    st	%l0, [%o0]

	setx	my_data46, %l0, %o0
    st	%l0, [%o0]

	setx	my_data47, %l0, %o0
    st	%l0, [%o0]

	setx	my_data48, %l0, %o0
    st	%l0, [%o0]

	setx	my_data49, %l0, %o0
    st	%l0, [%o0]

	setx	my_data50, %l0, %o0
    st	%l0, [%o0]

	setx	my_data51, %l0, %o0
    st	%l0, [%o0]

	setx	my_data52, %l0, %o0
    st	%l0, [%o0]

	setx	my_data53, %l0, %o0
    st	%l0, [%o0]

	setx	my_data54, %l0, %o0
    st	%l0, [%o0]

	setx	my_data55, %l0, %o0
    st	%l0, [%o0]

	setx	my_data56, %l0, %o0
    st	%l0, [%o0]

	setx	my_data57, %l0, %o0
    st	%l0, [%o0]

	setx	my_data58, %l0, %o0
    st	%l0, [%o0]

	setx	my_data59, %l0, %o0
    st	%l0, [%o0]

	setx	my_data60, %l0, %o0
    st	%l0, [%o0]

	setx	my_data61, %l0, %o0
    st	%l0, [%o0]

	setx	my_data62, %l0, %o0
    st	%l0, [%o0]

	setx	my_data63, %l0, %o0
    st	%l0, [%o0]

	setx	my_data0, %l0, %o0
    st	%l0, [%o0]

	setx	my_data1, %l0, %o0
    st	%l0, [%o0]

	setx	my_data2, %l0, %o0
    st	%l0, [%o0]

	setx	my_data3, %l0, %o0
    st	%l0, [%o0]

	setx	my_data4, %l0, %o0
    st	%l0, [%o0]

	setx	my_data5, %l0, %o0
    st	%l0, [%o0]

	setx	my_data6, %l0, %o0
    st	%l0, [%o0]

	setx	my_data7, %l0, %o0
    st	%l0, [%o0]

	setx	my_data8, %l0, %o0
    st	%l0, [%o0]

	setx	my_data9, %l0, %o0
    st	%l0, [%o0]

	setx	my_data10, %l0, %o0
    st	%l0, [%o0]

	setx	my_data11, %l0, %o0
    st	%l0, [%o0]

	setx	my_data12, %l0, %o0
    st	%l0, [%o0]

	setx	my_data13, %l0, %o0
    st	%l0, [%o0]

	setx	my_data14, %l0, %o0
    st	%l0, [%o0]

	setx	my_data15, %l0, %o0
    st	%l0, [%o0]

	setx	my_data16, %l0, %o0
    st	%l0, [%o0]

	setx	my_data17, %l0, %o0
    st	%l0, [%o0]

	setx	my_data18, %l0, %o0
    st	%l0, [%o0]

	setx	my_data19, %l0, %o0
    st	%l0, [%o0]

	setx	my_data20, %l0, %o0
    st	%l0, [%o0]

	setx	my_data21, %l0, %o0
    st	%l0, [%o0]

	setx	my_data22, %l0, %o0
    st	%l0, [%o0]

	setx	my_data23, %l0, %o0
    st	%l0, [%o0]

	setx	my_data24, %l0, %o0
    st	%l0, [%o0]

	setx	my_data25, %l0, %o0
    st	%l0, [%o0]

	setx	my_data26, %l0, %o0
    st	%l0, [%o0]

	setx	my_data27, %l0, %o0
    st	%l0, [%o0]

	setx	my_data28, %l0, %o0
    st	%l0, [%o0]

	setx	my_data29, %l0, %o0
    st	%l0, [%o0]

	setx	my_data30, %l0, %o0
    st	%l0, [%o0]

	setx	my_data31, %l0, %o0
    st	%l0, [%o0]

	setx	my_data32, %l0, %o0
    st	%l0, [%o0]

	setx	my_data33, %l0, %o0
    st	%l0, [%o0]

	setx	my_data34, %l0, %o0
    st	%l0, [%o0]

	setx	my_data35, %l0, %o0
    st	%l0, [%o0]

	setx	my_data36, %l0, %o0
    st	%l0, [%o0]

	setx	my_data37, %l0, %o0
    st	%l0, [%o0]

	setx	my_data38, %l0, %o0
    st	%l0, [%o0]

	setx	my_data39, %l0, %o0
    st	%l0, [%o0]

	setx	my_data40, %l0, %o0
    st	%l0, [%o0]

	setx	my_data41, %l0, %o0
    st	%l0, [%o0]

	setx	my_data42, %l0, %o0
    st	%l0, [%o0]

	setx	my_data43, %l0, %o0
    st	%l0, [%o0]

	setx	my_data44, %l0, %o0
    st	%l0, [%o0]

	setx	my_data45, %l0, %o0
    st	%l0, [%o0]

	setx	my_data46, %l0, %o0
    st	%l0, [%o0]

	setx	my_data47, %l0, %o0
    st	%l0, [%o0]

	setx	my_data48, %l0, %o0
    st	%l0, [%o0]

	setx	my_data49, %l0, %o0
    st	%l0, [%o0]

	setx	my_data50, %l0, %o0
    st	%l0, [%o0]

	setx	my_data51, %l0, %o0
    st	%l0, [%o0]

	setx	my_data52, %l0, %o0
    st	%l0, [%o0]

	setx	my_data53, %l0, %o0
    st	%l0, [%o0]

	setx	my_data54, %l0, %o0
    st	%l0, [%o0]

	setx	my_data55, %l0, %o0
    st	%l0, [%o0]

	setx	my_data56, %l0, %o0
    st	%l0, [%o0]

	setx	my_data57, %l0, %o0
    st	%l0, [%o0]

	setx	my_data58, %l0, %o0
    st	%l0, [%o0]

	setx	my_data59, %l0, %o0
    st	%l0, [%o0]

	setx	my_data60, %l0, %o0
    st	%l0, [%o0]

	setx	my_data61, %l0, %o0
    st	%l0, [%o0]

	setx	my_data62, %l0, %o0
    st	%l0, [%o0]

	setx	my_data63, %l0, %o0
    st	%l0, [%o0]

	setx	my_data0, %l0, %o0
    st	%l0, [%o0]

	setx	my_data1, %l0, %o0
    st	%l0, [%o0]

	setx	my_data2, %l0, %o0
    st	%l0, [%o0]

	setx	my_data3, %l0, %o0
    st	%l0, [%o0]

	setx	my_data4, %l0, %o0
    st	%l0, [%o0]

	setx	my_data5, %l0, %o0
    st	%l0, [%o0]

	setx	my_data6, %l0, %o0
    st	%l0, [%o0]

	setx	my_data7, %l0, %o0
    st	%l0, [%o0]

	setx	my_data8, %l0, %o0
    st	%l0, [%o0]

	setx	my_data9, %l0, %o0
    st	%l0, [%o0]

	setx	my_data10, %l0, %o0
    st	%l0, [%o0]

	setx	my_data11, %l0, %o0
    st	%l0, [%o0]

	setx	my_data12, %l0, %o0
    st	%l0, [%o0]

	setx	my_data13, %l0, %o0
    st	%l0, [%o0]

	setx	my_data14, %l0, %o0
    st	%l0, [%o0]

	setx	my_data15, %l0, %o0
    st	%l0, [%o0]

	setx	my_data16, %l0, %o0
    st	%l0, [%o0]

	setx	my_data17, %l0, %o0
    st	%l0, [%o0]

	setx	my_data18, %l0, %o0
    st	%l0, [%o0]

	setx	my_data19, %l0, %o0
    st	%l0, [%o0]

	setx	my_data20, %l0, %o0
    st	%l0, [%o0]

	setx	my_data21, %l0, %o0
    st	%l0, [%o0]

	setx	my_data22, %l0, %o0
    st	%l0, [%o0]

	setx	my_data23, %l0, %o0
    st	%l0, [%o0]

	setx	my_data24, %l0, %o0
    st	%l0, [%o0]

	setx	my_data25, %l0, %o0
    st	%l0, [%o0]

	setx	my_data26, %l0, %o0
    st	%l0, [%o0]

	setx	my_data27, %l0, %o0
    st	%l0, [%o0]

	setx	my_data28, %l0, %o0
    st	%l0, [%o0]

	setx	my_data29, %l0, %o0
    st	%l0, [%o0]

	setx	my_data30, %l0, %o0
    st	%l0, [%o0]

	setx	my_data31, %l0, %o0
    st	%l0, [%o0]

	setx	my_data32, %l0, %o0
    st	%l0, [%o0]

	setx	my_data33, %l0, %o0
    st	%l0, [%o0]

	setx	my_data34, %l0, %o0
    st	%l0, [%o0]

	setx	my_data35, %l0, %o0
    st	%l0, [%o0]

	setx	my_data36, %l0, %o0
    st	%l0, [%o0]

	setx	my_data37, %l0, %o0
    st	%l0, [%o0]

	setx	my_data38, %l0, %o0
    st	%l0, [%o0]

	setx	my_data39, %l0, %o0
    st	%l0, [%o0]

	setx	my_data40, %l0, %o0
    st	%l0, [%o0]

	setx	my_data41, %l0, %o0
    st	%l0, [%o0]

	setx	my_data42, %l0, %o0
    st	%l0, [%o0]

	setx	my_data43, %l0, %o0
    st	%l0, [%o0]

	setx	my_data44, %l0, %o0
    st	%l0, [%o0]

	setx	my_data45, %l0, %o0
    st	%l0, [%o0]

	setx	my_data46, %l0, %o0
    st	%l0, [%o0]

	setx	my_data47, %l0, %o0
    st	%l0, [%o0]

	setx	my_data48, %l0, %o0
    st	%l0, [%o0]

	setx	my_data49, %l0, %o0
    st	%l0, [%o0]

	setx	my_data50, %l0, %o0
    st	%l0, [%o0]

	setx	my_data51, %l0, %o0
    st	%l0, [%o0]

	setx	my_data52, %l0, %o0
    st	%l0, [%o0]

	setx	my_data53, %l0, %o0
    st	%l0, [%o0]

	setx	my_data54, %l0, %o0
    st	%l0, [%o0]

	setx	my_data55, %l0, %o0
    st	%l0, [%o0]

	setx	my_data56, %l0, %o0
    st	%l0, [%o0]

	setx	my_data57, %l0, %o0
    st	%l0, [%o0]

	setx	my_data58, %l0, %o0
    st	%l0, [%o0]

	setx	my_data59, %l0, %o0
    st	%l0, [%o0]

	setx	my_data60, %l0, %o0
    st	%l0, [%o0]

	setx	my_data61, %l0, %o0
    st	%l0, [%o0]

	setx	my_data62, %l0, %o0
    st	%l0, [%o0]

	setx	my_data63, %l0, %o0
    st	%l0, [%o0]


	ba 	normal_end
	nop


th_main_1:
th_main_2:
th_main_3:
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


	setx	my_data0, %l0, %o0
	ld	[%o0], %l0

	setx	my_data1, %l0, %o0
	ld	[%o0], %l0

	setx	my_data2, %l0, %o0
	ld	[%o0], %l0

	setx	my_data3, %l0, %o0
	ld	[%o0], %l0

	setx	my_data4, %l0, %o0
	ld	[%o0], %l0

	setx	my_data5, %l0, %o0
	ld	[%o0], %l0

	setx	my_data6, %l0, %o0
	ld	[%o0], %l0

	setx	my_data7, %l0, %o0
	ld	[%o0], %l0

	setx	my_data8, %l0, %o0
	ld	[%o0], %l0

	setx	my_data9, %l0, %o0
	ld	[%o0], %l0

	setx	my_data10, %l0, %o0
	ld	[%o0], %l0

	setx	my_data11, %l0, %o0
	ld	[%o0], %l0

	setx	my_data12, %l0, %o0
	ld	[%o0], %l0

	setx	my_data13, %l0, %o0
	ld	[%o0], %l0

	setx	my_data14, %l0, %o0
	ld	[%o0], %l0

	setx	my_data15, %l0, %o0
	ld	[%o0], %l0

	setx	my_data16, %l0, %o0
	ld	[%o0], %l0

	setx	my_data17, %l0, %o0
	ld	[%o0], %l0

	setx	my_data18, %l0, %o0
	ld	[%o0], %l0

	setx	my_data19, %l0, %o0
	ld	[%o0], %l0

	setx	my_data20, %l0, %o0
	ld	[%o0], %l0

	setx	my_data21, %l0, %o0
	ld	[%o0], %l0

	setx	my_data22, %l0, %o0
	ld	[%o0], %l0

	setx	my_data23, %l0, %o0
	ld	[%o0], %l0

	setx	my_data24, %l0, %o0
	ld	[%o0], %l0

	setx	my_data25, %l0, %o0
	ld	[%o0], %l0

	setx	my_data26, %l0, %o0
	ld	[%o0], %l0

	setx	my_data27, %l0, %o0
	ld	[%o0], %l0

	setx	my_data28, %l0, %o0
	ld	[%o0], %l0

	setx	my_data29, %l0, %o0
	ld	[%o0], %l0

	setx	my_data30, %l0, %o0
	ld	[%o0], %l0

	setx	my_data31, %l0, %o0
	ld	[%o0], %l0

	setx	my_data32, %l0, %o0
	ld	[%o0], %l0

	setx	my_data33, %l0, %o0
	ld	[%o0], %l0

	setx	my_data34, %l0, %o0
	ld	[%o0], %l0

	setx	my_data35, %l0, %o0
	ld	[%o0], %l0

	setx	my_data36, %l0, %o0
	ld	[%o0], %l0

	setx	my_data37, %l0, %o0
	ld	[%o0], %l0

	setx	my_data38, %l0, %o0
	ld	[%o0], %l0

	setx	my_data39, %l0, %o0
	ld	[%o0], %l0

	setx	my_data40, %l0, %o0
	ld	[%o0], %l0

	setx	my_data41, %l0, %o0
	ld	[%o0], %l0

	setx	my_data42, %l0, %o0
	ld	[%o0], %l0

	setx	my_data43, %l0, %o0
	ld	[%o0], %l0

	setx	my_data44, %l0, %o0
	ld	[%o0], %l0

	setx	my_data45, %l0, %o0
	ld	[%o0], %l0

	setx	my_data46, %l0, %o0
	ld	[%o0], %l0

	setx	my_data47, %l0, %o0
	ld	[%o0], %l0

	setx	my_data48, %l0, %o0
	ld	[%o0], %l0

	setx	my_data49, %l0, %o0
	ld	[%o0], %l0

	setx	my_data50, %l0, %o0
	ld	[%o0], %l0

	setx	my_data51, %l0, %o0
	ld	[%o0], %l0

	setx	my_data52, %l0, %o0
	ld	[%o0], %l0

	setx	my_data53, %l0, %o0
	ld	[%o0], %l0

	setx	my_data54, %l0, %o0
	ld	[%o0], %l0

	setx	my_data55, %l0, %o0
	ld	[%o0], %l0

	setx	my_data56, %l0, %o0
	ld	[%o0], %l0

	setx	my_data57, %l0, %o0
	ld	[%o0], %l0

	setx	my_data58, %l0, %o0
	ld	[%o0], %l0

	setx	my_data59, %l0, %o0
	ld	[%o0], %l0

	setx	my_data60, %l0, %o0
	ld	[%o0], %l0

	setx	my_data61, %l0, %o0
	ld	[%o0], %l0

	setx	my_data62, %l0, %o0
	ld	[%o0], %l0

	setx	my_data63, %l0, %o0
	ld	[%o0], %l0

	setx	my_data0, %l0, %o0
	ld	[%o0], %l0

	setx	my_data1, %l0, %o0
	ld	[%o0], %l0

	setx	my_data2, %l0, %o0
	ld	[%o0], %l0

	setx	my_data3, %l0, %o0
	ld	[%o0], %l0

	setx	my_data4, %l0, %o0
	ld	[%o0], %l0

	setx	my_data5, %l0, %o0
	ld	[%o0], %l0

	setx	my_data6, %l0, %o0
	ld	[%o0], %l0

	setx	my_data7, %l0, %o0
	ld	[%o0], %l0

	setx	my_data8, %l0, %o0
	ld	[%o0], %l0

	setx	my_data9, %l0, %o0
	ld	[%o0], %l0

	setx	my_data10, %l0, %o0
	ld	[%o0], %l0

	setx	my_data11, %l0, %o0
	ld	[%o0], %l0

	setx	my_data12, %l0, %o0
	ld	[%o0], %l0

	setx	my_data13, %l0, %o0
	ld	[%o0], %l0

	setx	my_data14, %l0, %o0
	ld	[%o0], %l0

	setx	my_data15, %l0, %o0
	ld	[%o0], %l0

	setx	my_data16, %l0, %o0
	ld	[%o0], %l0

	setx	my_data17, %l0, %o0
	ld	[%o0], %l0

	setx	my_data18, %l0, %o0
	ld	[%o0], %l0

	setx	my_data19, %l0, %o0
	ld	[%o0], %l0

	setx	my_data20, %l0, %o0
	ld	[%o0], %l0

	setx	my_data21, %l0, %o0
	ld	[%o0], %l0

	setx	my_data22, %l0, %o0
	ld	[%o0], %l0

	setx	my_data23, %l0, %o0
	ld	[%o0], %l0

	setx	my_data24, %l0, %o0
	ld	[%o0], %l0

	setx	my_data25, %l0, %o0
	ld	[%o0], %l0

	setx	my_data26, %l0, %o0
	ld	[%o0], %l0

	setx	my_data27, %l0, %o0
	ld	[%o0], %l0

	setx	my_data28, %l0, %o0
	ld	[%o0], %l0

	setx	my_data29, %l0, %o0
	ld	[%o0], %l0

	setx	my_data30, %l0, %o0
	ld	[%o0], %l0

	setx	my_data31, %l0, %o0
	ld	[%o0], %l0

	setx	my_data32, %l0, %o0
	ld	[%o0], %l0

	setx	my_data33, %l0, %o0
	ld	[%o0], %l0

	setx	my_data34, %l0, %o0
	ld	[%o0], %l0

	setx	my_data35, %l0, %o0
	ld	[%o0], %l0

	setx	my_data36, %l0, %o0
	ld	[%o0], %l0

	setx	my_data37, %l0, %o0
	ld	[%o0], %l0

	setx	my_data38, %l0, %o0
	ld	[%o0], %l0

	setx	my_data39, %l0, %o0
	ld	[%o0], %l0

	setx	my_data40, %l0, %o0
	ld	[%o0], %l0

	setx	my_data41, %l0, %o0
	ld	[%o0], %l0

	setx	my_data42, %l0, %o0
	ld	[%o0], %l0

	setx	my_data43, %l0, %o0
	ld	[%o0], %l0

	setx	my_data44, %l0, %o0
	ld	[%o0], %l0

	setx	my_data45, %l0, %o0
	ld	[%o0], %l0

	setx	my_data46, %l0, %o0
	ld	[%o0], %l0

	setx	my_data47, %l0, %o0
	ld	[%o0], %l0

	setx	my_data48, %l0, %o0
	ld	[%o0], %l0

	setx	my_data49, %l0, %o0
	ld	[%o0], %l0

	setx	my_data50, %l0, %o0
	ld	[%o0], %l0

	setx	my_data51, %l0, %o0
	ld	[%o0], %l0

	setx	my_data52, %l0, %o0
	ld	[%o0], %l0

	setx	my_data53, %l0, %o0
	ld	[%o0], %l0

	setx	my_data54, %l0, %o0
	ld	[%o0], %l0

	setx	my_data55, %l0, %o0
	ld	[%o0], %l0

	setx	my_data56, %l0, %o0
	ld	[%o0], %l0

	setx	my_data57, %l0, %o0
	ld	[%o0], %l0

	setx	my_data58, %l0, %o0
	ld	[%o0], %l0

	setx	my_data59, %l0, %o0
	ld	[%o0], %l0

	setx	my_data60, %l0, %o0
	ld	[%o0], %l0

	setx	my_data61, %l0, %o0
	ld	[%o0], %l0

	setx	my_data62, %l0, %o0
	ld	[%o0], %l0

	setx	my_data63, %l0, %o0
	ld	[%o0], %l0

	setx	my_data0, %l0, %o0
	ld	[%o0], %l0

	setx	my_data1, %l0, %o0
	ld	[%o0], %l0

	setx	my_data2, %l0, %o0
	ld	[%o0], %l0

	setx	my_data3, %l0, %o0
	ld	[%o0], %l0

	setx	my_data4, %l0, %o0
	ld	[%o0], %l0

	setx	my_data5, %l0, %o0
	ld	[%o0], %l0

	setx	my_data6, %l0, %o0
	ld	[%o0], %l0

	setx	my_data7, %l0, %o0
	ld	[%o0], %l0

	setx	my_data8, %l0, %o0
	ld	[%o0], %l0

	setx	my_data9, %l0, %o0
	ld	[%o0], %l0

	setx	my_data10, %l0, %o0
	ld	[%o0], %l0

	setx	my_data11, %l0, %o0
	ld	[%o0], %l0

	setx	my_data12, %l0, %o0
	ld	[%o0], %l0

	setx	my_data13, %l0, %o0
	ld	[%o0], %l0

	setx	my_data14, %l0, %o0
	ld	[%o0], %l0

	setx	my_data15, %l0, %o0
	ld	[%o0], %l0

	setx	my_data16, %l0, %o0
	ld	[%o0], %l0

	setx	my_data17, %l0, %o0
	ld	[%o0], %l0

	setx	my_data18, %l0, %o0
	ld	[%o0], %l0

	setx	my_data19, %l0, %o0
	ld	[%o0], %l0

	setx	my_data20, %l0, %o0
	ld	[%o0], %l0

	setx	my_data21, %l0, %o0
	ld	[%o0], %l0

	setx	my_data22, %l0, %o0
	ld	[%o0], %l0

	setx	my_data23, %l0, %o0
	ld	[%o0], %l0

	setx	my_data24, %l0, %o0
	ld	[%o0], %l0

	setx	my_data25, %l0, %o0
	ld	[%o0], %l0

	setx	my_data26, %l0, %o0
	ld	[%o0], %l0

	setx	my_data27, %l0, %o0
	ld	[%o0], %l0

	setx	my_data28, %l0, %o0
	ld	[%o0], %l0

	setx	my_data29, %l0, %o0
	ld	[%o0], %l0

	setx	my_data30, %l0, %o0
	ld	[%o0], %l0

	setx	my_data31, %l0, %o0
	ld	[%o0], %l0

	setx	my_data32, %l0, %o0
	ld	[%o0], %l0

	setx	my_data33, %l0, %o0
	ld	[%o0], %l0

	setx	my_data34, %l0, %o0
	ld	[%o0], %l0

	setx	my_data35, %l0, %o0
	ld	[%o0], %l0

	setx	my_data36, %l0, %o0
	ld	[%o0], %l0

	setx	my_data37, %l0, %o0
	ld	[%o0], %l0

	setx	my_data38, %l0, %o0
	ld	[%o0], %l0

	setx	my_data39, %l0, %o0
	ld	[%o0], %l0

	setx	my_data40, %l0, %o0
	ld	[%o0], %l0

	setx	my_data41, %l0, %o0
	ld	[%o0], %l0

	setx	my_data42, %l0, %o0
	ld	[%o0], %l0

	setx	my_data43, %l0, %o0
	ld	[%o0], %l0

	setx	my_data44, %l0, %o0
	ld	[%o0], %l0

	setx	my_data45, %l0, %o0
	ld	[%o0], %l0

	setx	my_data46, %l0, %o0
	ld	[%o0], %l0

	setx	my_data47, %l0, %o0
	ld	[%o0], %l0

	setx	my_data48, %l0, %o0
	ld	[%o0], %l0

	setx	my_data49, %l0, %o0
	ld	[%o0], %l0

	setx	my_data50, %l0, %o0
	ld	[%o0], %l0

	setx	my_data51, %l0, %o0
	ld	[%o0], %l0

	setx	my_data52, %l0, %o0
	ld	[%o0], %l0

	setx	my_data53, %l0, %o0
	ld	[%o0], %l0

	setx	my_data54, %l0, %o0
	ld	[%o0], %l0

	setx	my_data55, %l0, %o0
	ld	[%o0], %l0

	setx	my_data56, %l0, %o0
	ld	[%o0], %l0

	setx	my_data57, %l0, %o0
	ld	[%o0], %l0

	setx	my_data58, %l0, %o0
	ld	[%o0], %l0

	setx	my_data59, %l0, %o0
	ld	[%o0], %l0

	setx	my_data60, %l0, %o0
	ld	[%o0], %l0

	setx	my_data61, %l0, %o0
	ld	[%o0], %l0

	setx	my_data62, %l0, %o0
	ld	[%o0], %l0

	setx	my_data63, %l0, %o0
	ld	[%o0], %l0

	setx	my_data0, %l0, %o0
	ld	[%o0], %l0

	setx	my_data1, %l0, %o0
	ld	[%o0], %l0

	setx	my_data2, %l0, %o0
	ld	[%o0], %l0

	setx	my_data3, %l0, %o0
	ld	[%o0], %l0

	setx	my_data4, %l0, %o0
	ld	[%o0], %l0

	setx	my_data5, %l0, %o0
	ld	[%o0], %l0

	setx	my_data6, %l0, %o0
	ld	[%o0], %l0

	setx	my_data7, %l0, %o0
	ld	[%o0], %l0

	setx	my_data8, %l0, %o0
	ld	[%o0], %l0

	setx	my_data9, %l0, %o0
	ld	[%o0], %l0

	setx	my_data10, %l0, %o0
	ld	[%o0], %l0

	setx	my_data11, %l0, %o0
	ld	[%o0], %l0

	setx	my_data12, %l0, %o0
	ld	[%o0], %l0

	setx	my_data13, %l0, %o0
	ld	[%o0], %l0

	setx	my_data14, %l0, %o0
	ld	[%o0], %l0

	setx	my_data15, %l0, %o0
	ld	[%o0], %l0

	setx	my_data16, %l0, %o0
	ld	[%o0], %l0

	setx	my_data17, %l0, %o0
	ld	[%o0], %l0

	setx	my_data18, %l0, %o0
	ld	[%o0], %l0

	setx	my_data19, %l0, %o0
	ld	[%o0], %l0

	setx	my_data20, %l0, %o0
	ld	[%o0], %l0

	setx	my_data21, %l0, %o0
	ld	[%o0], %l0

	setx	my_data22, %l0, %o0
	ld	[%o0], %l0

	setx	my_data23, %l0, %o0
	ld	[%o0], %l0

	setx	my_data24, %l0, %o0
	ld	[%o0], %l0

	setx	my_data25, %l0, %o0
	ld	[%o0], %l0

	setx	my_data26, %l0, %o0
	ld	[%o0], %l0

	setx	my_data27, %l0, %o0
	ld	[%o0], %l0

	setx	my_data28, %l0, %o0
	ld	[%o0], %l0

	setx	my_data29, %l0, %o0
	ld	[%o0], %l0

	setx	my_data30, %l0, %o0
	ld	[%o0], %l0

	setx	my_data31, %l0, %o0
	ld	[%o0], %l0

	setx	my_data32, %l0, %o0
	ld	[%o0], %l0

	setx	my_data33, %l0, %o0
	ld	[%o0], %l0

	setx	my_data34, %l0, %o0
	ld	[%o0], %l0

	setx	my_data35, %l0, %o0
	ld	[%o0], %l0

	setx	my_data36, %l0, %o0
	ld	[%o0], %l0

	setx	my_data37, %l0, %o0
	ld	[%o0], %l0

	setx	my_data38, %l0, %o0
	ld	[%o0], %l0

	setx	my_data39, %l0, %o0
	ld	[%o0], %l0

	setx	my_data40, %l0, %o0
	ld	[%o0], %l0

	setx	my_data41, %l0, %o0
	ld	[%o0], %l0

	setx	my_data42, %l0, %o0
	ld	[%o0], %l0

	setx	my_data43, %l0, %o0
	ld	[%o0], %l0

	setx	my_data44, %l0, %o0
	ld	[%o0], %l0

	setx	my_data45, %l0, %o0
	ld	[%o0], %l0

	setx	my_data46, %l0, %o0
	ld	[%o0], %l0

	setx	my_data47, %l0, %o0
	ld	[%o0], %l0

	setx	my_data48, %l0, %o0
	ld	[%o0], %l0

	setx	my_data49, %l0, %o0
	ld	[%o0], %l0

	setx	my_data50, %l0, %o0
	ld	[%o0], %l0

	setx	my_data51, %l0, %o0
	ld	[%o0], %l0

	setx	my_data52, %l0, %o0
	ld	[%o0], %l0

	setx	my_data53, %l0, %o0
	ld	[%o0], %l0

	setx	my_data54, %l0, %o0
	ld	[%o0], %l0

	setx	my_data55, %l0, %o0
	ld	[%o0], %l0

	setx	my_data56, %l0, %o0
	ld	[%o0], %l0

	setx	my_data57, %l0, %o0
	ld	[%o0], %l0

	setx	my_data58, %l0, %o0
	ld	[%o0], %l0

	setx	my_data59, %l0, %o0
	ld	[%o0], %l0

	setx	my_data60, %l0, %o0
	ld	[%o0], %l0

	setx	my_data61, %l0, %o0
	ld	[%o0], %l0

	setx	my_data62, %l0, %o0
	ld	[%o0], %l0

	setx	my_data63, %l0, %o0
	ld	[%o0], %l0




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



SECTION .MY_DATA1  DATA_VA=0xd1112000
attr_data {
        Name = .MY_DATA1,
        VA= 0x0d1112000
        RA= 0x1d1112000
        PA= ra2pa(0x1d1112000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data1
my_data1:
        .xword 0x0

SECTION .MY_DATA2  DATA_VA=0xd1224000
attr_data {
        Name = .MY_DATA2,
        VA= 0x0d1224000
        RA= 0x1d1224000
        PA= ra2pa(0x1d1224000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data2
my_data2:
        .xword 0x0

SECTION .MY_DATA3  DATA_VA=0xd1336000
attr_data {
        Name = .MY_DATA3,
        VA= 0x0d1336000
        RA= 0x1d1336000
        PA= ra2pa(0x1d1336000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data3
my_data3:
        .xword 0x0

SECTION .MY_DATA4  DATA_VA=0xd1448000
attr_data {
        Name = .MY_DATA4,
        VA= 0x0d1448000
        RA= 0x1d1448000
        PA= ra2pa(0x1d1448000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data4
my_data4:
        .xword 0x0

SECTION .MY_DATA5  DATA_VA=0xd155a000
attr_data {
        Name = .MY_DATA5,
        VA= 0x0d155a000
        RA= 0x1d155a000
        PA= ra2pa(0x1d155a000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data5
my_data5:
        .xword 0x0

SECTION .MY_DATA6  DATA_VA=0xd166c000
attr_data {
        Name = .MY_DATA6,
        VA= 0x0d166c000
        RA= 0x1d166c000
        PA= ra2pa(0x1d166c000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data6
my_data6:
        .xword 0x0

SECTION .MY_DATA7  DATA_VA=0xd177e000
attr_data {
        Name = .MY_DATA7,
        VA= 0x0d177e000
        RA= 0x1d177e000
        PA= ra2pa(0x1d177e000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data7
my_data7:
        .xword 0x0

SECTION .MY_DATA8  DATA_VA=0xd1880000
attr_data {
        Name = .MY_DATA8,
        VA= 0x0d1880000
        RA= 0x1d1880000
        PA= ra2pa(0x1d1880000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data8
my_data8:
        .xword 0x0

SECTION .MY_DATA9  DATA_VA=0xd1992000
attr_data {
        Name = .MY_DATA9,
        VA= 0x0d1992000
        RA= 0x1d1992000
        PA= ra2pa(0x1d1992000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data9
my_data9:
        .xword 0x0

SECTION .MY_DATA10  DATA_VA=0xd1aa4000
attr_data {
        Name = .MY_DATA10,
        VA= 0x0d1aa4000
        RA= 0x1d1aa4000
        PA= ra2pa(0x1d1aa4000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data10
my_data10:
        .xword 0x0

SECTION .MY_DATA11  DATA_VA=0xd1bb6000
attr_data {
        Name = .MY_DATA11,
        VA= 0x0d1bb6000
        RA= 0x1d1bb6000
        PA= ra2pa(0x1d1bb6000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data11
my_data11:
        .xword 0x0

SECTION .MY_DATA12  DATA_VA=0xd1cc8000
attr_data {
        Name = .MY_DATA12,
        VA= 0x0d1cc8000
        RA= 0x1d1cc8000
        PA= ra2pa(0x1d1cc8000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data12
my_data12:
        .xword 0x0

SECTION .MY_DATA13  DATA_VA=0xd1dda000
attr_data {
        Name = .MY_DATA13,
        VA= 0x0d1dda000
        RA= 0x1d1dda000
        PA= ra2pa(0x1d1dda000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data13
my_data13:
        .xword 0x0

SECTION .MY_DATA14  DATA_VA=0xd1eec000
attr_data {
        Name = .MY_DATA14,
        VA= 0x0d1eec000
        RA= 0x1d1eec000
        PA= ra2pa(0x1d1eec000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data14
my_data14:
        .xword 0x0

SECTION .MY_DATA15  DATA_VA=0xd1ffe000
attr_data {
        Name = .MY_DATA15,
        VA= 0x0d1ffe000
        RA= 0x1d1ffe000
        PA= ra2pa(0x1d1ffe000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data15
my_data15:
        .xword 0x0

SECTION .MY_DATA16  DATA_VA=0xd2000000
attr_data {
        Name = .MY_DATA16,
        VA= 0x0d2000000
        RA= 0x1d2000000
        PA= ra2pa(0x1d2000000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data16
my_data16:
        .xword 0x0

SECTION .MY_DATA17  DATA_VA=0xd2112000
attr_data {
        Name = .MY_DATA17,
        VA= 0x0d2112000
        RA= 0x1d2112000
        PA= ra2pa(0x1d2112000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data17
my_data17:
        .xword 0x0

SECTION .MY_DATA18  DATA_VA=0xd2224000
attr_data {
        Name = .MY_DATA18,
        VA= 0x0d2224000
        RA= 0x1d2224000
        PA= ra2pa(0x1d2224000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data18
my_data18:
        .xword 0x0

SECTION .MY_DATA19  DATA_VA=0xd2336000
attr_data {
        Name = .MY_DATA19,
        VA= 0x0d2336000
        RA= 0x1d2336000
        PA= ra2pa(0x1d2336000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data19
my_data19:
        .xword 0x0

SECTION .MY_DATA20  DATA_VA=0xd2448000
attr_data {
        Name = .MY_DATA20,
        VA= 0x0d2448000
        RA= 0x1d2448000
        PA= ra2pa(0x1d2448000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data20
my_data20:
        .xword 0x0

SECTION .MY_DATA21  DATA_VA=0xd255a000
attr_data {
        Name = .MY_DATA21,
        VA= 0x0d255a000
        RA= 0x1d255a000
        PA= ra2pa(0x1d255a000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data21
my_data21:
        .xword 0x0

SECTION .MY_DATA22  DATA_VA=0xd266c000
attr_data {
        Name = .MY_DATA22,
        VA= 0x0d266c000
        RA= 0x1d266c000
        PA= ra2pa(0x1d266c000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data22
my_data22:
        .xword 0x0

SECTION .MY_DATA23  DATA_VA=0xd277e000
attr_data {
        Name = .MY_DATA23,
        VA= 0x0d277e000
        RA= 0x1d277e000
        PA= ra2pa(0x1d277e000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data23
my_data23:
        .xword 0x0

SECTION .MY_DATA24  DATA_VA=0xd2880000
attr_data {
        Name = .MY_DATA24,
        VA= 0x0d2880000
        RA= 0x1d2880000
        PA= ra2pa(0x1d2880000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data24
my_data24:
        .xword 0x0

SECTION .MY_DATA25  DATA_VA=0xd2992000
attr_data {
        Name = .MY_DATA25,
        VA= 0x0d2992000
        RA= 0x1d2992000
        PA= ra2pa(0x1d2992000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data25
my_data25:
        .xword 0x0

SECTION .MY_DATA26  DATA_VA=0xd2aa4000
attr_data {
        Name = .MY_DATA26,
        VA= 0x0d2aa4000
        RA= 0x1d2aa4000
        PA= ra2pa(0x1d2aa4000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data26
my_data26:
        .xword 0x0

SECTION .MY_DATA27  DATA_VA=0xd2bb6000
attr_data {
        Name = .MY_DATA27,
        VA= 0x0d2bb6000
        RA= 0x1d2bb6000
        PA= ra2pa(0x1d2bb6000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data27
my_data27:
        .xword 0x0

SECTION .MY_DATA28  DATA_VA=0xd2cc8000
attr_data {
        Name = .MY_DATA28,
        VA= 0x0d2cc8000
        RA= 0x1d2cc8000
        PA= ra2pa(0x1d2cc8000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data28
my_data28:
        .xword 0x0

SECTION .MY_DATA29  DATA_VA=0xd2dda000
attr_data {
        Name = .MY_DATA29,
        VA= 0x0d2dda000
        RA= 0x1d2dda000
        PA= ra2pa(0x1d2dda000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data29
my_data29:
        .xword 0x0

SECTION .MY_DATA30  DATA_VA=0xd2eec000
attr_data {
        Name = .MY_DATA30,
        VA= 0x0d2eec000
        RA= 0x1d2eec000
        PA= ra2pa(0x1d2eec000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data30
my_data30:
        .xword 0x0

SECTION .MY_DATA31  DATA_VA=0xd2ffe000
attr_data {
        Name = .MY_DATA31,
        VA= 0x0d2ffe000
        RA= 0x1d2ffe000
        PA= ra2pa(0x1d2ffe000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data31
my_data31:
        .xword 0x0

SECTION .MY_DATA32  DATA_VA=0xd3000000
attr_data {
        Name = .MY_DATA32,
        VA= 0x0d3000000
        RA= 0x1d3000000
        PA= ra2pa(0x1d3000000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data32
my_data32:
        .xword 0x0

SECTION .MY_DATA33  DATA_VA=0xd3112000
attr_data {
        Name = .MY_DATA33,
        VA= 0x0d3112000
        RA= 0x1d3112000
        PA= ra2pa(0x1d3112000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data33
my_data33:
        .xword 0x0

SECTION .MY_DATA34  DATA_VA=0xd3224000
attr_data {
        Name = .MY_DATA34,
        VA= 0x0d3224000
        RA= 0x1d3224000
        PA= ra2pa(0x1d3224000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data34
my_data34:
        .xword 0x0

SECTION .MY_DATA35  DATA_VA=0xd3336000
attr_data {
        Name = .MY_DATA35,
        VA= 0x0d3336000
        RA= 0x1d3336000
        PA= ra2pa(0x1d3336000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data35
my_data35:
        .xword 0x0

SECTION .MY_DATA36  DATA_VA=0xd3448000
attr_data {
        Name = .MY_DATA36,
        VA= 0x0d3448000
        RA= 0x1d3448000
        PA= ra2pa(0x1d3448000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data36
my_data36:
        .xword 0x0

SECTION .MY_DATA37  DATA_VA=0xd355a000
attr_data {
        Name = .MY_DATA37,
        VA= 0x0d355a000
        RA= 0x1d355a000
        PA= ra2pa(0x1d355a000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data37
my_data37:
        .xword 0x0

SECTION .MY_DATA38  DATA_VA=0xd366c000
attr_data {
        Name = .MY_DATA38,
        VA= 0x0d366c000
        RA= 0x1d366c000
        PA= ra2pa(0x1d366c000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data38
my_data38:
        .xword 0x0

SECTION .MY_DATA39  DATA_VA=0xd377e000
attr_data {
        Name = .MY_DATA39,
        VA= 0x0d377e000
        RA= 0x1d377e000
        PA= ra2pa(0x1d377e000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data39
my_data39:
        .xword 0x0

SECTION .MY_DATA40  DATA_VA=0xd3880000
attr_data {
        Name = .MY_DATA40,
        VA= 0x0d3880000
        RA= 0x1d3880000
        PA= ra2pa(0x1d3880000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data40
my_data40:
        .xword 0x0

SECTION .MY_DATA41  DATA_VA=0xd3992000
attr_data {
        Name = .MY_DATA41,
        VA= 0x0d3992000
        RA= 0x1d3992000
        PA= ra2pa(0x1d3992000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data41
my_data41:
        .xword 0x0

SECTION .MY_DATA42  DATA_VA=0xd3aa4000
attr_data {
        Name = .MY_DATA42,
        VA= 0x0d3aa4000
        RA= 0x1d3aa4000
        PA= ra2pa(0x1d3aa4000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data42
my_data42:
        .xword 0x0

SECTION .MY_DATA43  DATA_VA=0xd3bb6000
attr_data {
        Name = .MY_DATA43,
        VA= 0x0d3bb6000
        RA= 0x1d3bb6000
        PA= ra2pa(0x1d3bb6000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data43
my_data43:
        .xword 0x0

SECTION .MY_DATA44  DATA_VA=0xd3cc8000
attr_data {
        Name = .MY_DATA44,
        VA= 0x0d3cc8000
        RA= 0x1d3cc8000
        PA= ra2pa(0x1d3cc8000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data44
my_data44:
        .xword 0x0

SECTION .MY_DATA45  DATA_VA=0xd3dda000
attr_data {
        Name = .MY_DATA45,
        VA= 0x0d3dda000
        RA= 0x1d3dda000
        PA= ra2pa(0x1d3dda000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data45
my_data45:
        .xword 0x0

SECTION .MY_DATA46  DATA_VA=0xd3eec000
attr_data {
        Name = .MY_DATA46,
        VA= 0x0d3eec000
        RA= 0x1d3eec000
        PA= ra2pa(0x1d3eec000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data46
my_data46:
        .xword 0x0

SECTION .MY_DATA47  DATA_VA=0xd3ffe000
attr_data {
        Name = .MY_DATA47,
        VA= 0x0d3ffe000
        RA= 0x1d3ffe000
        PA= ra2pa(0x1d3ffe000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data47
my_data47:
        .xword 0x0

SECTION .MY_DATA48  DATA_VA=0xd4000000
attr_data {
        Name = .MY_DATA48,
        VA= 0x0d4000000
        RA= 0x1d4000000
        PA= ra2pa(0x1d4000000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data48
my_data48:
        .xword 0x0

SECTION .MY_DATA49  DATA_VA=0xd4112000
attr_data {
        Name = .MY_DATA49,
        VA= 0x0d4112000
        RA= 0x1d4112000
        PA= ra2pa(0x1d4112000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data49
my_data49:
        .xword 0x0

SECTION .MY_DATA50  DATA_VA=0xd4224000
attr_data {
        Name = .MY_DATA50,
        VA= 0x0d4224000
        RA= 0x1d4224000
        PA= ra2pa(0x1d4224000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data50
my_data50:
        .xword 0x0

SECTION .MY_DATA51  DATA_VA=0xd4336000
attr_data {
        Name = .MY_DATA51,
        VA= 0x0d4336000
        RA= 0x1d4336000
        PA= ra2pa(0x1d4336000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data51
my_data51:
        .xword 0x0

SECTION .MY_DATA52  DATA_VA=0xd4448000
attr_data {
        Name = .MY_DATA52,
        VA= 0x0d4448000
        RA= 0x1d4448000
        PA= ra2pa(0x1d4448000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data52
my_data52:
        .xword 0x0

SECTION .MY_DATA53  DATA_VA=0xd455a000
attr_data {
        Name = .MY_DATA53,
        VA= 0x0d455a000
        RA= 0x1d455a000
        PA= ra2pa(0x1d455a000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data53
my_data53:
        .xword 0x0

SECTION .MY_DATA54  DATA_VA=0xd466c000
attr_data {
        Name = .MY_DATA54,
        VA= 0x0d466c000
        RA= 0x1d466c000
        PA= ra2pa(0x1d466c000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data54
my_data54:
        .xword 0x0

SECTION .MY_DATA55  DATA_VA=0xd477e000
attr_data {
        Name = .MY_DATA55,
        VA= 0x0d477e000
        RA= 0x1d477e000
        PA= ra2pa(0x1d477e000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data55
my_data55:
        .xword 0x0

SECTION .MY_DATA56  DATA_VA=0xd4880000
attr_data {
        Name = .MY_DATA56,
        VA= 0x0d4880000
        RA= 0x1d4880000
        PA= ra2pa(0x1d4880000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data56
my_data56:
        .xword 0x0

SECTION .MY_DATA57  DATA_VA=0xd4992000
attr_data {
        Name = .MY_DATA57,
        VA= 0x0d4992000
        RA= 0x1d4992000
        PA= ra2pa(0x1d4992000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data57
my_data57:
        .xword 0x0

SECTION .MY_DATA58  DATA_VA=0xd4aa4000
attr_data {
        Name = .MY_DATA58,
        VA= 0x0d4aa4000
        RA= 0x1d4aa4000
        PA= ra2pa(0x1d4aa4000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data58
my_data58:
        .xword 0x0

SECTION .MY_DATA59  DATA_VA=0xd4bb6000
attr_data {
        Name = .MY_DATA59,
        VA= 0x0d4bb6000
        RA= 0x1d4bb6000
        PA= ra2pa(0x1d4bb6000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data59
my_data59:
        .xword 0x0

SECTION .MY_DATA60  DATA_VA=0xd4cc8000
attr_data {
        Name = .MY_DATA60,
        VA= 0x0d4cc8000
        RA= 0x1d4cc8000
        PA= ra2pa(0x1d4cc8000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data60
my_data60:
        .xword 0x0

SECTION .MY_DATA61  DATA_VA=0xd4dda000
attr_data {
        Name = .MY_DATA61,
        VA= 0x0d4dda000
        RA= 0x1d4dda000
        PA= ra2pa(0x1d4dda000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data61
my_data61:
        .xword 0x0

SECTION .MY_DATA62  DATA_VA=0xd4eec000
attr_data {
        Name = .MY_DATA62,
        VA= 0x0d4eec000
        RA= 0x1d4eec000
        PA= ra2pa(0x1d4eec000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data62
my_data62:
        .xword 0x0

SECTION .MY_DATA63  DATA_VA=0xd4ffe000
attr_data {
        Name = .MY_DATA63,
        VA= 0x0d4ffe000
        RA= 0x1d4ffe000
        PA= ra2pa(0x1d4ffe000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

        .data

.global my_data63
my_data63:
        .xword 0x0



.end
