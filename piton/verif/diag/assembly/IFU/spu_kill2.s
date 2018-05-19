// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: spu_kill2.s
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
#define CIOP
#define THREAD_MASK 0x00000001
#define NO_TRAPCHECK
#include "enable_traps.h"
#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global main

main:
        setx  spu_data, %r1, %r16
	ta T_CHANGE_HPRIV
	mov 0x88, %r1
	stxa %r16, [%r1] 0x40
	mov 0x90, %r1
	stxa %r0, [%r1] 0x40
	setx 0x3f, %r1, %r2
	mov 0x80, %r1
	stxa %r2, [%r1] 0x40
	mov 0xa0, %r1	
	ldxa [%r1] 0x40, %r1	
	setx  0x55931b0c18afc012, %r16, %r17
        setx  MAIN_BASE_DATA_VA, %r1, %r16
	setx 0x4a, %r1, %r13
	mov 0x80, %r23
	stx	%r17, [%r16+0x1]
	stxa %r13, [%r23] 0x40
	ta T_GOOD_TRAP	
				
.data
	.word  0x8e0a6504,0x78e43693,0xf167ee6c,0x854dbc58
	.word  0x6317ee24,0xf02547fa,0x46acee8c,0x8520c830
	.word  0x9aa12c26,0x89fe1384,0x9b421ed9,0x1afbb1b8
	.word  0xbd0c5342,0xe391fb96,0x209d8317,0x739ff366
	.word  0x040d7ecb,0x2b032141,0x49133e04,0x20320882
	.word  0x42350334,0x171423de,0x1ee0c1a6,0xff76d275
	.word  0x737d25f5,0x45ec0ddf,0x0a57faa4,0xd1fb3316
		
SECTION .ISEG_0 DATA_VA = 0x0000000070400000
attr_data {
	Name	 = .ISEG_0,
	VA	 = 0x0000000070400000,
	RA	 = 0x0000000704000000,
	PA	 = ra2pa(0x0000000704000000,0),
	part_0_d_ctx_nonzero_ps0_tsb,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.data
.global spu_data
spu_data:
	.word  0xdad4d6c5,0xebfab571,0x5683c73a,0x82528126
	.word  0x81dd072b,0xc601d88e,0xcbcf0212,0xbbd685a3
	.word  0x8fa375dd,0x1ac7afcd,0x4d40929e,0x2d8a9e7a
	.word  0x9c688a56,0xc846a04c,0x96aec5fd,0xbe2a07e3
	.word  0x3503d5c6,0x1ade2170,0xa323e9b5,0x61e399d0
	.word  0x44d80818,0x8baffac5,0x86950d84,0x3911adc1
	.word  0x175ab9c4,0xb1361787,0x6e5cfc53,0x7b8ddb4a
	.word  0x88ba9095,0xecc08ccf,0x44dca434,0x4dc8fd4e


