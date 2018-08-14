// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: app.c
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
 * app.c
 *
 * Implements object described in app.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <libelf.h>

#include "vector.h"
#include "app.h"
#include "gf_error.h"
#include "block.h"
#include "block_tsb.h"
#include "linked_section.h"

#define NO_OPEN_APP -1
#define UNSPECIFIED_START  ((uint64_t)-1)

vector_t App_vector;
int Open_app_index = NO_OPEN_APP;  /* index of open tsb-link */


/* App_vector elem (app_t*) functions */

static void init_app(app_vector_el_t *appp, void *data);
static void print_app(app_vector_el_t *appp, void *data);
static void finish_single_app_init(app_vector_el_t *appp,
				   void *data);
static int  app_name_compare(app_vector_el_t *appp, char *name);

static void sanity_check_app(app_t *app);
static void app_add_to_tsbs(app_vector_el_t *appp, void *data);
static void app_add_to_tsbcsms(app_vector_el_t *appp, void *data);



static linked_section_t * get_linked_section_by_name(app_t *app, char *name);

static void process_elf_file(app_vector_el_t *appp, process_app_args_t *args);
static void print_app_symtab(app_vector_el_t *appp, FILE *ofh);

typedef struct gen_image_linksection_args_s {
  char *link_section;
  Elf *elf;
  Elf_Scn *scn;
  FILE *ofh;
} gen_image_linksection_args_t;


static void blk_gen_image_if_match(block_vector_el_t *blockp,
				   gen_image_linksection_args_t *args);
static void blk_calculate_size_if_match(block_vector_el_t *blockp, 
					char *link_section);


typedef struct build_symtab_args_s {
  Elf *elf;
  Elf_Scn *scn;
} build_symtab_args_t;



static void linked_sec_build_symtab(linked_section_vector_el_t *lsectionp,
				    build_symtab_args_t *args);

#define NO_OPEN_BLOCK -1
#define NO_OPEN_BLOCK_TSB -1

/******************************************************************************
 *
 * APP VECTOR OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * clear_app_vector()
 * 
 * Initialize the app vector to be empty.
 * 
 *****************************************************************************/

void
clear_app_vector(void) {
  init_vector(&App_vector, "app_vector", sizeof(app_vector_el_t),
	      (vector_elem_func_t) init_app,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_app);
}

/******************************************************************************
 *
 * open_new_app(name, lineno);
 * 
 * Open a new app.  A name has been seen on input, so allocate a new
 * entry for it.  Mark it as open so the following set_app_* calls
 * will operate on it.  Use lineno if we have to report errors on it.
 * 
 *****************************************************************************/

void
open_new_app(char *name, int lineno) {
  int new_index;
  app_t *app;
  int i;
  int app_exists_error = 0;

  if(get_app_ptr_by_name(name)) {
    app_exists_error = 1;
    /* defer this until after the object is created to take advantage
       of standard error handling. */
  }

  new_index = add_vector_elements(&App_vector, 1);

  Open_app_index = new_index;
  app = VECTOR_ELEM(App_vector, new_index, app_vector_el_t);

  app->name = strdup(name);
  app->lineno = lineno;

  if(app_exists_error) {
    gf_error(M_APPSYNTAX,
	     FLINE_f
	     "APP named '%s' already exists!\n",
	     SRC_FLINE(app), name);
  }

}

/******************************************************************************
 *
 * close_app(lineno)
 * 
 * We've reached the end of a app block on input.  Mark it as
 * closed, and sanity check it.  Use lineno to report errors if need
 * be.
 * 
 *****************************************************************************/

void
close_app(int lineno) {
  if(Open_app_index == NO_OPEN_APP) {
    
    gf_error(M_GOLDFINGERPARSE,
	     FLINE_f
	     "Cannot close APP since none is open!\n",
	     GF_FLINE_NUM(lineno));
  }

  sanity_check_app(VECTOR_ELEM(App_vector, Open_app_index,
			       app_vector_el_t));

  Open_app_index = NO_OPEN_APP;
}



/******************************************************************************
 *
 * finish_app_init(void)
 * 
 * After parsing is complete, finish initialization, if there is
 * anything to do.
 * 
 *****************************************************************************/


void
finish_app_init(void) {
  iterate_vector(&App_vector,
		 (vector_elem_func_t) finish_single_app_init, NULL);

}

