// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsb.c
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
 * tsb.c
 *
 * Implements the object defined in tsb.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <errno.h>

#include "tsb.h"
#include "gf_error.h"
#include "vector.h"
#include "block.h"
#include "block_tsb.h"
#include "physmap.h"

vector_t Tsb_vector;
vector_t Tsbcsm_vector;

#define NO_OPEN_TSB -1
#define TSB_SIZE_MAX 15
#define BYTES_PER_ENTRY 16

int Suppress_zero = 1;
int Allow_tsb_conflicts = 0;
int Open_tsb_index = NO_OPEN_TSB;  /* index of open tsb */

int Open_tsbcsm_index = NO_OPEN_TSB;  /* index of open tsb */

/* Tsb_vector elem (tsb_t*) functions */

static void init_tsb(tsb_vector_el_t *tsbp, void *data);
static void print_tsb(tsb_vector_el_t *tsbp, void *data);
static void init_tsbcsm(tsbcsm_vector_el_t *tsbp, void *data);
static void print_tsbcsm(tsbcsm_vector_el_t *tsbp, void *data);

static void finish_single_tsb_init(tsb_vector_el_t *tsbp, void*);
static void finish_single_tsbcsm_init(tsbcsm_vector_el_t *tsbp, void*);

static int tsb_name_compare(tsb_vector_el_t *tsbp, char *name);
static int tsbcsm_name_compare(tsbcsm_vector_el_t *tsbp, char *name);

static void write_tsb(tsb_vector_el_t *tsbp, FILE *ofh);
static void write_tsbcsm(tsbcsm_vector_el_t *tsbp, FILE *ofh);

static void sanity_check_tsb(tsb_t *tsb);
static void sanity_check_tsbcsm(tsbcsm_t *tsb);

/******************************************************************************
 *
 * TSB VECTOR OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * clear_tsb_vector()
 * 
 * Initialize the tsb vector to be empty.
 * 
 *****************************************************************************/


void
clear_tsb_vector(void) {
  init_vector(&Tsb_vector, "Tsb_vector", sizeof(tsb_vector_el_t),
	    (vector_elem_func_t) init_tsb,
	    (vector_elem_func_t) NULL,
	    (vector_elem_func_t) print_tsb);
}
void
clear_tsbcsm_vector(void) {
  init_vector(&Tsbcsm_vector, "Tsbcsm_vector", sizeof(tsbcsm_vector_el_t),
	    (vector_elem_func_t) init_tsbcsm,
	    (vector_elem_func_t) NULL,
	    (vector_elem_func_t) print_tsbcsm);
}


/******************************************************************************
 *
 * open_new_tsb(name, lineno);
 * 
 * Open a new tsb.  A name has been seen on input, so allocate a new
 * entry for it.  Mark it as open so the following set_tsb_*
 * calls will operate on it.  Use lineno if we have to report errors
 * on it.
 * 
 *****************************************************************************/


void
open_new_tsb(char *name, int lineno) {
  int new_index;
  tsb_t *tsb;
  int i;
  int exists_error = 0;

  if(get_tsb_ptr_by_name(name)) {
    exists_error = 1;
    /* Defer error until after object is created to use standard error
       handlers */
  }

  new_index = add_vector_elements(&Tsb_vector, 1);

  Open_tsb_index = new_index;
  tsb = VECTOR_ELEM(Tsb_vector, new_index, tsb_vector_el_t);

  tsb->name = strdup(name);
  tsb->lineno = lineno;
 // printf("add new element to tsb vector: %s\n", tsb->name);

  if(exists_error) {
    gf_error(M_BADTSB, FLINE_f "TSB named '%s' already exists!\n",
	     SRC_FLINE(tsb), name);
  }

}

void
open_new_tsbcsm(char *name, int lineno) {
  int new_index;
  tsbcsm_t *tsb;
  int i;
  int exists_error = 0;

  if(get_tsbcsm_ptr_by_name(name)) {
    exists_error = 1;
    /* Defer error until after object is created to use standard error
       handlers */
  }

  new_index = add_vector_elements(&Tsbcsm_vector, 1);
  Open_tsbcsm_index = new_index;
  tsb = VECTOR_ELEM(Tsbcsm_vector, new_index, tsbcsm_vector_el_t);

  tsb->name = strdup(name);
  tsb->lineno = lineno;
//  printf("add new element to tsbcsm vector: %s\n", tsb->name);


  if(exists_error) {
    gf_error(M_BADTSB, FLINE_f "TSBCSM named '%s' already exists!\n",
	     SRC_FLINE(tsb), name);
  }

}

