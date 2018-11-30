// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: tsb_link.c
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
 * tsb_link.c
 *
 * Implements the tsb_link object defined in tsb_link.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <errno.h>

#include "vector.h"
#include "tsb_link.h"
#include "tsb.h"
#include "block.h"
#include "block_tsb.h"
#include "gf_error.h"
#include "physmap.h"

#define NO_OPEN_TSB_LINK -1
#define UNSPECIFIED_START  ((uint64_t)-1)
#define EOL ((uint64_t)-1)
#define LINK_SIZE 32

int Suppress_dup_tags_error = 0;

vector_t Tsb_link_vector;
int Open_tsb_link_index = NO_OPEN_TSB_LINK;  /* index of open tsb-link */
vector_t Tsbcsm_link_vector;
int Open_tsbcsm_link_index = NO_OPEN_TSB_LINK;  /* index of open tsb-link */


/* Tsb_link_vector elem (tsb_link_t*) functions */

static void init_tsb_link(tsb_link_vector_el_t *tsb_linkp, void *data);
static void init_tsbcsm_link(tsbcsm_link_vector_el_t *tsb_linkp, void *data);

static void print_tsb_link(tsb_link_vector_el_t *tsb_linkp, void *data);
static void print_tsbcsm_link(tsbcsm_link_vector_el_t *tsb_linkp, void *data);

static void finish_single_tsb_link_init(tsb_link_vector_el_t *tsb_linkp,
					void *data);
static void finish_single_tsbcsm_link_init(tsbcsm_link_vector_el_t *tsb_linkp,
					void *data);

static int  tsb_link_name_compare(tsb_link_vector_el_t *tsb_linkp, char *name);
static int  tsbcsm_link_name_compare(tsbcsm_link_vector_el_t *tsb_linkp, char *name);

static void sanity_check_tsb_link(tsb_link_t *tsb_link);
static void sanity_check_tsbcsm_link(tsbcsm_link_t *tsb_link);
static void write_tsb_link(tsb_link_vector_el_t *tsb_linkp, FILE *ofh);
static void write_tsbcsm_link(tsbcsm_link_vector_el_t *tsb_linkp, FILE *ofh);

static tsb_link_entry_t *start_new_chain(tsb_link_t *tsb_link,
					 uint64_t tag, uint64_t data,
					 block_t *block,
					 block_tsb_t *block_tsb
					 );
static tsbcsm_link_entry_t *start_new_csm_chain(tsbcsm_link_t *tsb_link,
					 uint64_t tag, uint64_t clump_num,
					 block_t *block,
					 block_tsbcsm_t *block_tsb
					 );

static void add_to_chain(tsb_link_t *tsb_link, tsb_link_entry_t *link_entry,
			 uint64_t tag, uint64_t data, block_t *block,
			 block_tsb_t *block_tsb
			 );
static void add_csm_to_chain(tsbcsm_link_t *tsb_link, tsbcsm_link_entry_t *link_entry,
			 uint64_t tag, uint64_t data, block_t *block,
			 block_tsbcsm_t *block_tsb
			 );


/* tsb_link->entries vector element (tsb_link_entry_t*) functions */
static void init_entry(tsb_link_entry_vector_el_t *entryp, void *data);
static void print_entry(tsb_link_entry_vector_el_t *entryp, void *data);

static void write_tsb_link_entry(tsb_link_entry_vector_el_t *entryp,
				 FILE *ofh);
static void write_tsbcsm_link_entry(tsbcsm_link_entry_vector_el_t *entryp,
				 FILE *ofh);
/******************************************************************************
 *
 * TSB_LINK VECTOR OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * clear_tsb_link_vector()
 * 
 * Initialize the tsb_link vector to be empty.
 * 
 *****************************************************************************/

void
clear_tsb_link_vector(void) {
  init_vector(&Tsb_link_vector, "Tsb_link_vector",
	      sizeof(tsb_link_vector_el_t),
	      (vector_elem_func_t) init_tsb_link,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_tsb_link);
}
void
clear_tsbcsm_link_vector(void) {
  init_vector(&Tsbcsm_link_vector, "Tsbcsm_link_vector",
	      sizeof(tsbcsm_link_vector_el_t),
	      (vector_elem_func_t) init_tsbcsm_link,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_tsbcsm_link);
}

