// Modified by Princeton University on March 18th, 2019
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: iob_main.cc
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
#include "pli_replacement.h"
#include "svdpi.h"

static struct pli_replacement *static_var = NULL;

void initialise_static_var() {
    static_var->sysMem = b_create();//create
    read_mem((char *)"mem.image", &(static_var->sysMem));//read memory
    for(int idx = 0; idx < 32; idx++)(static_var->last_addr)[idx] = 0;
}

#ifdef __cplusplus
extern "C" {
#endif
vluint64_t get_eight_byte(char* data, KeyType key)
{
  vluint64_t  val;
  int mask  = key & 0x38;
  val       = 0;

  for(int i = 0; i < 8; i++){
    val <<= 8;
    val  |= data[mask+i] & 0xff;
  }
  return val;
}
#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
extern "C" {
#endif
void write_eight_byte(char* data, KeyType key, vluint64_t val)
{
  unsigned first = val >> 32;
  unsigned second = val & 0xffff0000;
  //io_printf("iob_main.cc writing 0x%x%x to 0x%x\n", first, second, key);
  int mask  = key & 0x38;

  for(int i = 7; i >=0; i--){
    data[mask+i] = val & 0xff;
    val >>= 8;
  }
  // val = data[mask+i]
  // first = val >> 32;
  // second = val & 0xffff0000;
  // io_printf("iob_main.cc wrote 0x%x%x\n", val, key);
  return;
}
#ifdef __cplusplus
}
#endif

// get 64b of data from memory
#ifdef __cplusplus
extern "C" {
#endif
vluint64_t read_64b_call(vluint64_t key_var)
{
  if (static_var == NULL) {
    static_var = (struct pli_replacement*) malloc(sizeof(struct pli_replacement));
    initialise_static_var();
  }
    KeyType key = key_var;
    KeyType   mask_addr;
    mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);
    
    if((static_var->last_addr)[0] == mask_addr){
        return get_eight_byte((static_var->data)[0]->data, key);
    }
    else {
        // trin
        b_tree_atom_ptr data_ptr = b_Find(&(static_var->sysMem), &mask_addr);
        if(data_ptr){
            (static_var->data)[0]      = data_ptr;
            (static_var->last_addr)[0] = mask_addr;

            return get_eight_byte((static_var->data)[0]->data, key);
        }
        else{
            // io_printf("iob_main.cc: cache line not found at address 0x%llx\n", mask_addr << 6);
            // io_printf("iob_main.cc1: key was 0x%llx\n", key);
            // io_printf("iob_main.cc1: high was 0x%x\n", high);
            // io_printf("iob_main.cc1: low was 0x%x\n", low);
            return 0;
        }
    }
}
#ifdef __cplusplus
}
#endif

// get 64b of data from memory
#ifdef __cplusplus
extern "C" {
#endif
void write_64b_call(vluint64_t key_var, vluint64_t val)
{
  if (static_var == NULL) {
    static_var = (struct pli_replacement*) malloc(sizeof(struct pli_replacement));
    initialise_static_var();
  }
  KeyType key = key_var;
  KeyType   mask_addr;
  mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);


  if((static_var->last_addr)[0] == mask_addr){
    //io_printf("iob_main.cc: invaling cache\n");
    // invalidate cached data
    (static_var->last_addr)[0] = 0;
  }

  b_tree_atom_ptr data_ptr = b_Find(&(static_var->sysMem), &mask_addr);
  if(data_ptr){
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);
    (static_var->data)[0]      = data_ptr;
    (static_var->last_addr)[0] = mask_addr;
    write_eight_byte((static_var->data)[0]->data, key, val);
    return;
  }
  else{
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);

    b_tree_atom_ptr atom = (b_tree_atom_ptr)malloc(sizeof(struct b_tree_atom));
    for (int i = 0; i < ATOM_DATA_SIZE; i++)
      atom->data[i] = 0; // clear data

    write_eight_byte(atom->data, key, val);
    atom->key        = mask_addr;
    atom->size       = 64;

    b_insert(&(static_var->sysMem), &atom);
    return;
  }
}
#ifdef __cplusplus
}
#endif
