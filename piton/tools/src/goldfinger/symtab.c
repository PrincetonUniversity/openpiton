// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: symtab.c
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
 * symtab.c
 *
 * Implement object described in symtab.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "gf_error.h"
#include "vector.h"
#include "symtab.h"

static void init_symtab_entry(symtab_vector_el_t *entryp, void *data);
static void destroy_symtab_entry(symtab_vector_el_t *entryp, void *data);
static void print_symtab_entry(symtab_vector_el_t *entryp, void *data);
static int  symtab_ent_lookup_compare(symtab_vector_el_t *entryp, char *name);

/******************************************************************************
 *
 * VECTOR (symtab_t) OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * init_symtab(symtab)
 * 
 * Initialize the symbol table pointer to by symtab.  It should
 * already be allocated.
 * 
 *****************************************************************************/

void
init_symtab(symtab_t *symtab) {
  init_vector(symtab, "Symbol table", sizeof(symtab_vector_el_t),
	      (vector_elem_func_t) init_symtab_entry,
	      (vector_elem_func_t) destroy_symtab_entry,
	      (vector_elem_func_t) print_symtab_entry);
}


/******************************************************************************
 *
 * destroy_symtab(symtab)
 * 
 * Destroys the vector pointed to by symtab (i.e., *symtab) and
 * deallocates its elements.  It does NOT deallocate the symtab
 * itself.
 * 
 *****************************************************************************/

void
destroy_symtab(symtab_t *symtab) {
  deallocate_vector(symtab,NULL);
}

/******************************************************************************
 *
 * lookup_symtab(symtab, lookname)
 * 
 * Looks for a symbol named lookname in the sepcified symtab.  Returns
 * a pointer to the symbol table entry (i.e., symtab_ent_t *) that
 * matches.  Returns SYMTAB_NOT_FOUND if it is not found.
 * 
 *****************************************************************************/

symtab_ent_t *
lookup_symtab(symtab_t *symtab, char *lookname) {
  symtab_vector_el_t *entp = 
    search_vector(symtab, 
		  (vector_search_func_t) symtab_ent_lookup_compare, lookname);
  if(!entp) {
    return SYMTAB_NOT_FOUND;
  }
  return *entp;
}

/******************************************************************************
 *
 * add_to_symtab(symtab, name, value, size)
 * 
 * Adds a new entry to the specified symbol table and initializes the
 * new entry with (name, value, size).
 * 
 *****************************************************************************/


void
add_to_symtab(symtab_t *symtab, char *name, addr_t value, uint64_t size) {
  int new_index;
  symtab_vector_el_t entry;

  new_index = add_vector_elements(symtab, 1);
  entry = VECTOR_ELEM(*symtab, new_index, symtab_vector_el_t);

  entry->name = strdup(name);
  entry->value = value;
  entry->size  = size;
}


/******************************************************************************
 *
 * VECTOR ELEMENT (symtab_ent_t *) OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * init_symtab_entry(entryp, NULL)
 * 
 * Allocate a new symtab_entry_t and initialize it to a default state.
 * entryp is the address of where to write the address of the new
 * block (entryp is an symtab_entry_t **).
 * 
 *****************************************************************************/


static void
init_symtab_entry(symtab_vector_el_t *entryp, void *data) {
  symtab_vector_el_t entry = gf_malloc(sizeof(*entry));
  *entryp = entry;

  entry->name  = strdup("<unnamed>");
  entry->value = 0;
  entry->size  = 0;
}


/******************************************************************************
 *
 * destroy_symtab_entry(entryp, NULL)
 * 
 * Deallocates space associated with the symtab entry *entryp.
 * 
 *****************************************************************************/

static void
destroy_symtab_entry(symtab_vector_el_t *entryp, void *data) {
  symtab_vector_el_t entry = *entryp;

  free(entry->name);
}

/******************************************************************************
 *
 * print_symtab_entry(entryp, NULL);
 * 
 * Debug function that prints the specified symtab_entry.
 * 
 *****************************************************************************/

static void
print_symtab_entry(symtab_vector_el_t *entryp, void *data) {
  symtab_vector_el_t entry = *entryp;

  gf_say(VERBOSE_DEBUG,
	 "    Symbol %20s value=0x%llx size=0x%llx\n",
	 entry->name, entry->value, entry->size);
}

/******************************************************************************
 *
 * symtab_entry_name_compare(entryp, name)
 * 
 * Returns 1 if the specified name matches the name of **entryp and 0
 * otherwise.
 * 
 *****************************************************************************/


static int
symtab_ent_lookup_compare(symtab_vector_el_t *entryp, char *name) {
  symtab_ent_t *entry = *entryp;

  if(!strcmp(name, entry->name)) {
    return 1;
  }
  return 0;
}

