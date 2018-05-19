// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: decoder.c
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
#include "decoder.h"
//define the static vaiable of tlb decoder.
static dec_node_ptr dec_ptr;
void tlb_check(int );
void tlb_pop();
void tlb_reset_vld();
/*-------------------------------------------------------------------------------
 decode the d-stage instructions. 
--------------------------------------------------------------------------------*/
void bw_instruction_decoder_call()
{
  int        thrid;

  switch(tf_getp(DECODER_REQ)){
  case 1://initialize
    dec_ptr           = (dec_node_ptr)malloc(sizeof(struct dec_node));
    dec_ptr->heap     = (list_head_ptr)malloc(sizeof(struct list_head_node));
    for(thrid = 0;thrid < 32;thrid++){
      dec_ptr->on_going[thrid]    = 0;
      dec_ptr->lock[thrid]   = 0;
      dec_ptr->lock[thrid]   = 0;
      dec_ptr->rd[thrid]     = 0;
      dec_ptr->wr[thrid]     = 0;
      dec_ptr->counter[thrid]= 0;
      dec_ptr->pending_list[thrid] = (list_head_ptr)malloc(sizeof(struct list_head_node));
      dec_ptr->pending_list[thrid]->head_ptr = 0;
    }
    tf_putp(0, (int)dec_ptr);//reurn handle
    break;
  case 2://is it invalidate all?
    decoder();
    break;
  case 4://save data on list.
    push_data();
    break;
  case 5://save sas commuication data.
    push_send();
    break;
  case 6:
    dec_data();
    break;
  case 8:
    check_list();
    break;
    //tlb parity case
  case 20:
    tlb_error();
    break;
  case 21:
    tlb_pop();
    break;
  case 22:
    tlb_check(0);
    break;
  case 23:
    tlb_check(1);
    break;
  case RESET_COMMAND:
    reset();
    break; 
  }
}
/*-------------------------------------------------------------------------------
check whether it is invalidate_all.
---------------
asi | va | unit
---------------
54    0    IMMU data in register
55    all  IMMU TLB Data Access Register
56    all  IMMU TLB Demap 
57    all  demap

5c    0    DMMU data in register
5d    all  DMMU TLB Data Access Register
5e    all
5f    all  demap
60    0    MMU TLB Invalidate Register need to check tlv entry
60    8    DMMU TLB Invalidate Register
--------------------------------------------------------------------------------*/
int check_asi()
{
 int asi, va;

 asi = tf_getp(DECODER_ASI);
 va  = tf_getp(DECODER_VA);
 io_printf("Info(%d): tlb operation %x %x\n", tf_gettime(), asi, va);
 if((asi == 0x60) && (va == 0)){//i-tlb invalidate all
   if(get_long(DECODER_IVLD) == 0)return 0;
   return 1;
 } 
 if((asi == 0x60) && (va == 0x8)){//d-tlb invalidate all
   if(get_long(DECODER_DVLD) == 0)return 0;
   return 2;
 }
 if(asi == 0x55 || asi == 0x56 || asi == 0x57)return 1;
 if(asi == 0x5d || asi == 0x5e || asi == 0x5f)return 2; 
 //if(va == 0 && asi == 0x54)return 3;
 if(asi == 0x54)return 3;
 //if(va == 0 && asi == 0x5c)return 4;
 if(asi == 0x5c)return 4;
 return 0;
}
/*-------------------------------------------------------------------------------
Check the e-stage asi to search the tlb operation.
--------------------------------------------------------------------------------*/
void decoder()
{
  int          thrid, tlb;
  long long    pc;

  if(tlb = check_asi()){
    thrid   = tf_getp(DECODER_THRID);
    pc      = get_long(DECODER_PC);
    //first tlb
    dec_ptr->pc[thrid]       = pc;
    dec_ptr->which_tlb[thrid]= tlb;
    tf_putp(0, tlb);//lock the current pc.
    io_printf("(%0d)Info:tlb lock stepping of thread(%d) pc(%llx)\n", tf_gettime(), thrid, pc);
    /*
    else{//There are the pending tlb cmds.
      dec_ptr->next[thrid][dec_ptr->wr[thrid]].pc        = pc;
      dec_ptr->next[thrid][dec_ptr->wr[thrid]].which_tlb = tlb;
      dec_ptr->wr[thrid]++;
      if(dec_ptr->wr[thrid] == 12)dec_ptr->wr[thrid] = 0;
      dec_ptr->counter[thrid]++;
      tf_putp(0, 0);
      }*/
  }
  else tf_putp(0, 0);
}
/*-------------------------------------------------------------------------------
check pending.
--------------------------------------------------------------------------------*/
void check_pending()
{
  int          thrid;

  thrid   = tf_getp(DECODER_THRID);

  if(dec_ptr->counter[thrid]){
    tf_putp(0, dec_ptr->next[thrid][dec_ptr->rd[thrid]].which_tlb);
    tf_putlongp(DECODER_PC, dec_ptr->next[thrid][dec_ptr->rd[thrid]].pc,
		dec_ptr->next[thrid][dec_ptr->rd[thrid]].pc >> 32);

    dec_ptr->on_going[thrid] = 1;
    dec_ptr->pc[thrid]       = dec_ptr->next[thrid][dec_ptr->rd[thrid]].pc;
    dec_ptr->rd[thrid]++;
    if(dec_ptr->rd[thrid] == 12)dec_ptr->rd[thrid] = 0;
    dec_ptr->counter[thrid]--;
  }
  else tf_putp(0, 0);
}
/*-------------------------------------------------------------------------------
caller format:
 $bw_decoder(4, decoder_handle, type, {cpu_id[2:0],thread}, 
 c_cwp, rtl_reg_addr, rtl_reg_val, cond, updated);
--------------------------------------------------------------------------------*/
void  push_data()
{ 
  list_node_ptr item; 
  list_head_ptr cmp_handle;
  s_tfnodeinfo node_info;

  cmp_handle = (list_head_ptr)tf_getp(DECODER_HANDLE);
  if(cmp_handle->hhead_ptr)item = hpop(cmp_handle);
  else item = (list_node_ptr)malloc(sizeof(struct list_node));
  if(item == 0){
    io_printf("FATAL error: Memory allocation problem(bw_decoder)\n");
    tf_dofinish();
  }
  item->time       = tf_gettime();
  item->which_sign = tf_getp(3);
  item->thread     = tf_getp(4);
  item->spc        = (item->thread >> 2 ) & 7;
  item->win        = tf_getp(5);
  item->reg_num    = tf_getp(6);
  item->cond       = tf_getp(8);
  item->wait       = tf_getp(9);
  //get 64 bits value
   
  tf_nodeinfo(7, &node_info);
  item->aval[0] = node_info.node_value.vecval_p[0].avalbits;
  item->bval[0] = node_info.node_value.vecval_p[0].bvalbits;
  item->aval[1] = node_info.node_value.vecval_p[1].avalbits;
  item->bval[1] = node_info.node_value.vecval_p[1].bvalbits;
 
  item->sright  = 0;
  item->send    = 0;
  push(dec_ptr->pending_list[item->thread], &item);
}
/*-------------------------------------------------------------------------------
dummy = $bw_decoder(20, `TOP_MOD.list_handle, {cpu_id[2:0], 
thrid_m}, rd_idx, dtlb_rd_tte_tag, pc_m, 1);
--------------------------------------------------------------------------------*/
void tlb_error()
{
  list_node_ptr item; 
  list_head_ptr cmp_handle;
  int cpu, sel;
  cpu = tf_getp(3);//cpu_id
  sel = tf_getp(7);

  /* if(list_empty(dec_ptr->dtlb[cpu]) && (sel == 1)){
    item   = frontQ(dec_ptr->dtlb[cpu]);
    item->time       = tf_gettime();
    item->reg_num    = tf_getp(4);//idx
    item->val        = get_long(5);
    item->vir_pc     = get_long(6);
    item->wait       = 0;
  }
  else if(list_empty(dec_ptr->itlb[cpu]) && (sel == 2)){
    item             = frontQ(dec_ptr->itlb[cpu]);
    item->time       = tf_gettime();
    item->reg_num    = tf_getp(4);//idx
    item->val        = get_long(5);
    item->vir_pc     = get_long(6);
  }
  else {*/
    cmp_handle = (list_head_ptr)tf_getp(DECODER_HANDLE);
    if(cmp_handle->hhead_ptr)item = hpop(cmp_handle);
    else item = (list_node_ptr)malloc(sizeof(struct list_node)); 

    item->time       = tf_gettime();
    item->spc        = tf_getp(3);//cpu_id
    item->thread     = item->spc & 3;
    item->reg_num    = tf_getp(4);//idx
    item->val        = get_long(5);
    item->vir_pc     = get_long(6);
    item->wait       = 0;
    io_printf("(%0d:Info:TLB PARITY TRAP cpu(%d) tag(%llx) pc(%llx) TLB(%d)\n",
	    item->time, item->spc, item->val, item->vir_pc, tf_getp(7));
    if(sel == 1)push(dec_ptr->dtlb[item->spc], &item);
    else        push(dec_ptr->itlb[item->spc], &item);
    //}
}
/*-------------------------------------------------------------------------------
 check the error condition.
$bw_decoder(22, cpu_id[2:0], 1, rd_idx, tag_tlb, tlb_time)
--------------------------------------------------------------------------------*/
void tlb_check(int check)
{
  list_node_ptr item; 
  int cpu, err;
  err = 0;//no error
  cpu = tf_getp(2);
  if(tf_getp(3) == 1){//dtlb data
    if(list_empty(dec_ptr->dtlb[cpu])){
      item   = frontQ(dec_ptr->dtlb[cpu]);
      if(!check){
	item->wait++;
	if(item->wait >= WAIT_CYCLE){
	  err = 1;
	  tf_putp(4, item->reg_num);
	  tf_putlongp(5, item->val, item->val >> 32);
	  tf_putp(6, item->time); 
	}
      }
      else if(check){
	tf_putlongp(4, item->vir_pc, item->vir_pc >> 32);
	if(item->next)tf_putlongp(5, item->next->vir_pc, item->next->vir_pc >> 32);
	else tf_putlongp(5, 0, 0);
	err = 1;
      }
    }
  }
  else{

    if(list_empty(dec_ptr->itlb[cpu])){
      item   = frontQ(dec_ptr->itlb[cpu]);
      if(!check){
	item->wait++;
	if(item->wait >= WAIT_CYCLE){
	  err = 1;
	  tf_putp(4, item->reg_num);
	  tf_putlongp(5, item->val, item->val >> 32);
	  tf_putp(6, item->time); 
	}
      }
      else if(check){
	tf_putlongp(4, item->vir_pc, item->vir_pc >> 32);
	err = 1;
      }
    }
  }
  tf_putp(0, err);
}
/*-------------------------------------------------------------------------------
 keep the send data.
$bw_decoder(6, decoder_handle, type, thread, num, win, cond, updated, val)
--------------------------------------------------------------------------------*/
void tlb_pop()
{
  list_node_ptr item; 
  list_head_ptr cmp_handle;
  int cpu;

  cmp_handle = (list_head_ptr)tf_getp(2);
  cpu        = tf_getp(3);
  if(tf_getp(4) == 3){
    while(list_empty(dec_ptr->dtlb[cpu])){
      item   = pop(dec_ptr->dtlb[cpu]);
       push(dec_ptr->heap, &item);
    }
  }
  else if(tf_getp(4) == 1){
    if(list_empty(dec_ptr->dtlb[cpu])){
      item   = pop(dec_ptr->dtlb[cpu]);
      tf_putp(5, item->reg_num);
      push(dec_ptr->heap, &item);
    }
  }
  else{
    if(list_empty(dec_ptr->itlb[cpu])){
      item   = pop(dec_ptr->itlb[cpu]);      
      tf_putp(5, item->reg_num);
      push(dec_ptr->heap, &item);
      while(list_empty(dec_ptr->itlb[cpu])){
	item   = pop(dec_ptr->itlb[cpu]);
	push(dec_ptr->heap, &item);
      }
    }
  }
}
/*-------------------------------------------------------------------------------
 dummy = $bw_decoder(30, cpu_id[2:0], rd_idx, 1, dtlb_entry_vld);
--------------------------------------------------------------------------------*/
int bw_tlb_reset_vld_call()
{
  int thrid;

 switch(tf_getp(1)){
 case 1:
   for(thrid = 0; thrid < 32;thrid++){
     dec_ptr->dtlb[thrid] =  (list_head_ptr)malloc(sizeof(struct list_head_node));
     dec_ptr->itlb[thrid] =  (list_head_ptr)malloc(sizeof(struct list_head_node));
     }
   break;
 case 2:
   mra_entry();
   break;
 case 3:
   tlb_reset_vld();
   break;
 }
}
/*-------------------------------------------------------------------------------
 dummy = $bw_decoder(30, cpu_id[2:0], rd_idx, 1, dtlb_entry_vld);

--------------------------------------------------------------------------------*/
void tlb_reset_vld()
{
  int  idx, cpu;
  long long vld, mask;
  vld  = get_long(2);
  idx  = tf_getp(3);//get cache index
  mask = 1 << idx;
  if(vld & mask)vld ^= mask;
  tf_putlongp(2, vld, vld >> 32);
  /*
  int       idx, cpu,  mask, array_idx, array_lidx;
  handle hand;
  s_setval_value valuePtr;
  s_setval_delay delayPtr;
  //vector type
  s_acc_value  vec;
  int vec_size, array_size;
  cpu  = tf_getp(2);//get string index.
  idx  = tf_getp(3);//get cache index
  hand = tf_getp(4) == 1 ? acc_handle_by_name(dec_ptr->dentry_name[cpu], 0) :
                           acc_handle_by_name(dec_ptr->ientry_name[cpu], 0);
  //fetch vector type
  vec_size         = acc_fetch_size(hand);
  array_size       = ((vec_size - 1) / 32 + 1);
  vec.value.vector = (p_acc_vecval)malloc(array_size* sizeof(p_acc_vecval));
  vec.format       = accVectorVal;
  acc_fetch_value(hand, "%%", &vec);
  array_idx  = (idx >> 5);
  array_lidx = idx % 32;
  mask       = (1 << array_lidx);
  if(vec.value.vector[array_idx].aval & mask)vec.value.vector[array_idx].aval ^= mask;
  delayPtr.model     = accNoDelay;
  valuePtr.format    = accVectorVal;
  valuePtr.value.vector = vec.value.vector;
  acc_set_value(hand, &valuePtr, &delayPtr);
  return (0);*/

}

