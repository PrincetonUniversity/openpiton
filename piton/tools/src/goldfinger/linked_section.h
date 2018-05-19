// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: linked_section.h
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
#ifndef _LINKED_SECTION_H_
#define _LINKED_SECTION_H_

/*
 * linked_section.h
 *
 * This implements a linked section object.  This is an object that
 * knows how to build a symbol table for a section of a linked ELF
 * file.  This is separate from a block object since there may be many
 * blocks that reference the same ELF section.  The symbol table is
 * built per-link section, so this object can be shared among all
 * blocks that use it.
 */


#include <stdio.h>
#include <inttypes.h>
#include <libelf.h>

#include "gf_types.h"
#include "vector.h"
#include "symtab.h"

typedef struct linked_section_s {
  char *      name;           /* name of the linked_section object */
  char *      section_name;   /* name of the containing SECTION */
  char *      segment_name;   /* name of the segment the data in the
				 linked_sectino was generated from */
  symtab_t *  symtab;         /* pointer to a symbol table */
  size_t      shndx;          /* ELF section header index */

  addr_t      start_va;
  uint64_t    length;
} linked_section_t, *linked_section_vector_el_t;


/* Vector element functions.  Used to manipulate vectors of
   linked_section objects */
extern void init_linked_section(linked_section_vector_el_t *lsectionp,
				void *data);
extern void print_linked_section(linked_section_vector_el_t *lsectionp,
				 void *data);
extern int  linked_section_name_compare(linked_section_vector_el_t *lsectionp,
					char *name);


/* Builds the symbol table for the linked sectino */
extern void
build_linked_section_symbol_table(linked_section_t *linked_section,
				  Elf *elf, Elf_Scn *scn);

#endif
