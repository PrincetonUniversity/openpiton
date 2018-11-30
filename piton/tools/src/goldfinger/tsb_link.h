// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsb_link.h
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
#ifndef _TSB_LINK_H_
#define _TSB_LINK_H_


/*
 * tsb_link.h
 *
 * Implements a tsb_link - a linked-list area to handle collisions in
 * the TSB.  It defines a global variable, Tsb_link_vector, which is
 * created by the block parser, attr_yyparse().  The function
 * write_tsb_links will write the TSB link areas to the mmu image file.
 */

#include <stdio.h>
#include <inttypes.h>
#include "vector.h"

/* can't include tsb.h because of circularity */
struct tsb_entry_s;
struct tsbcsm_entry_s;
struct block_s;
struct block_tsb_s;

/* Each link entry has a tag/data and a pointer to the next entry in
   the list */
typedef struct tsb_link_entry_s {
  uint64_t tag;
  uint64_t data;
  uint64_t link;                     /* PA of next entry */

  struct block_s *block;               /* Pointer to block for debug */
  struct block_tsb_s *block_tsb;       /* Pointer to block_tsb for debug */
  uint64_t my_link;                  /* PA of this entry */
  struct tsb_link_entry_s *next;     /* Pointer to next	tsb_link_entry_t
					in logical linked list */
} tsb_link_entry_t, *tsb_link_entry_vector_el_t;

typedef struct tsbcsm_link_entry_s {
  uint64_t tag;
  uint64_t clump_num;
  uint64_t link;                     /* PA of next entry */

  struct block_s *block;               /* Pointer to block for debug */
  struct block_tsbcsm_s *block_tsb;       /* Pointer to block_tsb for debug */
  uint64_t my_link;                  /* PA of this entry */
  struct tsbcsm_link_entry_s *next;     /* Pointer to next	tsb_link_entry_t
					in logical linked list */
} tsbcsm_link_entry_t, *tsbcsm_link_entry_vector_el_t;


typedef struct tsb_link_s {
  char *name;                     /* name of tsb_link area */
  uint64_t start_addr;            /* starting PA of tsb_link area */

  char *srcfile;                  /* source file where tsb_link area defined */
  int   srcline;                  /* line number of definition */
  
  vector_t entries;               /* List of entries */

  int lineno;                     /* Line number in blocks file */

} tsb_link_t, *tsb_link_vector_el_t;

typedef struct tsbcsm_link_s {
  char *name;                     /* name of tsb_link area */
  uint64_t start_addr;            /* starting PA of tsb_link area */

  char *srcfile;                  /* source file where tsb_link area defined */
  int   srcline;                  /* line number of definition */
  
  vector_t entries;               /* List of entries */

  int lineno;                     /* Line number in blocks file */

} tsbcsm_link_t, *tsbcsm_link_vector_el_t;

extern vector_t Tsb_link_vector;
extern vector_t Tsbcsm_link_vector;


#define TSB_LINK_TAG ((uint64_t)-1)


/* Initialize Tsb_link_vector - call before parsing */
extern void clear_tsb_link_vector(void);
extern void clear_tsbcsm_link_vector(void);

/* Hook up pointers after all objects are created - call after parsing
   and before use */
extern void finish_tsb_link_init(void);
extern void finish_tsbcsm_link_init(void);

/* Debug function to print tsb_link area */
extern void print_tsb_link_vector();

/* Lookup by name*/
extern tsb_link_t *get_tsb_link_ptr_by_name(char *name);
extern tsbcsm_link_t *get_tsbcsm_link_ptr_by_name(char *name);

/* Write tsb_link areas to mmu image file */
extern void write_tsb_links(FILE *ofh);
extern void write_tsbcsm_links(FILE *ofh);

/* Add to tsb_link. The tsb_entry is the entry in the TSB that caused
   the collision.  The tag & data are the elements to add */
extern void tsb_link_add_entry(tsb_link_t *tsb_link,
			       uint64_t tag, uint64_t data,
			       struct tsb_entry_s *tsb_entry,
			       struct block_s *block,
			       struct block_tsb_s *block_tsb
			       );
extern void tsbcsm_link_add_entry(tsbcsm_link_t *tsb_link,
			       uint64_t tag, uint64_t clump_num,
			       struct tsbcsm_entry_s *tsbcsm_entry,
                   struct tsb_entry_s *tsb_entry,
			       struct block_s *block,
			       struct block_tsbcsm_s *block_tsb
			       );


/* If this is called, do not make it an error to add duplicate tags to
   a linked list. */
extern void disable_dup_tags_error(void);

/**************************************************************************** 
 *
 * PARSER FUNCTIONS 
 *
 ****************************************************************************/

extern void open_new_tsb_link(char *name, int lineno);
extern void close_tsb_link(int lineno);
extern void open_new_tsbcsm_link(char *name, int lineno);
extern void close_tsbcsm_link(int lineno);


/* Used by parser to set attributes of open block block */

#define SET_TSB_LINK_PROTO(_member_name, _type)			\
extern void set_tsb_link_ ## _member_name(_type _member_name)

#define SET_TSBCSM_LINK_PROTO(_member_name, _type)			\
extern void set_tsbcsm_link_ ## _member_name(_type _member_name)

#define SET_TSBCSM_PROTO(_member_name, _type)			\
extern void set_tsbcsm_ ## _member_name(_type _member_name)

SET_TSB_LINK_PROTO(start_addr, uint64_t);
SET_TSB_LINK_PROTO(srcfile, char *);
SET_TSB_LINK_PROTO(srcline, int);
SET_TSBCSM_LINK_PROTO(start_addr, uint64_t);
SET_TSBCSM_LINK_PROTO(srcfile, char *);
SET_TSBCSM_LINK_PROTO(srcline, int);
SET_TSBCSM_PROTO(start_addr, uint64_t);
SET_TSBCSM_PROTO(srcfile, char *);
SET_TSBCSM_PROTO(srcline, int);

#endif
