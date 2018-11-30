// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: vector.c
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
 * vector.c
 *
 * Implement the object defined in vector.h.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "gf_error.h"

#include "vector.h"

static void grow_vector(vector_t *vector, int by);

/******************************************************************************
 *
 * init_vector(vector, vector_name, elem_size, elem_init_func,
 *           elem_destroy_func, elem_print_func).
 *
 *
 * Intialize the vector pointed to by vector.  The vector_t itself should
 * already be allocated.  This function will take care of the elements.
 * 
 *****************************************************************************/

void
init_vector(vector_t *vector, char *vector_name, size_t elem_size,
	  vector_elem_func_t elem_init_func, 
	  vector_elem_func_t elem_destroy_func, 
	  vector_elem_func_t elem_print_func)
{
  vector->elem_size = elem_size;
  vector->len = 0;
  vector->alloc_len = DEFAULT_ALLOC_LEN;
  vector->elements = gf_malloc(vector->alloc_len * vector->elem_size);

  if(!vector_name) {
    vector->name = strdup("<unnamed>");
  } else {
    vector->name = strdup(vector_name);
  }

  vector->init_elem_func    = elem_init_func;
  vector->destroy_elem_func = elem_destroy_func;
  vector->print_elem_func   = elem_print_func;

}

/******************************************************************************
 *
 * deallocate_vector(vector, data)
 *
 * Destroy the elements of vector.  Doesn't mess with the vector_t itself.
 *
 *****************************************************************************/

void
deallocate_vector(vector_t *vector, void *data) {
  int i;

  if(vector->destroy_elem_func) {
    for(i=0; i<vector->len; i++) {
      (*vector->destroy_elem_func)(VECTOR_ELEM_VOID_PTR(*vector, i), data);
    }
  }

  if(vector->elements) {
    free(vector->elements);
  }
  if(vector->name) {
    free(vector->name);
  }

  bzero(vector, sizeof(*vector));
}

/******************************************************************************
 *
 * preallocate_vector(vector, len)
 *
 * Resize the elements array to avoid calls to realloc.  Does not
 * initialize elements or change the logical size of the vector.
 *
 *****************************************************************************/


void
preallocate_vector(vector_t *vector, int len) {
  int by = len - vector->alloc_len;
  if(by > 0) {
    grow_vector(vector, by);
  }
}

/******************************************************************************
 *
 * add_vector_elements(vector, num)
 *
 * Add num elements to the vector, resizing vector if need be.  It
 * initializes the elements with the elem_init_func provided to
 * init_vector.  Returns the index of the first element added.
 *
 *****************************************************************************/


int
add_vector_elements(vector_t *vector, int num) {
  int shortage = vector->len + num - vector->alloc_len;
  int index;

  if(shortage > 0) { 
    grow_vector(vector, (vector->len + num + shortage) * 2);
  }

  if(vector->init_elem_func) {
    int i;
    for(i=0; i<num; i++) {
      void *vp = VECTOR_ELEM_VOID_PTR(*vector, i+vector->len);
      (*vector->init_elem_func)(vp, NULL);
    }
  }
  index = vector->len;
  vector->len += num;
  return index;
}


/******************************************************************************
 *
 * iterate_vector(vector, elemfunc, data)
 *
 * Apply elemfunc to each element in the vector with data as its 2nd
 * argument.
 *
 *****************************************************************************/

void
iterate_vector(vector_t *vector, vector_elem_func_t elemfunc, void *data) {
  int i;
  for(i=0; i<vector->len; i++) {
    (*elemfunc)(VECTOR_ELEM_VOID_PTR(*vector, i), data);
  }
}
void
iterate_vector2(vector_t *vector1, vector_t *vector2, vector_elem_func2_t elemfunc, void *data) {
  int i;
  for(i=0; i<vector1->len; i++) {
    (*elemfunc)(VECTOR_ELEM_VOID_PTR(*vector1, i), VECTOR_ELEM_VOID_PTR(*vector2, i), data);
  }
}

/******************************************************************************
 *
 * search_vector(vector, srchfunc, search_data)
 *
 * Same as iterate_vector, but if srchfunc returns true, return a
 * pointer to the vector element for which it returned true and stop
 * iterating.  Otherwise, return NULL.
 *
 *****************************************************************************/

void *
search_vector(vector_t *vector, vector_search_func_t srchfunc,
	      void *search_data) 
{
  int i;
  for(i=0; i<vector->len; i++) {
    void *vp = VECTOR_ELEM_VOID_PTR(*vector, i);
    if((*srchfunc)(vp, search_data)) {
      return vp;
    }
  }
  return NULL;
}

/******************************************************************************
 *
 * vector_elem_void_ptr_range_chec(vector, index)
 *
 * Return pointer to _index-th element of the vector as a void *.
 * Really slow, but does range checking.
 *
 *****************************************************************************/

void *
vector_elem_void_ptr_range_check(vector_t vector, int index) {
  if(index < 0) {
    gf_error(M_CODE,
	     "Range check failed for vector %s: index=%d < 0.\n",
	     vector.name, index);
  }
  if(index >= vector.len) {
    gf_error(M_CODE,
	     "Range check failed for vector %s: index=%d > len=%d.\n",
	     vector.name, index, vector.len);
  }

  if(!vector.elements) {
    gf_error(M_CODE,
	     "Can't access element %d of vector %s because vector is "
	     "unallocated!\n",
	     index, vector.name);    
  }
  if(!vector.elem_size) {
    gf_error(M_CODE,
	     "Can't access element %d of vector %s because elem_size "
	     "is 0!\n",
	     index, vector.name);    
  }

  return (void *)(((char *)vector.elements) + (index * vector.elem_size));
}


/******************************************************************************
 *
 * grow_vector(vector, by)
 *
 * Grow allocated length of vector by "by" elements.
 *
 *****************************************************************************/

static void
grow_vector(vector_t *vector, int by) {
  vector->alloc_len += by;
  if(!(vector->elements = realloc(vector->elements,
				vector->alloc_len * vector->elem_size)))
    {
      gf_error(M_MEMORY, "Cannot grow vector %s to %d elements\n",
	       vector->name, vector->alloc_len);
    }
}