/******************************************************************************
 *
 * open_new_tsb_link(name, lineno);
 * 
 * Open a new tsb link.  A name has been seen on input, so allocate a
 * new entry for it.  Mark it as open so the following set_tsb_link_*
 * calls will operate on it.  Use lineno if we have to report errors
 * on it.
 * 
 *****************************************************************************/

void
open_new_tsb_link(char *name, int lineno) {
  int new_index;
  tsb_link_t *tsb_link;
  int i;
  int exists_error = 0;

  if(get_tsb_link_ptr_by_name(name)) {
    exists_error = 1;
    /* Defer error until object is created to use standard error handlers */
  }

  new_index = add_vector_elements(&Tsb_link_vector, 1);

  Open_tsb_link_index = new_index;
  tsb_link = VECTOR_ELEM(Tsb_link_vector, new_index, tsb_link_vector_el_t);

  tsb_link->name = strdup(name);
  tsb_link->lineno = lineno;

  if(exists_error) {
    gf_error(M_BADTSB, FLINE_f "TSB_LINK named '%s' already exists!\n",
	     SRC_FLINE(tsb_link), name);
  }

}

void
open_new_tsbcsm_link(char *name, int lineno) {
  int new_index;
  tsbcsm_link_t *tsb_link;
  int i;
  int exists_error = 0;

  if(get_tsbcsm_link_ptr_by_name(name)) {
    exists_error = 1;
    /* Defer error until object is created to use standard error handlers */
  }

  new_index = add_vector_elements(&Tsbcsm_link_vector, 1);

  Open_tsbcsm_link_index = new_index;
  tsb_link = VECTOR_ELEM(Tsbcsm_link_vector, new_index, tsbcsm_link_vector_el_t);

  tsb_link->name = strdup(name);
  tsb_link->lineno = lineno;

  if(exists_error) {
    gf_error(M_BADTSB, FLINE_f "TSBCSM_LINK named '%s' already exists!\n",
	     SRC_FLINE(tsb_link), name);
  }

}

/******************************************************************************
 *
 * close_tsb_link(lineno)
 * 
 * We've reached the end of a tsb_link block on input.  Mark it as
 * closed, and sanity check it.  Use lineno to report errors if need
 * be.
 * 
 *****************************************************************************/

void
close_tsb_link(int lineno) {
  if(Open_tsb_link_index == NO_OPEN_TSB_LINK) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close TSB_LINK since none is open!\n",
	     GF_FLINE_NUM(lineno));
  }

  sanity_check_tsb_link(VECTOR_ELEM(Tsb_link_vector, Open_tsb_link_index,
				    tsb_link_vector_el_t));

  Open_tsb_link_index = NO_OPEN_TSB_LINK;
}
void
close_tsbcsm_link(int lineno) {
  if(Open_tsbcsm_link_index == NO_OPEN_TSB_LINK) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close TSBCSM_LINK since none is open!\n",
	     GF_FLINE_NUM(lineno));
  }

  sanity_check_tsbcsm_link(VECTOR_ELEM(Tsbcsm_link_vector, Open_tsbcsm_link_index,
				    tsbcsm_link_vector_el_t));

  Open_tsbcsm_link_index = NO_OPEN_TSB_LINK;
}




/******************************************************************************
 *
 * finish_tsb_link_init(void)
 * 
 * After parsing is complete, finish initialization, if there is
 * anything to do.
 * 
 *****************************************************************************/


void
finish_tsb_link_init(void) {
  iterate_vector(&Tsb_link_vector,
		 (vector_elem_func_t) finish_single_tsb_link_init, NULL);

}
void
finish_tsbcsm_link_init(void) {
  iterate_vector(&Tsbcsm_link_vector,
		 (vector_elem_func_t) finish_single_tsbcsm_link_init, NULL);

}

/******************************************************************************
 *
 * get_tsb_link_ptr_by_name(name)
 * 
 * Returns a pointer to the tsb_link_t that has the specified name.
 * Returns NULL if there is no match.
 * 
 *****************************************************************************/

tsb_link_t *
get_tsb_link_ptr_by_name(char *name) {
  tsb_link_vector_el_t *tsb_link_ptr =
    search_vector(&Tsb_link_vector, (vector_search_func_t) tsb_link_name_compare,
		  name);

  if(!tsb_link_ptr) {
    return NULL;
  }
  return *tsb_link_ptr;
}

