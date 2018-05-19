// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: symtab.h
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
#ifndef _SYMTAB_H_
#define _SYMTAB_H_

/*
 * symtab.h
 *
 * Implements a symbol table.  A symbol table is a vector of
 * symtab_ent_t objects.  It gets a name, value, and size from an ELF
 * symbol table.  It stores the symbol table in a vector, which means
 * that searches are O(n), but in typical usage of goldfinger, the
 * symbol table is rarely accessed by name (only for start_label and
 * end_label in attrs).  The more significant access, from a
 * performance perspective, is when the symbol table is dumped after
 * image generation.  For that access pattern, a vector is the data
 * structure of choice.
 */


#include <stdlib.h>
#include "gf_types.h"
#include "vector.h"

typedef struct symtab_ent_s {
  char *   name;
  addr_t   value;
  uint64_t size;
} symtab_ent_t, *symtab_vector_el_t;

/* A symbol table is just a vector of entries */
typedef vector_t symtab_t ;

/* If a lookup fails, return this value */
#define SYMTAB_NOT_FOUND  NULL

/* Initializes a symbol table.  The symtab_t itself should already be
   allocated - this just allocates space for the elements */
extern void init_symtab(symtab_t *symtab);
/* Destroys a symbol table.  Does nothing with the symtab_t itself -
   just deallocates the elements */
extern void destroy_symtab(symtab_t *symtab);
/* Returns the symtab_ent_t* with the specified lookup name.  Returns
   SYMTAB_NOT_FOUND if it is not found. */
extern symtab_ent_t *lookup_symtab(symtab_t *symtab, char *lookname);

/* Adds a new entry to the symtab */
extern void add_to_symtab(symtab_t *symtab, char *name,
			  addr_t value, uint64_t size);

#endif
