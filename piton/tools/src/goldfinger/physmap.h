// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: physmap.h
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
#ifndef _PHYSMAP_H_
#define _PHYSMAP_H_

/*
 * physmap.h
 *
 * Maintains a map of physical memory.  Keeps track of which addresses
 * are used.  If you try to add_to_physmap() to a region that
 * conflicts with something in the physmap, you will generate a
 * M_PACOLLIDE error.  The only purpose of this module is to be able
 * to generate M_PACOLLIDE errors when appropriate.
 *
 * A global variable, Physmap, is used to keep track of the physical
 * address space.
 */

#include <stdlib.h>
#include "gf_types.h"
#include "vector.h"

typedef struct physmap_ent_descr_s {
  char *srcfile;
  int   srcline;

  enum { none_e, block_e, object_e } type;
  union {
    struct {
      char *section_name;
      char *segment_name;
    } block;
    struct {
      char *object_type;
      char *object_name;
    } object;
  } names;

  int lineno;

} physmap_ent_descr_t;


typedef struct physmap_ent_s {
  addr_t start;
  addr_t stop;

  physmap_ent_descr_t descr;

} physmap_ent_t, *physmap_vector_el_t;

/* A physmap is just a vector of physmap_ent_t objects */
typedef vector_t physmap_t ;


extern physmap_t Physmap;

/* Initializes the physmap to a default state.  The physmap_t itself
   should be allocated - this just initializes the elements */
extern void init_physmap(physmap_t *physmap);
/* Destroyes a physmap.  Doesn't deallocate the physmap_t, just the
   elements */
extern void destroy_physmap(physmap_t *physmap);

/* Add the a region to the physmap and cry M_PACOLLIDE if it collides
   with an existing entry.  There are two functions to handle
   different types of objects that can be added to the physmap.  They
   are handled the same except for the way they are pretty-printed in
   error messages. */

/* This is for an block block (block_t) */
extern void add_block_to_physmap(physmap_t *physmap,
				 char *srcfile, int srcline, int lineno,
				 addr_t start, addr_t stop,
				 char *section_name, char *segment_name);

/* This is for anything else */
extern void add_object_to_physmap(physmap_t *physmap,
				  char *srcfile, int srcline, int lineno,
				  addr_t start, addr_t stop,
				  char *object_type, char *object_name);


#endif
