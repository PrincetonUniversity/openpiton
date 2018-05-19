// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: threaded_pli_interface.cc
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
/***************************************************************************
****************************************************************************
***
***  Program File:  @(#)threaded_pli_interface.cc
***  
***  Version Date:  04/23/99
***
****************************************************************************
****************************************************************************/

#include<stdio.h>
#include<string.h>
#include <semaphore.h>
#include <thread.h>
#include "veriuser.h"
#include "tf_proto_cc.h"
#include "threaded_pli_interface.h"
extern void *jbus_monitor(void *arg); //jbus_cycle_info info);
extern void *jbus_checker(void *arg); //jbus_cycle_info info);
int thread_exit_status = 0;
class global_sim_info sim_info;
/*{{{  interface sigs*/
/*
input [5:0] jbus_j_req;
input [127:0] jbus_j_ad;
input [7:0] jbus_j_adtype;
input [3:0] jbus_j_adp;
input [2:0] jbus_j_pack0;
input [2:0] jbus_j_pack1;
input [2:0] jbus_j_pack2;
input [2:0] jbus_j_pack3;
input [2:0] jbus_j_pack4;
input [2:0] jbus_j_pack5;
input jbus_j_rst;
input jbus_j_clk;
*/
/*}}}  */
/*{{{  misc global functions*/
int get_plus_arg(int check, char *arg){
  return 1;
}
int get_time (int x){
  return tf_gettime();
}

void global_sim_info::set_inst_name(char *name){
  strncpy(inst_name, name, MAX_INST_NAME_SIZE);
}

char *global_sim_info::get_inst_name(void){
  return inst_name;
}

void global_sim_info::set_sim_time(unsigned long long time){
  sim_time = time;
}
void global_sim_info::set_sim_time(unsigned int time){
  sim_time = (unsigned long long) time;
}

unsigned long long global_sim_info::get_long_sim_time(void){
  return sim_time;
}

unsigned int global_sim_info::get_sim_time(void){
  return (int) sim_time;
}
void global_sim_info::set_exit(void){
  thread_exit_status = 1;
}
int global_sim_info::get_exit(void){

   if (thread_exit_status)
     tf_dofinish();
   return thread_exit_status;
}
/*}}}  */

/*{{{  get_verilog_arg stuff*/
void get_verilog_arg(BIT *vec, BIT *mask, int size, int arg_num){
  struct t_tfexprinfo expr;
  int i, a, b;
  a = b = 0;
  tf_exprinfo(arg_num, &expr);
  if (expr.expr_type == tf_nullparam)
        io_printf("Error - null paramter arg %d encountered\n", arg_num);
  else{
    for (i=0; i<size; i++){
      if ((i % 32) == 0){
        a = expr.expr_value_p[i/32].avalbits;
        b = expr.expr_value_p[i/32].bvalbits;
      }
        vec[i] = (a & 1);
        mask[i] = (a & 1);
      a = a >> 1;
      b = b >> 1;
    }
  }
}
void get_verilog_arg(BIT *value, int arg_num){
  *value = tf_getp(arg_num);
}
void get_verilog_arg(BIT64 *value, BIT64 *mask, int arg_num){
  //unsigned long long int hi,lo;
  struct t_tfexprinfo expr;
  int hi, lo;
  tf_exprinfo(arg_num, &expr);
  *value = 0;
  if (expr.expr_type == tf_nullparam)
        io_printf("Error - null paramter arg %d encountered\n", arg_num);
  else if (expr.expr_ngroups < 2){
        io_printf("Error - argument %d is too small to convert to BIT64\n", arg_num);
  }else{
      *value = (long long) (unsigned)expr.expr_value_p[0].avalbits |
             (((long long) (unsigned)expr.expr_value_p[1].avalbits) << 32);
      *mask = (long long) (unsigned)expr.expr_value_p[0].bvalbits |
             (((long long) (unsigned)expr.expr_value_p[1].bvalbits) << 32);

  }
}
void get_verilog_arg(BITS *value, int arg_num){
  *value = tf_getp(arg_num);
}
/*}}}  */
/*{{{  access from verilog side*/
void jbus_cycle_info::reset_change(void){
  get_verilog_arg(&reset, 1);
}
jbus_cycle_info::jbus_cycle_info(void) {
  inited = 0;
  return_status = 0;
  t_state = NULL;
}

