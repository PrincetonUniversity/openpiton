// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tr_wpt.s
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
!!
!!-------------------------------------------------------------------------------
!!
!!	test all the watch-point traps 
!!	registers involved in the testing : 
!!	VA_watch_point , LSU_CONTROL_REG
!!
!!	add PR,PW,VR,VW bits test cases
!!-------------------------------------------------------------------------------
/*
 * Use customized watch-point trap handler 
 */	 
#define H_T0_Reserved_0x62	T0_VA_watch_point	/* priority 11, higher */

#define H_HT0_HTrap_Instruction_0
#define My_HT0_HTrap_Instruction_0 \
	stxa	%l0, [%l1]0x58; done; \
	nop; nop; nop; nop; nop; nop;

#define H_HT0_HTrap_Instruction_1
#define My_HT0_HTrap_Instruction_1 \
	stxa %l4, [%g0]0x45; done; \
	nop; nop; nop; nop; nop; nop;

#include "boot.s"

.text
.global main

main:
	/*
	 **********************************
	 *	Translating ASIs
	 **********************************
	 */
translate_asi:
	nop

#define	VA_WATCHPOINT1	MAIN_BASE_DATA_VA

	/* setup the PA watch point reg */
	set	VA_WATCHPOINT1,	%l0
	mov	0x38,	%l1
	ta  	T_HTRAP_INST0
	
tc_0:
	mov	0x4,	%o0	/* ASI to test */
	mov	0x1,	%o1	/* VA watch-point applicable */
	call	wptrap_test
	nop

	mov	0xc,	%o0	/* ASI to test */
	mov	0x1,	%o1	/* VA watch-point applicable */
	call	wptrap_test
	nop

tc_1:	
	mov	0x10,	%o0	/* ASI to test */
	mov	0x1,	%o1	/* VA watch-point applicable */
	call	wptrap_test
	nop

/*
 ********************************
 *      Diag PASSED		*
 ********************************
 */
diag_pass:
        set     0xaaddcafe,     %l0
good_trap:
        ta T_GOOD_TRAP
        nop

/*
 ********************************
 *      Diag FAILED !           *
 ********************************
 */
diag_fail:
        set     0xdeadcafe,     %l0
bad_trap:
        ta T_BAD_TRAP
        nop
        nop

/*
 *******************************
 * watch-point test
 *******************************
 */
wptrap_test:
	add	0x0,	%o7,	%l7
	wr	%o0, 	0x0,	%asi

	sub	%o0,	0xc,	%l0
	brgz	%l0,	nucl_cfg0
	nop

	ba	wpt_rtn
	nop

nucl_cfg0:	
	/*
	 **********************************************************
	 * VA, PA both have mask 0x0, so no trap will be reported 
	 **********************************************************
	 */
	ta	T_CHANGE_PRIV
	nop
	mov	0x0,	%l0
	wrpr	%l0,	0x0,	%tl	

	ba	cfg_start
	nop

cfg_start:
	/* VA mask = 0x00 , PA mask = 0x00 , rd/write on */
	mov	0x0,	%l0
	mov	0xf,	%l1	
	sllx	%l1,	0x15,	%l1 	/* [PR,PW,VR,VW] = [24:21] */

	mov	0x00,	%l2
	sllx	%l2,	0x19,	%l2	/* VM = [32:25] */

	mov	0x00,	%l3
	sllx	%l3,	0x1f,	%l3	
	sllx	%l3,	0x3,	%l3	/* PM = [40:33] */

	or	%l2,	%l1,	%l4
	or	%l4,	%l3,	%l4
	mov	0xff,	%l0
	or	%l4,	%l0,	%l4	/* dcache-icache dmmu-immu on */
	ta  	T_HTRAP_INST1
cfg0_va:
	mov	0x0,	%l0
	setx	VA_WATCHPOINT1,	%l0,	%l1
	lduba	[%l1] %asi,	%l2	/* no trap will happen */

	cmp	%o0,	0x0
	be	diag_fail
	nop

cfg1:
	/*
	 **********************************************************
	 * VA mask > 0x0, so trap will be reported for VA
 	 *	VM have one bit set.   
	 * 	We test from VM[7:0] = 0x01 to 0x80
	 **********************************************************
	 */
	mov	0x0,	%l0
