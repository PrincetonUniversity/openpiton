// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: block.c
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
 * block.c
 *
 * Implement object described in block.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libelf.h>

#include "block.h"
#include "gf_types.h"
#include "gf_error.h"
#include "physmap.h"
#include "symtab.h"
#include "block_tsb.h"


int Compress = 1;
int EnvZero = 1;


typedef struct symtab_ent_args_s {
  addr_t start_va;
  addr_t stop_va;
  addr_t start_ra;
  addr_t start_pa;
  char *prefix;
  FILE *ofh;
} symtab_ent_args_t;


static void print_symtab_ent_if_in_range(symtab_vector_el_t* entp,
					 symtab_ent_args_t *args);


/******************************************************************************
 *
 * init_block(blockp, NULL)
 * 
 * Allocate a new block_t and initialize it to a default state.  blockp
 * is the address of where to write the address of the new block
 * (blockp is an block_t **).
 * 
 *****************************************************************************/


void
init_block(block_vector_el_t *blockp, void *data) {
  block_t *block = gf_malloc(sizeof(*block));
  *blockp = block;

  block->name = strdup("<no_name>");
  block->section_name = strdup("<unknown>");
  block->segment_name = strdup("<unknown>");
  block->link_section = NULL;
  block->srcfile      = strdup("<unknown>");
  block->srcline      = 0;
  block->lineno       = 0;
  block->d_offset     = 0;
  block->d_length     = 0;
  block->compress     = 0;
  block->in_image     = 1;
  block->va           = NO_ADDR;
  block->ra           = NO_ADDR;
  block->pa           = NO_ADDR;
  block->ra_eq_va     = 0;
  block->pa_eq_va     = 0;

  block->end_va       = NO_ADDR;
  block->start_label  = NULL;
  block->end_label    = NULL;
  
  init_vector(&(block->tsbs), "block_tsbs_vector",
	      sizeof(block_tsb_vector_el_t),
	      (vector_elem_func_t) init_block_tsb,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_block_tsb);
  block->open_block_tsb_index = 0;
// Add for CSM
  init_vector(&(block->tsbcsms), "block_tsbcsms_vector",
	      sizeof(block_tsbcsm_vector_el_t),
	      (vector_elem_func_t) init_block_tsbcsm,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_block_tsbcsm);
  block->open_block_tsbcsm_index = 0;

  block->linked_section_obj = NULL;
}

/******************************************************************************
 *
 * print_block(blockp, NULL);
 * 
 * Debug function that prints the specified block.
 * 
 *****************************************************************************/

void
print_block(block_vector_el_t *blockp, void *data) {
  block_t *block = *blockp;

  gf_say(VERBOSE_DEBUG, "BLOCK: name = '%s', lineno=%d\n", block->name,
	 block->lineno);
  gf_say(VERBOSE_DEBUG, "            srcfile = '%s'\n", 
	 block->srcfile ? block->srcfile : "<NULL>");
  gf_say(VERBOSE_DEBUG, "            srcline = %d\n", block->srcline);
  gf_say(VERBOSE_DEBUG, "       section_name = '%s'\n", 
	 block->section_name ? block->section_name : "<NULL>");
  gf_say(VERBOSE_DEBUG, "       segment_name = '%s'\n", 
	 block->segment_name ? block->segment_name : "<NULL>");
  gf_say(VERBOSE_DEBUG, "       link_section = '%s'\n", 
	 block->link_section ? block->link_section : "<NULL>");
  gf_say(VERBOSE_DEBUG, "             offset = 0x%"uint64_x_f"\n", block->d_offset);
  gf_say(VERBOSE_DEBUG, "             length = 0x%"uint64_x_f"\n", block->d_length);
  gf_say(VERBOSE_DEBUG, "                 va = 0x%"uint64_x_f"\n", block->va);
  gf_say(VERBOSE_DEBUG, "                 ra = 0x%"uint64_x_f"\n", block->ra);
  gf_say(VERBOSE_DEBUG, "                 pa = 0x%"uint64_x_f"\n", block->pa);
  gf_say(VERBOSE_DEBUG, "           compress = %d\n", block->compress);
  gf_say(VERBOSE_DEBUG, "           in_image = %d\n", block->in_image);

 gf_say(VERBOSE_DEBUG,
         "     end_va         = 0x%"uint64_x_f"\n", block->end_va);
  gf_say(VERBOSE_DEBUG,
         "     startlabel     = '%s'\n",
         block->start_label ? block->start_label : "<NULL>");
  gf_say(VERBOSE_DEBUG,
         "     end_label      = '%s'\n",
         block->end_label ? block->end_label : "<NULL>");
  gf_say(VERBOSE_DEBUG,
         "no_end_range_check  = %d\n", block->no_end_range_check);

  gf_say(VERBOSE_DEBUG, "           ra_eq_va = %d\n", block->ra_eq_va);
  gf_say(VERBOSE_DEBUG, "           pa_eq_va = %d\n", block->pa_eq_va);


  print_vector(&(block->tsbs));

  gf_say(VERBOSE_DEBUG, "\n");

}