int jbus_cycle_info::init(thread_t **id){
  thread_state *th;

  if (!inited){
    th = new class thread_state;

    inited = 1;
    sem_init(&th->sem_ack, 0, 0);
    sem_init(&th->sem, 0, 0);
    *id = &th->thread_id;
    th->next = NULL;
    th->parent = this;
    t_state = th;
    return 1;
  }else
    return 0;
}
void jbus_cycle_info::wait_to_exit(int status) {
  return_status = status;
  while (1) wait_next_cycle();
}
int jbus_cycle_info::new_cycle(void) {
      int i;
      thread_state *th;

      int arg_num=1;
      //BIT req[6];
      //BIT64 ad_hi, ad_lo;
      //BITS ad_type;
      //BIT  adp;
      //BITS packs[6];
      //if (reset == 1){
        get_verilog_arg(&req, arg_num++);
        //req_valid = 0;
        get_verilog_arg(&ad.hi, &ad_valid.hi, arg_num++);
        //ad_valid.hi = 0;
        get_verilog_arg(&ad.lo, &ad_valid.lo, arg_num++);
        //ad_valid.lo = 0;
        get_verilog_arg(&ad_type, arg_num++);
        ad_type_valid = 0;
        get_verilog_arg(&adp, arg_num++);
        adp_valid = 0;
        for (i=0; i<6; i++){
          get_verilog_arg(&pack[i], arg_num++);
          pack_valid[i] = 0;
        }
        get_verilog_arg(&par, arg_num++);
        par_valid = 0;

        sim_info.set_inst_name(tf_mipname());
        sim_info.set_sim_time((unsigned long long)tf_gettime());

        th = t_state;
        while (th!=NULL){
          sem_post(&th->sem);
          th->new_thread = 0;
          th = th->next;
        }
        th = t_state;
        while (th!=NULL){
          if (!th->new_thread)
            sem_wait(&th->sem_ack);
          th = th->next;
        }
      //}
      return return_status;
}
void jbus_cycle_info::print_raw(void){

  int i;
  printf("jbus_mon : ");
  printf("%d%d%d%d%d%d",(req >> 5) & 1, (req >> 4) & 1, (req >> 3) & 1, (req >> 2) & 1, (req >> 1) & 1, req & 1);
  //printf(" %016llx ", (unsigned long long)0x12345678abcdef0);
  printf(" %016llx ", ad.hi);
  printf(" %016llx ", ad.lo);
  printf("%02x ", ad_type);
  for (i=0; i<6; i++)
    printf("%d%d%d ", (pack[i] >> 2) & 1, (pack[i] >> 1) & 1, pack[i] & 1);
  printf("\n");
}
/*}}}  */

/*{{{  access from C side*/
char *port_names[]= {"j_req", "j_pack5", "j_pack4", "j_pack3", "j_pack2", "j_pack1", "j_pack0",
               "j_adp", "j_adtype", "j_ad_hi", "j_ad_lo", "j_rst", "j_par", "j_ad"};
char *jbus_cycle_info::intf_sig_name(enum port_ids id){
  if (id < INVALID_PORT_ID)
    return port_names[id];
  else
    return "????";
}

void jbus_cycle_info::fork(void *(fn)(void *)){
  thread_state *th, *ptr;

  th = new class thread_state;
  th->parent = this;
  sem_init(&th->sem_ack, 0, 0);
  sem_init(&th->sem, 0, 0);
  th->next = NULL;
  thr_create(0, 0, (void*(*)(void*))fn, th,
                   THR_SUSPENDED, &th->thread_id);
  thr_continue(th->thread_id);
  ptr = t_state;
  while (ptr->next != NULL)
    ptr = ptr->next;
  ptr->next = th;

}