cfg1_0:	
	setx	0x0000000203e0000f, 	%l0,	%l4	/* VM=0x1, PM=0x1 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_1:
	setx	0x0000000405e0000f, 	%l0,	%l4	/* VM=0x2, PM=0x2 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_2:
	setx	0x0000000809e0000f, 	%l0,	%l4	/* VM=0x4, PM=0x4 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_3:
	setx	0x0000001011e0000f, 	%l0,	%l4	/* VM=0x8, PM=0x8 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_4:
	setx	0x0000002021e0000f, 	%l0,	%l4	/* VM=0x10, PM=0x10 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_5:
	setx	0x0000004041e0000f, 	%l0,	%l4	/* VM=0x20, PM=0x20 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_6:
	setx	0x0000008081e0000f, 	%l0,	%l4	/* VM=0x40, PM=0x40 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg1_7:
	setx	0x0000010101e0000f, 	%l0,	%l4	/* VM=0x80, PM=0x80 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop


cfg2:
	/*
	 **********************************************************
	 * VA mask > 0x0, so trap will be reported for VA
	 *
 	 *	VM[7:0] multpile bits set
	 **********************************************************
	 */
	mov	0x0,	%l0
cfg2_0:	
	setx	0x0000000607e0000f, 	%l0,	%l4	/* VM=0x3, PM=0x3 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg2_1:
	setx	0x0000000e0fe0000f, 	%l0,	%l4	/* VM=0x7, PM=0x7 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg2_2:
	setx	0x0000006667e0000f, 	%l0,	%l4	/* VM=0x33, PM=0x33 */
							/* PR,PW,VR,VW = 4'b1111 */

	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg2_3:
	setx	0x0000007c7fe0000f, 	%l0,	%l4	/* VM=0x3e, PM=0x3e */
							/* PR,PW,VR,VW = 4'b1111 */

	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg2_4:
	setx	0x000000eeefe0000f, 	%l0,	%l4	/* VM=0x77, PM=0x77 */
							/* PR,PW,VR,VW = 4'b1111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg2_5:
	setx	0x000001ffffe0000f, 	%l0,	%l4	/* VM=0xff, PM=0xff */
							/* PR,PW,VR,VW = 4'b1111 */

	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg2_7:
	setx	0x0000011111e0000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b1111 */

	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop


cfg3:
	/*
	 **********************************************************
	 * VA mask > 0x0, so trap will be reported for VA
	 *
 	 *	both VM[7:0] & PM[7:0] have multpile bits set
	 *
	 * 	change PR,PW,VR,VW :
 	 * 		 0x0000, 0001, 0010, 0101, 0100, 
 	 * 		 0x1001, 1000, 0111, 0110, 0101, 
 	 * 		 0x1010, 1011, 1100, 1101, 1110, 
	 **********************************************************
	 */
	mov	0x0,	%l0
cfg3_0:	
	setx	0x000000060600000f, 	%l0,	%l4	/* VM=0x3, PM=0x3 */
							/* PR,PW,VR,VW = 4'b0000 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_1:
	setx	0x0000000e0e20000f, 	%l0,	%l4	/* VM=0x7, PM=0x7 */
							/* PR,PW,VR,VW = 4'b0001 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_2:
	setx	0x000000666640000f, 	%l0,	%l4	/* VM=0x33, PM=0x33 */
							/* PR,PW,VR,VW = 4'b0010 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_3:
	setx	0x000000eee060000f, 	%l0,	%l4	/* VM=0x77, PM=0x70 */
							/* PR,PW,VR,VW = 4'b0011 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_4:
	setx	0x0000007c7e80000f, 	%l0,	%l4	/* VM=0x3e, PM=0x3e */
							/* PR,PW,VR,VW = 4'b0100 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_5:
	setx	0x0000007c7ea0000f, 	%l0,	%l4	/* VM=0x3e, PM=0x3e */
							/* PR,PW,VR,VW = 4'b0101 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_6:
	setx	0x000000eeef00000f, 	%l0,	%l4	/* VM=0x77, PM=0x77 */
							/* PR,PW,VR,VW = 4'b1000 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_7:
	setx	0x000001ffff80000f, 	%l0,	%l4	/* VM=0xff, PM=0xff */
							/* PR,PW,VR,VW = 4'b1100 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_8:
	setx	0x000001111120000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b1001 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_9:
	setx	0x000001111140000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b1010 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_a:
	setx	0x000001111160000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b1011 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_b:
	setx	0x0000011110e0000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b0111 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_c:
	setx	0x0000011111c0000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b1110 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_d:
	setx	0x0000011111a0000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b1101 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

cfg3_e:
	setx	0x0000011110c0000f, 	%l0,	%l4	/* VM=0x88, PM=0x88 */
							/* PR,PW,VR,VW = 4'b0110 */
	ta	T_HTRAP_INST1

	call	wpt_masktest
	nop

