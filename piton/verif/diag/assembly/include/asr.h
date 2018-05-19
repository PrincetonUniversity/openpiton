// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: asr.h
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

!! WARNING:
!! For bit set/reset masks, use "X * 2**Y" instead of "X * 2^Y".
!! "^" means "exponentiation" under SunOS:/bin/m4, but
!!     means "bitwise xor" under Solaris:/usr/ccs/bin/m4.
!! "**" is acceptable notation for exponentiation with either.

! ASR field definitions
! Note: %asr16 is ASR 16 (decimal) or ASR 0x10 (hex))

! Sparc-V9 Defined ASRs

#define         ASR_Y_REG                               %asr0
#define         ASR_COND_CODE_REG                       %asr2
#define         ASR_ASI_REG                             %asr3
#define         ASR_TICK_REG                            %asr4
#define         ASR_PC                                  %asr5
#define         ASR_FP_STATUS_REG                       %asr6

! Non-Sparc-V9 ASRs

#define 	ASR_PERF_CONTROL_REG			%asr16
#define		ASR_PERF_COUNTER			%asr17
#define		ASR_DISPATCH_CONTROL_REG		%asr18
#define		ASR_GRAPHIC_STATUS_REG			%asr19
#define		ASR_SET_SOFTINT				%asr20
#define		ASR_CLEAR_SOFTINT			%asr21
#define		ASR_SOFTINT_REG				%asr22
#define		ASR_TICK_CMPR_REG			%asr23
#define         ASR_SYSTEM_TICK_REG                     %asr24
#define         ASR_SYSTEM_TICK_CMPR_REG                %asr25