/*-------------------------------------------------------------------------------
$bw_decoder(40, `DTLBPATH0.tlb_entry_vld, cpu, 1);
--------------------------------------------------------------------------------*/
int mra_entry()
{
   s_tfnodeinfo node_info, node_info4;
   char *avalPtr, *bvalPtr;
   int   groups, ind, i, num, aval[10], bval[10];
#ifdef USE_ACC
   s_tfexprinfo expr_info4;
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  char outdata[50];
  char tmpdata[10];
  delay_s.model = accNoDelay;
  outdata[0] = '\0';
#endif

   tf_nodeinfo(3, &node_info);
   tf_nodeinfo(4, &node_info4);
   avalPtr  = node_info.node_value.memoryval_p + tf_getp(2) * node_info.node_ngroups * 2;
   bvalPtr  = avalPtr + node_info.node_ngroups;
   groups   = 0;
   for(ind = 0; ind < node_info4.node_ngroups; ind++){
     aval[ind] = 0;
     bval[ind] = 0;
     for(i = 0; i < 4; i++){
       num = i * 8;
       aval[ind] |= ((avalPtr[groups] & 0xff) << num);
       bval[ind] |= ((bvalPtr[groups] & 0xff) << num);
       groups++;
     }
   }
#ifdef USE_ACC
   for(ind = node_info4.node_ngroups-1; ind >= 0; ind--){
	sprintf(tmpdata,"%0.8lx",aval[ind] & 0xffffffff);
	strcat(outdata,tmpdata);
   }
    acc_initialize();
    tmphandle = acc_handle_tfarg(4);
    value_s.format = accHexStrVal;
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);
#else
   for(groups = 0; groups < node_info4.node_ngroups ; groups++){
      node_info4.node_value.vecval_p[groups].avalbits = aval[groups] & 0xffffffff;
      node_info4.node_value.vecval_p[groups].bvalbits = bval[groups] & 0xffffffff;
    }
   tf_propagatep(4);
