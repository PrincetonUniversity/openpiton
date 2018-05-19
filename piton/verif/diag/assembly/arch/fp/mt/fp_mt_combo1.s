// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: fp_mt_combo1.s
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
/*
 *  Description:
 *  This is a generated diag using spc_st2mt_diag script
 *  This has the following:
 *     On thread 0: fp_addsub0.s
 *     On thread 1: fp_arth_exc0.s
 *     On thread 2: fp_ldst_gen0.s
 */

#define THREAD_COUNT    2
                

#define USER_PAGE_CUSTOM_MAP
#define USER_TEXT_MT_MAP
#define USER_DATA_MT_MAP

#define ENABLE_T0_Fp_disabled_0x20
#define H_T0_Fp_exception_ieee_754_0x21 T0_Fp_exception_ieee_754
#define	H_T0_Fp_exception_other_0x22 T0_Fp_exception_other
#include "boot.s"

#define THREAD_0_DIAG arch/fp/fp_addsub0_a.s
#define THREAD_1_DIAG arch/fp/fp_ldst_gen0.s

#include "mt_template_1_body.s" 