/*{{{  wait_next_cycle*/
void thread_state::wait_next_cycle(void) {
  if (!first_cycle)
    sem_post(&sem_ack);
  else
    first_cycle = 0;
  if (thread_exit_status)
    thr_exit(NULL);

  sem_wait(&sem);
}
/*}}}  */
/*{{{  wait_next_cycle*/
void jbus_cycle_info::wait_next_cycle(void) {
  if (!t_state->first_cycle)
    sem_post(&t_state->sem_ack);
  else
    t_state->first_cycle = 0;
  if (thread_exit_status)
    thr_exit(NULL);
  sem_wait(&t_state->sem);
}
/*}}}  */
/*{{{  wait_next_cycle*/
void thread_state::wait_next_cycle(char *unit, enum port_ids id, int top_bit, int bottom_bit, BIT64 expected) {
  BIT64 res, mask;
  char buff[64], *ptr;
  char buff_e[64], *ptr_e;
  if (!first_cycle)
    sem_post(&sem_ack);
  else
    first_cycle = 0;
  if (thread_exit_status)
    thr_exit(NULL);
  sem_wait(&sem);
  if ((res = parent->intf_sig(id, top_bit, bottom_bit)) != expected){
    mask = 1 << (top_bit - bottom_bit);
    ptr = buff;
    ptr_e = buff_e;
    while (mask != 0){
      if (res & mask)
        *ptr = '1';
      else
        *ptr = '0';
      if (expected & mask)
        *ptr_e = '1';
      else
        *ptr_e = '0';
      mask = mask >> 1;
      ptr++;
      ptr_e++;
    }
    *ptr = '\0';
    *ptr_e = '\0';
    dispmon(unit, DISPMON_TAG_WARNING, "signal check failed %s[%d:%d]=%s, expected %s\n", port_names[id], top_bit, bottom_bit, buff, buff_e);
  }

}
/*}}}  */
/*{{{  wait_next_cycle*/
void jbus_cycle_info::wait_next_cycle(char *unit, enum port_ids id, int top_bit, int bottom_bit, BIT64 expected) {
  BIT64 res, mask;
  char buff[64], *ptr;
  char buff_e[64], *ptr_e;
  if (!t_state->first_cycle)
    sem_post(&t_state->sem_ack);
  else
    t_state->first_cycle = 0;
  if (thread_exit_status)
    thr_exit(NULL);
  sem_wait(&t_state->sem);
  if ((res = intf_sig(id, top_bit, bottom_bit)) != expected){
    mask = 1 << (top_bit - bottom_bit);
    ptr = buff;
    ptr_e = buff_e;
    while (mask != 0){
      if (res & mask)
        *ptr = '1';
      else
        *ptr = '0';
      if (expected & mask)
        *ptr_e = '1';
      else
        *ptr_e = '0';
      mask = mask >> 1;
      ptr++;
      ptr_e++;
    }
    *ptr = '\0';
    *ptr_e = '\0';
    dispmon(unit, DISPMON_TAG_WARNING, "signal check failed %s[%d:%d]=%s, expected %s\n", port_names[id], top_bit, bottom_bit, buff, buff_e);
  }

}
/*}}}  */
/*{{{  get_bits_and_valid*/
BITS jbus_cycle_info::get_bits_and_valid(enum port_ids id, BITS *val, BITS *mask){

  BITS tmp;
  if (mask == NULL)
    mask = &tmp;
  switch (id){
    case j_pack5:
      *val = pack[5];
      *mask = pack_valid[5];
      break;
    case j_pack4:
      *val = pack[4];
      *mask = pack_valid[4];
      break;
    case j_pack3:
      *val = pack[3];
      *mask = pack_valid[3];
      break;
    case j_pack2:
      *val = pack[2];
      *mask = pack_valid[2];
      break;
    case j_pack1:
      *val = pack[1];
      *mask = pack_valid[1];
      break;
    case j_pack0:
      *val = pack[0];
      *mask = pack_valid[0];
      break;
    case j_req:
      *val = req;
      *mask = req_valid;
      break;
    case j_adtype:
      *val = ad_type;
      *mask = ad_type_valid;
      break;
    case j_adp:
      *val = (BITS)adp;
      *mask = (BITS)adp_valid;
      break;
    case j_par:
      *val = (BITS)par;
      *mask = (BITS)par_valid;
      break;
    case j_ad_lo:
      *val = (BITS)ad.lo;
      *mask = (BITS)ad_valid.lo;
      //printf("Warning - bit truncation has occured when retrieving ad bus value\n");
      break;
    case j_ad_hi:
      *val = (BITS)ad.hi;
      *mask = (BITS)ad_valid.hi;
      //printf("Warning - bit truncation has occured when retrieving ad bus value\n");
      break;
    case j_ad:
      printf("Warning - bit truncation has occured when retrieving ad bus value\n");
      *val = 0;
      break;
    case j_rst:
      *val = reset;
      *mask = reset_valid;
      break;
    default:
      printf("Internal error - unknown signal identifier (%d) used to retrieve data\n", id);
      break;
  }
  return *val;
}
/*}}}  */
/*{{{  get_bits_and_valid*/
BIT64 jbus_cycle_info::get_bits_and_valid(enum port_ids id, BIT64 *val, BIT64 *mask){

  BIT64 tmp;
  if (mask == NULL)
    mask = &tmp;
  switch (id){
    case j_pack5:
      *val = pack[5];
      *mask = pack_valid[5];
      break;
    case j_pack4:
      *val = pack[4];
      *mask = pack_valid[4];
      break;
    case j_pack3:
      *val = pack[3];
      *mask = pack_valid[3];
      break;
    case j_pack2:
      *val = pack[2];
      *mask = pack_valid[2];
      break;
    case j_pack1:
      *val = pack[1];
      *mask = pack_valid[1];
      break;
    case j_pack0:
      *val = pack[0];
      *mask = pack_valid[0];
      break;
    case j_req:
      *val = req;
      *mask = req_valid;
      break;
    case j_adtype:
      *val = ad_type;
      *mask = ad_type_valid;
      break;
    case j_adp:
      *val = (BIT64)adp;
      *mask = (BIT64)adp_valid;
      break;
    case j_par:
      *val = (BITS)par;
      *mask = (BITS)par_valid;
      break;
    case j_ad_lo:
      *val = ad.lo;
      *mask = ad_valid.lo;
      //printf("Warning - bit truncation has occured when retrieving ad bus value\n");
      break;
    case j_ad_hi:
      *val = ad.hi;
      *mask = ad_valid.hi;
      //printf("Warning - bit truncation has occured when retrieving ad bus value\n");
      break;
    case j_ad:
      printf("Warning - bit truncation has occured when retrieving ad bus value\n");
      *val = 0;
      break;
    case j_rst:
      *val = reset;
      *mask = reset_valid;
      break;
    default:
      printf("Internal error - unknown signal identifier (%d) used to retrieve data\n", id);
      break;
  }
  return *val;
}
/*}}}  */
/*{{{  get_bits_and_valid*/
BIT128 jbus_cycle_info::get_bits_and_valid(enum port_ids id, BIT128 *val, BIT128 *mask){

  BIT128 tmp;
  if (mask == NULL)
    mask = &tmp;
  switch (id){
    case j_pack5:
    case j_pack4:
    case j_pack3:
    case j_pack2:
    case j_pack1:
    case j_pack0:
    case j_req:
    case j_par:
    case j_adtype:
    case j_adp:
      printf("Internal error - signal identifier (%d) is wrong signal type for 128bit conversion\n", id);
      break;
    case j_ad:
      *val = ad;
      *mask = ad_valid;
      break;
    default:
      printf("Internal error - unknown signal identifier (%d) used to retrieve data\n", id);
      break;
  }
  return *val;
}
/*}}}  */
/*{{{  intf_sig stuff*/
BIT128 jbus_cycle_info::intf_sig_l(enum port_ids id){
  BIT128 val;
  return get_bits_and_valid(id, &val, NULL);
}

