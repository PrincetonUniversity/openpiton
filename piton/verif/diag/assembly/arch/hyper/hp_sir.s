// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: hp_sir.s
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
#define THREAD_COUNT  4
#define THREAD_STRIDE 1
#define MAIN_PAGE_HV_ALSO

#define H_HT0_Illegal_instruction_0x10 ill_handler
#define My_Software_Initiated_Reset setx sir_handler, %g1, %g2; jmp %g2; nop

#include "boot.s"

!sims -vcs_run -sas -sys=ciop hp_sir.s -finish_mask=f -fast_boot

.text
.global main
main:
	mov 0, %i0

th_fork(th_main)
th_main_0:
th0_user_sir:
	sir
	
	ta T_CHANGE_PRIV
th0_super_sir:
	sir

	ta T_CHANGE_HPRIV
th0_hyper_sir:
	sir

	ta T_BAD_TRAP
	nop

th_main_1:
th1_user_sir:
	sir
	
	ta T_CHANGE_PRIV
th1_super_sir:
	sir

	ta T_CHANGE_HPRIV
th1_hyper_sir:
	sir

	ta T_BAD_TRAP
	nop


th_main_2:
th2_user_sir:
	sir
	
	ta T_CHANGE_PRIV
th2_super_sir:
	sir

	ta T_CHANGE_HPRIV
th2_hyper_sir:
	sir

	ta T_BAD_TRAP
	nop


th_main_3:
th3_user_sir:
	sir
	
	ta T_CHANGE_PRIV
th3_super_sir:
	sir

	ta T_CHANGE_HPRIV
th3_hyper_sir:
	sir

	ta T_BAD_TRAP
	nop


pass:
        ta T_GOOD_TRAP
        nop

.global ill_handler
ill_handler:
	rdpr %tpc, %g1

	setx th0_user_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th1_user_sir
	nop
	or  %i0, 1, %i0
	ba chk_done
	nop
  chk_th1_user_sir:
	setx th1_user_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th2_user_sir
	nop
	or  %i0, 1, %i0
	ba chk_done
	nop
  chk_th2_user_sir:
	setx th2_user_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th3_user_sir
	nop
	or  %i0, 1, %i0
	ba chk_done
	nop
  chk_th3_user_sir:
	setx th3_user_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th0_super_sir
	nop
	or  %i0, 1, %i0
	ba chk_done
	nop


  chk_th0_super_sir:
	setx th0_super_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th1_super_sir
	nop
	or  %i0, 2, %i0
	ba chk_done
	nop
  chk_th1_super_sir:
	setx th1_super_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th2_super_sir
	nop
	or  %i0, 2, %i0
	ba chk_done
	nop
  chk_th2_super_sir:
	setx th2_super_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_th3_super_sir
	nop
	or  %i0, 2, %i0
	ba chk_done
	nop
  chk_th3_super_sir:
	setx th3_super_sir, %g3, %g2
	cmp %g1, %g2
	bne %xcc, chk_default
	nop
	or  %i0, 2, %i0
	ba chk_done
	nop
	
   chk_default:
	or  %i0, 4, %i0

chk_done:
	done

.global sir_handler
sir_handler:
	wrpr %g0, 1, %tl
	wrpr %g0, 1, %gl
	rdhpr %hpstate, %g3

	cmp %i0, 3 
	bne  fail 
	setx good_trap, %g1, %g2
	jmp %g2
	wrhpr %g3, 0x824, %hpstate 
fail:
	setx bad_trap, %g1, %g2
	jmp %g2
	wrhpr %g3, 0x824, %hpstate 


.data
l1_hit_0:
.xword 0x12345678