/******************************************************************************
 *
 * get_app_ptr_by_name(name)
 * 
 * Returns a pointer to the app_t that has the specified name.
 * Returns NULL if there is no match.
 * 
 *****************************************************************************/

app_t *
get_app_ptr_by_name(char *name) {
  app_vector_el_t *app_ptr =
    search_vector(&App_vector, (vector_search_func_t) app_name_compare,
		  name);

  if(!app_ptr) {
    return NULL;
  }
  return *app_ptr;
}


/******************************************************************************
 *
 * process_app_elf_files(args)
 * 
 * Write the output files for each element in the app vector.
 * 
 *****************************************************************************/


void
process_app_elf_files(process_app_args_t *args) {
  iterate_vector(&App_vector, (vector_elem_func_t) process_elf_file, args);
}

/******************************************************************************
 *
 * print_symtab(ofh)
 * 
 * Write the symbol table file, for each app in the app vector.
 * 
 *****************************************************************************/

void
print_symtab(FILE *ofh) {
  iterate_vector(&App_vector, (vector_elem_func_t) print_app_symtab, ofh);
}

/******************************************************************************
 *
 * add_apps_to_tsbs()
 * 
 * Iterate over all apps, adding their blocks to the appropriate TSBs.
 * 
 *****************************************************************************/

void
add_apps_to_tsbs(void) {
  iterate_vector(&App_vector,
		 (vector_elem_func_t) app_add_to_tsbs, NULL);
}

void
add_apps_to_tsbcsms(void) {
  iterate_vector(&App_vector,
		 (vector_elem_func_t) app_add_to_tsbcsms, NULL);
}


/******************************************************************************
 *
 * VECTOR ELEMENT (app_t *) OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * init_app(appp, NULL)
 * 
 * Allocate a new app_t and initialize it to a default state.  appp
 * is the address of where to write the address of the new block
 * (appp is an app_t **).
 * 
 *****************************************************************************/


static void
init_app(app_vector_el_t *appp, void *data) {
  app_t *app = gf_malloc(sizeof(*app));
  *appp = app;

  app->name = strdup("<no_name>");
  app->lineno = 0;
  app->elf_file = strdup("<unknown>");
  app->srcfile = NULL;
  app->srcline = 0;
  init_vector(&(app->blocks), "block_vector", sizeof(block_vector_el_t),
	      (vector_elem_func_t) init_block,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_block);
  app->open_block_index = NO_OPEN_BLOCK;
  init_vector(&(app->linked_sections), "linked_section_vector",
	      sizeof(linked_section_vector_el_t),
	      (vector_elem_func_t) init_linked_section,
	      (vector_elem_func_t) NULL,
	      (vector_elem_func_t) print_linked_section);

}

/******************************************************************************
 *
 * print_app(appp, NULL);
 * 
 * Debug function that prints the specified app.
 * 
 *****************************************************************************/


static void
print_app(app_vector_el_t *appp, void *data) {
  app_t *app = *appp;
  gf_say(VERBOSE_DEBUG,
	 "APP: name = '%s', lineno=%d\n", app->name, 
	 app->lineno);

  gf_say(VERBOSE_DEBUG,
	 "         srcfile = '%s'\n", 
	 app->srcfile ? app->srcfile : "<NULL>");
  gf_say(VERBOSE_DEBUG,
	 "         srcline = %d\n", app->srcline);
  gf_say(VERBOSE_DEBUG, 
	 "     elf_file    = '%s'\n",
	 app->elf_file ? app->elf_file : "<NULL>");

  gf_say(VERBOSE_DEBUG, "\n");
 
  print_vector(&(app->blocks));
  print_vector(&(app->linked_sections));

  gf_say(VERBOSE_DEBUG, "END APP '%s'\n", app->name);
  gf_say(VERBOSE_DEBUG, "\n");

}

/******************************************************************************
 *
 * finish_single_app_init(appp, NULL)
 * 
 * Finish the intialization of the **appp.  This is called after the
 * parser iscomplete and all objects are created.
 * 
 *****************************************************************************/


static void
finish_single_app_init(app_vector_el_t *appp, void *data) {
  app_t *app = *appp;

  iterate_vector(&(app->blocks), (vector_elem_func_t) finish_single_block_init,
		 data);
}

/******************************************************************************
 *
 * app_name_compare(appp, name)
 * 
 * Returns 1 if the specified name matches the name of **appp and 0
 * otherwise.
 * 
 *****************************************************************************/


