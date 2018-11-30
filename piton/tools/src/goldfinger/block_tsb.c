// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: block_tsb.c
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


/*
 * block_tsb.c
 *
 * Implement object described in block_tsb.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "block_tsb.h"
#include "block.h"
#include "tsb.h"

#define NO_BITS -1

/******************************************************************************
 *
 * init_block_tsb(block_tsbp, NULL)
 * 
 * Allocate a new block_tsb_t and initialize it to a default state.  block_tsbp
 * is the address of where to write the address of the new block_tsb
 * (block_tsbp is an block_tsb_t **).
 * 
 *****************************************************************************/


void
init_block_tsb(block_tsb_vector_el_t *block_tsbp, void *data) {
  block_tsb_t *block_tsb = gf_malloc(sizeof(*block_tsb));
  *block_tsbp = block_tsb;

  block_tsb->name = strdup("<no_name>");
  block_tsb->page_size    = 0;
  block_tsb->tag_base = NO_ADDR;
  block_tsb->data_base = NO_ADDR;

  block_tsb->srcfile = strdup("<unknown>");
  block_tsb->srcline = 0;

  block_tsb->va_index_bits.hi  = NO_BITS;
  block_tsb->va_index_bits.lo  = NO_BITS;
  block_tsb->tag_addr_bits.hi  = NO_BITS;
  block_tsb->tag_addr_bits.lo  = NO_BITS;
  block_tsb->tte_tag_addr_bits.hi = NO_BITS;
  block_tsb->tte_tag_addr_bits.lo = NO_BITS;
  block_tsb->data_addr_bits.hi = NO_BITS;
  block_tsb->data_addr_bits.lo = NO_BITS;
}

void
init_block_tsbcsm(block_tsbcsm_vector_el_t *block_tsbp, void *data) {
  block_tsbcsm_t *block_tsb = gf_malloc(sizeof(*block_tsb));
  *block_tsbp = block_tsb;

  block_tsb->name = strdup("<no_name>");
  block_tsb->srcfile = strdup("<unknown>");
  block_tsb->srcline = 0;

  block_tsb->clump_num  = 0;
}


/******************************************************************************
 *
 * print_block_tsb(block_tsbp, NULL);
 * 
 * Debug function that prints the specified block_tsb.
 * 
 *****************************************************************************/

void
print_block_tsb(block_tsb_vector_el_t *block_tsbp, void *data) {
  block_tsb_t *block_tsb = *block_tsbp;

  gf_say(VERBOSE_DEBUG, "   BLOCK_TSB: name = '%s', lineno=%d\n",
	 block_tsb->name,
	 block_tsb->lineno);
  gf_say(VERBOSE_DEBUG,
	 "            srcfile = '%s'\n", 
	 block_tsb->srcfile ? block_tsb->srcfile : "<NULL>");
  gf_say(VERBOSE_DEBUG,
	 "            srcline = %d\n", block_tsb->srcline);
  gf_say(VERBOSE_DEBUG,
         "        tag_base     = 0x%llx\n", block_tsb->tag_base);
  gf_say(VERBOSE_DEBUG,
         "        data_base    = 0x%llx\n", block_tsb->data_base);
  gf_say(VERBOSE_DEBUG,
         "        page_size    = 0x%llx\n", block_tsb->page_size);
  gf_say(VERBOSE_DEBUG,
         "        va_index     = [%d:%d]\n",
         block_tsb->va_index_bits.hi, block_tsb->va_index_bits.lo);
  gf_say(VERBOSE_DEBUG,
         "        tag_addr     = [%d:%d]\n",
         block_tsb->tag_addr_bits.hi, block_tsb->tag_addr_bits.lo);
  gf_say(VERBOSE_DEBUG,
         "        tte_tag_addr = [%d:%d]\n",
         block_tsb->tte_tag_addr_bits.hi, block_tsb->tte_tag_addr_bits.lo);
  gf_say(VERBOSE_DEBUG,
         "        data_addr    = [%d:%d]\n",
         block_tsb->data_addr_bits.hi, block_tsb->data_addr_bits.lo);


}

