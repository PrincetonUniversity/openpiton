// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tlu_tdb.s
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

#define	H_HT0_Window_Spill_0_Normal_Trap	T0_spill0_normal
#define H_HT0_Division_By_Zero          	T0_divide_by_zero
#define H_HT0_Mem_Address_Not_Aligned_0x34	T0_misaligned

#define MAIN_PAGE_HV_ALSO
#include "boot.s"

.text
.global main
main:

attr_text {
        Name = .MAIN,
        VA=MAIN_BASE_TEXT_VA,
        RA=MAIN_BASE_TEXT_RA,
        PA=ra2pa(MAIN_BASE_TEXT_RA,0),
        tsbonly,
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

	ta T_CHANGE_HPRIV
						
        ! create trap stack and go to user code by done
        ! set tpc and ntpc
        wrpr 3, %tl
        wrpr 3, %gl
        setx pop_tsa3, %g1, %g2
        wrpr %g2, %g0, %tpc
        wrpr %g2, %g0, %tnpc
	setx 0x24481000600,	%g1,	%g3
        wrpr  %g3, %g0,	%tstate
	wrhpr %g0, 0x4, %htstate
	done
	nop
	nop

pop_tsa3:
	rdpr	%tl,	%l0
	rdpr	%pstate, %l0	
	rdpr	%cwp,	%l1
	rd	%ccr,	%l2
	rd	%asi,	%l3

        wrpr  3, %tl
        wrpr  3, %gl
	nop
	setx	pop_tsa2,	%g1,	%g2
	wrpr	%g2,	%g0,	%tpc
	wrpr	%g2,	%g0,	%tnpc
	setx	0x20480000600,	%g1,	%g3
        wrpr %g3, %g0,	%tstate
	done
	nop
	nop
	
pop_tsa2:
	rdpr	%tl,	%l0
	rdpr	%pstate, %l0	
	rdpr	%cwp,	%l1
	rd	%ccr,	%l2
	rd	%asi,	%l3

        wrpr  2, %tl
        wrpr  2, %gl
	nop
	setx	pop_tsa1,	%g1,	%g2
	wrpr	%g2,	%g0,	%tpc
	wrpr	%g2,	%g0,	%tnpc
	setx	0x14881000600,	%g1,	%g3
        wrpr 	%g3, 	%g0,	%tstate
	done
	nop
	nop
	nop

pop_tsa1:
	rdpr	%tl,	%l0
	rdpr	%pstate, %l0	
	rdpr	%cwp,	%l1
	rd	%ccr,	%l2
	rd	%asi,	%l3

        wrpr  	1, %tl
        wrpr    1, %gl
	nop
	setx	pop_tsa0,	%g1,	%g2
	wrpr	%g2,	%g0,	%tpc
	wrpr	%g2,	%g0,	%tnpc
	setx	0x8880000600,	%g1,	%g3
        wrpr 	%g3, 	%g0,	%tstate
	done
	nop
	nop
	nop

pop_tsa0:
	rdpr	%tl,	%l0
	rdpr	%pstate, %l0	
	rdpr	%cwp,	%l1
	rd	%ccr,	%l2
	rd	%asi,	%l3
	/*
	 * generate spill_0_normal trap 
	 */
        /* set cansave = 0 to cause trap */
        set     0x0,    %l0
        wrpr    %l0,    0x0,    %cansave
        wrpr    %l0,    0x6,    %canrestore
        wrpr    %l0,    0x0,    %otherwin
        wrpr    %l0,    0x7,    %cleanwin
        wrpr    %l0,    0x0,    %wstate  /* n = 0 */
        wrpr    %l0,    0x0,    %cwp     /* n = 0 */

	save	/* generate the trap */
	nop

diag_pass:
	wrpr	0x6,	%pstate		/* get out of RED mode */
good_trap:	
	ta	T_GOOD_TRAP
	nop

diag_fail:
	wrpr	0x6,	%pstate		/* get out of RED mode */
bad_trap:	
	ta	T_BAD_TRAP
	nop


.global T0_spill0_normal
.global T0_divide_by_zero
.global T0_misaligned
T0_spill0_normal:
	/*
	 * create another trap  : 
	 *	divide by zero
	 */
	rd	%asi,	%l0
	rd	%ccr,	%l1
	rdpr	%tstate,	%g1	
	nop
	rd	%ccr,	%l2
	rd	%asi,	%l3
	rdpr	%tpc,	%g2
	rdpr	%tnpc,	%g3

        set     0x20,   %g4
	udiv	%g4,	%g0,	%g5	/* divide by zero */
	done
	nop
	nop

/*
 * Customized T1 divide by zero trap handler 
 */
T0_divide_by_zero:
	/* introduce a page fault trap */
	rd	%asi,	%l0
	rd	%ccr,	%l1
	rdpr	%tstate,	%g1
	rdpr	%tpc,	%g2
	rdpr	%tnpc,	%g3
        setx    partition_base_list, %g6,	%g1
	mov	0x28,	%o1
        ldub    [%g1+%o1], %g2
	nop
	nop
	mov	0x2d,	%o1
	ldx	[%g1+%o1],	%g2	
	nop
	mov	0xff,	%o1
	done
	nop
	nop

/* 
 * Customized T1 mem address misaligned trap 
 * TL = 3 	
 */
T0_misaligned:
	rd	%asi,	%l0
	rd	%ccr,	%l1
	rdpr	%tstate,	%g1
	rdpr	%tpc,	%g2
	rdpr	%tnpc,	%g3
        setx    partition_base_list, %g6,	%g1
	mov	0x28,	%o1
        ldub    [%g1+%o1], %g2
	nop
	done
	nop
	nop