static int
app_name_compare(app_vector_el_t *appp, char *name) {
  app_t *app = *appp;

  if(!strcmp(name, app->name)) {
    return 1;
  }
  return 0;
}



/******************************************************************************
 *
 * sanity_check_app(app);
 * 
 * Check the specification for the app and throw an error if it
 * isn't kosher.
 * 
 *****************************************************************************/


static void
sanity_check_app(app_t *app) {
  if(!app->elf_file) {
    gf_error(M_APPSYNTAX,
	     FLINE_f,
	     "Application '%s' does not define an elf_file!\n",
	     SRC_FLINE(app), app->name);
  }
}


/******************************************************************************
 *
 * app_add_to_tsbs(appp, data)
 * 
 * Add all blocks in the app to their desginated TSBs.
 * 
 *****************************************************************************/



static void
app_add_to_tsbs(app_vector_el_t *appp, void *data) {
 app_t *app = *appp;

 iterate_vector(&(app->blocks), (vector_elem_func_t) block_add_to_tsbs,
		data);
}

static void
app_add_to_tsbcsms(app_vector_el_t *appp, void *data) {
 app_t *app = *appp;

 iterate_vector(&(app->blocks), (vector_elem_func_t) block_add_to_tsbcsms,
		data);
}


/******************************************************************************
 *
 * process_elf_file(appp, args);
 * 
 * Output the specified appp to its designated output
 * file(s). (mem.image and/or symbol.tbl).
 * 
 *****************************************************************************/


static void
process_elf_file(app_vector_el_t *appp, process_app_args_t *args) {
  app_t *app = *appp;

  Elf         *elf;
  Elf_Scn     *scn = NULL;
  Elf64_Shdr  *shdr;
  Elf64_Ehdr  *ehdr = NULL;
  char        *name;
  int          fd;
  int          ndx;
  linked_section_t *linked_section;
  size_t       symtab_ndx = 0;
  

  gf_say(VERBOSE_DEBUG, "Processing %s\n", app->elf_file);
  elf_version(EV_CURRENT);
  
  fd = open(app->elf_file, O_RDONLY);
  elf = elf_begin(fd, ELF_C_READ, NULL);

  if ((ehdr = elf64_getehdr(elf)) == 0) {
    gf_error(M_ELF, FLINE_f "Cannot get elf header for file '%s'\n",
	     SRC_FLINE(app), app->elf_file);
  }
  ndx = ehdr->e_shstrndx;

  /* Go through all sections, building linked_section objects */
  while ((scn = elf_nextscn(elf, scn)) != NULL) {
    size_t shndx = elf_ndxscn(scn);

    shdr = elf64_getshdr(scn);
   

    if(shdr->sh_type == SHT_SYMTAB) {
      symtab_ndx = elf_ndxscn(scn);
    }

    if(!(shdr->sh_type == SHT_PROGBITS || shdr->sh_type == SHT_NOBITS)) {
      continue;
    }
    
    name = elf_strptr(elf, ndx, (size_t)shdr->sh_name);
    if(name == NULL) {
      continue;
    }

    linked_section = get_linked_section_by_name(app, name);
    if(linked_section) {
      linked_section->shndx    = shndx;
      linked_section->start_va = shdr->sh_addr;
      linked_section->length   = shdr->sh_size;
    }


  }


#ifndef MACOS
  iterate_vector(&(app->blocks),
		 (vector_elem_func_t) block_check_link_section_exists,
		 NULL);
#endif


  /* If we found a symbol table section, add symbols to all linked sections */
  if(symtab_ndx) {
    build_symtab_args_t build_st_args;
    scn = elf_getscn(elf, symtab_ndx);

    build_st_args.elf = elf;
    build_st_args.scn = scn;

    iterate_vector(&(app->linked_sections), 
		   (vector_elem_func_t) linked_sec_build_symtab,
		   &build_st_args);

  }


  /* Now that we have linked_section objects built, and they have
     symbol tables associated with them, we can go through the blocks
     and do our computation.  This was impossbile before symbol tables
     were built because blocks may have start_label and end_label
     set. */

  scn = NULL;
  while ((scn = elf_nextscn(elf, scn)) != NULL) {
    gen_image_linksection_args_t linksection_args;
    size_t shndx = elf_ndxscn(scn);

    shdr = elf64_getshdr(scn);
   

    if(shdr->sh_type == SHT_SYMTAB) {
      symtab_ndx = elf_ndxscn(scn);
    }

    if(!(shdr->sh_type == SHT_PROGBITS || shdr->sh_type == SHT_NOBITS)) {
      continue;
    }
    
    name = elf_strptr(elf, ndx, (size_t)shdr->sh_name);
    if(name == NULL) {
      continue;
    }

    iterate_vector(&(app->blocks),
		   (vector_elem_func_t) blk_calculate_size_if_match,
		   name);
    
    if(args->genimage) {
      
      linksection_args.link_section = name;
      linksection_args.elf = elf;
      linksection_args.scn = scn;
      linksection_args.ofh = args->image_fh;

      iterate_vector(&(app->blocks),
		     (vector_elem_func_t) blk_gen_image_if_match,
		     &linksection_args);
    }


  }

  elf_end(elf);
  close(fd);

}