tsbcsm_link_t *
get_tsbcsm_link_ptr_by_name(char *name) {
  tsbcsm_link_vector_el_t *tsb_link_ptr =
    search_vector(&Tsbcsm_link_vector, (vector_search_func_t) tsbcsm_link_name_compare,
		  name);

  if(!tsb_link_ptr) {
    return NULL;
  }
  //printf("get_tsbcsm_link_ptr!!!\n");
  return *tsb_link_ptr;
}


/******************************************************************************
 *
 * write_tsb_links(ofh)
 * 
 * Write the output files for each element in the tsb_link vector.
 * 
 *****************************************************************************/


void
write_tsb_links(FILE *ofh) {
  iterate_vector(&Tsb_link_vector, (vector_elem_func_t) write_tsb_link, ofh);
}
void
write_tsbcsm_links(FILE *ofh) {
  iterate_vector(&Tsbcsm_link_vector, (vector_elem_func_t) write_tsbcsm_link, ofh);
}





/******************************************************************************
 *
 * VECTOR ELEMENT (tsb_link_t *) OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * init_tsb_link(tsb_linkp, NULL)
 * 
 * Allocate a new tsb_link_t and initialize it to a default state.  tsb_linkp
 * is the address of where to write the address of the new block
 * (tsb_linkp is an tsb_link_t **).
 * 
 *****************************************************************************/


static void
init_tsb_link(tsb_link_vector_el_t *tsb_linkp, void *data) {
  tsb_link_t *tsb_link = gf_malloc(sizeof(*tsb_link));
  *tsb_linkp = tsb_link;

  tsb_link->name = "<no_name>";
  tsb_link->start_addr = UNSPECIFIED_START;
  tsb_link->lineno = 0;
  tsb_link->srcfile = strdup("<unknown>");
  tsb_link->srcline = 0;

  init_vector(&(tsb_link->entries), "TSB_Link_entries",
	      sizeof(tsb_link_entry_vector_el_t),
	      (vector_elem_func_t) init_entry,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_entry);

}
static void
init_tsbcsm_link(tsbcsm_link_vector_el_t *tsb_linkp, void *data) {
  tsbcsm_link_t *tsb_link = gf_malloc(sizeof(*tsb_link));
  *tsb_linkp = tsb_link;

  tsb_link->name = "<no_name>";
  tsb_link->start_addr = UNSPECIFIED_START;
  tsb_link->lineno = 0;
  tsb_link->srcfile = strdup("<unknown>");
  tsb_link->srcline = 0;

  init_vector(&(tsb_link->entries), "TSBCSM_Link_entries",
	      sizeof(tsb_link_entry_vector_el_t),
	      (vector_elem_func_t) init_entry,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_entry);

}

/******************************************************************************
 *
 * print_tsb_link(tsb_linkp, NULL);
 * 
 * Debug function that prints the specified tsb_link.
 * 
 *****************************************************************************/


static void
print_tsb_link(tsb_link_vector_el_t *tsb_linkp, void *data) {
  tsb_link_t *tsb_link = *tsb_linkp;
  gf_say(VERBOSE_DEBUG,
	 "TSB_LINK: name = '%s', lineno=%d\n", tsb_link->name, 
	 tsb_link->lineno);
  gf_say(VERBOSE_DEBUG, 
	 "     start_addr  = 0x%"uint64_x_f"\n", tsb_link->start_addr);
  gf_say(VERBOSE_DEBUG, "\n");

  print_vector(&(tsb_link->entries));

}
static void
print_tsbcsm_link(tsbcsm_link_vector_el_t *tsb_linkp, void *data) {
  tsbcsm_link_t *tsb_link = *tsb_linkp;
  gf_say(VERBOSE_DEBUG,
	 "TSBCSM_LINK: name = '%s', lineno=%d\n", tsb_link->name, 
	 tsb_link->lineno);
  gf_say(VERBOSE_DEBUG, 
	 "     start_addr  = 0x%"uint64_x_f"\n", tsb_link->start_addr);
  gf_say(VERBOSE_DEBUG, "\n");

  print_vector(&(tsb_link->entries));

}

/******************************************************************************
 *
 * finish_single_tsb_link_init(tsb_linkp, NULL)
 * 
 * Finish the intialization of the **tsb_linkp.  This is called after the
 * parser iscomplete and all objects are created.
 * 
 *****************************************************************************/


