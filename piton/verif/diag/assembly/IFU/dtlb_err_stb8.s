// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dtlb_err_stb8.s
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
!DTLB parity error on the eight store
	
#define CIOP
#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
        mov     0x8, %g1;\
        stxa    %g0, [%g1] 0x60;\
        retry;\
        nop;\
        nop;\
        nop;\
        nop;\
        nop
#include "boot.s"
.text	
.global main
main:

	setx MAIN_BASE_DATA_VA, %r1, %r16
        setx 0x041f59b53c791cf6, %r1, %r2
        setx 0x40df03374181b8fc, %r1, %r3
        setx 0x1e707862a1e01630, %r1, %r4
        setx 0xc5721fd38068da75, %r1, %r5
        setx 0xdb711b587750c225, %r1, %r6
        setx 0xeaef401c574fc3ec, %r1, %r7
        setx 0xfb12d5387d2696af, %r1, %r8
        setx 0x335d9f5892eccbd9, %r1, %r9
        setx 0x335d9f5892eccbd9, %r1, %r11
        setx 0xd21f4468336c8058, %r1, %r12
        setx 0xb16479356c0ec87f, %r1, %r13
        setx 0xbd471ac111e27548, %r1, %r14
        setx 0xca007e49d8b1c901, %r1, %r15
        setx 0xc8157cf9354217bb, %r1, %r17
        setx 0xb24b70bc69e0378a, %r1, %r18
        setx 0x6cab37f4ce8c032f, %r1, %r19
        setx 0x64d0f2d8aa06596f, %r1, %r20
        setx 0x900e1650a24a07c3, %r1, %r21
        setx 0xd21f4468336c8058, %r1, %r22
        setx 0xb16479356c0ec87f, %r1, %r23
        setx 0xbd471ac111e27548, %r1, %r24
        setx 0xca007e49d8b1c901, %r1, %r25
        setx 0x986b9de12e5c9e8e, %r1, %r26
        setx 0x9b67506ee1e31e18, %r1, %r27
        setx 0x56d26623865e7a85, %r1, %r28
        setx 0x69ad2a8c0dce810a, %r1, %r29
        setx 0xaae13685e1a4c023, %r1, %r30
        setx 0xaae13685e1a4c023, %r1, %r31	
		
        set 0x2, %r10
        subcc %r10, 0x1, %r10
br_loop:	
	stx  %r2, [%r16]
	stw  %r3, [%r16 + 0x4]
	sth  %r4, [%r16 + 0x8]
	stb  %r5, [%r16]
	stx  %r2, [%r16]
	stw  %r3, [%r16 + 0x4]
	sth  %r4, [%r16 + 0x8]
dtlb_err:	
!$EV error(0,expr(@VA(.MAIN.dtlb_err), 16, 16),2,DTLB_DATA,35); 
	stx  %r5, [%r16]
	stx  %r5, [%r16]
	stx  %r5, [%r16]		
	ldx  [%r16], %r6
	add     %r6, 0x059d, %r31
	add     %r4, %r14, %r29
	or      %r5, 0x0020, %r23
	add     %r3, 0x0700, %r18
	add     %r4, %r15, %r23
	add     %r7, 0x09f6, %r23
	add     %r6, %r11, %r19
	and     %r4, 0x047e, %r30
	add     %r3, %r13, %r25
	and     %r3, 0x0f51, %r30
	and     %r4, %r13, %r19
	or      %r3, %r9, %r18
	and     %r6, %r11, %r25
	and     %r8, %r14, %r28
	and     %r8, %r9, %r21
	or      %r8, 0x031a, %r20
	add     %r5, 0x0cb9, %r30
	and     %r7, 0x0bf3, %r31
	add     %r6, 0x03c9, %r17
	or      %r8, %r15, %r30
        bne br_loop
        subcc %r10, 0x1, %r10
	ta T_GOOD_TRAP

.data
        .word  0x9b4bec13,0xc4fe6abc,0x5f1c43c7,0x397d1e9c
        .word  0x54ef4633,0xc365e761,0x76ef3bdc,0xbe471c5f
        .word  0x7a10d84b,0x422185b3,0xee309d77,0xd283dd2d
        .word  0xb069cdeb,0xa13cb8c4,0x979a1a26,0xd8510952
