// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_custom_trap_handlers.s
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
/* File  : tlu_custom_trap_handlers.s
 */

!!!!!!!!!!!!!!!!!!!!!!!!!
!! Disable trap checking
#define NO_TRAPCHECK

! Enable Traps
#define ENABLE_T1_Reserved_0x11
#define ENABLE_T1_Reserved_0x20
#define ENABLE_HT0_Reserved_0x02

#define SPILL_TRAP_RETRY
#define FILL_TRAP_RETRY

#define H_HT0_Reserved_0x74
#define SUN_H_HT0_Reserved_0x74 \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Corrected_ECC_error_0x63
#define SUN_H_HT0_Corrected_ECC_error_0x63 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	retry

#define H_T0_Corrected_ECC_error_0x63
#define SUN_H_T0_Corrected_ECC_error_0x63 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	retry

#define H_T0_Reserved_0x62
#define My_T0_Reserved_0x62 \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x62
#define SUN_H_HT0_Reserved_0x62 \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Instruction_access_error_0x0a
#define SUN_H_HT0_Instruction_access_error_0x0a \
	stxa	%g0, [%g0] 0x60; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
	mov	8, %g3; \
	stxa	%g0, [%g3] 0x60; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

	
#define H_T0_Fp_disabled_0x20
#define My_T0_Fp_disabled_0x20 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

#define H_T1_Reserved_0x20
#define SUN_H_T1_Reserved_0x20 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

#define	H_T1_Reserved_0x11
#define SUN_H_T1_Reserved_0x11 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

#define	H_T1_Reserved_0x21
#define SUN_H_T1_Reserved_0x21 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

#define	H_T1_Reserved_0x22
#define SUN_H_T1_Reserved_0x22 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	done

! Data Error
#define H_HT0_Reserved_0x78
#define SUN_H_HT0_Reserved_0x78 \
	rdhpr	%htba, %g3; \
	rdpr	%tl, %g3; \
	rdpr	%gl, %g3; \
	rdpr	%tstate, %g3; \
	rdpr	%tpc, %g3; \
	rdpr	%tnpc, %g3; \
	rdhpr	%htstate, %g3; \
	retry

#define H_T1_Illegal_instruction_0x10
#define My_T1_Illegal_instruction_0x10 \
	done; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
