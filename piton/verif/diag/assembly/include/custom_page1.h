// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: custom_page1.h
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
#define USER_PAGE_CUSTOM_MAP
#include "boot.s"

#ifndef CUSTOM_CP
#define CUSTOM_CP 1
#endif

SECTION .MAIN  TEXT_VA=0x1000000, DATA_VA=0x2000000

attr_text {
        Name = .MAIN,
        VA=0x1000000,
        RA=0x130000000,
        PA=ra2pa(0x130000000,0),
        part_0_i_ctx_nonzero_ps0_tsb,
#ifdef SELFMOD
        part_0_d_ctx_nonzero_ps0_tsb,
        #ifdef CSM_ENABLE
            part_0_d_ctx_nonzero_ps0_tsb_csm,
        #endif
#endif
#ifdef CSM_ENABLE
        part_0_i_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=CUSTOM_CP, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
attr_data {
        Name = .MAIN,
        VA=0x2000000,
        RA=0x132000000,
        PA=ra2pa(0x132000000,0),
        part_0_d_ctx_nonzero_ps0_tsb,
#ifdef CSM_ENABLE
        part_0_d_ctx_nonzero_ps0_tsb_csm,
        TTE_HDID=0, TTE_HD_SIZE=mpeval(PTON_NUM_TILES%64), TTE_SDID=0, TTE_LSID=0,
#endif
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_SIZE_PTR=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=CUSTOM_CP, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }

