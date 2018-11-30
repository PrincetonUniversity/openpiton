// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: linked_section.c
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
 * linked_section.c
 *
 * Implement object described in linked_section.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libelf.h>
#include <gelf.h>

#include "linked_section.h"
#include "gf_types.h"
#include "gf_error.h"
#include "physmap.h"


/******************************************************************************
 *
 * init_linked_section(lsectionp, NULL)
 * 
 * Allocate a new linked_section_t and initialize it to a default
 * state.  lsectionp is the address of where to write the address of
 * the new linked_section (lsectionp is an linked_section_t **).
 * 
 *****************************************************************************/


void
init_linked_section(linked_section_vector_el_t *lsectionp, void *data) {
  linked_section_t *linked_section = gf_malloc(sizeof(*linked_section));
  *lsectionp = linked_section;

  linked_section->name = strdup("<no_name>");
  linked_section->section_name = NULL;
  linked_section->segment_name = NULL;
  linked_section->shndx        = 0;
  linked_section->start_va     = NO_ADDR;
  linked_section->length       = 0;
  linked_section->symtab = gf_malloc(sizeof(*(linked_section->symtab)));
  init_symtab(linked_section->symtab);
}

/******************************************************************************
 *
 * print_linked_section(lsectionp, NULL);
 * 
 * Debug function that prints the specified linked_section.
 * 
 *****************************************************************************/

void
print_linked_section(linked_section_vector_el_t *lsectionp, void *data) {
  linked_section_t *linked_section = *lsectionp;

  gf_say(VERBOSE_DEBUG, "LINKED_SECTION: name = '%s'\n", linked_section->name);
  gf_say(VERBOSE_DEBUG, "     section_name = '%s'\n", 
	 linked_section->section_name ?
	 linked_section->section_name : "<NULL>");
  gf_say(VERBOSE_DEBUG, "     segment_name = '%s'\n", 
	 linked_section->segment_name ?
	 linked_section->segment_name : "<NULL>");
  gf_say(VERBOSE_DEBUG, "     start_va     = 0x%llx\n",
	 linked_section->start_va);
  gf_say(VERBOSE_DEBUG, "     length       = %lld\n",
	 linked_section->length);
  gf_say(VERBOSE_DEBUG, "            shndx = %ld\n",
	 linked_section->shndx);
  if(linked_section->symtab) {
    print_vector(linked_section->symtab);
  }

  gf_say(VERBOSE_DEBUG, "\n");

}



/******************************************************************************
 *
 * linked_section_name_compare(lsectionp, name)
 * 
 * Returns 1 if the specified name matches the name of **lsectionp and 0
 * otherwise.
 * 
 *****************************************************************************/

int
linked_section_name_compare(linked_section_vector_el_t *lsectionp, char *name)
{
  linked_section_t *linked_section = *lsectionp;

  if(!strcmp(name, linked_section->name)) {
    return 1;
  }
  return 0;
}


/******************************************************************************
 *
 * build_linked_section_symbol_table(linked_section, elf, scn, ofh)
 * 
 * Builds a symbol table for the specified elf linked_section.
 * 
 *****************************************************************************/

void
build_linked_section_symbol_table(linked_section_t *linked_section,
				  Elf *elf, Elf_Scn *scn)
{
  Elf_Data *data;
  Elf64_Shdr  *shdr;
  int count;
  int i;
  shdr = elf64_getshdr(scn);

  data = elf_getdata(scn, NULL);
  count = shdr->sh_size / shdr->sh_entsize;

  for(i=0; i< count; i++) {
    GElf_Sym sym;
    char *symname;
    gelf_getsym(data, i, &sym);
    symname = elf_strptr(elf, shdr->sh_link, sym.st_name);

    if(!strlen(symname) || !sym.st_shndx) {
      continue;
    }

    if(sym.st_shndx == linked_section->shndx) {
      add_to_symtab(linked_section->symtab, symname,
		    (addr_t)sym.st_value,
		    (uint64_t)sym.st_size);
    }

  }

}