/******************************************************************************
 *
 * close_tsb(lineno)
 * 
 * We've reached the end of a tsb block on input.  Mark it as
 * closed, and sanity check it.  Use lineno to report errors if need
 * be.
 * 
 *****************************************************************************/


void
close_tsb(int lineno) {
  if(Open_tsb_index == NO_OPEN_TSB) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close TSB since none is open!\n", GF_FLINE_NUM(lineno));
  }

  sanity_check_tsb(VECTOR_ELEM(Tsb_vector, Open_tsb_index, tsb_vector_el_t));

  Open_tsb_index = NO_OPEN_TSB;
}

void
close_tsbcsm(int lineno) {
  if(Open_tsbcsm_index == NO_OPEN_TSB) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close TSBCSM since none is open!\n", GF_FLINE_NUM(lineno));
  }

  sanity_check_tsbcsm(VECTOR_ELEM(Tsbcsm_vector, Open_tsbcsm_index, tsbcsm_vector_el_t));

  Open_tsbcsm_index = NO_OPEN_TSB;
}

/******************************************************************************
 *
 * get_tsb_ptr_by_name(name)
 * 
 * Returns a pointer to the tsb_t that has the specified name.
 * Returns NULL if there is no match.
 * 
 *****************************************************************************/

tsb_t *
get_tsb_ptr_by_name(char *name) {
  tsb_vector_el_t *tsb_ptr =
    search_vector(&Tsb_vector,
		(vector_search_func_t)tsb_name_compare, name);
  if(!tsb_ptr) {
    return NULL;
  }
  return *tsb_ptr;
}

tsbcsm_t *
get_tsbcsm_ptr_by_name(char *name) {
  tsbcsm_vector_el_t *tsb_ptr =
    search_vector(&Tsbcsm_vector,
		(vector_search_func_t)tsbcsm_name_compare, name);
  if(!tsb_ptr) {
    return NULL;
  }
  return *tsb_ptr;
}

/******************************************************************************
 *
 * finish_tsb_init(void)
 * 
 * After parsing is complete, finish initialization.  This consists of
 * associating a tsb_link entry by name (if link_area is defined).  It
 * also allocates and zero's out the tsb_entries for each element in
 * the tsb vector.
 * 
 *****************************************************************************/

void
finish_tsb_init(void) {
  iterate_vector(&Tsb_vector, (vector_elem_func_t) finish_single_tsb_init, NULL);
}
void
finish_tsbcsm_init(void) {
  iterate_vector(&Tsbcsm_vector, (vector_elem_func_t) finish_single_tsbcsm_init, NULL);
}

/******************************************************************************
 *
 * write_tsbs(void)
 * 
 * Write the output files for each element in the tsb vector.
 * 
 *****************************************************************************/

void
write_tsbs(FILE *ofh) {
  iterate_vector(&Tsb_vector, (vector_elem_func_t) write_tsb, ofh);
}
void
write_tsbcsms(FILE *ofh) {
  iterate_vector(&Tsbcsm_vector, (vector_elem_func_t) write_tsbcsm, ofh);
}



/******************************************************************************
 *
 * ELEMENT OPERATIONS
 * 
 *****************************************************************************/

/******************************************************************************
 *
 * init_tsb(tsbp, NULL)
 * 
 * Allocate a new tsb_t and initialize it to a default state.  tsbp
 * is the address of where to write the address of the new block
 * (tsbp is an tsb_t **).
 * 
 *****************************************************************************/


static void
init_tsb(tsb_vector_el_t *tsbp, void *data) {
  tsb_t *tsb = gf_malloc(sizeof(*tsb));
  *tsbp = tsb;

  tsb->name = strdup("<no_name>");
  tsb->num_entries = 0;
  tsb->start_addr = NO_ADDR;
  tsb->size_bits = 0;
  tsb->split = 0;
  tsb->link_area = NULL;
  tsb->lineno = 0;
  tsb->srcfile = strdup("<unknown>");
  tsb->srcline = 0;

  tsb->entries = NULL;
  tsb->link_ptr = NULL;
}
static void
init_tsbcsm(tsbcsm_vector_el_t *tsbp, void *data) {
  tsbcsm_t *tsb = gf_malloc(sizeof(*tsb));
  *tsbp = tsb;

  tsb->name = strdup("<no_name>");
  tsb->num_entries = 0;
  tsb->start_addr = NO_ADDR;
  tsb->size_bits = 0;
  tsb->split = 0;
  tsb->link_area = NULL;
  tsb->lineno = 0;
  tsb->srcfile = strdup("<unknown>");
  tsb->srcline = 0;

  tsb->entries = NULL;
  tsb->link_ptr = NULL;
}