#endif

}
/*-------------------------------------------------------------------------------
$bw_decoder(40, `DTLBPATH0.tlb_entry_vld, cpu, 1);
--------------------------------------------------------------------------------*/
int tlb_entry()
{
  //handle hand;
  //char *str, *sstr;
  /*
  hand = acc_handle_tfarg(2);
  str  = acc_fetch_fullname(hand);
  cpu  = tf_getp(3);
  if(tf_getp(4) == 1){
    dec_ptr->dentry_name[cpu] =  (char*)malloc(strlen(str)+1);
    strcpy(dec_ptr->dentry_name[cpu], str);
  }
  else {
    dec_ptr->ientry_name[cpu] =  (char*)malloc(strlen(str)+1);
    strcpy(dec_ptr->ientry_name[cpu], str);
    }*/
}
/*-------------------------------------------------------------------------------
get stepping data.
 $bw_decoder(5, `TOP_MOD.list_handle, {cpu_id[2:0], t_idx[1:0]}, `PLI_RESET_TLB_ENTRY, tlb, rd_idx);
--------------------------------------------------------------------------------*/
void  push_send()
{
  list_node_ptr item; 
  list_head_ptr cmp_handle;

  cmp_handle = (list_head_ptr)tf_getp(DECODER_HANDLE);
  if(cmp_handle->hhead_ptr)item = hpop(cmp_handle);
  else item = (list_node_ptr)malloc(sizeof(struct list_node));
  if(item == 0){
    io_printf("FATAL error: Memory allocation problem Where(bw_decoder)\n");
    tf_dofinish();
  }
  item->thread     = tf_getp(DECODER_THRID);
  item->which_sign = tf_getp(DECODER_STEP);
  switch(item->which_sign){
  case(PLI_SSTEP) :
    item->val      = get_long(DECODER_STEP+1);
    break;
  case(PLI_WRITE_TH_XCC_REG) :
    item->bound = tf_getp(DECODER_CCR);
    break;
  case(PLI_READ_TH_REG) :
    item->win      = tf_getp(DECODER_WIN);
    item->reg_num  = tf_getp(DECODER_ADDR);
    break;
  case(PLI_WRITE_TH_REG_HI) :
    item->win     = tf_getp(DECODER_WIN);
    item->reg_num = tf_getp(DECODER_ADDR);
    item->bound   = tf_getp(DECODER_CCR);
    break;
  case(PLI_WRITE_TH_REG) :
    item->win     = tf_getp(DECODER_WIN);
    item->reg_num = tf_getp(DECODER_ADDR);
    item->bound   = tf_getp(DECODER_CCR);
    break; 
  case(PLI_READ_TH_FP_REG_X) :
    item->reg_num  = tf_getp(DECODER_ADDR);
    break;
  case(PLI_READ_TH_FP_REG_I) :
    item->reg_num  = tf_getp(DECODER_ADDR);
    break;
  case(PLI_READ_TH_CTL_REG) :
    item->reg_num = tf_getp(DECODER_ADDR);
    break;
  case(PLI_WRITE_TH_CTL_REG) :
    item->reg_num  = tf_getp(DECODER_ADDR);
    item->val      =  get_long(DECODER_CCR);
    break;
   case(PLI_FORCE_TRAP_TYPE) :
     item->val     = tf_getp(DECODER_WIN);
     break;
  case(PLI_RESET_TLB_ENTRY) :
    item->reg_num  = tf_getp(DECODER_WIN);
    item->win      = tf_getp(DECODER_ADDR);
    break;
  case(PLI_INST_TTE) :
     item->val     = tf_getp(DECODER_WIN);
     break;
  case(PLI_DATA_TTE) :
     item->val     = tf_getp(DECODER_WIN);
     break;
  default ://no special
    break;
  }
  item->send = 1;//indicate send.
  push(dec_ptr->pending_list[item->thread], &item); 
}
/*-------------------------------------------------------------------------------
 keep the send data.
$bw_decoder(6, decoder_handle, type, thread, num, win, cond, updated, val)
--------------------------------------------------------------------------------*/
int dec_data()
{

  list_head_ptr cmp_handle;
  list_node_ptr item; 
  int thrid, low, high, pval;

 
  cmp_handle = (list_head_ptr)tf_getp(DECODER_LIST);//get compare Q dec_ptr
  thrid      = tf_getp(DECODER_THRID+1);
  pval       = 0;
  while(list_empty(dec_ptr->pending_list[thrid])){
    item   = pop(dec_ptr->pending_list[thrid]);
    if(item->send){
      tf_putp(3, item->which_sign);
      tf_putp(5, item->reg_num);
      tf_putp(6, item->win);
      tf_putp(7, item->bound);
      if(item->which_sign == PLI_WRITE_TH_CTL_REG)tf_putlongp(7, item->val, item->val >> 32);
      push(dec_ptr->heap, &item);
      pval = 1;
      break;
    }
    else {
      /*
      if(dec_ptr->on_going[thrid] &&
	 (item->which_sign == PC)){
	low = dec_ptr->pc[thrid]         & 0xffffffff;
	high= (dec_ptr->pc[thrid] >> 32) & 0xffffffff;
	if((low == item->aval[0]) && (high == item->aval[1])){
	  front(dec_ptr->pending_list[thrid], &item);
	  break;
	}
	}*/
      push(cmp_handle,  &item);
    }
  }
  list_empty(dec_ptr->pending_list[thrid]) ? tf_putp(9, 1) : tf_putp(9, 0);
  tf_putp(0, pval);
}
/*-------------------------------------------------------------------------------
Is the list empty?
--------------------------------------------------------------------------------*/
void check_list()
{
  int i, mask, thrid;
  
  mask  = tf_getp(DECODER_MASK);
  thrid = tf_getp(DECODER_MASK+1);
  for(i = 0; i < 4; i++){
    if(dec_ptr->pending_list[thrid+i]->head_ptr && (mask & (1 << i)))mask ^= (1 << i);
  }
  tf_putp(DECODER_MASK, mask);
}
/*----------------------------------
check whether it is invalidate_all.
------------------------------------*/
long long get_long(int loc){
  int       low, high;
  long long pc;

  low  = tf_getlongp(&high, loc);
  pc   = high;
  pc <<= 32;
  pc  |= low;
  return pc;
}
/*----------------------------------
check whether it is invalidate_all.
------------------------------------*/
void reset()
{
  int thrid;
  list_node_ptr item;
 
  
  for(thrid = 0;thrid < 32;thrid++){
      dec_ptr->on_going[thrid]    = 0;
      dec_ptr->lock[thrid]   = 0;
      dec_ptr->lock[thrid]   = 0;
      dec_ptr->rd[thrid]     = 0;
      dec_ptr->wr[thrid]     = 0;
      dec_ptr->counter[thrid]= 0;
      while(list_empty(dec_ptr->dtlb[thrid])){
	item   = pop(dec_ptr->dtlb[thrid]);
	push(dec_ptr->heap, &item);
      }
      while(list_empty(dec_ptr->itlb[thrid])){
	item   = pop(dec_ptr->itlb[thrid]);
	push(dec_ptr->heap, &item);
      }
      while(list_empty(dec_ptr->pending_list[thrid])){
	item   = pop(dec_ptr->pending_list[thrid]);
	push(dec_ptr->heap, &item);
      }
  }
}