BIT64 jbus_cycle_info::intf_sig(enum port_ids id){
  BIT64 val;
  return get_bits_and_valid(id, &val, NULL);

}
BIT64 jbus_cycle_info::checked_intf_sig(enum port_ids id, int invalid){
  BITS val, mask;
  get_bits_and_valid(id, &val, &mask);
  if (mask != 0){
    printf("Error - invalid bits bus - returning zero\n");
    return 0;
  }
  return val;
}
BIT64 jbus_cycle_info::checked_intf_sig(enum port_ids id, int top_bit, int bottom_bit){
  BITS val, valid, bit_mask;
  BIT64 val64, valtop64, bit_mask64, bit_masktop64;
  BIT64 valid64, validtop64;
  BIT128 val128, valid128;
  if (sizes[id] > SIZEOF_BITS){
    if (sizes[id] > SIZEOF_BIT64){
      /*{{{  allow bits of a 128 bit value to be extracted - error if segement > 64*/
      get_bits_and_valid(id, &val128, &valid128);
      if ((top_bit - bottom_bit) > 64)
        printf("Warning - bit truncation has occured when retrieving bus value\n");
      if (top_bit > 63){
        if (top_bit >= 127)
          bit_masktop64 = (((BIT64)1) << (top_bit-63)) - 1;
        else
          bit_masktop64 = 0xffffffffffffffff;
        bit_mask64 = 0xffffffffffffffff;
      }else{
        bit_masktop64 = 0;
        if (top_bit >= 63)
          bit_mask64 = 0xffffffffffffffff;
        else
          bit_mask64 = (((BIT64)1) << (top_bit + 1)) - 1;
      }
      val64 = (val128.lo & bit_mask64) >> bottom_bit;
      valtop64 = (val128.hi & bit_masktop64) >> bottom_bit-64;
      valid64 = (valid128.lo & bit_mask64) >> bottom_bit;
      validtop64 = (valid128.hi & bit_masktop64) >> bottom_bit-64;
      if (validtop64 != 0 || valid64 != 0)
        printf("Warning - not all bits requested are valid - invalid bit mask %016llx%016llx\n", validtop64, valid64);
      return valtop64 | val64;
      /*}}}  */
    }else{
      get_bits_and_valid(id, &val64, &valid64);
      if (top_bit >= SIZEOF_BIT64 - 1)
        bit_mask64 = -1;
      else
        bit_mask64 = (((BIT64) 1) << (top_bit + 1)) - 1;
      val64 = (val64 & bit_mask64) >> bottom_bit;
      valid64 = (valid64 & bit_mask64) >> bottom_bit;
      if (valid64 != 0)
        printf("Warning - not all bits requested are valid - invalid bit mask %016llx\n", valid64);
      return val64;
    }
  }else{
    get_bits_and_valid(id, &val, &valid);
    if (top_bit >= SIZEOF_BITS - 1)
      bit_mask = -1;
    else
      bit_mask = (((BITS) 1) << (top_bit + 1)) - 1;
    val = (val & bit_mask) >> bottom_bit;
    valid = (valid & bit_mask) >> bottom_bit;
    if (valid != 0)
      printf("Warning - not all bits requested are valid - invalid bit mask %016llx\n", valid64);
    return val;
  }
}