/******************************************************************************
 *
 * finish_single_block_init(blockp, NULL)
 * 
 * Finish the intialization of the **blockp.  This is called after the
 * parser iscomplete and all objects are created.
 * 
 *****************************************************************************/

void
finish_single_block_init(block_vector_el_t *blockp, void* data) {
  block_t *block = *blockp;

  iterate_vector(&(block->tsbs),
		 (vector_elem_func_t) finish_single_block_tsb_init, data);
  
  iterate_vector(&(block->tsbcsms),
		 (vector_elem_func_t) finish_single_block_tsbcsm_init, data);

}


/******************************************************************************
 *
 * block_name_compare(blockp, name)
 * 
 * Returns 1 if the specified name matches the name of **blockp and 0
 * otherwise.
 * 
 *****************************************************************************/

int
block_name_compare(block_vector_el_t *blockp, char *name) {
  block_t *block = *blockp;

  if(!strcmp(name, block->name)) {
    return 1;
  }
  return 0;
}

/******************************************************************************
 *
 * block_link_section_compare(blockp, name)
 * 
 * Returns 1 if the specified name matches the link_section of
 * **blockp and 0 otherwise.
 * 
 *****************************************************************************/

int
block_link_section_compare(block_vector_el_t *blockp, char *name) {
  block_t *block = *blockp;

  if(!strcmp(name, block->link_section)) {
    return 1;
  }
  return 0;
}


/******************************************************************************
 *
 * sanity_check_block(block);
 * 
 * Check the specification for the block and throw an error if it isn't
 * kosher.
 * 
 *****************************************************************************/

void
sanity_check_block(block_t *block) {
  iterate_vector(&(block->tsbs),
		 (vector_elem_func_t) sanity_check_block_tsb, NULL);

  if((block->va != NO_ADDR) && block->start_label) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f "\n"
	     "block '%s' specifies both start_va and start_label!\n",
	     SRC_FLINE(block), block->name);
  }
  if((block->end_va != NO_ADDR) && block->end_label) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f
	     "block '%s' specifies both end_va and end_label!\n",
	     SRC_FLINE(block), block->name);
  }
  if((block->pa == NO_ADDR) && (! block->pa_eq_va) && (block->in_image)) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f
	     "block '%s' is in the image, but has no pa!\n",
	     SRC_FLINE(block), block->name);
  }
  if((block->pa != NO_ADDR) && (block->pa_eq_va)) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f
	     "block '%s' specifies both PA and PA_EQ_VA!\n",
	     SRC_FLINE(block), block->name);
  }
  if((block->ra == NO_ADDR) && (!block->ra_eq_va) && VECTOR_LEN(block->tsbs)) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f
	     "block '%s' is in a TSB, but has no ra!\n",
	     SRC_FLINE(block), block->name);
  }
  if((block->ra != NO_ADDR) && (block->ra_eq_va)) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f
	     "block '%s' specifies both RA and RA_EQ_VA!\n",
	     SRC_FLINE(block), block->name);
  }
}


/******************************************************************************
 *
 * block_print_symtab(blockp, ofh)
 * 
 * Print the symbol table for the block.  The linked_section member of
 * the block contains a symbol table.  Iterate over it, printing every
 * entry that's within range of this block.
 * 
 *****************************************************************************/

