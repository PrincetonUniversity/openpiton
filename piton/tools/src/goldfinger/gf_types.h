// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: gf_types.h
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
#ifndef _GF_TYPES_H_
#define _GF_TYPES_H_

/*
 * gf_types.h
 *
 * Defines some types that are used all over goldfinger.
 */


#include <inttypes.h>


typedef uint64_t addr_t;
typedef unsigned long seclen_t;

#define seclen_d_f "%ld"
#define seclen_x_f "%lx"

#ifdef __x86_64__
#define uint64_d_f "ld"
#define uint64_x_f "lx"
#else
#define uint64_d_f "lld"
#define uint64_x_f "llx"
#endif

typedef struct bit_range_s {
  int hi;
  int lo;
} bit_range_t;


/* creates a mask (shifted to start at bit 0) for the given bit range */
#define bit_range_to_shifted_mask_64(_bit_range)			\
(									\
    ((((uint64_t) 1) <<  ((_bit_range.hi) - (_bit_range).lo + 1)) - 1)	\
)

/* creates a mask (in the correct posistion) for the given bit range */
#define bit_range_to_mask_64(_bit_range)			\
(bit_range_to_shifted_mask_64(_bit_range) << (_bit_range).lo)


#define NO_ADDR ((addr_t)(-1))

#endif