static void
finish_single_tsb_link_init(tsb_link_vector_el_t *tsb_linkp, void *data) {
  /* nothing to do */
}
static void
finish_single_tsbcsm_link_init(tsbcsm_link_vector_el_t *tsb_linkp, void *data) {
  /* nothing to do */
}

/******************************************************************************
 *
 * tsb_link_name_compare(tsb_linkp, name)
 * 
 * Returns 1 if the specified name matches the name of **tsb_linkp and 0
 * otherwise.
 * 
 *****************************************************************************/


static int
tsb_link_name_compare(tsb_link_vector_el_t *tsb_linkp, char *name) {
  tsb_link_t *tsb_link = *tsb_linkp;

  if(!strcmp(name, tsb_link->name)) {
    return 1;
  }
  return 0;
}
static int
tsbcsm_link_name_compare(tsbcsm_link_vector_el_t *tsb_linkp, char *name) {
  tsbcsm_link_t *tsb_link = *tsb_linkp;

  if(!strcmp(name, tsb_link->name)) {
    return 1;
  }
  return 0;
}


/******************************************************************************
 *
 * sanity_check_tsb_link(tsb_link);
 * 
 * Check the specification for the tsb_link and throw an error if it
 * isn't kosher.
 * 
 *****************************************************************************/


static void
sanity_check_tsb_link(tsb_link_t *tsb_link) {
  if(tsb_link->start_addr == UNSPECIFIED_START) {
    gf_error(M_BADTSB, 
	     FLINE_f
	     "TSB_link '%s' does not specify a starting address!\n",
	     SRC_FLINE(tsb_link), tsb_link->name);
  }
}
static void
sanity_check_tsbcsm_link(tsbcsm_link_t *tsb_link) {
  if(tsb_link->start_addr == UNSPECIFIED_START) {
    gf_error(M_BADTSB, 
	     FLINE_f
	     "TSBCSM_link '%s' does not specify a starting address!\n",
	     SRC_FLINE(tsb_link), tsb_link->name);
  }
}

/******************************************************************************
 *
 * write_tsb_link(tsb_linkp, ofh);
 * 
 * Output the specified tsb_linkp to the mmu image file.
 * 
 *****************************************************************************/


static void
write_tsb_link(tsb_link_vector_el_t *tsb_linkp, FILE *ofh) {
  tsb_link_t *tsb_link = *tsb_linkp;
  tsb_link_entry_t *entry;
  uint64_t i;

  add_object_to_physmap(&Physmap,
			tsb_link->srcfile, tsb_link->srcline, tsb_link->lineno,
			tsb_link->start_addr,
			tsb_link->start_addr + 
			VECTOR_LEN(tsb_link->entries) * LINK_SIZE,
			"TSB_LINK", tsb_link->name);

  fprintf(ofh, "@%016"uint64_x_f"\t// TSB_LINK '%s'\n", tsb_link->start_addr,
	  tsb_link->name);

  iterate_vector(&(tsb_link->entries),
		 (vector_elem_func_t) write_tsb_link_entry,
		 ofh);


}
static void
write_tsbcsm_link(tsbcsm_link_vector_el_t *tsb_linkp, FILE *ofh) {
  tsbcsm_link_t *tsb_link = *tsb_linkp;
  tsb_link_entry_t *entry;
  uint64_t i;

  add_object_to_physmap(&Physmap,
			tsb_link->srcfile, tsb_link->srcline, tsb_link->lineno,
			tsb_link->start_addr,
			tsb_link->start_addr + 
			VECTOR_LEN(tsb_link->entries) * LINK_SIZE,
			"TSBCSM_LINK", tsb_link->name);

  fprintf(ofh, "@%016"uint64_x_f"\t// TSBCSM_LINK '%s'\n", tsb_link->start_addr,
	  tsb_link->name);

  iterate_vector(&(tsb_link->entries),
		 (vector_elem_func_t) write_tsbcsm_link_entry,
		 ofh);


}

/******************************************************************************
 *
 * tsb_link_add_entry(tsb_link, tag, data, tsb_entry)
 * 
 * Add tag & data to linked list.  The tsb_entry is the entry in the
 * TSB where the collision occured.
 * 
 *****************************************************************************/

