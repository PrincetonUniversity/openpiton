// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: pstate.h
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

!		         PSTATE
!	.--+--+---+---.-----+---+---.--+----+--+--+
!	|IG|MG|CLE|TLE|  MM |RED|PEF|AM|PRIV|IE|AG|
!	+--+--+---+---+-----+---+---+--+----+--+--+
!	 11 10  9   8  7   6  5   4   3   2   1  0

#define PSTATE_IG_MASK		0x800
#define PSTATE_MG_MASK		0x400
#define PSTATE_CLE_MASK		0x200
#define PSTATE_TLE_MASK		0x100
#define PSTATE_MM_MASK		0x0C0
#define	PSTATE_RED_MASK		0x020
#define	PSTATE_PEF_MASK		0x010
#define	PSTATE_AM_MASK		0x008
#define	PSTATE_PRIV_MASK	0x004
#define	PSTATE_IE_MASK		0x002
#define	PSTATE_AG_MASK		0x001

#define PSTATE_IG_SHIFT		11
#define PSTATE_MG_SHIFT		10
#define PSTATE_CLE_SHIFT	9
#define PSTATE_TLE_SHIFT	8
#define PSTATE_MM_SHIFT		6
#define	PSTATE_RED_SHIFT	5
#define	PSTATE_PEF_SHIFT	4
#define	PSTATE_AM_SHIFT		3
#define	PSTATE_PRIV_SHIFT	2
#define	PSTATE_IE_SHIFT		1
#define	PSTATE_AG_SHIFT		0

#define PSTATE_MM_TSO		0
#define	PSTATE_MM_PSO		1
#define	PSTATE_MM_RMO		2

#define	MM_TSO			PSTATE_MM_TSO
#define	MM_PSO			PSTATE_MM_PSO
#define	MM_RMO			PSTATE_MM_RMO

#define	PSTATE_RD(REG) rdpr %pstate,REG
#define	PSTATE_WR(REG) wrpr REG,%pstate
