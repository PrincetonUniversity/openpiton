// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: block_tsb.h
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
#ifndef _BLOCK_TSB_H_
#define _BLOCK_TSB_H_


/*
 * block_tsb.h
 *
 * A block_t contains a vector of block_tsb objects.  Each block_tsb
 * object defines a TSB that the block should be added to, and the
 * parameters that should be used to add to the TSB.
 */



#include "gf_types.h"
#include "gf_error.h"
#include "tsb.h"

struct block_s;

typedef struct block_tsb_s {
  char *  name;                    /* name of the TSB */
  tsb_t * tsb;                     /* pointer to TSB this object
				      refers to */

  struct block_s *block;           /* ptr to block that contains this
				      object */

  bit_range_t va_index_bits;       /* bits of VA to use in index
				      computation.  NOTE the TSB will
				      add its size field to the hi end
				      of this. */
  bit_range_t tag_addr_bits;       /* bits of VA to use for TSB tag */
  bit_range_t tte_tag_addr_bits;   /* bits of TSB tag put VA into */
  bit_range_t data_addr_bits;      /* bits of TSB data to use for RA */
  uint64_t page_size;              /* page size in bytes */
  addr_t tag_base;                 /* TSB tag with no VA bits set -
				      used to give to TSBs */
  addr_t data_base;                /* TSB data with no RA bits set -
				      used to give to TSBs */

  /* common for all parser-created objects */
  char *srcfile;        /* Source file where this block_tsb is defined */
  int   srcline;        /* Line in the source file for definition */
  int   lineno;         /* Line in .goldfinger file where this block_tsb
			   is defined */

} block_tsb_t, *block_tsb_vector_el_t;

typedef struct block_tsbcsm_s {
  char *  name;                    /* name of the TSB */
  tsbcsm_t * tsbcsm;                     /* pointer to TSB this object
				      refers to */

  struct block_s *block;           /* ptr to block that contains this
				      object */
  bit_range_t va_index_bits;       /* bits of VA to use in index
				      computation.  NOTE the TSB will
				      add its size field to the hi end
				      of this. */
  bit_range_t tag_addr_bits;       /* bits of VA to use for TSB tag */
  bit_range_t tte_tag_addr_bits;   /* bits of TSB tag put VA into */
  bit_range_t data_addr_bits;      /* bits of TSB data to use for RA */
  uint64_t page_size;              /* page size in bytes */
  addr_t tag_base;                 /* TSB tag with no VA bits set -
				      used to give to TSBs */
  addr_t data_base;                /* TSB data with no RA bits set -
				      used to give to TSBs */

  uint64_t clump_num;
  /* common for all parser-created objects */
  char *srcfile;        /* Source file where this block_tsb is defined */
  int   srcline;        /* Line in the source file for definition */
  int   lineno;         /* Line in .goldfinger file where this block_tsb
			   is defined */

} block_tsbcsm_t, *block_tsbcsm_vector_el_t;


/* Vector element fucntions. Used to maninipulate entries in a block_tsb
   vector */
extern void init_block_tsb(block_tsb_vector_el_t *block_tsbp, void *data);
extern void print_block_tsb(block_tsb_vector_el_t *block_tsbp, void *data);

extern void init_block_tsbcsm(block_tsbcsm_vector_el_t *block_tsbp, void *data);
extern void print_block_tsbcsm(block_tsbcsm_vector_el_t *block_tsbp, void *data);

/* after all objects are created, do whatever initializationis necessary */
extern void finish_single_block_tsb_init(block_tsb_vector_el_t *block_tsbp,
					 void*);

extern void finish_single_block_tsbcsm_init(block_tsbcsm_vector_el_t *block_tsbp,
					 void*);

/* allow search by block_tsb name */
extern int  block_tsb_name_compare(block_tsb_vector_el_t *block_tsbp,
				   char *name);
/* Cry foul if a block_tsb is improperly defined */
extern void sanity_check_block_tsb(block_tsb_vector_el_t *block_tsbp,
				   void *data);

extern void add_block_tsb_to_tsb(block_tsb_vector_el_t *block_tsbp,
				 void *data);
extern void add_block_tsbcsm_to_tsbcsm(block_tsbcsm_vector_el_t *block_tsbp, 
                block_tsb_vector_el_t *block_tsbp2, void *data);

/* Debugging function - given a TSB tag, return the VA */
extern addr_t tag2va(block_tsb_t *block_tsb, uint64_t tag, uint64_t index);
extern addr_t csmtag2va(block_tsbcsm_t *block_tsb, uint64_t tag, uint64_t index);


/**************************************************************************** 
 *
 * PARSER FUNCTIONS 
 *
 ****************************************************************************/

#define BLK_TSB_SET_PROTO(_member_name, _type)			\
extern void blk_tsb_set_ ## _member_name (block_tsb_t *block,	\
                                          _type _member_name)

BLK_TSB_SET_PROTO(tag_base, addr_t);
BLK_TSB_SET_PROTO(data_base, addr_t);
BLK_TSB_SET_PROTO(page_size, uint64_t);
BLK_TSB_SET_PROTO(srcfile, char *);
BLK_TSB_SET_PROTO(srcline, int);

#define BLK_TSB_SET_BITS_PROTO(_member_name)				      \
extern void blk_tsb_set_ ## _member_name (block_tsb_t *block_tsb, int hi_bit, \
				      int lo_bit)

BLK_TSB_SET_BITS_PROTO(va_index_bits);
BLK_TSB_SET_BITS_PROTO(tag_addr_bits);
BLK_TSB_SET_BITS_PROTO(data_addr_bits);

extern void blk_tsbcsm_set_clump_num (block_tsbcsm_t *block_tsb, uint64_t clump_num) ;
extern void blk_tsbcsm_set_clump_num (block_tsbcsm_t *block_tsb, uint64_t clump_num) ;
extern void blk_tsb_set_tte_tag_addr_bits(block_tsb_t *block_tsb, int hi_bit, int lo_bit) ;

#endif