/******************************************************************************
 *
 * print_tsb(tsbp, NULL);
 * 
 * Debug function that prints the specified tsb.
 * 
 *****************************************************************************/

static void
print_tsb(tsb_vector_el_t *tsbp, void *data) {
  tsb_t *tsb = *tsbp;

  gf_say(VERBOSE_DEBUG, "TSB: name = '%s', lineno=%d\n", tsb->name,
	 tsb->lineno);
  gf_say(VERBOSE_DEBUG, "     start_addr  = 0x%llx\n", tsb->start_addr);
  gf_say(VERBOSE_DEBUG, "     num_entries = %"uint64_d_f"\n", tsb->num_entries);
  gf_say(VERBOSE_DEBUG, "     size_bits   = 0x%llx\n", tsb->size_bits);
  gf_say(VERBOSE_DEBUG, "     split       = %"uint64_d_f"\n", tsb->split);
  gf_say(VERBOSE_DEBUG, "     link_area   = '%s'\n", 
	 tsb->link_area ? tsb->link_area : "<NULL>");
  gf_say(VERBOSE_DEBUG, "\n");

}
static void
print_tsbcsm(tsbcsm_vector_el_t *tsbp, void *data) {
  tsbcsm_t *tsb = *tsbp;

  gf_say(VERBOSE_DEBUG, "TSBCSM: name = '%s', lineno=%d\n", tsb->name,
	 tsb->lineno);
  gf_say(VERBOSE_DEBUG, "     start_addr  = 0x%llx\n", tsb->start_addr);
  gf_say(VERBOSE_DEBUG, "     num_entries = %"uint64_d_f"\n", tsb->num_entries);
  gf_say(VERBOSE_DEBUG, "     size_bits   = 0x%llx\n", tsb->size_bits);
  gf_say(VERBOSE_DEBUG, "     split       = %"uint64_d_f"\n", tsb->split);
  gf_say(VERBOSE_DEBUG, "     link_area   = '%s'\n", 
	 tsb->link_area ? tsb->link_area : "<NULL>");
  gf_say(VERBOSE_DEBUG, "\n");

}


/******************************************************************************
 *
 * finish_single_tsb_init(tsbp, NULL)
 * 
 * Finish the intialization of the **tsbp.  This is called after the
 * parser iscomplete and all objects are created.
 * 
 *****************************************************************************/

static void
finish_single_tsb_init(tsb_vector_el_t *tsbp, void* data) {
  tsb_t *tsb = *tsbp;

  tsb_link_t *link_ptr = NULL;
  uint64_t entries_bytes = 0;

  if(tsb->link_area) {
    link_ptr = get_tsb_link_ptr_by_name(tsb->link_area);
    //printf("DEBUG: tsblink ptr%x\n", link_ptr->start_addr);
    if(!link_ptr) {
      gf_error(M_BADTSB, FLINE_f
	       "TSB '%s' defines a non-existent link area '%s'!\n",
	       SRC_FLINE(tsb), tsb->name, tsb->link_area);
    } else {
      tsb->link_ptr = link_ptr;
    }
  }

  entries_bytes = tsb->num_entries * sizeof(* (tsb->entries));

  tsb->entries = gf_malloc( entries_bytes );
  bzero(tsb->entries, entries_bytes);

}

