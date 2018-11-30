// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: physmap.c
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
 * physmap.c
 *
 * Implements object defined in physmap.h
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "gf_error.h"
#include "vector.h"
#include "physmap.h"

physmap_t Physmap;

static void init_physmap_entry(physmap_vector_el_t *entryp, void *data);
static void destroy_physmap_entry(physmap_vector_el_t *entryp, void *data);
static void print_physmap_entry(physmap_vector_el_t *entryp, void *data);
static void check_entry_vs_vector(physmap_ent_t *entry, physmap_t *physmap);
static void check_vector_elem(physmap_vector_el_t *entryp,
			      physmap_ent_t *check);
static void collision_error(physmap_ent_t *check, physmap_ent_t *old);
static char *get_ent_descr_string(physmap_ent_t *entry);

static void copy_physmap_entry(physmap_ent_t *to, physmap_ent_t *from);

/******************************************************************************
 *
 * VECTOR (physmap_t) OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * init_physmap(physmap)
 * 
 * Initialize the symbol table pointer to by physmap.  It should
 * already be allocated.
 * 
 *****************************************************************************/

void
init_physmap(physmap_t *physmap) {
  init_vector(physmap, "Physmap", sizeof(physmap_vector_el_t),
	      (vector_elem_func_t) init_physmap_entry,
	      (vector_elem_func_t) destroy_physmap_entry,
	      (vector_elem_func_t) print_physmap_entry);
}


/******************************************************************************
 *
 * destroy_physmap(physmap)
 * 
 * Destroys the vector pointed to by physmap (i.e., *physmap) and
 * deallocates its elements.  It does NOT deallocate the physmap
 * itself.
 * 
 *****************************************************************************/

void
destroy_physmap(physmap_t *physmap) {
  deallocate_vector(physmap,NULL);
}

/******************************************************************************
 *
 * add_block_to_physmap(physmap, srcfile, srcline, start, stop,
 *                     section_name, segment_name)
 * 
 * Adds a block to the physmap.
 * 
 *****************************************************************************/


void
add_block_to_physmap(physmap_t *physmap, char *srcfile, int srcline,
		     int lineno, addr_t start, addr_t stop,
		     char *section_name, char *segment_name) 
{
  int new_index;
  physmap_vector_el_t entry;
  physmap_ent_t local_entry;

  local_entry.descr.srcfile = strdup(srcfile);
  local_entry.descr.srcline = srcline;
  local_entry.descr.lineno  = lineno;
  local_entry.start   = start;
  local_entry.stop    = stop;

  local_entry.descr.type = block_e;


  local_entry.descr.names.block.section_name = strdup(section_name);
  local_entry.descr.names.block.segment_name = strdup(segment_name);

  //printf("DEBUG section: %s\n", section_name);
  //printf("DEBUG segment: %s\n", segment_name);
  //printf("DEBUG srcfile: %s\n", srcfile);
  //printf("DEBUG srcline: %d\n", srcline);
  //printf("DEBUG lineno: %d\n", lineno);
  //printf("DEBUG start: %lx\n", start);
  //printf("DEBUG stop: %lx\n", stop);

  check_entry_vs_vector(&local_entry, physmap);

  new_index = add_vector_elements(physmap, 1);
  entry = VECTOR_ELEM(*physmap, new_index, physmap_vector_el_t);

  copy_physmap_entry(entry, &local_entry);
}

/******************************************************************************
 *
 * add_object_to_physmap(physmap, srcfile, srcline, start, stop,
 *                       object_type, object_name)
 * 
 * Adds an object (i.e., something other than a block) to the
 * physmap.
 * 
 *****************************************************************************/


void
add_object_to_physmap(physmap_t *physmap, char *srcfile, int srcline,
		      int lineno, addr_t start, addr_t stop,
		      char *object_type, char *object_name)
{
  int new_index;
  physmap_vector_el_t entry;
  physmap_ent_t local_entry;

  local_entry.descr.srcfile = strdup(srcfile);
  local_entry.descr.srcline = srcline;
  local_entry.descr.lineno  = lineno;
  local_entry.start   = start;
  local_entry.stop    = stop;

  local_entry.descr.type = object_e;

  local_entry.descr.names.object.object_type = strdup(object_type);
  local_entry.descr.names.object.object_name = strdup(object_name);
  
  //printf("DEBUG object: %s\n", object_type);
  //printf("DEBUG object: %s\n", object_name);

  check_entry_vs_vector(&local_entry, physmap);

  new_index = add_vector_elements(physmap, 1);
  entry = VECTOR_ELEM(*physmap, new_index, physmap_vector_el_t);

  copy_physmap_entry(entry, &local_entry);
}

/******************************************************************************
 *
 * copy_physmap_entry(to, from)
 * 
 * Shallow-copies elements of 'from' to 'to'.
 * 
 *****************************************************************************/

static void
copy_physmap_entry(physmap_ent_t *to, physmap_ent_t *from) {
  to->start         = from->start;
  to->stop          = from->stop;
  to->descr.srcfile = from->descr.srcfile;
  to->descr.srcline = from->descr.srcline;
  to->descr.lineno  = from->descr.lineno;
  to->descr.type    = from->descr.type;

  if(to->descr.type == block_e) {
    to->descr.names.block.section_name = from->descr.names.block.section_name;
    to->descr.names.block.segment_name = from->descr.names.block.segment_name;
  } else if(to->descr.type == object_e) {
    to->descr.names.object.object_type = from->descr.names.object.object_type;
    to->descr.names.object.object_name = from->descr.names.object.object_name;
  }
 
}

