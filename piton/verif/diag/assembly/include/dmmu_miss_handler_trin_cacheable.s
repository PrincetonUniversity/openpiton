// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: dmmu_miss_handler.s
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
#ifdef EX_TRAPCHECK
	! extended trapcheck returns traptype
	mov	0x68,	%o0
#endif
	mov	0x30, %g7
	ldxa	[%g7] 0x58, %g2		! get va/context from tag-access
	ldxa	[%g0] 0x59, %g1         ! dmmu ps0 ptr
#ifdef MIMIC_SOLARIS
	srlx	%g0, %g0, %g0
	brnz	%g0, HT0_Fast_Data_Access_MMU_Miss_0x68
	sll	%g0, %g0, %g0
	xor	%g0, %g0, %g0
#endif
	!ldda	[%g1] 0x24, %g4         ! load tte from ps0 tsb
    ldx     [%g1] , %g4     ! load tte from ps0 tsb
    ldx     [%g1+8] , %g5       ! load tte from ps0 tsb
	cmp	%g2, %g4
	bne	%xcc, dmmu_miss_handler_ext
#ifdef CSM_ENABLE
    mov %g0, %g7
#else
    nop
#endif

#ifdef CSM_ENABLE
    or %g1, %g0, %g7
    sllx    %g7, 1, %g7
#endif
	ba	dmmu_trap_done
	mov	0x80, %g1		! offset (VA) for patrition id