static void
finish_single_tsbcsm_init(tsbcsm_vector_el_t *tsbp, void* data) {
  tsbcsm_t *tsb = *tsbp;

  tsbcsm_link_t *link_ptr = NULL;
  uint64_t entries_bytes = 0;
//  printf("Enter finish_single_tsbcsm_init\n");
//  printf("tsbcsm link name is %s\n", tsb->link_area);
  if(tsb->link_area) {
    link_ptr = get_tsbcsm_link_ptr_by_name(tsb->link_area);
    if(!link_ptr) {
      gf_error(M_BADTSB, FLINE_f
	       "TSBCSM '%s' defines a non-existent link area '%s'!\n",
	       SRC_FLINE(tsb), tsb->name, tsb->link_area);
    } else {
      tsb->link_ptr = link_ptr;
    }
  }

  entries_bytes = tsb->num_entries * sizeof(* (tsb->entries));

  tsb->entries = gf_malloc( entries_bytes );
  bzero(tsb->entries, entries_bytes);

}



/******************************************************************************
 *
 * tsb_name_compare(tsbp, name)
 * 
 * Returns 1 if the specified name matches the name of **tsbp and 0
 * otherwise.
 * 
 *****************************************************************************/

static int
tsb_name_compare(tsb_vector_el_t *tsbp, char *name) {
  tsb_t *tsb = *tsbp;

  if(!strcmp(name, tsb->name)) {
    return 1;
  }
  return 0;
}
static int
tsbcsm_name_compare(tsbcsm_vector_el_t *tsbp, char *name) {
  tsbcsm_t *tsb = *tsbp;

  if(!strcmp(name, tsb->name)) {
    return 1;
  }
  return 0;
}


/******************************************************************************
 *
 * sanity_check_tsb(tsb);
 * 
 * Check the specification for the tsb and throw an error if it isn't
 * kosher.
 * 
 *****************************************************************************/

static void
sanity_check_tsb(tsb_t *tsb) {
  if(tsb->size_bits > TSB_SIZE_MAX) {
    gf_error(M_BADTSB,
	     FLINE_f
	     "Tsb '%s', size bits 0x%llx out of range (0-0x%x).\n",
	     SRC_FLINE(tsb), tsb->name, tsb->size_bits, TSB_SIZE_MAX);
  }

  if(tsb->split > 1) {
    gf_error(M_BADTSB, 
	     FLINE_f "Tsb '%s', split 0x%llx out of range (0-1).\n",
	     SRC_FLINE(tsb), tsb->name, tsb->split);
  }

  if(tsb->num_entries == 0) {
    gf_error(M_BADTSB, 
	     FLINE_f "Tsb '%s', num_entries cannot be zero.\n",
	     SRC_FLINE(tsb), tsb->name);
  }
  if(tsb->start_addr == NO_ADDR) {
    gf_error(M_BADTSB, 
	     "Tsb '%s', no start_addr set.\n",
	     SRC_FLINE(tsb), tsb->name);
  }
  
}

static void
sanity_check_tsbcsm(tsbcsm_t *tsb) {
  if(tsb->size_bits > TSB_SIZE_MAX) {
    gf_error(M_BADTSB,
	     FLINE_f
	     "Tsbcsm '%s', size bits 0x%llx out of range (0-0x%x).\n",
	     SRC_FLINE(tsb), tsb->name, tsb->size_bits, TSB_SIZE_MAX);
  }

  if(tsb->split > 1) {
    gf_error(M_BADTSB, 
	     FLINE_f "Tsbcsm '%s', split 0x%llx out of range (0-1).\n",
	     SRC_FLINE(tsb), tsb->name, tsb->split);
  }

  if(tsb->num_entries == 0) {
    gf_error(M_BADTSB, 
	     FLINE_f "Tsbcsm '%s', num_entries cannot be zero.\n",
	     SRC_FLINE(tsb), tsb->name);
  }
  if(tsb->start_addr == NO_ADDR) {
    gf_error(M_BADTSB, 
	     "Tsbcsm '%s', no start_addr set.\n",
	     SRC_FLINE(tsb), tsb->name);
  }
  
}



/******************************************************************************
 *
 * add_entry(tsb, index, tag, data)
 * 
 * Adds (tag,data) to the named tsb at the specified index.
 * 
 *****************************************************************************/