void
tsb_link_add_entry(tsb_link_t *tsb_link, uint64_t tag, uint64_t data,
		   tsb_entry_t *tsb_entry, block_t *block,
		   block_tsb_t *block_tsb) 
{
  tsb_link_entry_t *link_entry;

  if(tsb_entry->tag == TSB_LINK_TAG) {
    uint64_t index;
    /* add to chain */

    index = (tsb_entry->data - tsb_link->start_addr) / LINK_SIZE;
    link_entry = VECTOR_ELEM(tsb_link->entries, index,
			     tsb_link_entry_vector_el_t);

    /* chase to the end of the chain */
   while(link_entry->next) {
  /*    if((link_entry->tag == tag) && !Suppress_dup_tags_error) {

	gf_error(M_DUPLICATETAG,
		 "Conflict in TSB_Link '%s'.\n"
		 "Tag 0x%"uint64_x_f" being added twice.\n"
		 FLINE_f
		 "First from block '%s'\n"
		 FLINE_f
		 "Again from block '%s'\n",
		 tsb_link->name, tag, 
		 SRC_FLINE(link_entry->block), link_entry->block->name,
		 SRC_FLINE(block), block->name);
      }*/
      link_entry = link_entry->next;
    }

    add_to_chain(tsb_link, link_entry, tag, data, block, block_tsb);
  } else {
    /* create new chain */
    link_entry = start_new_chain(tsb_link, tsb_entry->tag, tsb_entry->data,
				 block, block_tsb);
    add_to_chain(tsb_link, link_entry, tag, data, block, block_tsb);

 /*   if((link_entry->tag == tag) && !Suppress_dup_tags_error) {
      gf_error(M_DUPLICATETAG,
	       "Conflict in TSB_Link '%s'.\n"
	       "Tag 0x%"uint64_x_f" being added twice.\n"
	       FLINE_f
	       "First from block '%s'\n"
	       FLINE_f
	       "Again from block '%s'\n",
	       tsb_link->name, tag, 
	       SRC_FLINE(tsb_entry->block), tsb_entry->block->name,	       
	       SRC_FLINE(block), block->name);
    }
*/

    tsb_entry->tag  = TSB_LINK_TAG;
    tsb_entry->data = link_entry->my_link;
    //printf("DEBUG: tsbentry data%x\n", tsb_entry->data);

  }
}
void
tsbcsm_link_add_entry(tsbcsm_link_t *tsb_link, uint64_t tag, uint64_t clump_num,
		   tsbcsm_entry_t *tsbcsm_entry, tsb_entry_t *tsb_entry, block_t *block,
		   block_tsbcsm_t *block_tsb) 
{
  tsbcsm_link_entry_t *link_entry;

  if(tsbcsm_entry->tag == TSB_LINK_TAG) {
    uint64_t index;
    /* add to chain */

    index = (tsbcsm_entry->data - tsb_link->start_addr) / LINK_SIZE;
    link_entry = VECTOR_ELEM(tsb_link->entries, index,
			     tsbcsm_link_entry_vector_el_t);

    /* chase to the end of the chain */
    while(link_entry->next) {
    /*  if((link_entry->tag == tag) && !Suppress_dup_tags_error) {

	gf_error(M_DUPLICATETAG,
		 "Conflict in TSBCSM_Link '%s'.\n"
		 "Tag 0x%"uint64_x_f" being added twice.\n"
		 FLINE_f
		 "First from block '%s'\n"
		 FLINE_f
		 "Again from block '%s'\n",
		 tsb_link->name, tag, 
		 SRC_FLINE(link_entry->block), link_entry->block->name,
		 SRC_FLINE(block), block->name);
      }*/
      link_entry = link_entry->next;
    }

    add_csm_to_chain(tsb_link, link_entry, tag, clump_num, block, block_tsb);
  } else {
    /* create new chain */
    link_entry = start_new_csm_chain(tsb_link, tsbcsm_entry->tag, tsbcsm_entry->clump_num, block, block_tsb);
    add_csm_to_chain(tsb_link, link_entry, tag, clump_num, block, block_tsb);

 /*   if((link_entry->tag == tag) && !Suppress_dup_tags_error) {
      gf_error(M_DUPLICATETAG,
	       "Conflict in TSBCSM_Link '%s'.\n"
	       "Tag 0x%"uint64_x_f" being added twice.\n"
	       FLINE_f
	       "First from block '%s'\n"
	       FLINE_f
	       "Again from block '%s'\n",
	       tsb_link->name, tag, 
	       SRC_FLINE(tsbcsm_entry->block), tsbcsm_entry->block->name,	       
	       SRC_FLINE(block), block->name);
    }*/


    tsbcsm_entry->tag  = TSB_LINK_TAG;
    tsbcsm_entry->data = link_entry->my_link;
    //printf("DEBUG: tsbcsmentry data%x\n", tsbcsm_entry->data);

  }
}

