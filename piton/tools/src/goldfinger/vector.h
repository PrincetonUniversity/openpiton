// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: vector.h
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
#ifndef _VECTOR_H_
#define _VECTOR_H_

/*
 * vector.h
 *
 * Generic vector object, used to handle memory gunk for vectors of
 * objects.  The vector manages memory for its elements, and it makes
 * no assumtions about what type of objects they are, except that they
 * can be shallow-copied.  Like a C++ STL vector, this vector is
 * stored in an array.  The array is resized with realloc when needed,
 * so it is appropriate for vectors that are added to at the end.  It
 * is not appropriate for vectors where adds/deletes can happen from
 * the beginning or middle.
 *
 * If the symbol RANGE_CHECK is defined during compilation, the vector
 * will perform range checks when it is indexed.  This slows it down
 * substantially, though, so it should only be used for debugging.
 */

#include <sys/types.h>

/* This type of function should be used for anything you want the vector
   to be able to call on all elements (i.e., an argument to
   iterate_vector.  Similarly, the element init, destroy, and print
   functions need to be of this type. 

   First argument is a pointer to an element.  Second is user-defined.

*/
typedef void (*vector_elem_func_t)(void *, void *);
typedef void (*vector_elem_func2_t)(void *, void *, void *);

/* Function should return true for a match and false otherwise.  First
   arg is a pointer to an element, and the second is a pointer to what
   we're trying to search for */
typedef int  (*vector_search_func_t)(void *, void *);



typedef struct vector_s {
  void * elements;
  int    len;                           /* logical number of elems in vector */
  int    alloc_len;                     /* number of allocated elems */

  size_t elem_size;                     /* size of an element in bytes */

  vector_elem_func_t init_elem_func;    /* Function to init an elem */
  vector_elem_func_t destroy_elem_func; /* Function to destroy an elem */
  vector_elem_func_t print_elem_func;   /* Function to print an elem */

  char *name;                           /* name of vector for
					   debugging puprposes */
} vector_t;


# define VECTOR_LEN(_vector)  ((_vector).len)

#define DEFAULT_ALLOC_LEN 40


/* Intialize the vector pointed to by vector.  The vector_t itself should
   already be allocated.  This function will take care of the
   elements */
void init_vector(vector_t *vector, char *vector_name, size_t elem_size,
	       vector_elem_func_t elem_init_func,
	       vector_elem_func_t elem_destroy_func,
	       vector_elem_func_t elem_print_func);

/* Destroy the elements of vector.  Doesn't mess with the vector_t itself. */
void deallocate_vector(vector_t *vector, void *data);

/* Resize the elements array to avoid calls to realloc.  Does not
   initialize elements or change the logical size of the vector. */
void preallocate_vector(vector_t *vector, int len);

/* Add num elements to the vector, resizing vector if need be.  It
   initializes the elements with the elem_init_func provided to
   init_vector.  Returns the index of the first element added. */
int add_vector_elements(vector_t *vector, int num);

/* Apply elemfunc to each element in the vector with data as its 2nd
   argument */
void iterate_vector(vector_t *vector, vector_elem_func_t elemfunc, void *data);
void iterate_vector2(vector_t *vector1, vector_t *vector2, vector_elem_func2_t elemfunc, void *data);

/* Same as iterate_vector, but if srchfunc returns true, return a
   pointer to the vector element for which it returned true and stop
   iterating.  Otherwise, return NULL. */

void *search_vector(vector_t *vector, vector_search_func_t srchfunc, 
		  void *search_data);

/* Shortcut */
#define print_vector(_vectorp)					\
iterate_vector((_vectorp), (_vectorp)->print_elem_func, NULL)


/* Accessors.  If RANGE_CHECK is defined, they're really slow, but you
   can't access out-of-range entries */

#ifdef RANGE_CHECK

/* Return pointer to _index-th element of the vector as a void *. */
# define VECTOR_ELEM_VOID_PTR(_vector, _index)		\
vector_elem_void_ptr_range_check(*(_vector), _index)

/* Return pointer to _index-th element of the vector as a pointer to an
   element.  Requires the type to do this. */
# define VECTOR_ELM_PTR(_vector, _index, _elemtype)		\
((_elemtype *)(VECTOR_ELEM_VOID_PTR((_vector), (_index))))

/* Returns the _index-th element of the vector as an lvalue.
   Requires the type to do this. */
# define VECTOR_ELEM(_vector, _index, _elemtype)	\
(*(VECTOR_ELEM_PTR((_vector),(_index),(_elemtype))))

void *vector_elem_void_ptr_range_check(vector_t vector, int index);

#else

/* Return pointer to _index-th element of the vector as a void *. */
# define VECTOR_ELEM_VOID_PTR(_vector, _index)				\
((void *)((char*)((_vector).elements) + ((_index) * (_vector).elem_size)))

/* Return pointer to _index-th element of the vector as a pointer to an
   element.  Requires the type to do this. */
# define VECTOR_ELEM_PTR(_vector, _index, _elemtype)	\
(((_elemtype *) ((_vector).elements)) + (_index))

/* Returns the _index-th element of the vector as an lvalue.
   Requires the type to do this. */
# define VECTOR_ELEM(_vector, _index, _elemtype)	\
(((_elemtype *) ((_vector).elements))[(_index)])

#endif

#endif