/******************************************************************************
 *
 * print_app_symtab(appp, ofh)
 * 
 * Prints the symbol table file information for the given app to the
 * given file handle.
 * 
 *****************************************************************************/


static void
print_app_symtab(app_vector_el_t *appp, FILE *ofh) {
  app_t *app = *appp;

  iterate_vector(&(app->blocks),
		 (vector_elem_func_t) block_print_symtab, ofh);
  
}


/******************************************************************************
 *
 * LINKED SECTION FUNCTIONS
 * 
 * These functions manipulate elements of the linked_section vector (a
 * member of the app_t).
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * linked_sec_build_symtab(lsectionp, args)
 * 
 * Element function for building a symbol table for the linked
 * section.  The args struct will include a pointer to an open ELF
 * section.
 * 
 *****************************************************************************/

static void
linked_sec_build_symtab(linked_section_vector_el_t *lsectionp,
			build_symtab_args_t *args)
{
  linked_section_t *linked_section = *lsectionp;

  build_linked_section_symbol_table(linked_section, args->elf, args->scn);
}


/******************************************************************************
 *
 * get_linked_section_by_name(app, name)
 * 
 * Search an app object for a linked_section object with a given name
 * and return it.
 * 
 *****************************************************************************/

static linked_section_t *
get_linked_section_by_name(app_t *app, char *name) {
  linked_section_vector_el_t *lsectionp =
    search_vector(&(app->linked_sections),
		  (vector_search_func_t) linked_section_name_compare, name);

  if(!lsectionp) {
    return NULL;
  }
  return *lsectionp;
}


/******************************************************************************
 *
 * BLOCK VECTOR FUNCTIONS
 * 
 * These functions manipulate the block vector (a member of the app_t).
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * open_new_block(name, lineno);
 * 
 * Open a new block.  A name has been seen on input, so allocate a new
 * entry for it.  Mark it as open so the following set_block_* calls
 * will operate on it.  Use lineno if we have to report errors on it.
 * The new block will be part of the currently open app object.
 * 
 *****************************************************************************/


void
open_new_block(char *name, int lineno) {
  int new_index;
  block_t *block;
  int i;
  app_t *app = VECTOR_ELEM(App_vector, Open_app_index,
			   app_vector_el_t);


  new_index = add_vector_elements(&(app->blocks), 1);

  app->open_block_index = new_index;
  block = VECTOR_ELEM(app->blocks, new_index, block_vector_el_t);

  block->name = strdup(name);
  block->lineno = lineno;

}

/******************************************************************************
 *
 * close_block(lineno)
 * 
 * We've reached the end of a block on input.  Mark it as closed, and
 * sanity check it.  Use lineno to report errors if need be.  This
 * function also sets up the block to point to the appropriate entry
 * in the linked_section vector.  If no appropriate entry exists, one is
 * created.
 * 
 *****************************************************************************/


void
close_block(int lineno) {
  app_t *app = VECTOR_ELEM(App_vector, Open_app_index,
			   app_vector_el_t);
  block_t *block;
  linked_section_t *lsection;


  if(app->open_block_index == NO_OPEN_BLOCK) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close block since no BLOCK is open!\n",
	     GF_FLINE_NUM(lineno));
  }


  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);


  sanity_check_block(block);
  
  lsection = get_linked_section_by_name(app, block->link_section);
  if(!lsection) {
    int new_index;

    new_index = add_vector_elements(&(app->linked_sections), 1);
    lsection = VECTOR_ELEM(app->linked_sections, new_index,
			   linked_section_vector_el_t);
    lsection->name = strdup(block->link_section);
    lsection->section_name = strdup(block->section_name);
    lsection->segment_name = strdup(block->segment_name);
  }
  block->linked_section_obj = lsection;

  
  app->open_block_index = NO_OPEN_BLOCK;

}

