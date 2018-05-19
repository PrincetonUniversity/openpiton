// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mt_template_1_body.s
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
/***********************************************************************
 *  Description:
 *  boundary cases for add instruction	
 *
 **********************************************************************/

#define SYSCMD_0 cat $DV_ROOT/verif/diag/assembly
#ifdef CSM_ENABLE
#define SYSCMD_1 bw_cpp -B -P -DNO_DECLARE_TSB -DMT_TEMPLATE -DCSM_ENABLE -DPTON_X_TILES=PTON_X_TILES -DPTON_Y_TILES=PTON_Y_TILES -DPTON_NUM_TILES=PTON_NUM_TILES -I$DV_ROOT/verif/diag/assembly/include
#else
#define SYSCMD_1 bw_cpp -B -P -DNO_DECLARE_TSB -DMT_TEMPLATE -I$DV_ROOT/verif/diag/assembly/include
#endif
#define SYSCMD_2 bw_m4 -I $DV_ROOT/verif/diag/assembly/include


SECTION .MAIN TEXT_VA=MAIN_BASE_TEXT_VA, DATA_VA=MAIN_BASE_DATA_VA
attr_text {
        Name = .MAIN,
        VA = MAIN_BASE_TEXT_VA,
        RA = MAIN_BASE_TEXT_RA,
        PA = MAIN_BASE_TEXT_PA,
        part_0_i_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_i_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}

attr_data {
        Name = .MAIN,
        VA = MAIN_BASE_DATA_VA,
        RA = MAIN_BASE_DATA_RA,
        PA = MAIN_BASE_DATA_PA,
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}


.global main
.text

main:

th_fork_jmp_p(th_main, %g2)

changequote([, ])

foreachbit([i], 32, M4_user_text_mask, [

SECTION .MAIN[_]i TEXT_VA= [0x]mpeval(MAIN_BASE_TEXT_VA + (i+1) * USER_PAGE_INCR, 16), DATA_VA= [0x]mpeval(MAIN_BASE_DATA_VA + (i+1) * USER_PAGE_INCR, 16)
attr_text {
        Name = .MAIN[_]i,
        VA= [0x]mpeval(MAIN_BASE_TEXT_VA + (i+1) * USER_PAGE_INCR, 16),
        PA= [0x]mpeval(MAIN_BASE_TEXT_PA + (i+1) * USER_PAGE_INCR, 16),
        RA= [0x]mpeval(MAIN_BASE_TEXT_RA + (i+1) * USER_PAGE_INCR, 16),
        part_0_i_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_i_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN[_]i,
        VA= [0x]mpeval(MAIN_BASE_DATA_VA + (i+1) * USER_PAGE_INCR, 16),
        PA= [0x]mpeval(MAIN_BASE_DATA_PA + (i+1) * USER_PAGE_INCR, 16),
        RA= [0x]mpeval(MAIN_BASE_DATA_RA + (i+1) * USER_PAGE_INCR, 16),
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=1, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
[.]text
[.]global th_main[_]i
th_main[_]i[:]
changequote({{, }})
ifelse(
i, 0, {{esyscmd(SYSCMD_0/THREAD_0_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 1, {{esyscmd(SYSCMD_0/THREAD_1_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 2, {{esyscmd(SYSCMD_0/THREAD_2_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 3, {{esyscmd(SYSCMD_0/THREAD_3_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 4, {{esyscmd(SYSCMD_0/THREAD_4_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 5, {{esyscmd(SYSCMD_0/THREAD_5_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 6, {{esyscmd(SYSCMD_0/THREAD_6_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 7, {{esyscmd(SYSCMD_0/THREAD_7_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 8, {{esyscmd(SYSCMD_0/THREAD_8_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 9, {{esyscmd(SYSCMD_0/THREAD_9_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 10, {{esyscmd(SYSCMD_0/THREAD_10_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 11, {{esyscmd(SYSCMD_0/THREAD_11_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 12, {{esyscmd(SYSCMD_0/THREAD_12_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 13, {{esyscmd(SYSCMD_0/THREAD_13_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 14, {{esyscmd(SYSCMD_0/THREAD_14_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 15, {{esyscmd(SYSCMD_0/THREAD_15_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 16, {{esyscmd(SYSCMD_0/THREAD_16_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 17, {{esyscmd(SYSCMD_0/THREAD_17_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 18, {{esyscmd(SYSCMD_0/THREAD_18_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 19, {{esyscmd(SYSCMD_0/THREAD_19_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 20, {{esyscmd(SYSCMD_0/THREAD_20_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 21, {{esyscmd(SYSCMD_0/THREAD_21_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 22, {{esyscmd(SYSCMD_0/THREAD_22_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 23, {{esyscmd(SYSCMD_0/THREAD_23_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 24, {{esyscmd(SYSCMD_0/THREAD_24_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 25, {{esyscmd(SYSCMD_0/THREAD_25_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 26, {{esyscmd(SYSCMD_0/THREAD_26_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 27, {{esyscmd(SYSCMD_0/THREAD_27_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 28, {{esyscmd(SYSCMD_0/THREAD_28_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 29, {{esyscmd(SYSCMD_0/THREAD_29_DIAG | SYSCMD_1 | SYSCMD_2)}},
i, 30, {{esyscmd(SYSCMD_0/THREAD_30_DIAG | SYSCMD_1 | SYSCMD_2)}},
{{esyscmd(SYSCMD_0/THREAD_30_DIAG | SYSCMD_1 | SYSCMD_2)}})
changequote([, ])
	
	nop
	nop
	ta	T_GOOD_TRAP
])dnl
changequote(`, ')dnl'