void
block_print_symtab(block_vector_el_t *blockp, FILE *ofh) {
  block_t *block = *blockp;
  linked_section_t *linked_section = block->linked_section_obj;
  symtab_ent_args_t entryargs;

  entryargs.start_va = block->va;
  entryargs.stop_va =  block->va + block->d_length;
  entryargs.start_ra = block->ra;
  entryargs.start_pa = block->pa;
  entryargs.prefix   = block->section_name;
  entryargs.ofh      = ofh;

  if((entryargs.start_pa == NO_ADDR) && block->in_image) {
    entryargs.start_pa = entryargs.start_va;
  }

  iterate_vector(linked_section->symtab,
		 (vector_elem_func_t) print_symtab_ent_if_in_range,
		 &entryargs);
  
}

/******************************************************************************
 *
 * block_check_link_section_exists(blockp, NULL)
 * 
 * Make sure we've actually seen a link_section by the proper name, and
 * signal a fatal error if we haven't.
 * 
 *****************************************************************************/


void
block_check_link_section_exists(block_vector_el_t *blockp, void *data)
{ 
  block_t *block = *blockp;
  if(! block->linked_section_obj->shndx) {
    gf_error(M_BLOCKSYNTAX,
	     FLINE_f
	     "block '%s' specifies link_section '%s'\nthat doesn't exist!\n",
	     SRC_FLINE(block), block->name, block->link_section);
  }

}


/******************************************************************************
 *
 * block_calculate_size(block)
 * 
 * Resolve start_label and end label, caculate the size of the section
 * and other derived parameters.  Set up PA and RA if ra_eq_va or
 * pa_eq_va are set.  Error check start and end addresses.  This needs
 * to be called after the linked_section_obj pointer is set.
 * 
 *****************************************************************************/

void
block_calculate_size(block_t *block) {
 linked_section_t *linked_section = block->linked_section_obj;
 addr_t seg_start;
 addr_t seg_end;


 seg_start = linked_section->start_va;
 seg_end   = seg_start + linked_section->length;

 if(block->start_label) {
   symtab_ent_t *st_entry = lookup_symtab(linked_section->symtab,
					  block->start_label);

   print_vector(linked_section->symtab);

   if(st_entry == SYMTAB_NOT_FOUND) {
     gf_error(M_BADLABEL,
	      FLINE_f "Couldn't find definition for label '%s'\n",
	      SRC_FLINE(block), block->start_label);
   } else {
     block->va = st_entry->value;
   }
 }

 if(block->va == NO_ADDR) {
   block->va = seg_start;
 }
 
 if(block->va < seg_start) {
    gf_error(M_OUTOFRANGE,
	     FLINE_f
	     "Block block start va 0x%"uint64_x_f" is before beginning of "
	     "section 0x%"uint64_x_f".\n",
	     SRC_FLINE(block),
	     block->va, seg_start);
  }
 if(block->va > seg_end) {
   gf_error(M_OUTOFRANGE,
	    FLINE_f
	    "Block block start va 0x%"uint64_x_f" is beyond section range "
	    "section 0x%"uint64_x_f" -> 0x%"uint64_x_f".\n",
	    SRC_FLINE(block),
	    block->va, seg_start, seg_end);
 }


 block->d_offset = block->va - seg_start;

 if(block->end_label) {
   symtab_ent_t *st_entry = lookup_symtab(linked_section->symtab,
					  block->end_label);

   if(st_entry == SYMTAB_NOT_FOUND) {
     gf_error(M_BADLABEL,
	      FLINE_f
	      "Couldn't find definition for label '%s'\n",
	      SRC_FLINE(block),
	      block->end_label);
   } else {
     block->d_length = st_entry->value - block->va;
   }
 } else if(block->end_va != NO_ADDR) {

  if(block->end_va < seg_start) {
    gf_error(M_OUTOFRANGE,
	     FLINE_f
	     "Block block end va 0x%"uint64_x_f" is before beginning of "
	     "section 0x%"uint64_x_f".\n",
	     SRC_FLINE(block),
	     block->end_va, seg_start);
  }
  if(!(block->no_end_range_check) && (block->end_va > seg_end)) {
    gf_error(M_OUTOFRANGE,
	     FLINE_f
	     "Block block end va 0x%"uint64_x_f" is beyond section range "
	     "section 0x%"uint64_x_f" = 0x%"uint64_x_f".\n",
	     SRC_FLINE(block),
	     block->end_va, seg_start, seg_end);
  }
  if(block->end_va < block->va) {
    gf_error(M_OUTOFRANGE,
	     FLINE_f
	     "Block block end va 0x%"uint64_x_f" < start va 0x%"uint64_x_f"!\n",
	     SRC_FLINE(block),
	     block->end_va, block->va);
  }


   block->d_length = block->end_va - block->va;
 } else {
   block->d_length = seg_end - block->va;
 }

 if(block->ra_eq_va) {
   block->ra = block->va;
   block->ra &= (1ULL << get_pa_size()) - 1; 
 }
 if(block->pa_eq_va) {
    block->pa = block->va;
    block->pa &= (1ULL << get_pa_size()) - 1;
 }

 /* Now that I've evaluated labels, I need to sanity check va,ra,pa again */
 iterate_vector(&(block->tsbs),
		(vector_elem_func_t) sanity_check_block_tsb, NULL);


}