void
add_entry(tsb_t *tsb, uint64_t index, uint64_t tag, uint64_t data,
	  block_t *block, block_tsb_t *block_tsb) 
{
  if(index >= tsb->num_entries) {
    gf_error(M_BADTSB,
	     FLINE_f "Cannot insert entry into TSB '%s' at "
	     "index %"uint64_d_f" since it has only %"uint64_d_f" entries!\n",
	     SRC_FLINE(tsb), tsb->name, index, tsb->num_entries);
  }

  if((tsb->entries[index].tag == 0) && (tsb->entries[index].data == 0)) {
    /* no collision */
    tsb->entries[index].tag  = tag;
    tsb->entries[index].data = data;
    tsb->entries[index].block = block;
    tsb->entries[index].block_tsb = block_tsb;
  } else {
    /* need to create a linked vector */
    if(!Allow_tsb_conflicts) {
      gf_error(M_VACOLLIDE,
	       "VA collision in TSB %s at index %"uint64_d_f".\n"
	       FLINE_f
	       "This_va=0x%llx (tag %llx) from block %s.\n"
	       FLINE_f
	       "Conficting_va=0x%llx from block %s.\n"
	       "Not allowed unless -allow_tsb_conflicts is used.\n",
	       tsb->name, index, SRC_FLINE(block),
	       tag2va(block_tsb, tag, index), tag, block->name,
	       SRC_FLINE(tsb->entries[index].block_tsb->block),
	       tag2va(tsb->entries[index].block_tsb, tsb->entries[index].tag,
		      index),
	       tsb->entries[index].block->name
	       );
    } else if(!tsb->link_ptr) {
      gf_error(M_BADTSB,
	       "TSB %s has entry collsion and no link area.\n"
	       FLINE_f
	       "First addr:  0x%llx from block %s.\n"
	       FLINE_f
	       "Second addr: 0x%llx from block %s.\n",
	       tsb->name,
	       SRC_FLINE(block), tag2va(block_tsb, tag, index), block->name,
	       SRC_FLINE(tsb->entries[index].block_tsb->block),
	       tag2va(tsb->entries[index].block_tsb, tsb->entries[index].tag,
		      index),
	       tsb->entries[index].block->name
	       );
    }

    tsb_link_add_entry(tsb->link_ptr, tag, data,
		       &(tsb->entries[index]), block, block_tsb);

    //printf("DEBUG: add tsb entry %d tag %x : data %x\n", index, tsb->entries[index].tag, tsb->entries[index].data);
  }

}

void
add_entry_csm(tsbcsm_t *tsbcsm, tsb_t *tsb, uint64_t index, uint64_t tag, uint64_t data, uint64_t clump_num, block_t *block, block_tsbcsm_t *block_tsb) 
{
  if(index >= tsbcsm->num_entries) {
    gf_error(M_BADTSB,
	     FLINE_f "Cannot insert entry into TSBCSM '%s' at "
	     "index %"uint64_d_f" since it has only %"uint64_d_f" entries!\n",
	     SRC_FLINE(tsbcsm), tsbcsm->name, index, tsbcsm->num_entries);
  }

  if((tsbcsm->entries[index].tag == 0) && (tsbcsm->entries[index].data == 0)) {
    /* no collision */
    tsbcsm->entries[index].tag  = tag;
    tsbcsm->entries[index].data  = data;
    tsbcsm->entries[index].clump_num = clump_num;
    tsbcsm->entries[index].block = block;
    tsbcsm->entries[index].block_tsb = block_tsb;
  } else {
    /* need to create a linked vector */
    if(!Allow_tsb_conflicts) {
      gf_error(M_VACOLLIDE,
	       "VA collision in TSBCSM %s at index %"uint64_d_f".\n"
	       FLINE_f
	       "This_va=0x%llx (tag %llx) from block %s.\n"
	       FLINE_f
	       "Conficting_va=0x%llx from block %s.\n"
	       "Not allowed unless -allow_tsb_conflicts is used.\n",
	       tsbcsm->name, index, SRC_FLINE(block),
	       csmtag2va(block_tsb, tag, index), tag, block->name,
	       SRC_FLINE(tsbcsm->entries[index].block_tsb->block),
	       csmtag2va(tsbcsm->entries[index].block_tsb, tsbcsm->entries[index].tag,
		      index),
	       tsbcsm->entries[index].block->name
	       );
    } else if(!tsbcsm->link_ptr) {
      gf_error(M_BADTSB,
	       "TSBCSM %s has entry collsion and no link area.\n"
	       FLINE_f
	       "First addr:  0x%llx from block %s.\n"
	       FLINE_f
	       "Second addr: 0x%llx from block %s.\n",
	       tsbcsm->name,
	       SRC_FLINE(block), csmtag2va(block_tsb, tag, index), block->name,
	       SRC_FLINE(tsbcsm->entries[index].block_tsb->block),
	       csmtag2va(tsbcsm->entries[index].block_tsb, tsbcsm->entries[index].tag,
		      index),
	       tsbcsm->entries[index].block->name
	       );
    }

    tsbcsm_link_add_entry(tsbcsm->link_ptr, tag, clump_num,
		       &(tsbcsm->entries[index]), &(tsb->entries[index]), block, block_tsb);
    //printf("DEBUG: add tsbcsm entry %d tag %x : data %x\n", index, tsbcsm->entries[index].tag, tsbcsm->entries[index].data);
  }

}