static void
blk_calculate_size_if_match(block_vector_el_t *blockp, char *link_section) {
  block_t *block = *blockp;
  
  if(!strcmp(link_section, block->link_section)) {
    block_calculate_size(block);
  }
}

/******************************************************************************
 *
 * blk_gen_image_if_match(blockp, args)
 * 
 * Iterator function for the block vector.  If the args specify a
 * link_section name that matches the block's link_section name, then
 * generate a memory image for the block.  Else, do nothing.
 * 
 *****************************************************************************/

static void
blk_gen_image_if_match(block_vector_el_t *blockp,
		       gen_image_linksection_args_t *args)
{
  block_t *block = *blockp;

  if(!strcmp(args->link_section, block->link_section)) {
    block_generate_image(block, args->elf, args->scn, args->ofh);
  }
}


/******************************************************************************
 *
 * open_new_block_tsb(name, lineno);
 * 
 * Open a new block_tsb.  A name has been seen on input, so allocate a
 * new entry for it.  Mark it as open so the following set_block_tsb_*
 * calls will operate on it.  Use lineno if we have to report errors
 * on it.  The new block_tsb will be part of the currently open block
 * of the currently open app object.
 * 
 *****************************************************************************/


void
open_new_block_tsb(char *name, int lineno) {
  int new_index;
  block_t *block;
  block_tsb_t *block_tsb;
  int i;
  app_t *app = VECTOR_ELEM(App_vector, Open_app_index,
			   app_vector_el_t);


  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);


  new_index = add_vector_elements(&(block->tsbs), 1);

  block->open_block_tsb_index = new_index;
  block_tsb = VECTOR_ELEM(block->tsbs, new_index, block_tsb_vector_el_t);
  
  block_tsb->name = strdup(name);
  block_tsb->lineno = lineno;
  block_tsb->block = block;
}

void
open_new_block_tsbcsm(char *name, int lineno) {
  int new_index;
  block_t *block;
  block_tsbcsm_t *block_tsb;
  int i;
  app_t *app = VECTOR_ELEM(App_vector, Open_app_index,
			   app_vector_el_t);


  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);


  new_index = add_vector_elements(&(block->tsbcsms), 1);

  block->open_block_tsbcsm_index = new_index;
  block_tsb = VECTOR_ELEM(block->tsbcsms, new_index, block_tsbcsm_vector_el_t);
  
  block_tsb->name = strdup(name);
  block_tsb->lineno = lineno;
  block_tsb->block = block;
}


/******************************************************************************
 *
 * close_block(lineno)
 * 
 * We've reached the end of a block_tsb on input.  Mark it as closed,
 * and sanity check it.  Use lineno to report errors if need be. 
 * 
 *****************************************************************************/


void
close_block_tsb(int lineno) {
  app_t *app = VECTOR_ELEM(App_vector, Open_app_index,
			   app_vector_el_t);
  block_t *block;
  block_tsb_t *block_tsb;


  if(app->open_block_index == NO_OPEN_BLOCK) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close block since no BLOCK is open!\n",
	     GF_FLINE_NUM(lineno));
  }


  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);

  if(block->open_block_tsb_index == NO_OPEN_BLOCK_TSB) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close block_tsb since no BLOCK_TSB is open!\n",
	     GF_FLINE_NUM(lineno));
  }

  block_tsb = VECTOR_ELEM(block->tsbs, block->open_block_tsb_index,
			  block_tsb_vector_el_t);



  block->open_block_tsb_index = NO_OPEN_BLOCK_TSB;

}

void
close_block_tsbcsm(int lineno) {
  app_t *app = VECTOR_ELEM(App_vector, Open_app_index,
			   app_vector_el_t);
  block_t *block;
  block_tsbcsm_t *block_tsb;


  if(app->open_block_index == NO_OPEN_BLOCK) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close block since no BLOCK is open!\n",
	     GF_FLINE_NUM(lineno));
  }


  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);

  if(block->open_block_tsbcsm_index == NO_OPEN_BLOCK_TSB) {
    gf_error(M_GOLDFINGERPARSE, FLINE_f
	     "Cannot close block_tsb since no BLOCK_TSB is open!\n",
	     GF_FLINE_NUM(lineno));
  }

  block_tsb = VECTOR_ELEM(block->tsbcsms, block->open_block_tsbcsm_index,
			  block_tsbcsm_vector_el_t);



  block->open_block_tsbcsm_index = NO_OPEN_BLOCK_TSB;

}