wpt_rtn:
	add	%l7,	0,	%o7	
	retl
	nop

/*
 *******************************
 * test all the combinations  
 *    of VM, PM
 *******************************
 */
wpt_masktest:
	/*
	 ********************
	 * test load on VA
	 ********************
	 */
load_va:
	mov	0x62,	%o0
        ta      T_TRAP_EN
        nop
	mov	0x0,	%l0
	setx	VA_WATCHPOINT1,	%l0,	%l1
	lduba	[%l1] %asi,	%l2	
	lduba	[%l1+0x4] %asi,	%l2	
	lduba	[%l1+0x7] %asi,	%l2	
	lduha	[%l1+0x2] %asi,	%l2	
	lduha	[%l1+0x4] %asi,	%l2	
	lduha	[%l1+0x6] %asi,	%l2	
	lduwa	[%l1+0x4] %asi,	%l2	
	lduwa	[%l1] %asi,	%l2	
	ldxa	[%l1] %asi,	%l2	

	/*
	 ********************
	 * test store on VA
	 ********************
	 */
store_va:
	stba	%l2,	[%l1] %asi
	stba	%l2,	[%l1+0x4] %asi
	stba	%l2,	[%l1+0x7] %asi
	stha	%l2,	[%l1+0x2] %asi
	stba	%l2,	[%l1+0x4] %asi
	stha	%l2,	[%l1+0x6] %asi
	stwa	%l2,	[%l1+0x4] %asi
	stwa	%l2,	[%l1] %asi
	stxa	%l2,	[%l1] %asi

wpt_msktst_rtn:
	retl
	nop

.data

swap_data:
	.xword	0xffff5555aaaabbbb
	.xword	0xffff7777aaaacccc
	.xword	0xffffeeeeaaaadddd
	.xword	0xffffffffaaaaeeee
	.xword	0xffff2222aaaaffff
	.xword	0xffff3333aaaa5555
	.xword	0xffff4444aaaa6666
	.xword	0xffff11115555aaaa
	.xword	0xffff5555aaaabbbb
	.xword	0xffff7777aaaacccc
	.xword	0xffffeeeeaaaadddd
	.xword	0xffffffffaaaaeeee
	.xword	0xffff2222aaaaffff
	.xword	0xffff3333aaaa5555
	.xword	0xffff4444aaaa6666
	.xword	0xffff11115555aaaa
.end

SECTION .USER_TRAP TEXT_VA=0x20008000
attr_text {
	NAME = .USER_TRAP,
	hypervisor
	}
attr_text {
        Name = .USER_TRAP
        VA=0x20008000
	RA=0x20008000,
	PA=ra2pa(0x20008000, 0),
        part_0_i_ctx_zero_ps0_tsb,
        TTE_G=0, TTE_Context=0, TTE_V=1, TTE_Size=0x0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
        }

.global T0_VA_watch_point

/*
 *******************************
 * VA watch-point hit trap
 *******************************
 */
T0_VA_watch_point:
	mov	0x18,	%l5	
	mov	0x20,	%l6
	ta 	T_CHANGE_HPRIV
	!ldxa	[%l5] 0x58,	%l3
	!ldxa	[%l6] 0x58,	%l4
	mov	0x38,	%l5	
	mov	0x40,	%l6
	ldxa	[%l5] 0x58,	%l3
	!ldxa	[%l6] 0x58,	%l4
	ta 	T_CHANGE_NONHPRIV
	done
	nop