/******************************************************************************
 *
 * start_new_chain(tsb_link, tag, data, block)
 * 
 * Start a new linked-list in the link area.  Add a new node and add
 * tag/data to it.
 * 
 *****************************************************************************/

 
static tsb_link_entry_t *
start_new_chain(tsb_link_t *tsb_link, uint64_t tag, uint64_t data,
		block_t *block, block_tsb_t *block_tsb) 
{
  tsb_link_entry_t *entry;
  int new_index = add_vector_elements(&(tsb_link->entries), 1);
  entry = VECTOR_ELEM(tsb_link->entries, new_index,
		      tsb_link_entry_vector_el_t);

  entry->tag = tag;
  entry->data = data;
  entry->link = EOL;
  entry->block = block;
  entry->block_tsb = block_tsb;
  entry->my_link = tsb_link->start_addr + (new_index * LINK_SIZE);
  entry->next = NULL;
  
  return entry;
}
static tsbcsm_link_entry_t *
start_new_csm_chain(tsbcsm_link_t *tsb_link, uint64_t tag, uint64_t clump_num,
		block_t *block, block_tsbcsm_t *block_tsb) 
{
  tsbcsm_link_entry_t *entry;
  int new_index = add_vector_elements(&(tsb_link->entries), 1);
  entry = VECTOR_ELEM(tsb_link->entries, new_index,
		      tsbcsm_link_entry_vector_el_t);

  entry->tag = tag;
  entry->clump_num = clump_num;
  entry->link = EOL;
  entry->block = block;
  entry->block_tsb = block_tsb;
  entry->my_link = tsb_link->start_addr + (new_index * LINK_SIZE);
  entry->next = NULL;
  
  return entry;
}

/******************************************************************************
 *
 * add_to_chain(tsb_link, link_entry, tag, data, block);
 * 
 * Add tag/data to existing linked_list that ENDS with link_entry.
 * 
 *****************************************************************************/

static void
add_to_chain(tsb_link_t *tsb_link, tsb_link_entry_t *link_entry,
	     uint64_t tag, uint64_t data, block_t *block,
	     block_tsb_t *block_tsb)
{
  tsb_link_entry_t *entry;
  int new_index = add_vector_elements(&(tsb_link->entries), 1);
  entry = VECTOR_ELEM(tsb_link->entries, new_index,
		      tsb_link_entry_vector_el_t);

  entry->tag = tag;
  entry->data = data;
  entry->link = EOL;
  entry->my_link = tsb_link->start_addr + (new_index * LINK_SIZE);
  entry->block = block;
  entry->block_tsb = block_tsb;
  entry->next = NULL;

  link_entry->link = entry->my_link;
  link_entry->next = entry;
}

static void
add_csm_to_chain(tsbcsm_link_t *tsb_link, tsbcsm_link_entry_t *link_entry,
	     uint64_t tag, uint64_t clump_num, block_t *block,
	     block_tsbcsm_t *block_tsb)
{
  tsbcsm_link_entry_t *entry;
  int new_index = add_vector_elements(&(tsb_link->entries), 1);
  entry = (tsbcsm_link_entry_t *)VECTOR_ELEM(tsb_link->entries, new_index,
		      tsb_link_entry_vector_el_t);

  entry->tag = tag;
  entry->clump_num = clump_num;
  entry->link = EOL;
  entry->my_link = tsb_link->start_addr + (new_index * LINK_SIZE);
  entry->block = block;
  entry->block_tsb = block_tsb;
  entry->next = NULL;

  link_entry->link = entry->my_link;
  link_entry->next = entry;
}

/******************************************************************************
 *
 * init_entry(entryp, NULL)
 * 
 * Inits a new tsb_link_entry element.
 * 
 *****************************************************************************/

static void
init_entry(tsb_link_entry_vector_el_t *entryp, void *data) {
  tsb_link_entry_t *entry = gf_malloc(sizeof(*entry));
  *entryp = entry;

  entry->tag = 0;
  entry->data = 0;
  entry->my_link = EOL;
  entry->link = EOL;
  entry->next = NULL;
}

