// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: template_mt.s
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
#define USER_START_LABEL c_start
#define MAIN_TEXT_DATA_ALSO

!define stack size
!--------------------------------------------------
#ifndef STACKSIZE
#define STACKSIZE	4096
#endif

!Include this before boot.s to use spill/fill traps 
!--------------------------------------------------
#include "c/ctraps.h"
#include "boot.s"

#ifndef CUSTOM_TRAPS_BASE_TEXT_ADDR
#define CUSTOM_TRAPS_BASE_TEXT_ADDR       0x500000
#endif

#ifndef CUSTOM_TRAPS_BASE_TEXT_ADDR_RA
#define CUSTOM_TRAPS_BASE_TEXT_ADDR_RA  0x10500000
#endif
	
#ifndef CUSTOM_TRAPS_BASE_DATA_ADDR
#define CUSTOM_TRAPS_BASE_DATA_ADDR       0x510000
#endif

#ifndef CUSTOM_TRAPS_BASE_DATA_ADDR_RA
#define CUSTOM_TRAPS_BASE_DATA_ADDR_RA  0x10510000
#endif
	
#ifndef C_BASE_TEXT_ADDR
#define C_BASE_TEXT_ADDR               0x520000
#endif
	
#ifndef C_BASE_TEXT_ADDR_RA
#define C_BASE_TEXT_ADDR_RA          0x10520000
#endif
	
#ifndef C_BASE_DATA_ADDR
#define C_BASE_DATA_ADDR               0x530000
#endif

#ifndef	C_BASE_DATA_ADDR_RA
#define C_BASE_DATA_ADDR_RA          0x10530000
#endif

#ifndef MTCHELPER_BASE_DATA_ADDR0
#define MTCHELPER_BASE_DATA_ADDR0         0xd30000
#endif

#ifndef	MTCHELPER_BASE_DATA_ADDR_RA0
#define MTCHELPER_BASE_DATA_ADDR_RA0    0x10d30000
#endif


/*****************************************************************************
 * SECTION .CUSTOM_TRAPS
 * Trap handlers that will run in nucleus context
 *****************************************************************************/

SECTION .CUSTOM_TRAPS \
	TEXT_VA=CUSTOM_TRAPS_BASE_TEXT_ADDR, \
	DATA_VA=CUSTOM_TRAPS_BASE_DATA_ADDR

changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[	
attr_text {
        NAME=.CUSTOM_TRAPS,
	VA=CUSTOM_TRAPS_BASE_TEXT_ADDR,
	RA=CUSTOM_TRAPS_BASE_TEXT_ADDR_RA,
	PA=ra2pa2(CUSTOM_TRAPS_BASE_TEXT_ADDR_RA, i),
	[part_]i[_i_ctx_zero_ps0_tsb],
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
	}
])dnl
])dnl
changequote(`,')dnl'

#ifdef MAIN_PAGE_HV_ALSO
attr_text {
        NAME=.CUSTOM_TRAPS,
        VA=CUSTOM_TRAPS_BASE_TEXT_ADDR,
        hypervisor
        }
#endif

changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[	
attr_data {
        NAME=.CUSTOM_TRAPS,
        VA=CUSTOM_TRAPS_BASE_DATA_ADDR,
	RA=CUSTOM_TRAPS_BASE_DATA_ADDR_RA,
	PA=ra2pa2(CUSTOM_TRAPS_BASE_DATA_ADDR_RA, i),
	[part_]i[_d_ctx_zero_ps0_tsb],
        TTE_G=1, TTE_Context=0, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
        }
])dnl
])dnl
changequote(`,')dnl'

#include "c/ctraps.s"

/*****************************************************************************
 * SECTION .C
 * Code and data for C library
 *****************************************************************************/
	
SECTION .C \
	TEXT_VA=C_BASE_TEXT_ADDR, \
	DATA_VA=C_BASE_DATA_ADDR

changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[	
attr_text {
        NAME=.C
	VA=C_BASE_TEXT_ADDR,
	RA=C_BASE_TEXT_ADDR_RA,
	PA=ra2pa2(C_BASE_TEXT_ADDR_RA, i),
	[part_]i[_i_ctx_nonzero_ps0_tsb],
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=0
}	
])dnl
])dnl
changequote(`,')dnl'


#ifdef MAIN_PAGE_HV_ALSO
attr_text {
      NAME=.C
      VA=C_BASE_TEXT_ADDR,
      hypervisor
      }     
#endif

changequote([, ])dnl
forloop([i], 0, 7, [
ifdef([part_]i[_used],[	
attr_data {
        NAME=.C,
	VA=C_BASE_DATA_ADDR,
	RA=C_BASE_DATA_ADDR_RA,
	PA=ra2pa2(C_BASE_DATA_ADDR_RA, i),
	[part_]i[_d_ctx_nonzero_ps0_tsb],	
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1,
	TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}	
])dnl
])dnl
changequote(`,')dnl'

#include "c/stackinit_mt.s"
#include "c/libc.s"
#include "c/put.s"
!------------------------------------------------------------------------------



#ifdef MTCHELPER

/*****************************************************************************
 * SECTION .MTCHELPER0
 * An additional sectiob with more data
 *****************************************************************************/
	
SECTION .MTCHELPER0 \
	DATA_VA=MTCHELPER_BASE_DATA_ADDR0

attr_data {
        NAME=.MTCHELPER0,
	VA=MTCHELPER_BASE_DATA_ADDR0,
	RA=MTCHELPER_BASE_DATA_ADDR_RA0,
	PA=ra2pa(MTCHELPER_BASE_DATA_ADDR_RA0, 0),
	part_0_d_ctx_nonzero_ps0_tsb,	
        TTE_G=0, TTE_Context=PCONTEXT, TTE_V=1,
	TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1
}	

.section .data

.global	shared_memory2
shared_memory2:
	.skip 0x1000

.global	shared_memory_buffers2
shared_memory_buffers2:
	.skip 0x4000

#endif


#ifndef USER_PAGE_CUSTOM_MAP
SECTION .MAIN
#endif
