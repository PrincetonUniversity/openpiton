// Modified by Princeton University on June 9th, 2015
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
//------------------------------------------------------------------------------
//
// Program File: @(#)main.cc
// Version Date: 08/29/02
//
// Date:         5/14/2003
//
//------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <inttypes.h>
#include "global.h"
#include "bw_lib.h"
#include "list.h"
#include "cpx.h"
#include "pcx.h"
#include "b_ary.h"
#include "iob.h"

// Routines called by the verilog code.
extern "C" void iob_cdrive_call();
extern "C" void init_jbus_model_call();

extern "C" void read_64b_call();
extern "C" void write_64b_call();

extern "C" void init_oram_call();

//define global variable
//This memory is common for all devices.
static b_tree_node_ptr sysMem;//b_try for memory
static iob iob_inst; //("diag.ev");
//file used for oram init
static FILE *oram_fp = NULL;

//define dummy structure for static variable.
typedef struct static_for_pli{
  b_tree_atom_ptr data[32];
  KeyType      last_addr[32];
};
static static_for_pli pli_var;
/*------------------------------------------
initialize all variable to be used in this env.
-------------------------------------------*/
void init_jbus_model_call(){
  char  *str;
  int   idx;
  int   oram;
  set_random();

  iob_inst.manual_init("diag.ev");

  str       = tf_getcstringp(1);  // a get file name.
  oram      = tf_getp(2); //whether to use oram or not
  sysMem              = b_create();//create
  if (!oram)
          read_mem(str, &sysMem);//read memory
  for(idx = 0; idx < 32; idx++)pli_var.last_addr[idx] = oram ? -1 : 0;
}
/*------------------------------------------
handle the cmp clock domain jobs.
-------------------------------------------*/
void iob_cdrive_call()
{
  iob_inst.do_iob();//do iob operations.
  iob_inst.drive_cpx(CPX_LOC);
  iob_inst.drive_req(CPX_REQ);
}
/*------------------------------------------
It return 8 junk bytes to caller.
-------------------------------------------*/
long long get_eight_byte(char* data, KeyType key)
{
  long long  val;
  int mask  = key & 0x38;
  val       = 0;

  for(int i = 0; i < 8; i++){
    val <<= 8;
    val  |= data[mask+i] & 0xff;
  }
  return val;
}

void write_eight_byte(char* data, KeyType key, unsigned long long val)
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

// get 64b of data from memory
void read_64b_call()
{
  KeyType key;
  int low, high;
  low  = tf_getlongp(&high, 1);
  key   = high;
  key <<= 32;
  key  |= (unsigned)low;
  b_tree_atom_ptr data;
  KeyType   mask_addr;
  mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);

  if(pli_var.last_addr[0] == mask_addr){
      int low, high;
      unsigned long long data = get_eight_byte(pli_var.data[0]->data, key);
      low = data & 0xffffffff;
      high = (data >> 32) & 0xffffffff;
      tf_putlongp(2, low, high);
    return;
  }
  else {
    // trin
    data = b_Find(&sysMem, &mask_addr);
    if(data){
      pli_var.data[0]      = data;
      pli_var.last_addr[0] = mask_addr;

      int low, high;
      unsigned long long data = get_eight_byte(pli_var.data[0]->data, key);
      low = data & 0xffffffff;
      high = (data >> 32) & 0xffffffff;
      tf_putlongp(2, low, high);
      return;
    }
    else{
      // io_printf("iob_main.cc: cache line not found at address 0x%llx\n", mask_addr << 6);
      // io_printf("iob_main.cc1: key was 0x%llx\n", key);
      // io_printf("iob_main.cc1: high was 0x%x\n", high);
      // io_printf("iob_main.cc1: low was 0x%x\n", low);
      tf_putlongp(2, 0, 0);
      return;
    }
  }
}

// get 64b of data from memory
void write_64b_call()
{
  KeyType key;
  int low, high;
  low  = tf_getlongp(&high, 1);
  key   = high;
  key <<= 32;
  key  |= (unsigned)low;
  unsigned long long val;
  low  = tf_getlongp(&high, 2);
  val   = (unsigned)high;
  val <<= 32;
  val  |= (unsigned)low;
  b_tree_atom_ptr data;
  KeyType   mask_addr;
  mask_addr = (((unsigned long long)key & 0x000000ffffffffffULL) >> 6);


  if(pli_var.last_addr[0] == mask_addr){
    //io_printf("iob_main.cc: invaling cache\n");
    // invalidate cached data
    pli_var.last_addr[0] = 0;
  }

  data = b_Find(&sysMem, &mask_addr);
  if(data){
    // io_printf("iob_main.cc : writing %x_%x\n", high, low);
    // io_printf("iob_main.cc : writing %x_%x\n", val >> 32, val & 0x0000ffff);
    pli_var.data[0]      = data;
    pli_var.last_addr[0] = mask_addr;
    write_eight_byte(pli_var.data[0]->data, key, val);
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

    b_insert(&sysMem, &atom);
    return;
  }
}

/*------------------------------------------
repeatedly call this to get the queue
pli argument 1 : filename
pli argument 2 : done (output)
pli argument 3 : addr (output)
pli argument 4 : val0 (output)
pli argument 5 : val1 (output)
pli argument 6 : val2 (output)
pli argument 7 : val3 (output)
pli argument 8 : val4 (output)
pli argument 9 : val5 (output)
pli argument 10: val6 (output)
pli argument 11: val7 (output)
-------------------------------------------*/
void init_oram_call(){
  char  *fn;
  int   idx;

  size_t len = 0;
  size_t read;
  char *line = NULL;

  char buf[9][17];

  unsigned long long addr;
  unsigned long long val[8];

  int i;


  fn = tf_getcstringp(1);  // a get file name.
  if (oram_fp == NULL)
          oram_fp = fopen(fn, "r");

  if (oram_fp == NULL) {
          perror("open()");
          exit(1);
  }

  read = getline(&line, &len, oram_fp);

  if (read == -1) {
          tf_putp(2, 1); //done = 1
  } else {
          tf_putp(2, 0); //done = 0
          sscanf(line, "%s %s %s %s %s %s %s %s %s\n",
                 &buf[0], &buf[1], &buf[2], &buf[3], &buf[4],
                 &buf[5], &buf[6], &buf[7], &buf[8]);
          addr = strtoul(buf[0], NULL, 16);
          //io_printf("oram init. addr: %x\n", addr);
          tf_putlongp(3, addr & 0xffffffff, (addr >> 32) & 0xffffffff);
          for (i = 1; i < 9; i++)
                  val[i-1] = strtoul(buf[i], NULL, 16);
          for (i = 4; i < 4 + 8; i++)
                  tf_putlongp(i, val[i-4] & 0xffffffff,
                              (val[i-4] >> 32) & 0xffffffff);
  }
  free(line);
}
