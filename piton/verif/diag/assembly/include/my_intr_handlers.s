// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: my_intr_handlers.s
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
/* File  : my_intr_handlers.s
 * Description: 
 *	This file contains the basic (bare minimum) interrupt handlers for 
 * HW, SW, and Queue interrupts. The default interrupt handler in boot code 
 * will take the diag to BAD_TRAP if they occur. This handlers in a diag will 
 * overwrite the default interrupt handlers at boot code.
 *	This file also contains the APIs and Macro definitions used to generate
 * different interrupts from assembly diags.
 */

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Trap Generation APIs
!! --------------------
!! T_SEND_THRD_INTR	0x30
!! T_SEND_CPU_MONDO_Q_INTR	0x31
!! T_SEND_DEV_MONDO_Q_INTR	0x32
!! T_SEND_RES_ERROR_Q_INTR	0x33
!! T_SEND_SOFTINT		0x34
!! T_SEND_IOB_INTR	0x35
!! 
!! T_API_SEND_THRD_INTR		0x90
!! T_API_SEND_CPU_MONDO_Q_INTR	0x91
!! T_API_SEND_DEV_MONDO_Q_INTR	0x92
!! T_API_SEND_RES_ERROR_Q_INTR	0x93
!! T_API_SEND_IOB_INTR		0x95

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
	mov	0x3c0, %g3; \
	ldxa	[%g0] 0x74, %g5; \
	and	%g5, 0x30, %g5; \
	ldxa	[%g3+%g5] 0x25, %g6; \
	add	%g3, 8, %g3; \
	add	%g6, 0x40, %g6; \
	stxa	%g6, [%g3+%g5] 0x25; \
	retry

#define H_T0_Interrupt_0x60
#define My_T0_Interrupt_0x60 \
	mov	0x3c0, %g3; \
	ldxa	[%g0] 0x74, %g5; \
	and	%g5, 0x30, %g5; \
	ldxa	[%g3+%g5] 0x25, %g6; \
	add	%g3, 8, %g3; \
	add	%g6, 0x40, %g6; \
	stxa	%g6, [%g3+%g5] 0x25; \
	retry

#define H_T1_Reserved_0x60
#define SUN_H_T1_Reserved_0x60 \
	mov	0x3c0, %g3; \
	ldxa	[%g0] 0x74, %g5; \
	and	%g5, 0x30, %g5; \
	ldxa	[%g3+%g5] 0x25, %g6; \
	add	%g3, 8, %g3; \
	add	%g6, 0x40, %g6; \
	stxa	%g6, [%g3+%g5] 0x25; \
	retry


!!!!! Queue interrupt handler


#define H_T0_Cpu_Mondo_Trap_0x7c
#define My_T0_Cpu_Mondo_Trap_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
	
#define H_T0_Dev_Mondo_Trap_0x7d
#define My_T0_Dev_Mondo_Trap_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
	
#define H_T0_Resumable_Error_0x7e
#define My_T0_Resumable_Error_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x7c
#define My_T1_Reserved_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
	
#define H_T1_Reserved_0x7d
#define My_T1_Reserved_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
	
#define H_T1_Reserved_0x7e
#define My_T1_Reserved_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7c
#define SUN_H_HT0_Reserved_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
	
#define H_HT0_Reserved_0x7d
#define SUN_H_HT0_Reserved_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
	
#define H_HT0_Reserved_0x7e
#define SUN_H_HT0_Reserved_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop


!!!!! Hstick-match trap handler


#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x5e
#define My_HT0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x5e
#define My_T1_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop


!!!!! SW interuupt handlers


#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_1_0x41
#define My_T0_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_2_0x42
#define My_T0_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_3_0x43
#define My_T0_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_4_0x44
#define My_T0_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_5_0x45
#define My_T0_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_6_0x46
#define My_T0_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_7_0x47
#define My_T0_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_8_0x48
#define My_T0_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_9_0x49
#define My_T0_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_10_0x4a
#define My_T0_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_11_0x4b
#define My_T0_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_12_0x4c
#define My_T0_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_13_0x4d
#define My_T0_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g3; \
	and	%g3, 0x300, %g5; \
	wr	%g3, %g5, %pcr; \
	retry; \
	nop                                 

#define H_T1_Reserved_0x4e
#define My_T1_Reserved_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x41
#define My_T1_Reserved_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x42
#define My_T1_Reserved_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x43
#define My_T1_Reserved_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x44
#define My_T1_Reserved_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x45
#define My_T1_Reserved_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x46
#define My_T1_Reserved_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x47
#define My_T1_Reserved_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x48
#define My_T1_Reserved_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x49
#define My_T1_Reserved_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x4a
#define My_T1_Reserved_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x4b
#define My_T1_Reserved_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x4c
#define My_T1_Reserved_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x4d
#define My_T1_Reserved_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x4f
#define My_T1_Reserved_0x4f \
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g3; \
	and	%g3, 0x300, %g5; \
	wr	%g3, %g5, %pcr; \
	retry; \
	nop                                 

#define H_HT0_Interrupt_Level_14_0x4e
#define My_HT0_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_1_0x41
#define My_HT0_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_2_0x42
#define My_HT0_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_3_0x43
#define My_HT0_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_4_0x44
#define My_HT0_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_5_0x45
#define My_HT0_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_6_0x46
#define My_HT0_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_7_0x47
#define My_HT0_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_8_0x48
#define My_HT0_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_9_0x49
#define My_HT0_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_10_0x4a
#define My_HT0_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_11_0x4b
#define My_HT0_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_12_0x4c
#define My_HT0_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_13_0x4d
#define My_HT0_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_15_0x4f
#define My_HT0_Interrupt_Level_15_0x4f \
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g3; \
	and	%g3, 0x300, %g4; \
	wr	%g3, %g4, %pcr; \
	retry; \
	nop                                