/******************************************************************************
 *
 * block_add_to_tsbs(blockp, data)
 * 
 * Add this block to every tsb named in the tsbs list.
 * 
 *****************************************************************************/

void
block_add_to_tsbs(block_vector_el_t *blockp, void *data) {
  block_t *block = *blockp;
  iterate_vector(&(block->tsbs),
		 (vector_elem_func_t) add_block_tsb_to_tsb,
		 data);
}
void
block_add_to_tsbcsms(block_vector_el_t *blockp, void *data) {
  block_t *block = *blockp;
  iterate_vector2(&(block->tsbcsms), &(block->tsbs),
		 (vector_elem_func2_t) add_block_tsbcsm_to_tsbcsm,
		 data);
}

#define SWAP(x) { \
ch0 = x.ch[3]; x.ch[3] = x.ch[0]; x.ch[0] = ch0; \
ch0 = x.ch[2]; x.ch[2] = x.ch[1]; x.ch[1] = ch0; \
}

/******************************************************************************
 *
 * block_generate_image(block, elf, scn, ofh)
 * 
 * Print the memory image for this block to the specified file handle.
 * Requires an ELF object and an open ELF section.
 * 
 *****************************************************************************/

void
block_generate_image(block_t *block, Elf *elf, Elf_Scn *scn, FILE *ofh) {
  Elf_Data *data;
  Elf64_Shdr  *shdr;
  uint32_t *wdata;
  unsigned long long bytes;
  unsigned long long words;
  unsigned long long total_bytes;
  int compress;
  addr_t line_pa;
  int doing_compress = 0;
  int zero_line = 0;
  addr_t last_addr;
  int printed_data = 0;

  int i;
  int needs_free = 0;
  addr_t start_pa = block->pa;
  addr_t adjusted_pa;

  if(! block->in_image) {
    return;
  }

  adjusted_pa = start_pa;
  adjusted_pa &= (1ULL << get_pa_size()) - 1;

  fprintf(ofh, "\n@%016"uint64_x_f"\t// Section '%s', segment '%s'\n",
          adjusted_pa, block->section_name, block->segment_name);

  shdr = elf64_getshdr(scn);
  data = elf_getdata(scn, NULL);

  if(shdr->sh_type == SHT_NOBITS) {
    total_bytes = (shdr->sh_size > block->d_length) ?
      shdr->sh_size : block->d_length;

    wdata = gf_malloc((size_t)total_bytes);
    bzero(wdata, (size_t)total_bytes);
    needs_free = 1;
  } else {
    total_bytes = data->d_size;
    wdata = (uint32_t *) data->d_buf;
  }
  bytes = block->d_length;
  words = bytes / 4;

  wdata += (block->d_offset / 4);

  compress = block->compress && Compress;
  line_pa = start_pa;

  add_block_to_physmap(&Physmap, block->srcfile, block->srcline, block->lineno,
		       start_pa, start_pa + bytes,
		       block->section_name, block->segment_name);

#define WORDS_PER_LINE 8
#define BYTES_PER_WORD 4

  last_addr = start_pa;

  for(i=0; i<(words+WORDS_PER_LINE); i+=WORDS_PER_LINE) {
    uint32_t w0, w1;
    long32_ch4 wl0, wl1;
    unsigned char ch0;

    if(i >= words) {
      break;
    }

    if((i+7) < words) {
      zero_line = 
        (wdata[i+0] == 0) && (wdata[i+1] == 0) &&
        (wdata[i+2] == 0) && (wdata[i+3] == 0) &&
        (wdata[i+4] == 0) && (wdata[i+5] == 0) &&
        (wdata[i+6] == 0) && (wdata[i+7] == 0);
    }

    if(doing_compress && ! zero_line) {

      if(EnvZero) {

	if(printed_data) {
	  fprintf(ofh, "\n@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
		  last_addr, start_pa);
	}

	fprintf(ofh, "// zero_bytes %"uint64_d_f"\n\n", line_pa - last_addr);
      } else {
	fprintf(ofh, "\n");
      }

      fprintf(ofh, "@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
              line_pa, start_pa);
      doing_compress = 0;
    }

    if(compress && ((i+7) < words) && zero_line) {
      if(!doing_compress) {
	last_addr = line_pa;
      }
      doing_compress = 1;
      line_pa += WORDS_PER_LINE * BYTES_PER_WORD;
      continue;
    }


    wl0.w32 = (i + 0) < words ? wdata[i+0] : 0;
    wl1.w32 = (i + 1) < words ? wdata[i+1] : 0;

    printed_data = 1;
#ifdef LITTLE_ENDIAN
    SWAP(wl0);
    SWAP(wl1);
#endif
    fprintf(ofh, "%08x%08x", wl0.w32, wl1.w32);
    if(i+2 >= words) {
      fprintf(ofh, "\n");
      break;
    }

    wl0.w32 = (i + 2) < words ? wdata[i+2] : 0;
    wl1.w32 = (i + 3) < words ? wdata[i+3] : 0;

#ifdef LITTLE_ENDIAN
    SWAP(wl0);
    SWAP(wl1);
#endif
    fprintf(ofh, " %08x%08x",wl0.w32, wl1.w32);

    if(i+4 >= words) {
      fprintf(ofh,"\n");
      break;
    }
    
    wl0.w32 = (i + 4) < words ? wdata[i+4] : 0;
    wl1.w32 = (i + 5) < words ? wdata[i+5] : 0;

#ifdef LITTLE_ENDIAN
    SWAP(wl0);
    SWAP(wl1);
#endif
    fprintf(ofh, " %08x%08x", wl0.w32, wl1.w32);

    if(i+6 >= words) {
      fprintf(ofh, "\n");
      break;
    }
    
    wl0.w32 = (i + 6) < words ? wdata[i+6] : 0;
    wl1.w32 = (i + 7) < words ? wdata[i+7] : 0;

#ifdef LITTLE_ENDIAN
    SWAP(wl0);
    SWAP(wl1);
#endif
    fprintf(ofh, " %08x%08x\n", wl0.w32, wl1.w32);
    line_pa += WORDS_PER_LINE * BYTES_PER_WORD;
    
  }

  if(doing_compress) {
    if(EnvZero) {
      fprintf(ofh, "// zero_bytes %"uint64_d_f"\n\n", line_pa - last_addr);
    }
  }


  if(needs_free) {
    free(wdata);
  }


}