void
print_block_tsbcsm(block_tsbcsm_vector_el_t *block_tsbp, void *data) {
  block_tsbcsm_t *block_tsb = *block_tsbp;

  gf_say(VERBOSE_DEBUG, "   BLOCK_TSB: name = '%s', lineno=%d\n",
	 block_tsb->name,
	 block_tsb->lineno);
  gf_say(VERBOSE_DEBUG,
	 "            srcfile = '%s'\n", 
	 block_tsb->srcfile ? block_tsb->srcfile : "<NULL>");
  gf_say(VERBOSE_DEBUG,
	 "            srcline = %d\n", block_tsb->srcline);
  gf_say(VERBOSE_DEBUG,
         "        clump_num  = %d\n",
         block_tsb->clump_num);


}

/******************************************************************************
 *
 * finish_single_block_tsb_init(block_tsbp, NULL)
 * 
 * Finish the intialization of the **block_tsbp.  This is called after the
 * parser iscomplete and all objects are created.
 * 
 *****************************************************************************/

void
finish_single_block_tsb_init(block_tsb_vector_el_t *block_tsbp, void* data) {
  block_tsb_t *block_tsb = *block_tsbp;
  tsb_t *tsb;
  
  block_tsb->tsb = get_tsb_ptr_by_name(block_tsb->name);

  if(!block_tsb->tsb) {
    gf_error(M_BADTSB,
	     FLINE_f "Block '%s' specifies unknown tsb '%s'.\n",
	     SRC_FLINE(block_tsb->block),
	     block_tsb->block->name,
	     block_tsb->name);
  }
}

void
finish_single_block_tsbcsm_init(block_tsbcsm_vector_el_t *block_tsbp, void* data) {
  block_tsbcsm_t *block_tsb = *block_tsbp;
  tsbcsm_t *tsb;
  
  block_tsb->tsbcsm = get_tsbcsm_ptr_by_name(block_tsb->name);

  if(!block_tsb->tsbcsm) {
    gf_error(M_BADTSB,
	     FLINE_f "Block '%s' specifies unknown tsbcsm '%s'.\n",
	     SRC_FLINE(block_tsb->block),
	     block_tsb->block->name,
	     block_tsb->name);
  }
}


/******************************************************************************
 *
 * block_tsb_name_compare(block_tsbp, name)
 * 
 * Returns 1 if the specified name matches the name of **block_tsbp and 0
 * otherwise.
 * 
 *****************************************************************************/

int
block_tsb_name_compare(block_tsb_vector_el_t *block_tsbp, char *name) {
  block_tsb_t *block_tsb = *block_tsbp;

  if(!strcmp(name, block_tsb->name)) {
    return 1;
  }
  return 0;
}

/******************************************************************************
 *
 * sanity_check_block_tsb(block_tsbp, data)
 * 
 * Declares an error if the block_tsb (or a few parameters in the
 * containing block) are improperly defined.  It may be called before
 * and/or after the containing block has calculated its size (or set
 * up its ra_eq_va/pa_eq_va parameters).
 * 
 *****************************************************************************/