/******************************************************************************
 *
 * print_entry(entryp, NULL)
 * 
 * Debug prints a tsb_link_entry node.
 * 
 *****************************************************************************/

static void
print_entry(tsb_link_entry_vector_el_t *entryp, void *data) {
  tsb_link_entry_t *entry = *entryp;

  gf_say(VERBOSE_DEBUG,
	 "         tag      = 0x%"uint64_x_f"\n", entry->tag);
  gf_say(VERBOSE_DEBUG,
	 "         data     = 0x%"uint64_x_f"\n", entry->data);
  gf_say(VERBOSE_DEBUG,
	 "         link     = 0x%"uint64_x_f"\n", entry->link);
  gf_say(VERBOSE_DEBUG,
	 "         my link  = 0x%"uint64_x_f"\n", entry->my_link);
  gf_say(VERBOSE_DEBUG,
	 "         next     = 0x%p\n", entry->next);

}

/******************************************************************************
 *
 * write_tsb_link_entry(entryp, ofh);
 * 
 * Writes a tsb_link entry to the mmu image file.
 * 
 *****************************************************************************/

static void
write_tsb_link_entry(tsb_link_entry_vector_el_t *entryp, FILE *ofh) {
  tsb_link_entry_t *entry = *entryp;
  fprintf(ofh, 
	  "%016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f"\n",
	  entry->tag,  entry->data, 
	  entry->link, entry->link);  
}

/******************************************************************************
 *
 * write_tsbcsm_link_entry(entryp, ofh);
 * 
 * Writes a tsbcsm_link entry to the mmu image file.
 * 
 *****************************************************************************/

static void
write_tsbcsm_link_entry(tsbcsm_link_entry_vector_el_t *entryp, FILE *ofh) {
  tsbcsm_link_entry_t *entry = *entryp;
  fprintf(ofh, 
	  "%016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f" %016"uint64_x_f"\n",
	  entry->tag,  entry->clump_num, 
	  entry->link, entry->link);  
}


/******************************************************************************
 *
 * disable_dup_tags_error()
 * 
 * Disables error check for duplicate tags in tsb linked list.
 * 
 *****************************************************************************/

void
disable_dup_tags_error(void) {
  Suppress_dup_tags_error = 1;
}

/******************************************************************************
 *
 * SET FUNCTIONS
 *
 * These are for use during parsing.  They set attributes of the
 * currently open tsb_link object.
 * 
 *****************************************************************************/

#define SET_TSB_LINK(_member_name, _type)				   \
void									   \
set_tsb_link_ ## _member_name (_type _member_name) {			   \
  tsb_link_t *tsb_link = VECTOR_ELEM(Tsb_link_vector, Open_tsb_link_index, \
				     tsb_link_vector_el_t);		   \
  tsb_link->_member_name = _member_name;				   \
}

#define SET_TSB_LINK_STRING(_member_name) 				   \
void									   \
set_tsb_link_ ## _member_name (char * _member_name) {			   \
  tsb_link_t *tsb_link = VECTOR_ELEM(Tsb_link_vector, Open_tsb_link_index, \
				     tsb_link_vector_el_t);		   \
  tsb_link->_member_name = strdup(_member_name);			   \
}
#define SET_TSBCSM_LINK(_member_name, _type)				   \
void									   \
set_tsbcsm_link_ ## _member_name (_type _member_name) {			   \
  tsbcsm_link_t *tsb_link = VECTOR_ELEM(Tsbcsm_link_vector, Open_tsbcsm_link_index, \
				     tsbcsm_link_vector_el_t);		   \
  tsb_link->_member_name = _member_name;				   \
}

#define SET_TSBCSM_LINK_STRING(_member_name) 				   \
void									   \
set_tsbcsm_link_ ## _member_name (char * _member_name) {			   \
  tsbcsm_link_t *tsb_link = VECTOR_ELEM(Tsbcsm_link_vector, Open_tsbcsm_link_index, \
				     tsbcsm_link_vector_el_t);		   \
  tsb_link->_member_name = strdup(_member_name);			   \
}



SET_TSB_LINK(start_addr, uint64_t)
SET_TSB_LINK_STRING(srcfile)
SET_TSB_LINK(srcline, int)
SET_TSBCSM_LINK(start_addr, uint64_t)
SET_TSBCSM_LINK_STRING(srcfile)
SET_TSBCSM_LINK(srcline, int)