/******************************************************************************
 *
 * print_symtab_ent_if_in_range(entp, args);
 * 
 * Used to iterate over the linked_section's symbol table.  Print the
 * symbol table entry if it's in range of the block.
 * 
 *****************************************************************************/

 
static void
print_symtab_ent_if_in_range(symtab_vector_el_t* entp, symtab_ent_args_t *args) {
  symtab_ent_t *entry = *entp;
  FILE *ofh = args->ofh;
  addr_t offset;
  int pa_size = get_pa_size();
  addr_t pa_mask = (1ULL << pa_size) - 1;

  if(!((entry->value >= args->start_va) && (entry->value <= args->stop_va))) {
    return;
  }

  offset = entry->value - args->start_va;
  fprintf(ofh, "%s.%s\t%016"uint64_x_f" ", args->prefix ? args->prefix : "",
	  entry->name, entry->value);
  if(args->start_ra == NO_ADDR) {
    fprintf(ofh, "X ");
  } else {
    if(pa_size == 40) {
      fprintf(ofh, "%010"uint64_x_f" ", (args->start_ra + offset) & pa_mask);
    } else {
      fprintf(ofh, "%016"uint64_x_f" ", (args->start_ra + offset) & pa_mask);
    }
  }

  if(args->start_pa == NO_ADDR) {
    fprintf(ofh, "X");
  } else {
    if(pa_size == 40) {
      fprintf(ofh, "%010"uint64_x_f"", (args->start_pa + offset) & pa_mask);
    } else {
      fprintf(ofh, "%016"uint64_x_f"", (args->start_pa + offset) & pa_mask);
    }
  }

  fprintf(ofh, "\n");
}