void
sanity_check_block_tsb(block_tsb_vector_el_t *block_tsbp, void *data) {
   block_tsb_t *block_tsb = *block_tsbp;
   block_t *block = block_tsb->block;
   
   if((block->ra == NO_ADDR) && (! block->ra_eq_va)) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block '%s' does not specify a starting ra!\n",
	      SRC_FLINE(block), block->name);
   }

   if(block_tsb->tag_base == NO_ADDR) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify a tag mask!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if(block_tsb->data_base == NO_ADDR) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify a data mask!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if(block_tsb->va_index_bits.lo == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify va_index_bits.lo!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->va_index_bits.hi < 0) ||
      (block_tsb->va_index_bits.hi > 63)) 
     {
       gf_error(M_BLOCKSYNTAX,
		FLINE_f
		"block_tsb '%s' va_index_bits.hi must be in 0-63, not %d.\n",
		SRC_FLINE(block_tsb), block_tsb->name,
		block_tsb->va_index_bits.hi);
     
     }
   if(block_tsb->va_index_bits.lo == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify va_index_bits.lo!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->va_index_bits.lo < 0) ||
      (block_tsb->va_index_bits.lo > 63)) 
     {
       gf_error(M_BLOCKSYNTAX,
		FLINE_f
		"block_tsb '%s' va_index_bits.lo must be in 0-63, not %d.\n",
		SRC_FLINE(block_tsb), block_tsb->name,
		block_tsb->va_index_bits.lo);
       
     }
   if(block_tsb->tag_addr_bits.hi == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify tag_addr_bits.hi!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->tag_addr_bits.hi < 0) ||
      (block_tsb->tag_addr_bits.hi > 63)) {
     gf_error(M_BLOCKSYNTAX,
	      FLINE_f
	      "block_tsb '%s' tag_addr_bits.hi must be in 0-63, not %d.\n",
	      SRC_FLINE(block_tsb), block_tsb->name,
	      block_tsb->tag_addr_bits.hi);
     
   }
   if(block_tsb->tag_addr_bits.lo == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify tag_addr_bits.lo!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->tag_addr_bits.lo < 0) ||
      (block_tsb->tag_addr_bits.lo > 63)) 
     {
       gf_error(M_BLOCKSYNTAX,
		FLINE_f
		"block_tsb '%s' tag_addr_bits.lo must be in 0-63, not %d.\n",
		SRC_FLINE(block_tsb), block_tsb->name,
		block_tsb->tag_addr_bits.lo);
       
     }
   //
   if(block_tsb->tte_tag_addr_bits.hi == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify tte_tag_addr_bits.hi!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->tte_tag_addr_bits.hi < 0) ||
      (block_tsb->tte_tag_addr_bits.hi > 63)) {
     gf_error(M_BLOCKSYNTAX,
	      FLINE_f
	      "block_tsb '%s' tte_tag_addr_bits.hi must be in 0-63, not %d.\n",
	      SRC_FLINE(block_tsb), block_tsb->name,
	      block_tsb->tte_tag_addr_bits.hi);
     
   }
   if(block_tsb->tte_tag_addr_bits.lo == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify tte_tag_addr_bits.lo!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->tte_tag_addr_bits.lo < 0) ||
      (block_tsb->tte_tag_addr_bits.lo > 63)) 
     {
       gf_error(M_BLOCKSYNTAX,
		FLINE_f
		"block_tsb '%s' tte_tag_addr_bits.lo must be in 0-63, not %d.\n",
		SRC_FLINE(block_tsb), block_tsb->name,
		block_tsb->tte_tag_addr_bits.lo);            
     }
   //
   if(block_tsb->data_addr_bits.hi == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify data_addr_bits.hi!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->data_addr_bits.hi < 0) ||
      (block_tsb->data_addr_bits.hi > 63))
     {
       gf_error(M_BLOCKSYNTAX,
		FLINE_f
		"block_tsb '%s' data_addr_bits.hi must be in 0-63, not %d.\n",
		SRC_FLINE(block_tsb), block_tsb->name,
		block_tsb->data_addr_bits.hi);
       
     }
   if(block_tsb->data_addr_bits.lo == NO_BITS) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify data_addr_bits.lo!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   if((block_tsb->data_addr_bits.lo < 0) ||
      (block_tsb->data_addr_bits.lo > 63))
     {
       gf_error(M_BLOCKSYNTAX,
		FLINE_f
		"block_tsb '%s' data_addr_bits.lo must be in 0-63, not %d.\n",
		SRC_FLINE(block_tsb), block_tsb->name,
		block_tsb->data_addr_bits.lo);
       
     }
   if(!block_tsb->page_size) {
     gf_error(M_BLOCKSYNTAX, 
	      FLINE_f
	      "block_tsb '%s' does not specify page_size!\n",
	      SRC_FLINE(block_tsb), block_tsb->name);
   }
   
   if(!is_pow2(block_tsb->page_size)) {
     gf_error(M_BLOCKSYNTAX,
	      FLINE_f
	      "block_tsb '%s' page size (%lld) is not a power of 2!\n",
	      SRC_FLINE(block_tsb), block_tsb->name, block_tsb->page_size);
   }
   
   if((block->ra != NO_ADDR) && !is_aligned(block->ra, block_tsb->page_size)) {
     gf_error(M_BADALIGN,
	      FLINE_f
	      "Block start ra 0x%llx is not aligned to page size (0x%llx) ",
	      SRC_FLINE(block),
	      block->ra, block_tsb->page_size);
   }
   if(block->va != NO_ADDR &&
      !is_aligned(block->va, block_tsb->page_size))
     {
       gf_error(M_BADALIGN,
		FLINE_f
		"Block start va 0x%llx is not aligned to page size (0x%llx) ",
		SRC_FLINE(block), block->va, block_tsb->page_size);
     }
   if(block->pa != NO_ADDR &&
      !is_aligned(block->pa, block_tsb->page_size))
     {
       gf_error(M_BADALIGN,
		FLINE_f
		"Block start pa 0x%llx is not aligned to page size (0x%llx) ",
		SRC_FLINE(block), block->pa, block_tsb->page_size);
     }
   
   
}