/******************************************************************************
 *
 * SET FUNCTIONS
 *
 * These are for use during parsing.  They set attributes of the
 * currently open app object.
 * 
 *****************************************************************************/

#define SET_APP(_member_name, _type)					\
void									\
set_app_ ## _member_name (_type _member_name)				\
{									\
  app_t *app;								\
									\
  app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	\
  app->_member_name = _member_name;					\
}

#define SET_APP_STRING(_member_name)					\
void									\
set_app_ ## _member_name (char * _member_name)				\
{									\
  app_t *app;								\
									\
  app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	\
  app->_member_name = strdup(_member_name);				\
}


SET_APP_STRING(elf_file)
SET_APP_STRING(srcfile)
SET_APP(srcline, int)

/******************************************************************************
 *
 * BLOCK SET FUNCTIONS
 *
 * These are for use during parsing.  They set attributes of the
 * currently open block in the currently open app object.
 * 
 *****************************************************************************/

#define SET_BLOCK(_member_name, _type)					      \
void									      \
set_block_ ## _member_name (_type _member_name)				      \
{									      \
  app_t *app;								      \
  block_t *block;							      \
									      \
  app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	      \
  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t); \
  blk_set_ ## _member_name (block, _member_name);			      \
}

SET_BLOCK(section_name, char *)
SET_BLOCK(segment_name, char *)
SET_BLOCK(link_section, char *)
SET_BLOCK(srcfile, char *)
SET_BLOCK(srcline, int)
SET_BLOCK(compress, int)
SET_BLOCK(in_image, int)
SET_BLOCK(no_end_range_check, int)
SET_BLOCK(va, addr_t)
SET_BLOCK(ra, addr_t)
SET_BLOCK(pa, addr_t)
SET_BLOCK(start_label, char *)
SET_BLOCK(end_label, char *)
SET_BLOCK(end_va, addr_t)
SET_BLOCK(ra_eq_va, int)
SET_BLOCK(pa_eq_va, int)

#define SET_BLOCK_TSB(_member_name, _type)				      \
void									      \
set_block_tsb_ ## _member_name (_type _member_name)			      \
{									      \
  app_t *app;								      \
  block_t *block;							      \
									      \
  app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	      \
  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t); \
  blk_set_blk_tsb_ ## _member_name (block, _member_name);		      \
}

#define SET_BLOCK_TSBCSM(_member_name, _type)				      \
void									      \
set_block_tsbcsm_ ## _member_name (_type _member_name)			      \
{									      \
  app_t *app;								      \
  block_t *block;							      \
									      \
  app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	      \
  block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t); \
  blk_set_blk_tsbcsm_ ## _member_name (block, _member_name);		      \
}

SET_BLOCK_TSB(tag_base, addr_t)
SET_BLOCK_TSB(data_base, addr_t)
SET_BLOCK_TSB(page_size, addr_t)
SET_BLOCK_TSB(srcfile, char *)
SET_BLOCK_TSB(srcline, int)
SET_BLOCK_TSBCSM(clump_num, uint64_t)

#define SET_BLOCK_TSB_BITS(_member_name)				      \
void									      \
set_block_tsb_ ## _member_name(int hi_bit, int lo_bit) {		      \
 app_t *app;								      \
 block_t *block;							      \
									      \
 app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	      \
 block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);  \
 blk_set_blk_tsb_ ## _member_name (block, hi_bit, lo_bit);		      \
}

#define SET_BLOCK_TSBCSM_BITS(_member_name)				      \
void									      \
set_block_tsbcsm_ ## _member_name(int hi_bit, int lo_bit) {		      \
 app_t *app;								      \
 block_t *block;							      \
									      \
 app = VECTOR_ELEM(App_vector, Open_app_index, app_vector_el_t);	      \
 block = VECTOR_ELEM(app->blocks, app->open_block_index, block_vector_el_t);  \
 blk_set_blk_tsbcsm_ ## _member_name (block, hi_bit, lo_bit);		      \
}

SET_BLOCK_TSB_BITS(va_index_bits)
SET_BLOCK_TSB_BITS(tag_addr_bits)
SET_BLOCK_TSB_BITS(tte_tag_addr_bits)
SET_BLOCK_TSB_BITS(data_addr_bits)
  