/******************************************************************************
 *
 * SET FUNCTIONS
 *
 * These are for use during parsing.  They set attributes of the
 * specified block.
 * 
 *****************************************************************************/

#define BLK_SET_STRING(_member_name)					\
void									\
blk_set_ ## _member_name (block_t *block, char * _member_name) {	\
  block->_member_name = strdup(_member_name);				\
}

#define BLK_SET(_member_name, _type)				\
void								\
blk_set_ ## _member_name (block_t *block, _type _member_name) {	\
  block->_member_name = _member_name;				\
}

#define BLK_SET_BITS(_member_name)					\
void									\
blk_set_ ## _member_name(block_t *block, int hi_bit, int lo_bit) {	\
  block->_member_name.lo = lo_bit;					\
  block->_member_name.hi = hi_bit;					\
}



BLK_SET_STRING(section_name)
BLK_SET_STRING(segment_name)
BLK_SET_STRING(link_section)
BLK_SET_STRING(srcfile)
BLK_SET(srcline, int)
BLK_SET(compress, int)
BLK_SET(in_image, int)
BLK_SET(va, addr_t)
BLK_SET(ra, addr_t)
BLK_SET(pa, addr_t)
BLK_SET(no_end_range_check, int)
BLK_SET(ra_eq_va, int)
BLK_SET(pa_eq_va, int)

BLK_SET_STRING(start_label)
BLK_SET_STRING(end_label)
BLK_SET(end_va, addr_t)

#define BLK_SET_BLK_TSB(_member_name, _type)				\
void									\
blk_set_blk_tsb_ ## _member_name(block_t *block, _type _member_name)	\
{									\
  block_tsb_t *block_tsb = VECTOR_ELEM(block->tsbs,			\
				       block->open_block_tsb_index,	\
				       block_tsb_vector_el_t);		\
  blk_tsb_set_ ## _member_name(block_tsb, _member_name);		\
}

#define BLK_SET_BLK_TSBCSM(_member_name, _type)				\
void									\
blk_set_blk_tsbcsm_ ## _member_name(block_t *block, _type _member_name)	\
{									\
  block_tsbcsm_t *block_tsb = VECTOR_ELEM(block->tsbcsms,			\
				       block->open_block_tsbcsm_index,	\
				       block_tsbcsm_vector_el_t);		\
  blk_tsbcsm_set_ ## _member_name(block_tsb, _member_name);		\
}

#define BLK_SET_BLK_TSB_BITS(_member_name)				 \
void									 \
blk_set_blk_tsb_ ## _member_name(block_t *block, int hi_bit, int lo_bit) \
{									 \
  block_tsb_t *block_tsb = VECTOR_ELEM(block->tsbs,			 \
				       block->open_block_tsb_index,	 \
				       block_tsb_vector_el_t);		 \
  blk_tsb_set_ ## _member_name(block_tsb, hi_bit, lo_bit);		 \
}

BLK_SET_BLK_TSB(tag_base, addr_t)
BLK_SET_BLK_TSB(data_base, addr_t)
BLK_SET_BLK_TSB(page_size, uint64_t)
BLK_SET_BLK_TSB(srcfile, char *)
BLK_SET_BLK_TSB(srcline, int)
BLK_SET_BLK_TSBCSM(clump_num, uint64_t)


BLK_SET_BLK_TSB_BITS(va_index_bits)
BLK_SET_BLK_TSB_BITS(tag_addr_bits)
BLK_SET_BLK_TSB_BITS(tte_tag_addr_bits)
BLK_SET_BLK_TSB_BITS(data_addr_bits)