/******************************************************************************
 *
 * get_tsb_size_bits(tsb);
 * 
 * Returns the size bits for the named TSB.
 * 
 *****************************************************************************/

uint64_t
get_tsb_size_bits(tsb_t *tsb) {
  return tsb->size_bits;
}
uint64_t
get_tsbcsm_size_bits(tsbcsm_t *tsb) {
  return tsb->size_bits;
}

/******************************************************************************
 *
 * write_tsb(tsb);
 * 
 * Output the specified tsb to its designated output file.
 * 
 *****************************************************************************/


static void
write_tsb(tsb_vector_el_t *tsbp, FILE *ofh) {
  tsb_t *tsb = *tsbp;
  uint64_t i;
  uint64_t last_addr;
  int skip = 0;
  int printed_data = 0;


  add_object_to_physmap(&Physmap, tsb->srcfile, tsb->srcline, tsb->lineno,
			tsb->start_addr,
			tsb->start_addr + tsb->num_entries * BYTES_PER_ENTRY,
			"TSB", tsb->name);

  fprintf(ofh, "@%016"uint64_x_f"\t// TSB '%s'\n", tsb->start_addr, tsb->name);

  last_addr = tsb->start_addr;
  
  for(i=0; i<tsb->num_entries; i+=2) {
    //printf("DEBUG GOLD TSB %d  %d\n",i,tsb->entries[i].tag);
    if(Suppress_zero && 
       (tsb->entries[i].tag == 0)   && (tsb->entries[i].data == 0) &&
       (tsb->entries[i+1].tag == 0) && (tsb->entries[i+1].data == 0) 
       )
      {
	if(!skip) {
	  last_addr = tsb->start_addr + (i * 16);
	}
	skip = 1;
	continue;
      }

    if(skip) {
      if(EnvZero) {
	if(printed_data) {
	  fprintf(ofh, "\n@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
		  last_addr, tsb->start_addr);
	}

	fprintf(ofh, "// zero_bytes %"uint64_d_f"\n\n",  
		(tsb->start_addr + (i * 16)) - last_addr);
      } else {
	fprintf(ofh, "\n");
      }

      fprintf(ofh, "@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
	      tsb->start_addr + (i * 16), tsb->start_addr);
    }

    skip = 0;
    fprintf(ofh, "%016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f"\n",
	    tsb->entries[i].tag, tsb->entries[i].data,
	    tsb->entries[i+1].tag, tsb->entries[i+1].data);

    if(tsb->entries[i].tag == ((uint64_t)-1)) {
        //printf("DEBUG: write tsb index %d data%x\n", i, tsb->entries[i].data);
    }
    if(tsb->entries[i+1].tag == ((uint64_t)-1)) {
        //printf("DEBUG: write tsb index %d data%x\n", i+1, tsb->entries[i+1].data);
    }

    printed_data = 1;
  }

  if(skip) {
    if(EnvZero) {
      if(printed_data) {
	fprintf(ofh, "\n@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
		last_addr, tsb->start_addr);
      }
      fprintf(ofh, "// zero_bytes %"uint64_d_f"\n\n",  
	      (tsb->start_addr + (i * 16)) - last_addr);
    } else {
      fprintf(ofh, "\n");
    }
  }
  
  fprintf(ofh, "\n");

}