/******************************************************************************
 *
 * add_block_tsb_to_tsb(block_tsbp, data)
 * 
 * Add the contents of the containing block to the named tsb.
 * 
 *****************************************************************************/

void
add_block_tsb_to_tsb(block_tsb_vector_el_t *block_tsbp, void *data) {
  block_tsb_t *block_tsb = *block_tsbp;
  tsb_t *tsb = block_tsb->tsb;
  block_t *block = block_tsb->block;
   
  bit_range_t tsb_index_bit_range = block_tsb->va_index_bits;
  addr_t tag_mask      = bit_range_to_mask_64(block_tsb->tag_addr_bits);
  addr_t tte_tag_mask  = bit_range_to_mask_64(block_tsb->tte_tag_addr_bits);
  addr_t data_mask     = bit_range_to_mask_64(block_tsb->data_addr_bits);
  addr_t tag_base      = block_tsb->tag_base;
  addr_t data_base     = block_tsb->data_base;
  addr_t page_size     = block_tsb->page_size;
  addr_t page_size_log = log2(block_tsb->page_size);

  addr_t tsb_size_bits;
  addr_t index_mask, index_shift;
  addr_t page_num;

  addr_t num_pages;
  addr_t page_mask;

  addr_t aligned_start, aligned_start_ra;
  addr_t tte_tag_shift = block_tsb->tte_tag_addr_bits.lo;
  addr_t tag_shift = block_tsb->tag_addr_bits.lo;

  if(block->d_length == 0) {
    num_pages = 0;
  } else {
    num_pages = ((block->d_length - 1) >> page_size_log) + 1;
  }
  
  page_mask        = ~(page_size - 1);
  aligned_start    = block->va & page_mask;
  aligned_start_ra = block->ra & page_mask;

  tsb_size_bits = get_tsb_size_bits(tsb);
  tsb_index_bit_range.hi += tsb_size_bits;

  index_mask  = bit_range_to_shifted_mask_64(tsb_index_bit_range);
  index_shift = tsb_index_bit_range.lo;

  gf_say(VERBOSE_DEBUG, "Adding %lld pages at va=0x%llx to TSB %s\n",
	 num_pages, aligned_start, tsb->name);

  for(page_num = 0;  page_num < num_pages; page_num++) {
    {
      addr_t index;
      addr_t tag;
      addr_t data;

      addr_t page_va = aligned_start + (page_num << page_size_log);
      addr_t page_ra = aligned_start_ra + (page_num << page_size_log);
      addr_t tagaddr;
	
      index = (page_va >> index_shift) & index_mask;

      gf_say(VERBOSE_DEBUG, 
	     "  Adding page at va=0x%llx at index %lld "
	     "(Index mask = 0x%llx, shift=0x%llx)\n",
	     page_va, index, index_mask, index_shift);

      tagaddr = (page_va & tte_tag_mask) >> tte_tag_shift;
      tagaddr <<= tag_shift;


      tag   = (tagaddr & tag_mask)  | (tag_base  & ~tag_mask);
      data  = (page_ra & data_mask) | (data_base & ~data_mask);
      //printf("TSB page num is %d \n", page_num);
      //printf("add block tsb: index is %d \n", index);
      //printf("add block tsb: tag is %lx \n", tag);
      //printf("add block tsb: data is %lx \n", data);
      //printf("add block tsb: block is %s \n", block->name);
      //printf("add block tsb: block_tsb is %s \n", block_tsb->name);
      add_entry(tsb, index, tag, data, block, block_tsb);
    }
    
  }
}


