// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: list.c
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
/*******************************************************************************
    list.c
*********************************************************************************/
#include "list.h"
#define  PC            32
#define  HINTP         120
#define  INTR_RECEIVE  106
int hpush(list_head_ptr handle, list_node_ptr* item);
/*-------------------------------------------------------------------------------
  read data from veriloag.
--------------------------------------------------------------------------------*/
long long get_time()
{
  int high, low;
  long long time, ltime;
  
  low    = tf_getlongtime(&high);
  ltime  = low;
  time   = high;
  time <<= 32;
  time  &= 0xffffffff00000000;
  ltime &= 0xffffffff;
  time  |= ltime;
  return time;
}
/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
list_node_ptr pop(list_head_ptr handle)
{
  list_node_ptr tmp_ptr;
  tmp_ptr          = handle->head_ptr;
  handle->head_ptr = tmp_ptr->next;
  return tmp_ptr;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int push(list_head_ptr handle, list_node_ptr* item)
{
  (*item)->next = 0;//indicates the last record.
  if(handle->head_ptr == 0)
    handle->head_ptr = *item;
  else 
    handle->tail_ptr->next = *item;
  handle->tail_ptr   = *item; 
  return 1;
}
/*-------------------------------------------------------------------------------
  just return the top item of FiFo.
--------------------------------------------------------------------------------*/
list_node_ptr frontQ(list_head_ptr handle)
{
  return handle->head_ptr;
}
/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
list_node_ptr dpop(list_head_ptr handle)
{
  list_node_ptr tmp_ptr;
  tmp_ptr           = handle->dhead_ptr;
  handle->dhead_ptr = tmp_ptr->next;
  return tmp_ptr;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int dpush(list_head_ptr handle, list_node_ptr* item)
{
  (*item)->next = 0;//indicates the last record.
  if(handle->dhead_ptr == 0)
    handle->dhead_ptr = *item;
  else handle->dtail_ptr->next = *item;
  handle->dtail_ptr   = *item; 
  return 1;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int front(list_head_ptr handle, list_node_ptr* item)
{
  if(handle->head_ptr == 0){
    handle->tail_ptr = *item;
    (*item)->next    = 0;
  } 
  else (*item)->next = handle->head_ptr;
  handle->head_ptr = (*item);
  return 1;
}
/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
list_node_ptr search(int thread, list_head_ptr handle)
{
  list_node_ptr tmp_ptr, prev;

  tmp_ptr = handle->head_ptr;
  if(tmp_ptr->thread == thread){//found the target node.
    handle->head_ptr = tmp_ptr->next;
    if(tmp_ptr == handle->tail_ptr)handle->tail_ptr = tmp_ptr->next;
    return tmp_ptr;
  }
  prev    = tmp_ptr;
  tmp_ptr = tmp_ptr->next;
  //search the target thread.
  while(tmp_ptr){
     if(tmp_ptr->thread == thread){//found the target node.
       if(tmp_ptr == handle->tail_ptr)handle->tail_ptr = prev;
       prev->next = tmp_ptr->next;
       return tmp_ptr;
     }
     prev    = tmp_ptr;
     tmp_ptr = tmp_ptr->next;
  }
  return 0;
}
/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
int find_next(list_head_ptr handle, int which)
{
  int thrid,  set;
  long long time;

  list_node_ptr tmp_ptr, prev;
  set     = 0;
  tmp_ptr = handle->head_ptr;
  thrid   = tmp_ptr->thread;
  time    = tmp_ptr->time;
  if(tmp_ptr->next == 0)return 1;//no candidate
  prev    = tmp_ptr;
  tmp_ptr = tmp_ptr->next;
  if(prev->wait == 1)set = 1;
  while(tmp_ptr){
    if(tmp_ptr->thread != thrid || tmp_ptr->time != time)return 1;
    if(set && (tmp_ptr->wait == 1))return 0;
    if(tmp_ptr->which_sign == which){
      if(tmp_ptr == handle->tail_ptr)handle->tail_ptr = prev;
      prev->next       = tmp_ptr->next;
      tmp_ptr->next    = handle->head_ptr;
      handle->head_ptr = tmp_ptr;
      return 0;
    }
    prev    = tmp_ptr;
    tmp_ptr = tmp_ptr->next; 
    if(prev->wait == 1)set = 1;
  }
  return 1;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int list_empty(list_head_ptr handle)
{
  return (int)handle->head_ptr;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int shiftList(list_head_ptr handle, int thread)
{
  list_node_ptr f_ptr, s_ptr, t_ptr, p_ptr;
  int sw, set;
  sw               = 0;
  set              = 0;
  f_ptr            = handle->head_ptr;
  if(f_ptr == 0 || f_ptr->next == 0)return 0;
  //search for the next head node.
  s_ptr = f_ptr->next; 
  if(f_ptr->wait == 1){
    set   = 1;
    while(s_ptr){
      if(s_ptr->wait != 1)break;
      s_ptr = s_ptr->next;
    }
    if(s_ptr == 0)return 0;
  }
  handle->head_ptr = s_ptr;
  p_ptr            = 0;
  //main routine
  while(s_ptr){
    if(f_ptr->thread == s_ptr->thread){//insert the node.
      sw = 1;
      if((f_ptr->reg_num == s_ptr->reg_num) && 
	 (f_ptr->wait >= 2)                 &&
	 (f_ptr->win == s_ptr->win)         ||
 
	 (f_ptr->which_sign == HINTP)       && 
	 (s_ptr->which_sign == HINTP)       ||
	 (f_ptr->which_sign == INTR_RECEIVE)&& 
	 (s_ptr->which_sign == INTR_RECEIVE ||s_ptr->which_sign == HINTP)
	 ){
	io_printf("(%0lld)Info:drop element signal(%d) reg(%d) thread(%d) val(%08x%08x)\n", 
		get_time(), f_ptr->which_sign, f_ptr->reg_num, f_ptr->thread, f_ptr->aval[1], f_ptr->aval[0]);
	drop_data(f_ptr->aval[1], f_ptr->aval[0], f_ptr->reg_num, f_ptr->thread);
	hpush(handle, &f_ptr);
	if(f_ptr->wait >= 2){
	  tf_putlongp(3, f_ptr->aval[0], f_ptr->aval[1]);
	  tf_putp(4, f_ptr->win);
	  tf_putp(5, f_ptr->reg_num);
	  return 2;
	}
	if(f_ptr->which_sign == INTR_RECEIVE){
	  tf_putlongp(3, f_ptr->aval[0], f_ptr->aval[1]);
	  tf_putp(4, f_ptr->win);
	  tf_putp(5, f_ptr->cond);
	  return 1;
	}
	break;
      }
      if(f_ptr->wait >= 2)f_ptr->wait++;
      t_ptr       = s_ptr->next;
      s_ptr->next = f_ptr;
      f_ptr->next = t_ptr;
      if(s_ptr == handle->tail_ptr)handle->tail_ptr = f_ptr;
      break;
    }   
    p_ptr = s_ptr;
    s_ptr = s_ptr->next;
    if(set){
      while(s_ptr){
	if(s_ptr->wait != 1)break;
	p_ptr = s_ptr;
	s_ptr = s_ptr->next;
      }
    }
    if(s_ptr && (s_ptr->wait == 1))set = 1;
  }//while
  if(sw == 0){
    if((f_ptr->reg_num == p_ptr->reg_num) && 
       (f_ptr->wait >= 2)                 &&
       (f_ptr->win == p_ptr->win)         ||

       (f_ptr->which_sign == HINTP)       && 
       (p_ptr->which_sign == HINTP)       ||

       (f_ptr->which_sign == INTR_RECEIVE)&& 
       (p_ptr->which_sign == INTR_RECEIVE || 

	p_ptr->which_sign == HINTP)
       ){

      io_printf("(%0lld)Info:drop element signal(%d) reg(%d) thread(%d) val(%08x%08x) val(%08x%08x)\n", 
		get_time(), f_ptr->which_sign, f_ptr->reg_num, f_ptr->thread, 
		f_ptr->aval[1], f_ptr->aval[0],
		p_ptr->aval[1], p_ptr->aval[0]);

      drop_data(f_ptr->aval[1], f_ptr->aval[0], f_ptr->reg_num, f_ptr->thread);
      hpush(handle, &f_ptr);

      if(f_ptr->wait >= 2){
	  tf_putlongp(3, f_ptr->aval[0], f_ptr->aval[1]);
	  tf_putp(4, f_ptr->win);
	  tf_putp(5, f_ptr->reg_num); 
	  return 2;
      }

      if(f_ptr->which_sign == INTR_RECEIVE){
	tf_putlongp(3, f_ptr->aval[0], f_ptr->aval[1]);
	tf_putp(4, f_ptr->win);
	tf_putp(5, f_ptr->cond);
	return 1;
      }
    }
    else {
      if((f_ptr->which_sign != HINTP) && 
	 (f_ptr->wait != 1)){
	if((thread == f_ptr->thread) && 
	   (f_ptr->which_sign == 152) &&
	   (f_ptr->wait >= 2) &&
	   (p_ptr->thread == thread))f_ptr->wait++;
	io_printf("(%0lld)Info:drop element signal(%0d) thread(%d) val(%08x%08x) time(%d) thread(%d)\n", 
		  get_time(), f_ptr->which_sign,f_ptr->thread, 
		  f_ptr->aval[1], f_ptr->aval[0], f_ptr->time, p_ptr->thread);
	t_ptr       = p_ptr->next;
	p_ptr->next = f_ptr;
	f_ptr->next = t_ptr;
	if(p_ptr == handle->tail_ptr)handle->tail_ptr = f_ptr;
      }
    }
  }
  return 0;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
void frontRegVal(list_head_ptr handle)
{
  list_node_ptr f_ptr, s_ptr, t_ptr, p_ptr;
  int sw;
  sw               = 0;
  f_ptr            = handle->head_ptr;
  if(f_ptr == 0 || f_ptr->next == 0)return;
  handle->head_ptr = f_ptr->next;
  s_ptr            = handle->head_ptr;

  while(s_ptr){
    if((s_ptr->wait == 1) && (f_ptr->wait != 1)){//insert the node.
      t_ptr       = s_ptr->next;
      s_ptr->next = f_ptr;
      f_ptr->next = t_ptr;
      sw          = 1;
      if(s_ptr == handle->tail_ptr)handle->tail_ptr = f_ptr;
      break;
    }
    p_ptr = s_ptr;
    s_ptr = s_ptr->next;
  }
  if(sw == 0){
    t_ptr       = p_ptr->next;
    p_ptr->next = f_ptr;
    f_ptr->next = t_ptr;
    if(p_ptr == handle->tail_ptr)handle->tail_ptr = f_ptr;
  }
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int shiftright(list_head_ptr handle)
{
  list_node_ptr f_ptr, s_ptr, t_ptr, p_ptr;
  
  f_ptr  = handle->head_ptr;
  if(f_ptr == 0              ||
     f_ptr->next == 0        || 
     (++f_ptr->sright) > 300 || 
     (f_ptr->wait < 2))return 1;
  handle->head_ptr = f_ptr->next;
  s_ptr            = handle->head_ptr;
  t_ptr            = s_ptr->next;
  s_ptr->next      = f_ptr;
  f_ptr->next      = t_ptr;
  if(s_ptr == handle->tail_ptr)handle->tail_ptr = f_ptr;
  return 0;
}
/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
list_node_ptr hpop(list_head_ptr handle)
{
  list_node_ptr tmp_ptr;
  tmp_ptr           = handle->hhead_ptr;
  handle->hhead_ptr = tmp_ptr->next;
  return tmp_ptr;
}
/*-------------------------------------------------------------------------------
  get the first item from list.
--------------------------------------------------------------------------------*/
list_node_ptr hfront(list_head_ptr handle)
{
  list_node_ptr tmp_ptr;
  tmp_ptr           = handle->htail_ptr;
  handle->htail_ptr = handle->htail_prev;
  handle->htail_ptr->next = 0;
  return tmp_ptr;
}
/*-------------------------------------------------------------------------------
  push record on the back of list.
--------------------------------------------------------------------------------*/
int hpush(list_head_ptr handle, list_node_ptr* item)
{

  (*item)->next = 0;//indicates the last record.
  handle->htail_prev = handle->htail_ptr;
  if(handle->hhead_ptr == 0)
    handle->hhead_ptr = *item;
  else 
    handle->htail_ptr->next = *item;
  handle->htail_ptr   = *item; 
  return 1;
}
/*-------------------------------------------------------------------------------
  read data from veriloag.
--------------------------------------------------------------------------------*/
int get_data(list_node_ptr item)
{
  s_tfnodeinfo node_info;
  tf_nodeinfo(8, &node_info);
  item->time       = get_time();//tf_gettime();
  item->which_sign = tf_getp(3);
  item->spc        = tf_getp(4);
  item->thread     = tf_getp(5);
  item->win        = tf_getp(6);
  item->reg_num    = tf_getp(7);
  item->cond       = tf_getp(9);
  item->wait       = tf_getp(10);
  item->aval[0] = node_info.node_value.vecval_p[0].avalbits;
  item->bval[0] = node_info.node_value.vecval_p[0].bvalbits;
  item->aval[1] = node_info.node_value.vecval_p[1].avalbits;
  item->bval[1] = node_info.node_value.vecval_p[1].bvalbits;
  item->sright  = 0;
}
/*-------------------------------------------------------------------------------
  put data into verilog.
--------------------------------------------------------------------------------*/
int put_data(list_node_ptr item)
{

#ifdef USE_ACC
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  char outdata[20];
  delay_s.model = accNoDelay;
#else
  s_tfnodeinfo node_info;
  tf_nodeinfo(8, &node_info);
#endif


  tf_putp(3, item->which_sign);
  tf_putp(4, item->spc);
  tf_putp(5, item->thread);
  tf_putp(6, item->win);
  tf_putp(7, item->reg_num);
  tf_putp(9, item->cond );
  tf_putlongp(10, item->time, item->time >> 32);//tf_putp(10,item->time );
#ifdef USE_ACC
    acc_initialize();
    tmphandle = acc_handle_tfarg(8);
    value_s.format = accHexStrVal;
    sprintf(outdata,"%0.8lx%0.8lx",  item->aval[1], item->aval[0]);
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);
    io_printf("bw_list : put_data %s \n",outdata);
#else
    io_printf("bw_list : put_data %0.8x %0.8x \n",item->aval[1],item->aval[0]);
  node_info.node_value.vecval_p[0].avalbits = item->aval[0];
  node_info.node_value.vecval_p[0].bvalbits = item->bval[0];
  node_info.node_value.vecval_p[1].avalbits = item->aval[1];
  node_info.node_value.vecval_p[1].bvalbits = item->bval[1];
  tf_propagatep(8);
#endif
}
/*-------------------------------------------------------------------------------
 swap the front node with the next different thread node.
--------------------------------------------------------------------------------*/
int swap(list_head_ptr handle)
{
  list_node_ptr prev ;

  if(handle->head_ptr->next == 0)return 0;  
  prev = handle->head_ptr;
  if(handle->tail_ptr == prev->next)handle->tail_ptr = prev;
  handle->head_ptr       = prev->next;
  prev->next             = handle->head_ptr->next;
  handle->head_ptr->next = prev;
  return 3;
}
/*-------------------------------------------------------------------------------
  argument 1:
  contains handle.
  argument 2:
  0 : create list
  1 : check empty
  2 : return the first item
  3 : push one record on the list.
   create linked list, check value, and return value.
  argument 3: register number
  argument 4: value
  argument 5: time
--------------------------------------------------------------------------------*/
int bw_list_call()
{
  int req, cpu, low, high;
  list_head_ptr lhandle;
  list_node_ptr item; 
  s_tfnodeinfo node_info;

#ifdef USE_ACC
  s_setval_delay delay_s;
  s_setval_value value_s;
  handle tmphandle;
  char outdata[20];
  delay_s.model = accNoDelay;
#endif

  
  lhandle = (list_head_ptr)tf_getp(1);//get the handle for this list.
  req    = tf_getp(2);//get request type
  switch(req){
  case 0 : //create linked list
    lhandle = (list_head_ptr)malloc(sizeof(struct list_head_node));
    lhandle->head_ptr = 0;
    lhandle->tail_ptr = 0;
    lhandle->num      = 0;
    lhandle->hhead_ptr = 0;
    lhandle->htail_ptr = 0;
    lhandle->dhead_ptr = 0;
    lhandle->dtail_ptr = 0;
    for(req = 0; req < 32; req++)lhandle->bound[req] = 0;
    tf_putp(0, (unsigned int)lhandle);//reurn handle
    break;
  case 1 : //check list if empty, return 0
    if(lhandle->head_ptr){
      if(tf_nump() > 2){
	tf_nodeinfo(8, &node_info);
	tf_putp(0, 1);
	tf_putp(3, lhandle->head_ptr->thread);
	tf_putp(4, lhandle->head_ptr->win);
	tf_putp(5, lhandle->head_ptr->reg_num);
	tf_putp(6, lhandle->head_ptr->which_sign);
	tf_putp(7, lhandle->head_ptr->wait);
	//tf_putp(9, lhandle->head_ptr->time);
	tf_putlongp(9, lhandle->head_ptr->time, lhandle->head_ptr->time >> 32);
#ifdef USE_ACC
    acc_initialize();
    tmphandle = acc_handle_tfarg(8);
    value_s.format = accHexStrVal;
    sprintf(outdata,"%0.8lx%0.8lx",  lhandle->head_ptr->aval[1],  
	lhandle->head_ptr->aval[0]);
    value_s.value.str = outdata;
    acc_set_value(tmphandle, &value_s, &delay_s);
    io_printf("bw_list : Data %s \n",outdata);
#else
	node_info.node_value.vecval_p[0].avalbits = lhandle->head_ptr->aval[0];
	node_info.node_value.vecval_p[0].bvalbits = lhandle->head_ptr->bval[0];
	node_info.node_value.vecval_p[1].avalbits = lhandle->head_ptr->aval[1];
	node_info.node_value.vecval_p[1].bvalbits = lhandle->head_ptr->bval[1];
	tf_propagatep(8);
#endif
      }
    }
    else tf_putp(0, 0);
    break;
  case 2:  // return the first list and delete the first item.
    item = pop(lhandle);
    if(item){
      put_data(item);
      hpush(lhandle, &item); 
      tf_putp(0, 1);
    }
    else tf_putp(0, 0);
    break;
  case 3: //push data
    if(lhandle->hhead_ptr)item = hpop(lhandle);
    else item = (list_node_ptr)malloc(sizeof(struct list_node));
    if(item == 0){
      io_printf("FATAL error: Memory allocation\n");
      tf_dofinish();
    }
    get_data(item);
    //make instruction boundary
    if(item->which_sign == PC)lhandle->bound[item->thread]++;
    item->bound = lhandle->bound[item->thread];
    tf_putp(0, push(lhandle, &item));
    break;
  case 4 :
    // io_printf("(%0d):Info int received register thread(%d)\n", tf_gettime(),  tf_getp(6));
    low = shiftList(lhandle, tf_getp(6));
    tf_putp(0, low);
    break;
  case 5 :
    io_printf("(%0lld):Info front by one\n", get_time());
    frontRegVal(lhandle); 
    break; 
  case 6 :
    tf_putp(0, find_next(lhandle, tf_getp(3)));
    io_printf("(%0lld):Info find cmd(%d) in the list\n", get_time(), tf_getp(3));
    break;   
  case 7 :
    item = hfront(lhandle);
    front(lhandle, &item);
   break;
  case 10 :  
    if(lhandle->head_ptr->wait != 1){
      io_printf("(%0lld):Info rignt shift\n", get_time());  
      tf_putp(0, shiftright(lhandle));
    }
    break; 
  case 11 :  
    io_printf("(%0lld):Info rignt shift\n", get_time());  
    tf_putp(0, swap(lhandle));
    break; 
    //instruction checker
    
  case 20 ://save instruction
    if(lhandle->hhead_ptr)item = hpop(lhandle);
    else item = (list_node_ptr)malloc(sizeof(struct list_node));
    if(item == 0){
      io_printf("FATAL error: Memory allocation\n");
      tf_dofinish();
    }
    //get data
    item->thread     = tf_getp(3); 
    item->inst       = tf_getp(4);
    item->cond       = tf_getp(5);
    item->wait       = 0;
    item->time       = get_time();//tf_gettime();
    tf_putp(0, dpush(lhandle, &item));
    break;
  case 21 : //return instruction.
    item = dpop(lhandle);
    if(item){ 
      tf_putp(3, item->inst);
      tf_putlongp(4, item->time, item->time >> 32);//tf_putp(4, item->time);
      tf_putp(5, item->cond);
      hpush(lhandle, &item); 
    }
    break;
  case 22 : //it is empty and return thread to be checked at this time.
    if(lhandle->dhead_ptr){
      tf_putp(3, lhandle->dhead_ptr->thread);
      tf_putp(0, 1);
      lhandle->dhead_ptr->wait++;
    }
    else tf_putp(0, 0);
    break;
  case RESET_COMMAND:
    while(lhandle->head_ptr){
      item = pop(lhandle);
      hpush(lhandle, &item); 
    }
    while(lhandle->dhead_ptr){
      item = dpop(lhandle);
      hpush(lhandle, &item); 
    }
    break;
  }
}