static void
write_tsbcsm(tsbcsm_vector_el_t *tsbp, FILE *ofh) {
  tsbcsm_t *tsb = *tsbp;
  uint64_t i;
  uint64_t last_addr;
  int skip = 0;
  int printed_data = 0;


  add_object_to_physmap(&Physmap, tsb->srcfile, tsb->srcline, tsb->lineno,
			tsb->start_addr,
			tsb->start_addr + tsb->num_entries * BYTES_PER_ENTRY,
			"TSB", tsb->name);

  fprintf(ofh, "@%016"uint64_x_f"\t// TSBCSM '%s'\n", tsb->start_addr, tsb->name);

  last_addr = tsb->start_addr;
  
  for(i=0; i<tsb->num_entries; i+=2) {
    //printf("DEBUG GOLD TSBCSM %d  %d\n",i,tsb->entries[i].tag);
    if(Suppress_zero && 
       (tsb->entries[i].tag == 0)   && (tsb->entries[i].data == 0) &&
       (tsb->entries[i+1].tag == 0) && (tsb->entries[i+1].data == 0) 
       )
      {
	if(!skip) {
	  last_addr = tsb->start_addr + (i * 16);
	}
	skip = 1;
	continue;
      }

    if(skip) {
      if(EnvZero) {
	if(printed_data) {
	  fprintf(ofh, "\n@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
		  last_addr, tsb->start_addr);
	}

	fprintf(ofh, "// zero_bytes %"uint64_d_f"\n\n",  
		(tsb->start_addr + (i * 16)) - last_addr);
      } else {
	fprintf(ofh, "\n");
      }

      fprintf(ofh, "@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
	      tsb->start_addr + (i * 16), tsb->start_addr);
    }

    skip = 0;
    fprintf(ofh, "%016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f"\n",
	    tsb->entries[i].tag, tsb->entries[i].clump_num,
	    tsb->entries[i+1].tag, tsb->entries[i+1].clump_num);
    printed_data = 1;
  }

  if(skip) {
    if(EnvZero) {
      if(printed_data) {
	fprintf(ofh, "\n@%016"uint64_x_f"\t// from compressed 0x%016"uint64_x_f"\n",
		last_addr, tsb->start_addr);
      }
      fprintf(ofh, "// zero_bytes %"uint64_d_f"\n\n",  
	      (tsb->start_addr + (i * 16)) - last_addr);
    } else {
      fprintf(ofh, "\n");
    }
  }
  
  fprintf(ofh, "\n");

}

/******************************************************************************
 *
 * SET FUNCTIONS
 *
 * These are for use during parsing.  They set attriibutes of the
 * currently open tsb_link object.
 * 
 *****************************************************************************/

#define SET_TSB(_member_name, _type) 					 \
void									 \
set_tsb_ ## _member_name (_type _member_name) {				 \
  tsb_t *tsb = VECTOR_ELEM(Tsb_vector, Open_tsb_index, tsb_vector_el_t); \
  tsb->_member_name = _member_name;					 \
}

#define SET_TSB_STRING(_member_name) 					 \
void									 \
set_tsb_ ## _member_name (char *_member_name) {				 \
  tsb_t *tsb = VECTOR_ELEM(Tsb_vector, Open_tsb_index, tsb_vector_el_t); \
  tsb->_member_name = strdup(_member_name);				 \
}

#define SET_TSBCSM(_member_name, _type) 					 \
void									 \
set_tsbcsm_ ## _member_name (_type _member_name) {				 \
  tsbcsm_t *tsbcsm = VECTOR_ELEM(Tsbcsm_vector, Open_tsbcsm_index, tsbcsm_vector_el_t); \
  tsbcsm->_member_name = _member_name;					 \
}

#define SET_TSBCSM_STRING(_member_name) 					 \
void									 \
set_tsbcsm_ ## _member_name (char *_member_name) {				 \
  tsbcsm_t *tsbcsm = VECTOR_ELEM(Tsbcsm_vector, Open_tsbcsm_index, tsbcsm_vector_el_t); \
  tsbcsm->_member_name = strdup(_member_name);				 \
}


SET_TSB(num_entries, uint64_t)
SET_TSB(size_bits, uint64_t)
SET_TSB(split, uint64_t)
SET_TSB_STRING(srcfile)
SET_TSB(srcline, int)
SET_TSB(start_addr, uint64_t)
SET_TSB_STRING(link_area)

SET_TSBCSM(num_entries, uint64_t)
SET_TSBCSM(size_bits, uint64_t)
SET_TSBCSM(split, uint64_t)
SET_TSBCSM_STRING(srcfile)
SET_TSBCSM(srcline, int)
SET_TSBCSM(start_addr, uint64_t)
SET_TSBCSM_STRING(link_area)

