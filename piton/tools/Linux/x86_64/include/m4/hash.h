/* GNU m4 -- A simple macro processor
   Copyright (C) 2001, 2006-2007, 2010, 2013-2014, 2017 Free Software
   Foundation, Inc.
   Written by Gary V. Vaughan <gary@gnu.org>

   This file is part of GNU M4.

   GNU M4 is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   GNU M4 is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef M4_HASH_H
#define M4_HASH_H 1

#include <m4/system.h>

/* Must be 1 less than a power of 2 for the resize algorithm to
   be efficient.  */
#define M4_HASH_DEFAULT_SIZE    511

/* When the average number of values per bucket breaks this value
   the table will be grown to reduce the density accordingly.  */
#define M4_HASH_MAXIMUM_DENSITY 3.0

BEGIN_C_DECLS

typedef struct m4_hash m4_hash;

typedef size_t  m4_hash_hash_func (const void *key);
typedef int     m4_hash_cmp_func  (const void *key, const void *try);
typedef void *  m4_hash_copy_func (m4_hash *src, const void *key, void *value,
                                   m4_hash *dest);

extern m4_hash *m4_hash_new     (size_t size, m4_hash_hash_func *hash_func,
                                 m4_hash_cmp_func *cmp_func);
extern m4_hash *m4_hash_dup     (m4_hash *hash, m4_hash_copy_func *copy);
extern void     m4_hash_delete  (m4_hash *hash);
extern void     m4_hash_exit    (void);

extern size_t   m4_get_hash_length      (m4_hash *hash);

extern void **          m4_hash_lookup  (m4_hash *hash, const void *key);
extern void *           m4_hash_remove  (m4_hash *hash, const void *key);
extern const void *     m4_hash_insert  (m4_hash *hash, const void *key,
                                         void *value);



extern size_t   m4_hash_string_hash (const void *key);
extern int      m4_hash_string_cmp  (const void *key, const void *try);



typedef struct m4_hash_iterator m4_hash_iterator;
typedef void *  m4_hash_apply_func  (m4_hash *hash, const void *key,
                                     void *value, void *userdata);

extern void *   m4_hash_apply       (m4_hash *hash, m4_hash_apply_func *func,
                                     void *userdata);

extern const void *      m4_get_hash_iterator_key   (m4_hash_iterator *place);
extern void *            m4_get_hash_iterator_value (m4_hash_iterator *place);
extern m4_hash_iterator *m4_get_hash_iterator_next  (const m4_hash *hash,
                                                     m4_hash_iterator *place);
extern void              m4_free_hash_iterator      (const m4_hash *hash,
                                                     m4_hash_iterator *place);


END_C_DECLS

#endif /* !M4_HASH_H */