!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!! START of Trap Generators !!!!!!!!!!!!!!
#define	T_SEND_THRD_INTR	0x30
#define T_SEND_CPU_MONDO_Q_INTR	0x31
#define T_SEND_DEV_MONDO_Q_INTR	0x32
#define T_SEND_RES_ERROR_Q_INTR	0x33
#define	T_SEND_SOFTINT		0x34
#define	T_SEND_IOB_INTR	0x35

#define	T_API_SEND_THRD_INTR		0x90
#define T_API_SEND_CPU_MONDO_Q_INTR	0x91
#define T_API_SEND_DEV_MONDO_Q_INTR	0x92
#define T_API_SEND_RES_ERROR_Q_INTR	0x93
#define	T_API_SEND_IOB_INTR		0x95

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Thread Interrupt generate functions

#define H_T0_Trap_Instruction_0
#define	My_T0_Trap_Instruction_0 \
	ta	T_API_SEND_THRD_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Trap_Instruction_0
#define	My_T1_Trap_Instruction_0 \
	ta	T_API_SEND_THRD_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Trap_Instruction_0
#define	My_HT0_Trap_Instruction_0 \
	ta	T_API_SEND_THRD_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_HTrap_Instruction_0
#define	My_HT0_HTrap_Instruction_0 \
	stxa	%o0, [%g0] 0x73; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! CPU_MONDO_QUEUE Interrupt generate functions

#define H_T0_Trap_Instruction_1
#define	My_T0_Trap_Instruction_1 \
	ta	T_API_SEND_CPU_MONDO_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Trap_Instruction_1
#define	My_T1_Trap_Instruction_1 \
	ta	T_API_SEND_CPU_MONDO_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Trap_Instruction_1
#define	My_HT0_Trap_Instruction_1 \
	ta	T_API_SEND_CPU_MONDO_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_HTrap_Instruction_1
#define	My_HT0_HTrap_Instruction_1 \
	mov	0x3c0, %g3; \
	ldxa	[%g3] 0x25, %g4; \
	add	%g3, 8, %g3; \
	add	%g4, 0x40, %g4; \
	stxa	%g4, [%g3] 0x25; \
	done; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DEV_MONDO_QUEUE Interrupt generate functions

#define H_T0_Trap_Instruction_2
#define	My_T0_Trap_Instruction_2 \
	ta	T_API_SEND_DEV_MONDO_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Trap_Instruction_2
#define	My_T1_Trap_Instruction_2 \
	ta	T_API_SEND_DEV_MONDO_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Trap_Instruction_2
#define	My_HT0_Trap_Instruction_2 \
	ta	T_API_SEND_DEV_MONDO_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_HTrap_Instruction_2
#define	My_HT0_HTrap_Instruction_2 \
	mov	0x3d0, %g3; \
	ldxa	[%g3] 0x25, %g4; \
	add	%g3, 8, %g3; \
	add	%g4, 0x40, %g4; \
	stxa	%g4, [%g3] 0x25; \
	done; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! RES_ERROR_QUEUE Interrupt generate functions

#define H_T0_Trap_Instruction_3
#define	My_T0_Trap_Instruction_3 \
	ta	T_API_SEND_RES_ERROR_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Trap_Instruction_3
#define	My_T1_Trap_Instruction_3 \
	ta	T_API_SEND_RES_ERROR_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Trap_Instruction_3
#define	My_HT0_Trap_Instruction_3 \
	ta	T_API_SEND_RES_ERROR_Q_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_HTrap_Instruction_3
#define	My_HT0_HTrap_Instruction_3 \
	mov	0x3e0, %g3; \
	ldxa	[%g3] 0x25, %g4; \
	add	%g3, 8, %g3; \
	add	%g4, 0x40, %g4; \
	stxa	%g4, [%g3] 0x25; \
	done; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! SOFTINT generate functions

#define H_T0_Trap_Instruction_4
#define	My_T0_Trap_Instruction_4 \
	wrpr	%g0, 0, %pil; \
	wr	%o0, %g0, %set_softint; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Trap_Instruction_4
#define	My_T1_Trap_Instruction_4 \
	wrpr	%g0, 0, %pil; \
	wr	%o0, %g0, %set_softint; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Trap_Instruction_4
#define	My_HT0_Trap_Instruction_4 \
	wrpr	%g0, 0, %pil; \
	wr	%o0, %g0, %set_softint; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_HTrap_Instruction_4
#define	My_HT0_HTrap_Instruction_4 \
	wrpr	%g0, 0, %pil; \
	wr	%o0, %g0, %set_softint; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! IOB Interrupt generate functions

#define H_T0_Trap_Instruction_5
#define	My_T0_Trap_Instruction_5 \
	ta	T_API_SEND_IOB_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Trap_Instruction_5
#define	My_T1_Trap_Instruction_5 \
	ta	T_API_SEND_IOB_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Trap_Instruction_5
#define	My_HT0_Trap_Instruction_5 \
	ta	T_API_SEND_IOB_INTR; \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

!!#define IOB_INT_VEC_DIS_REG	0x9800000800

#define H_HT0_HTrap_Instruction_5
#define	My_HT0_HTrap_Instruction_5 \
	mov  0x98, %g5; \
	mov  0x800, %g6; \
	sllx  %g5, 0x20, %g5; \
	or  %g6, %g5, %g6; \
	stx		%o0, [%g6]; \
	done; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!! END of Trap Generators !!!!!!!!!!!!!!!!