void
add_block_tsbcsm_to_tsbcsm(block_tsbcsm_vector_el_t *block_tsbp, block_tsb_vector_el_t *block_tsbp2, void *data) {
  block_tsbcsm_t *block_tsbcsm = *block_tsbp;
  block_tsb_t *block_tsb = *block_tsbp2;

  tsbcsm_t *tsbcsm = block_tsbcsm->tsbcsm;
  tsb_t *tsb = block_tsb->tsb;

  block_t *block = block_tsb->block;
   
  addr_t clump_num = block_tsbcsm->clump_num;
  //printf("add block tsbcsm: clump_num is %lld \n", clump_num);

  bit_range_t tsb_index_bit_range = block_tsb->va_index_bits;
  addr_t tag_mask      = bit_range_to_mask_64(block_tsb->tag_addr_bits);
  addr_t tte_tag_mask  = bit_range_to_mask_64(block_tsb->tte_tag_addr_bits);
  addr_t data_mask     = bit_range_to_mask_64(block_tsb->data_addr_bits);
  addr_t tag_base      = block_tsb->tag_base;
  addr_t data_base     = block_tsb->data_base;
  addr_t page_size     = block_tsb->page_size;
  addr_t page_size_log = log2(block_tsb->page_size);

  addr_t tsb_size_bits;
  addr_t index_mask, index_shift;
  addr_t page_num;

  addr_t num_pages;
  addr_t page_mask;

  addr_t aligned_start, aligned_start_ra;
  addr_t tte_tag_shift = block_tsb->tte_tag_addr_bits.lo;
  addr_t tag_shift = block_tsb->tag_addr_bits.lo;

  if(block->d_length == 0) {
    num_pages = 0;
  } else {
    num_pages = ((block->d_length - 1) >> page_size_log) + 1;
  }
  
  
  page_mask        = ~(page_size - 1);
  aligned_start    = block->va & page_mask;
  aligned_start_ra = block->ra & page_mask;

  tsb_size_bits = get_tsb_size_bits(tsb);
  tsb_index_bit_range.hi += tsb_size_bits;

  index_mask  = bit_range_to_shifted_mask_64(tsb_index_bit_range);
  index_shift = tsb_index_bit_range.lo;

  gf_say(VERBOSE_DEBUG, "Adding %lld pages at va=0x%llx to TSBCSM %s\n",
	 num_pages, aligned_start, tsbcsm->name);

  for(page_num = 0;  page_num < num_pages; page_num++) {
    {
      addr_t index;
      addr_t tag;
      addr_t data;

      addr_t page_va = aligned_start + (page_num << page_size_log);
      addr_t page_ra = aligned_start_ra + (page_num << page_size_log);
      addr_t tagaddr;
	
      index = (page_va >> index_shift) & index_mask;

      gf_say(VERBOSE_DEBUG, 
	     "  Adding page at va=0x%llx at index %lld "
	     "(Index mask = 0x%llx, shift=0x%llx)\n",
	     page_va, index, index_mask, index_shift);

      tagaddr = (page_va & tte_tag_mask) >> tte_tag_shift;
      tagaddr <<= tag_shift;


      tag   = (tagaddr & tag_mask)  | (tag_base  & ~tag_mask);
      data  = (page_ra & data_mask) | (data_base & ~data_mask);
      
      //printf("TSBCSM page num is %d \n", page_num);
      //printf("add block tsbcsm: index is %d \n", index);
      //printf("add block tsbcsm: tag is %lx \n", tag);
      //printf("add block tsbcsm: data is %lx \n", clump_num);
      //printf("add block tsbcsm: block is %s \n", block->name);
      //printf("add block tsbcsm: block_tsb is %s \n", block_tsbcsm->name);

      add_entry_csm(tsbcsm, tsb, index, tag, data, clump_num, block, block_tsbcsm);
    }
    
  }
}

