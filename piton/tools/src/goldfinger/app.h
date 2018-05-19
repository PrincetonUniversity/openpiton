// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: app.h
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
#ifndef _APP_H_
#define _APP_H_


/*
 * app.h
 *
 * This is the interface for an application object.  An application
 * object is a linked executable that contains a vector of
 * user-specified blocks (see block.h).  Each block is a description
 * of how a portion of the executable file should be written to the
 * image file and/or the symbol table.

 * A global variable, App_vector, is a vector of app_t pointers.  It
 * is created by the parser, yyparse().  The process_app_elf_files()
 * function does the magic to create the output.
 */


#include <stdio.h>
#include "gf_types.h"
#include "vector.h"


typedef struct app_s {
  char *name;                  /* name of app */
  char *elf_file;              /* name of elf file for linked app */

  /* vector of user's blocks (block_vector_el_t) for this app */
  vector_t blocks;               

  /* vector of linked_sections (linked_section_vector_el_t) found in the
     elf file */
  vector_t linked_sections;

  /* common for all parser-created objects */
  char *srcfile;              /* Source file where this app is defined */ 
  int srcline;                /* Line in the source file for definition */
  int lineno;                 /* line number in .goldfinger file */

  /* Used internally */
  int open_block_index;       /* index of open block (used during parsing) */
} app_t, *app_vector_el_t;



extern vector_t App_vector;


/* Initialize App_vector - call before parsing */
extern void clear_app_vector(void);

/* Do whatever setup is necessary after all objects have been
   constructed.  Call after parsing and before use. */
extern void finish_app_init(void);


/* Search for app (in App_vector) by name */
extern app_t *get_app_ptr_by_name(char *name);


/* Do the magic - iterate over the App_vector, doing whatever processing
   is requested in the process_app_args_t. */

typedef struct process_app_args_s { /* Provide arguments to
				       process_app_elf_files */
  int   genimage;
  FILE *image_fh;
} process_app_args_t;

extern void process_app_elf_files(process_app_args_t *args);
extern void print_symtab(FILE *ofh);

/* Iterate over all appliations, adding their blocks to the
   appropriate TSBs */
extern void add_apps_to_tsbs(void);
extern void add_apps_to_tsbcsms(void);


/**************************************************************************** 
 *
 * PARSER FUNCTIONS 
 *
 ****************************************************************************/

extern void open_new_app(char *name, int lineno);
extern void close_app(int lineno);

extern void open_new_block(char *name, int lineno);
extern void close_block(int lineno);

extern void open_new_block_tsb(char *name, int lineno);
extern void close_block_tsb(int lineno);

extern void open_new_block_tsbcsm(char *name, int lineno);
extern void close_block_tsbcsm(int lineno);


/* Used by the parser to set attributes of open app */


#define SET_APP_PROTO(_member_name, _type)			\
extern void set_app_ ## _member_name(_type _member_name)

SET_APP_PROTO(elf_file, char *);
SET_APP_PROTO(srcfile, char *);
SET_APP_PROTO(srcline, int);

/* Called by parser to set attributes of the open block in the open app */

#define SET_BLOCK_PROTO(_member_name, _type)			\
extern void set_block_ ## _member_name(_type _member_name)

#define SET_BLOCK_TSB_PROTO(_member_name, _type)		\
extern void set_block_tsb_ ## _member_name(_type _member_name)

#define SET_BLOCK_TSB_BITS_PROTO(_member_name)			\
extern void set_block_tsb_ ## _member_name(int hi_bit, int lo_bit)

SET_BLOCK_PROTO(section_name, char *);
SET_BLOCK_PROTO(segment_name, char *);
SET_BLOCK_PROTO(link_section, char *);
SET_BLOCK_PROTO(srcfile, char *);
SET_BLOCK_PROTO(srcline, int);
SET_BLOCK_PROTO(compress, int);
SET_BLOCK_PROTO(in_image, int);
SET_BLOCK_PROTO(no_end_range_check, int);
SET_BLOCK_PROTO(va, addr_t);
SET_BLOCK_PROTO(ra, addr_t);
SET_BLOCK_PROTO(pa, addr_t);
SET_BLOCK_PROTO(start_label, char *);
SET_BLOCK_PROTO(end_label, char *);
SET_BLOCK_PROTO(end_va, addr_t);
SET_BLOCK_PROTO(ra_eq_va, int);
SET_BLOCK_PROTO(pa_eq_va, int);

SET_BLOCK_TSB_PROTO(tag_base, addr_t);
SET_BLOCK_TSB_PROTO(data_base, addr_t);
SET_BLOCK_TSB_PROTO(page_size, addr_t);
SET_BLOCK_TSB_PROTO(srcfile, char *);
SET_BLOCK_TSB_PROTO(srcline, int);

SET_BLOCK_TSB_BITS_PROTO(va_index_bits);
SET_BLOCK_TSB_BITS_PROTO(tag_addr_bits);
SET_BLOCK_TSB_BITS_PROTO(tte_tag_addr_bits);
SET_BLOCK_TSB_BITS_PROTO(data_addr_bits);

#endif