BIT64 jbus_cycle_info::intf_sig(enum port_ids id, int top_bit){
  BITS val, bit_mask;
  BIT64 val64, bit_mask64;
  BIT128 val128;
  if (sizes[id] > SIZEOF_BITS){
    if (sizes[id] > SIZEOF_BIT64){
      /*{{{  allow bits of a 128 bit value to be extracted - error if segment > 64*/
      get_bits_and_valid(id, &val128, NULL);
      if (top_bit > 64)
        printf("Warning - bit truncation has occured when retrieving bus value\n");
      if (top_bit >= 63)
        bit_mask64 = 0xffffffffffffffff;
      else
        bit_mask64 = (((BIT64)1) << (top_bit + 1)) - 1;
      val64 = (val128.lo & bit_mask64);
      return val64;
      /*}}}  */
    }else{
      if (top_bit >= SIZEOF_BIT64 - 1)
        bit_mask64 = -1;
      else
        bit_mask64 = (((BIT64) 1) << (top_bit + 1)) - 1;
      get_bits_and_valid(id, &val64, NULL);
      return (val64 & bit_mask64);
    }
  }else{
    if (top_bit >= SIZEOF_BITS - 1)
      bit_mask = -1;
    else
      bit_mask = (((BITS) 1) << (top_bit + 1)) - 1;
    get_bits_and_valid(id, &val, NULL);
    return (val & bit_mask);
  }
}
BIT64 jbus_cycle_info::intf_sig(enum port_ids id, int top_bit, int bottom_bit){
  BITS val, bit_mask;
  BIT64 val64, valtop64, bit_mask64, bit_masktop64;
  BIT128 val128;
  if (sizes[id] > SIZEOF_BITS){
    if (sizes[id] > SIZEOF_BIT64){
      /*{{{  allow bits of a 128 bit value to be extracted - error if segement > 64*/
      get_bits_and_valid(id, &val128, NULL);
      if ((top_bit - bottom_bit) > 64)
        printf("Warning - bit truncation has occured when retrieving bus value\n");
      if (top_bit > 63){
        if (top_bit >= 127)
          bit_masktop64 = 0xffffffffffffffff;
        else
          bit_masktop64 = (((BIT64)1) << (top_bit-63)) - 1;
      }else{
        bit_masktop64 = 0;
      }
      if (bottom_bit > 63){
       // bottom_bit = bottom_bit - 64;
        bit_mask64 = 0;
      }else{
        if (top_bit >= 63)
          bit_mask64 = 0xffffffffffffffff;
        else
          bit_mask64 = (((BIT64)1) << (top_bit + 1)) - 1;
      }
      val64 = (val128.lo & bit_mask64) >> bottom_bit;
      valtop64 = (val128.hi & bit_masktop64) >> bottom_bit-64;
      return valtop64 | val64;
      /*}}}  */
    }else{
      get_bits_and_valid(id, &val64, NULL);
      if (top_bit >= SIZEOF_BIT64 - 1)
        bit_mask64 = -1;
      else
        bit_mask64 = (((BIT64) 1) << (top_bit + 1)) - 1;
      val64 = (val64 & bit_mask64) >> bottom_bit;
      return val64;
    }
  }else{
    get_bits_and_valid(id, &val, NULL);
    if (top_bit >= SIZEOF_BITS - 1)
      bit_mask = -1;
    else
      bit_mask = (((BITS) 1) << (top_bit + 1)) - 1;
    val = (val & bit_mask) >> bottom_bit;
    return val;
  }
}
/*}}}  */
/*{{{  intf_sig_v stuff*/
BIT  *jbus_cycle_info::intf_sig_v(enum port_ids id, BIT *tmp){
  BITS val;
  int i;
  get_bits_and_valid(id, &val, NULL);
  for (i=0; i<sizes[id]; i++){
    tmp[i] = val & 1;
    val = val >> 1;
  }
  return tmp;
}
BIT  *jbus_cycle_info::intf_sig_v(enum port_ids id, BIT *tmp, int top_bit, int bottom_bit)
{
  int i;
  BITS val, valid, bit_mask;
  BIT64 val64, valtop64, bit_mask64, bit_masktop64;
  BIT64 valid64, validtop64;
  BIT128 val128, valid128;
  if (sizes[id] > SIZEOF_BITS){
    if (sizes[id] > SIZEOF_BIT64){
      get_bits_and_valid(id, &val128, &valid128);
      if (bottom_bit > 64)
        val64 =val128.hi >> bottom_bit - 64;
      else
        val64 =val128.lo >> bottom_bit;
      for (i=bottom_bit; i <= top_bit; i++){
        tmp[i-bottom_bit] = val64 & 1;
        val64 = val64 >> 1;
        if (i == 64 && bottom_bit <= 64){
          val64 = val128.hi;
        }
      }
      return tmp;
    }else{
      get_bits_and_valid(id, &val64, &valid64);
      val64 >> bottom_bit;
      for (i=0; i<(top_bit - bottom_bit) + 1; i++){
        tmp[i] = val64 & 1;
        val64 = val64 >> 1;
      }
      return tmp;
    }
  }
  get_bits_and_valid(id, &val, NULL);
  val >> bottom_bit;
  for (i=0; i<(top_bit - bottom_bit) + 1; i++){
    tmp[i] = val & 1;
    val = val >> 1;
  }
  return tmp;
}
/*}}}  */
/*{{{  wait_for_event*/
void jbus_cycle_info::wait_for_event(enum port_ids id, BIT value, int timeout) {
  BITS val;
  int i;

  i =0;
  get_bits_and_valid(id, &val, NULL);
  while (i < timeout && val != value){
    wait_next_cycle();
    get_bits_and_valid(id, &val, NULL);
  }

}
/*}}}  */
/*}}}  */
/*{{{  monitor i/f stuff*/
jbus_cycle_info mon_info;
extern "C" void new_jbus_mon_cycle(void) {
   sim_info.get_exit();
   mon_info.new_cycle();
}