/******************************************************************************
 *
 * VECTOR ELEMENT (physmap_ent_t *) OPERATIONS
 * 
 *****************************************************************************/


/******************************************************************************
 *
 * init_physmap_entry(entryp, NULL)
 * 
 * Allocate a new physmap_entry_t and initialize it to a default state.
 * entryp is the address of where to write the address of the new
 * block (entryp is an physmap_entry_t **).
 * 
 *****************************************************************************/


static void
init_physmap_entry(physmap_vector_el_t *entryp, void *data) {
  physmap_vector_el_t entry = gf_malloc(sizeof(*entry));
  *entryp = entry;

  entry->descr.type = none_e;
  entry->start = 0;
  entry->stop  = 0;
  entry->descr.srcline = 0;
  entry->descr.lineno = 0;
  entry->descr.srcfile = strdup("<unknown>");
}


/******************************************************************************
 *
 * destroy_physmap_entry(entryp, NULL)
 * 
 * Deallocates space associated with the physmap entry *entryp.
 * 
 *****************************************************************************/

static void
destroy_physmap_entry(physmap_vector_el_t *entryp, void *data) {
  physmap_vector_el_t entry = *entryp;

  free(entry->descr.srcfile);

  if(entry->descr.type == block_e) {
    free(entry->descr.names.block.section_name);
    free(entry->descr.names.block.segment_name);
  } else if(entry->descr.type = object_e) {
    free(entry->descr.names.object.object_type);
    free(entry->descr.names.object.object_name);
  }
}

/******************************************************************************
 *
 * print_physmap_entry(entryp, NULL);
 * 
 * Debug function that prints the specified physmap_entry.
 * 
 *****************************************************************************/

static void
print_physmap_entry(physmap_vector_el_t *entryp, void *data) {
  physmap_vector_el_t entry = *entryp;

  if(entry->descr.type == block_e) {
    gf_say(VERBOSE_DEBUG,
	   "   Start=0x%llx Stop=0x%llx, section=%s, segment=%s\n",
	   entry->start, entry->stop, entry->descr.names.block.section_name,
	   entry->descr.names.block.segment_name);
  } else if(entry->descr.type == object_e) {
    gf_say(VERBOSE_DEBUG,
	   "   Start=0x%llx Stop=0x%llx, object_type=%s, name=%s\n",
	   entry->start, entry->stop, entry->descr.names.object.object_type,
	   entry->descr.names.object.object_name);
  } else {
    gf_say(VERBOSE_DEBUG,
	   "   Start=0x%llx Stop=0x%llx\n",
	   entry->start, entry->stop);
  }
}

/******************************************************************************
 *
 * check_entry_vs_vector(entry, physmap)
 * 
 * Check that the given entry doesn't collide with anything in the physmap.
 * 
 *****************************************************************************/


static void
check_entry_vs_vector(physmap_ent_t *entry, physmap_t *physmap) {

  if(entry->stop < entry->start) {
    gf_error(M_GOLDFINGERMISC,
	     "Trying to check a pa region where stop (0x%llx) < "
	     "start (0x%llx)!\n",
	     entry->stop, entry->start);
  }


  iterate_vector(physmap, (vector_elem_func_t) check_vector_elem, entry);
}


/******************************************************************************
 *
 * check_vector_elem(entryp, check)
 * 
 * Check that the entryp (element in the vector) doesn't collide with
 * the entry check.
 * 
 *****************************************************************************/


static void
check_vector_elem(physmap_vector_el_t *entryp, physmap_ent_t *check) {
  physmap_ent_t *entry = *entryp;
  
  if(! ((check->stop <= entry->start) || (check->start >= entry->stop)) ) {
    collision_error(check, entry);
  }
}

/******************************************************************************
 *
 * collision_error(check, old)
 * 
 * The two entries check and old collide.  Emit a descriptive error
 * message.
 * 
 *****************************************************************************/


static void
collision_error(physmap_ent_t *check, physmap_ent_t *old) {

  gf_error(M_PACOLLIDE,
	   "PA COLLISION:\n"
	   FLINE_f
	   "%s :   PA_start=0x%llx, PA_stop=0x%llx\n"
	   FLINE_f
	   "%s :   PA_start=0x%llx, PA_stop=0x%llx\n",
	   SRC_FLINE(&(old->descr)), get_ent_descr_string(old),
	   old->start, old->stop,
	   SRC_FLINE(&(check->descr)), get_ent_descr_string(check),
	   check->start, check->stop);

}

/******************************************************************************
 *
 * get_ent_descr_string(entry)
 * 
 * Returns a string (allocated by malloc, so it can be freed)
 * describing the physmap entry.  For informational purposes only
 * 
 *****************************************************************************/

#define STRBUF_SIZE 2048
static char *
get_ent_descr_string(physmap_ent_t *entry) {
  char *buf;

  buf = gf_malloc(STRBUF_SIZE);
  if(entry->descr.type == block_e) {
    snprintf(buf, STRBUF_SIZE, "SECTION '%s', segment '%s'",
	     entry->descr.names.block.section_name,
	     entry->descr.names.block.segment_name);
  } else if(entry->descr.type = object_e) {
    snprintf(buf, STRBUF_SIZE, "%s '%s'",
	     entry->descr.names.object.object_type,
	     entry->descr.names.object.object_name);
  } else {
    snprintf(buf, STRBUF_SIZE, "Unknown Source");
  }
  return buf;
}
