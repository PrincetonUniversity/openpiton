// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: block.h
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
#ifndef _BLOCK_H_
#define _BLOCK_H_


/*
 * block.h
 *
 * This is the interface for an block object.  An block is a
 * specification for how a portion of a linked executable (an app_t
 * object, see app.h) should be turned into a memory image and/or a
 * symbol table.
 *
 * Each app_t object includes a vector of blocks.  The vector is created
 * by the parser.  The application will iterated over its blocks when
 * it comes time to generate output.
 */



#include <stdio.h>
#include <libelf.h>

#include "gf_types.h"
#include "linked_section.h"


extern int Compress;
extern int EnvZero;

typedef struct block_s {
  char *name;           /* name of block */
  char *section_name;   /* name of section this block belongs to (for debug) */
  char *segment_name;   /* name of segment this block belongs to (for debug) */
  char *link_section;   /* ELF name of link section this block describes */
  int compress;         /* Binary.  Compress memory image for block? */
  addr_t va;            /* VA of block start */
  addr_t ra;            /* RA of block start */
  addr_t pa;            /* PA of block start */
  int in_image;         /* Boolean.  Include this block in memory
			   image? Default=1. */

  addr_t end_va;        /* ending va of block */

  /* start/end va may also be specified by label */
  char *start_label;    /* start label for block */
  char *end_label;      /* end label for block */
  vector_t tsbs;        /* list of tsbs (block_tsb objects) this block
			   should write to */
  vector_t tsbcsms;     /* list of tsbcsms (block_tsb objects) this block
			   should write to */
  

  int no_end_range_check;          /* If 1, don't care if end_va is
				      off the end of the segment */

  /* Boolean.  Alternate way to set RA and PA.  Sets them to VA
     (truncated to PASIZE) after the VA has been set (or computed from
     a label) */
  int ra_eq_va; 
  int pa_eq_va;



  linked_section_t *linked_section_obj; /* Pointer to linked section
					   object that corresponds to
					   this block. */

  /* common for all parser-created objects */
  char *srcfile;        /* Source file where this block is defined */
  int   srcline;        /* Line in the source file for definition */
  int   lineno;         /* Line in .goldfinger file where this block
			   is defined */

  
  /* derived aprameters */
  addr_t d_offset;        /* Offset from the beginning of elf section
			   where this block begins. */
  addr_t d_length;        /* Number of bytes encompassed by the block. */


  /* used internally */
  int open_block_tsb_index;
  int open_block_tsbcsm_index;

} block_t, *block_vector_el_t;


/* Vector element fucntions. Used to maninipulate entries in a block vector */
extern void init_block(block_vector_el_t *blockp, void *data);
extern void print_block(block_vector_el_t *blockp, void *data);
/* after all objects are created, do whatever initializationis necessary */
extern void finish_single_block_init(block_vector_el_t *blockp, void*);
/* allow search by block name */
extern int  block_name_compare(block_vector_el_t *blockp, char *name);
/* allow search by link_section */
extern int  block_link_section_compare(block_vector_el_t *blockp, char *name);

/* Add the block to all TSBs named in its contained block_tsb objects */
extern void block_add_to_tsbs(block_vector_el_t *blockp, void *data);
extern void block_add_to_tsbcsms(block_vector_el_t *blockp, void *data);


/* Cry foul if a block is improperly defined */
extern void sanity_check_block(block_t *block);

/* Calculate the VA and size of the block, after the linked_section
   object has been created. */
extern void block_calculate_size(block_t *block);

/* Check that we have actually seen the link_section we were supposed to */
extern void block_check_link_section_exists(block_vector_el_t *blockp,
					    void *data);


/* Output functions */
extern void block_print_symtab(block_vector_el_t *blockp, FILE *ofh);
extern void block_generate_image(block_t *block,
				 Elf *elf, Elf_Scn *scn, FILE *ofh);



/**************************************************************************** 
 *
 * PARSER FUNCTIONS 
 *
 ****************************************************************************/

#define BLK_SET_PROTO(_member_name, _type)				   \
extern void blk_set_ ## _member_name (block_t *block, _type _member_name)

BLK_SET_PROTO(section_name, char *);
BLK_SET_PROTO(segment_name, char *);
BLK_SET_PROTO(link_section, char *);
BLK_SET_PROTO(srcfile, char *);
BLK_SET_PROTO(srcline, int);
BLK_SET_PROTO(compress, int);
BLK_SET_PROTO(in_image, int);
BLK_SET_PROTO(va, addr_t);
BLK_SET_PROTO(ra, addr_t);
BLK_SET_PROTO(pa, addr_t);

BLK_SET_PROTO(start_label, char *);
BLK_SET_PROTO(end_label, char *);
BLK_SET_PROTO(end_va, addr_t);
BLK_SET_PROTO(no_end_range_check, int);
BLK_SET_PROTO(ra_eq_va, int);
BLK_SET_PROTO(pa_eq_va, int);


BLK_SET_PROTO(tsb, char*);


#define BLK_SET_BLK_TSB_PROTO(_member_name, _type)			\
extern void blk_set_blk_tsb_ ## _member_name (block_t *block,		\
					      _type _member_name)

BLK_SET_BLK_TSB_PROTO(tag_base, addr_t);
BLK_SET_BLK_TSB_PROTO(data_base, addr_t);
BLK_SET_BLK_TSB_PROTO(page_size, uint64_t);
BLK_SET_BLK_TSB_PROTO(srcfile, char *);
BLK_SET_BLK_TSB_PROTO(srcline, int);

#define BLK_SET_BLK_TSB_BITS_PROTO(_member_name)			 \
extern void blk_set_blk_tsb_ ## _member_name (block_t *block, int hi_bit,\
					     int lo_bit)

BLK_SET_BLK_TSB_BITS_PROTO(va_index_bits);
BLK_SET_BLK_TSB_BITS_PROTO(tag_addr_bits);
BLK_SET_BLK_TSB_BITS_PROTO(tte_tag_addr_bits);
BLK_SET_BLK_TSB_BITS_PROTO(data_addr_bits);

typedef union {
  uint32_t w32;
  unsigned char ch[4];
} long32_ch4;

extern void blk_set_blk_tsbcsm_clump_num(block_t *block, uint64_t clump_num) ;

#endif