extern "C" void jbus_mon_reset_change() {
   sim_info.get_exit();
   mon_info.reset_change();
}


extern "C" void jbus_mon_init(void){
    thread_t *jbus_mon_thread;

    if(mon_info.init(&jbus_mon_thread)){
      thr_create(0, 0, jbus_monitor, &mon_info,
                   THR_SUSPENDED, jbus_mon_thread);
      thr_continue(*jbus_mon_thread);
    }
}
/*}}}  */
/*{{{  check i/f stuff*/
jbus_cycle_info check_info;

extern "C" void new_jbus_check_cycle(void) {
   sim_info.get_exit();
   check_info.new_cycle();

}

extern "C" void jbus_check_reset_change() {
   sim_info.get_exit();
   check_info.reset_change();

}


extern "C" void jbus_check_init(void){
  thread_t *jbus_check_thread;

#ifdef DBX_DEBUG
FILE *id;

         fprintf(stderr, "DEBUG - waiting for lock file to arrive\n");
                  while ((id = fopen("lock.tmp", "r")) == NULL);
                           fclose(id);
#endif

  if (check_info.init(&jbus_check_thread)){
      thr_create(0, 0, jbus_checker, &check_info,
                 THR_SUSPENDED, jbus_check_thread);
      thr_continue(*jbus_check_thread);
  }
}
/*}}}  */