/******************************************************************************
 *
 * tag2va(block_tsb, tag, index)
 * 
 * Convert from a TSB tag to a virtual address.  Used only for error
 * reporting.
 * 
 *****************************************************************************/

addr_t
tag2va(block_tsb_t *block_tsb, uint64_t tag, uint64_t index) {
  addr_t va;
  addr_t tag_mask      = bit_range_to_mask_64(block_tsb->tag_addr_bits);

  va = (tag & tag_mask) << block_tsb->tte_tag_addr_bits.lo;
  va |= (index << block_tsb->va_index_bits.lo);

  return va;
}
addr_t
csmtag2va(block_tsbcsm_t *block_tsb, uint64_t tag, uint64_t index) {
  addr_t va;
  addr_t tag_mask      = bit_range_to_mask_64(block_tsb->tag_addr_bits);

  va = (tag & tag_mask) << block_tsb->tte_tag_addr_bits.lo;
  va |= (index << block_tsb->va_index_bits.lo);

  return va;
}


/******************************************************************************
 *
 * SET FUNCTIONS
 *
 * These are for use during parsing.  They set attributes of the
 * specified block_tsb.
 * 
 *****************************************************************************/

#define BLK_TSB_SET_STRING(_member_name)				\
void									\
blk_tsb_set_ ## _member_name (block_tsb_t *block_tsb, char * _member_name) {\
  block_tsb->_member_name = strdup(_member_name);			\
}

#define BLK_TSB_SET(_member_name, _type)				\
void									\
blk_tsb_set_ ## _member_name (block_tsb_t *block_tsb, _type _member_name) {\
  block_tsb->_member_name = _member_name;				\
}

#define BLK_TSB_SET_BITS(_member_name)					\
void									\
blk_tsb_set_ ## _member_name(block_tsb_t *block_tsb, int hi_bit, int lo_bit) {\
  block_tsb->_member_name.lo = lo_bit;					\
  block_tsb->_member_name.hi = hi_bit;					\
}

#define BLK_TSBCSM_SET_STRING(_member_name)				\
void									\
blk_tsbcsm_set_ ## _member_name (block_tsbcsm_t *block_tsb, char * _member_name) {\
  block_tsb->_member_name = strdup(_member_name);			\
}

#define BLK_TSBCSM_SET(_member_name, _type)				\
void									\
blk_tsbcsm_set_ ## _member_name (block_tsbcsm_t *block_tsb, _type _member_name) {\
  block_tsb->_member_name = _member_name;				\
}

#define BLK_TSBCSM_SET_BITS(_member_name)					\
void									\
blk_tsbcsm_set_ ## _member_name(block_tsbcsm_t *block_tsb, int hi_bit, int lo_bit) {\
  block_tsb->_member_name.lo = lo_bit;					\
  block_tsb->_member_name.hi = hi_bit;					\
}


BLK_TSB_SET_STRING(name)
BLK_TSB_SET(tag_base, addr_t)
BLK_TSB_SET(data_base, addr_t)
BLK_TSB_SET(page_size, uint64_t)
BLK_TSB_SET_STRING(srcfile)
BLK_TSB_SET(srcline, int)
BLK_TSBCSM_SET(clump_num, uint64_t)


BLK_TSB_SET_BITS(va_index_bits)
BLK_TSB_SET_BITS(tag_addr_bits)
BLK_TSB_SET_BITS(tte_tag_addr_bits)
BLK_TSB_SET_BITS(data_addr_bits)

