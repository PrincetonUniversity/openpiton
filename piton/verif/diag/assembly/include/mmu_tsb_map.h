// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: mmu_tsb_map.h
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


#ifndef MAP_AND_ENABLE_IMU	
#define MAP_AND_ENABLE_IMU 1	/* Default IMU	enable value */
#endif
#ifndef MAP_AND_ENABLE_DMU	
#define MAP_AND_ENABLE_DMU 1	/* Default DMU	enable value */
#endif

#ifndef MMU_PAGE_SIZE
#define MMU_PAGE_SIZE 8K
#endif

#ifndef USER_CONTEXT
#define USER_CONTEXT 44
#endif

/* Added following user text/data TTE switches.                            */
/* See /diag/src/sit/examples/exampleTweakUserMmuMap.s or exampleMmuMap.s  */

/* Note:  PAs of the default user text and data have been picked to avoid  */
/* conflict with privileged code for E$ sizes of 2M and 4M, but to cause   */
/* conflict for sizes of 512K and 1M.      GA 5/20/93.                     */

#ifndef USER_TEXT_CONTEXT
#define USER_TEXT_CONTEXT		USER_CONTEXT
#endif
#ifndef USER_TEXT_GLOBAL_BIT
#define USER_TEXT_GLOBAL_BIT		0
#endif
#ifndef USER_TEXT_WRITE_BIT
#define USER_TEXT_WRITE_BIT		0
#endif
#ifndef USER_TEXT_PRIV_BIT
#define USER_TEXT_PRIV_BIT		0
#endif
#ifndef USER_TEXT_SIDE_EFFECT_BIT
#define USER_TEXT_SIDE_EFFECT_BIT	0	/* read-only 0 in IMU. */
#endif
#ifndef USER_TEXT_CV_BIT
#define USER_TEXT_CV_BIT		0	/* read-only 0 in IMU. */
#endif
#ifndef USER_TEXT_CP_BIT
#define USER_TEXT_CP_BIT		1
#endif
#ifndef USER_TEXT_LOCK_BIT
#define USER_TEXT_LOCK_BIT		0
#endif
#ifndef USER_TEXT_SN_BIT
#define USER_TEXT_SN_BIT		0
#endif


#ifndef USER_TEXT_PA

#ifdef  SYSTEM
#define USER_TEXT_PA			00000080000
#else
#define USER_TEXT_PA			00010100000
#endif

#endif

#ifndef USER_TEXT_IE_BIT
#define USER_TEXT_IE_BIT		0	/* read-only 0 in IMU. */
#endif
#ifndef USER_TEXT_NFO_BIT
#define USER_TEXT_NFO_BIT		0	/* read-only 0 in IMU. */
#endif
#ifndef USER_TEXT_SIZE
#define USER_TEXT_SIZE			MMU_PAGE_SIZE
#endif

#ifndef USER_DATA_CONTEXT
#define USER_DATA_CONTEXT		USER_CONTEXT
#endif
#ifndef USER_DATA_GLOBAL_BIT
#define USER_DATA_GLOBAL_BIT		0
#endif
#ifndef USER_DATA_WRITE_BIT
#define USER_DATA_WRITE_BIT		1
#endif
#ifndef USER_DATA_PRIV_BIT
#define USER_DATA_PRIV_BIT		0
#endif
#ifndef USER_DATA_SIDE_EFFECT_BIT
#define USER_DATA_SIDE_EFFECT_BIT	0
#endif
#ifndef USER_DATA_CV_BIT
#define USER_DATA_CV_BIT		1
#endif
#ifndef USER_DATA_CP_BIT
#define USER_DATA_CP_BIT		1
#endif
#ifndef USER_DATA_LOCK_BIT
#define USER_DATA_LOCK_BIT		0
#endif
#ifndef USER_DATA_SN_BIT
#define USER_DATA_SN_BIT		0
#endif

#ifndef USER_DATA_PA

#ifdef	SYSTEM
#define USER_DATA_PA			000000D0000
#else
#define USER_DATA_PA			00020200000
#endif

#endif

#ifndef USER_DATA_IE_BIT
#define USER_DATA_IE_BIT		0
#endif
#ifndef USER_DATA_NFO_BIT
#define USER_DATA_NFO_BIT		0
#endif
#ifndef USER_DATA_SIZE
#define USER_DATA_SIZE			MMU_PAGE_SIZE
#endif

