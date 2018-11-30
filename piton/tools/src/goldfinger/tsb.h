// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsb.h
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
#ifndef _TSB_H_
#define _TSB_H_

/*
 * tsb.h
 *
 * This implements a TSB.  It defines a global variable, Tsb_vector,
 * which is a list of all TSBs.  It is built by the block parser,
 * attr_yyparse().  The block blocks add to the TSBs as appropriate.
 * The TSB programming is then written to the mmu image by write_tsbs().
 */

#include <stdio.h>
#include <inttypes.h>
#include "tsb_link.h"
#include "vector.h"
#include "gf_types.h"

/* Can't include block.h or block_tsb.h because of circularity */
struct block_s;
struct block_tsb_s;

/* Tsb entry is tag & data.  The pointer to an block object is just
   there so I can print a good error message in case of a TSB
   collision. */
typedef struct tsb_entry_s {
  uint64_t tag;
  uint64_t data;

  struct block_s *block;
  struct block_tsb_s *block_tsb;
} tsb_entry_t;

typedef struct tsbcsm_entry_s {
  uint64_t tag;
  uint64_t data;
  uint64_t clump_num;

  struct block_s *block;
  struct block_tsbcsm_s *block_tsb;
} tsbcsm_entry_t;



typedef struct tsb_s {
  char *name;                /* name of TSB */
  uint64_t   num_entries;    /* number of entries */
  uint64_t   size_bits;      /* encoded size bits */
  uint64_t   split;          /* binary. is split */
  addr_t     start_addr;     /* start PA of TSB */

  char *link_area;           /* name of tsb_link area */
  tsb_link_t *link_ptr;      /* pointer to tsb_link object named above */

  char *srcfile;             /* Source file where this TSB was defined */
  int  srcline;              /* Line number of definition */

  tsb_entry_t *entries;      /* Array of entries */

  int lineno;                /* line number in blocks file */
} tsb_t, *tsb_vector_el_t;

typedef struct tsbcsm_s {
  char *name;                /* name of TSB */
  uint64_t   num_entries;    /* number of entries */
  uint64_t   size_bits;      /* encoded size bits */
  uint64_t   split;          /* binary. is split */
  addr_t     start_addr;     /* start PA of TSB */

  char *link_area;           /* name of tsb_link area */
  tsbcsm_link_t *link_ptr;      /* pointer to tsb_link object named above */

  char *srcfile;             /* Source file where this TSB was defined */
  int  srcline;              /* Line number of definition */

  tsbcsm_entry_t *entries;      /* Array of entries */

  int lineno;                /* line number in blocks file */
} tsbcsm_t, *tsbcsm_vector_el_t;


extern vector_t Tsb_vector;
extern vector_t Tsbcsm_vector;



/* Set to 1 to not print tag=0,data=0 lines in tsb file.  This will make the
   file not work in diag generation, but it's userful in debugging */
extern int Suppress_zero;

/* default is 0, so TSB collision is error.  Set to 1 to enable tsb_links */
extern int Allow_tsb_conflicts;

/* Initialize Tsb_vector - call before parsing */
extern void clear_tsb_vector(void);
extern void clear_tsbcsm_vector(void);


/* Hook up pointers after all objects are created - call after parsing
   and before use */
extern void finish_tsb_init(void);
extern void finish_tsbcsm_init(void);

/* Debug function to print tsbs */ 
extern void print_tsb_vector(void);

/* Lookup TSB by name */
extern tsb_t *get_tsb_ptr_by_name(char *name);
extern tsbcsm_t *get_tsbcsm_ptr_by_name(char *name);

/* Write TSB programming to mmu image file */
extern void write_tsbs(FILE *ofh);
extern void write_tsbcsms(FILE *ofh);


/* Returns the size field of the TSB.  The block object needs to be
   able to do this so it knows how many bits of the TSB to use for an
   index */
extern uint64_t get_tsb_size_bits(tsb_t *tsb);
extern uint64_t get_tsbcsm_size_bits(tsbcsm_t *tsb);


/* Adds tag & data to the tsb at the specified index.  The block pointer is stored for better error reporting */
extern void add_entry(tsb_t *tsb, uint64_t index, uint64_t tag, uint64_t data,
		      struct block_s *block, struct block_tsb_s *block_tsb);
extern void add_entry_csm(tsbcsm_t *tsbcsm, tsb_t *tsb, uint64_t index, uint64_t tag, uint64_t data, uint64_t clump_num,
		      struct block_s *block, struct block_tsbcsm_s *block_tsb);


/**************************************************************************** 
 *
 * PARSER FUNCTIONS 
 *
 ****************************************************************************/

extern void open_new_tsb(char *name, int lineno);
extern void close_tsb(int lineno);

extern void open_new_tsbcsm(char *name, int lineno);
extern void close_tsbcsm(int lineno);

/* Used by parser to set attributes of open tsb */

#define SET_TSB_PROTO(_member_name, _type)			\
extern void set_tsb_ ## _member_name(_type _member_name)

SET_TSB_PROTO(num_entries, uint64_t);
SET_TSB_PROTO(size_bits, uint64_t);
SET_TSB_PROTO(split, uint64_t);
SET_TSB_PROTO(srcfile, char *);
SET_TSB_PROTO(srcline, int);
SET_TSB_PROTO(start_addr, uint64_t);
SET_TSB_PROTO(link_area, char *);


#endif
