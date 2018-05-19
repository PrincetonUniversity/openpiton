// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ver.h
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


/*
		                VER
	+-.-.-.-.-.-.-.-.---.---.---.---.---.---.----+-.----+
	| MANUF |  IMPL |  MASK |  RSVD | MAXTL |RSVD|MAXWIN|
	+-------+-------+-------+-------+-------+----+------+
	 63   48 47   32 31   24 23   16 15    8 7  5 4    0

*/

#define VER_MANUF_MASK		0xFFFF000000000000
#define VER_IMPL_MASK		0x0000FFFF00000000
#define VER_MASK_MASK		0x00000000FF000000
#define VER_MAXTL_MASK		0x000000000000FF00
#define VER_MAXWIN_MASK		0x000000000000001F

#define VER_MANUF_SHIFT		48
#define VER_IMPL_SHIFT		32
#define VER_MASK_SHIFT		24
#define VER_MAXTL_SHIFT		8
#define VER_MAXWIN_SHIFT	0

#define	VER_RD(REG) rdpr %ver,REG
#define	VER_WR(REG) wrpr REG,%ver
