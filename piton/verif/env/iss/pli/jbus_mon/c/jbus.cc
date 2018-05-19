// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbus.cc
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
***  Program File:  @(#)jbus.cc
***
***  Version Date:  07/17/00
***
****************************************************************************
****************************************************************************/

#ifdef LINUX
#else

#include "jbus.h"
//{{{  signal constructor
mt_Signal::mt_Signal(int arg_no, thread_state *t_state)
      : Signal(arg_no)
{
  bus_thread = t_state;
}


//------------------------------------------------------------------------------
// Constructor. Allows the active state to be set.
mt_Signal::mt_Signal(int arg_no, thread_state *t_state, int state)
   :Signal(arg_no, state)
{
  bus_thread = t_state;
}

//------------------------------------------------------------------------------
// Constructor. Allows the active state to be set.
mt_Signal::mt_Signal(int arg_no, thread_state *t_state, int top, int bottom)
  : Signal(arg_no, top, bottom)
{
  bus_thread = t_state;
}
//}}}  

void mt_Signal::wait_for_event(BITS value, int timeout) {
  int i=0;
  thread_state *th;
  th = bus_thread;
  while (th!=NULL && th->thread_id != thr_self()){
    th = th->next;
  }
  if (th == NULL){
    io_printf((char *)"Fatal error in threaded PLI - cannot find a valid to match current thread %d\n", thr_self());
    abort();
  }
  //Get a clock before looking at inputs
  th->wait_next_cycle();
  while (i < timeout && (this->Value() != value || this->Value_c() == 'z' || this->Value_c() == 'x')){
    th->wait_next_cycle();
    i++;
  }
}
void mt_Signal::wait_for_event(BITS *value, int timeout) {
}

void mt_Signal::wait_next_cycle(void) {
  thread_state *th;
  th = bus_thread;
  while (th!=NULL && th->thread_id != thr_self()){
    th = th->next;
  }
  if (th == NULL){
    io_printf((char *)"Fatal error in threaded PLI - cannot find a valid to match current thread %d\n", thr_self());
    abort();
  }
  th->wait_next_cycle();
}

jbus::jbus(thread_state *parent)
{
  int arg_number=1;
  if (parent != NULL)
    t_state = parent;

  j_ad    = new mt_Signal(arg_number++, t_state, 127, 0);
  j_adtype = new mt_Signal(arg_number++, t_state, 7, 0);
  j_adp = new mt_Signal(arg_number++, t_state, 3, 0);


  j_req_out_l_0 = new mt_Signal(arg_number++, t_state, 5, 0);
  j_req_out_l_1 = new mt_Signal(arg_number++, t_state, 5, 0);
  j_req_out_l_2 = new mt_Signal(arg_number++, t_state, 5, 0);
  j_req_out_l_3 = new mt_Signal(arg_number++, t_state, 5, 0);
  j_req_out_l_4 = new mt_Signal(arg_number++, t_state, 5, 0);
  j_req_out_l_5 = new mt_Signal(arg_number++, t_state, 5, 0);
  j_req_out_l_6 = new mt_Signal(arg_number++, t_state, 5, 0);

  j_pack0 = new mt_Signal(arg_number++, t_state, 2, 0);
  j_pack1 = new mt_Signal(arg_number++, t_state, 2, 0);
  j_pack2 = new mt_Signal(arg_number++, t_state, 2, 0);
  j_pack3 = new mt_Signal(arg_number++, t_state, 2, 0);
  j_pack4 = new mt_Signal(arg_number++, t_state, 2, 0);
  j_pack5 = new mt_Signal(arg_number++, t_state, 2, 0);
  j_pack6 = new mt_Signal(arg_number++, t_state, 2, 0);

  j_par = new mt_Signal(arg_number++, t_state);
  j_rst = new mt_Signal(arg_number++, t_state);
  j_por = new mt_Signal(arg_number++, t_state);

  valid_ports = new mt_Signal(arg_number++, t_state, 6, 0);
  j_err = new mt_Signal(arg_number++, t_state, 6, 0);
  j_change = new mt_Signal(arg_number++, t_state, 6, 0);

  arg_number = 1;
  j_ad_out    = new mt_Signal(arg_number++, t_state, 127, 0);
  j_adtype_out = new mt_Signal(arg_number++, t_state, 7, 0);
  j_adp_out = new mt_Signal(arg_number++, t_state, 3, 0);
  transaction_name = new mt_Signal(arg_number++, t_state, 127, 0);

  arg_number = 1;
  bus_is_idle = new mt_Signal(arg_number++, t_state);
  uncompleted_accesses = new mt_Signal(arg_number++, t_state);



}

int jbus::InputValues(void)
{
  int ok = 1;
  ok &= j_req_out_l_0->sample_input();
  ok &= j_req_out_l_1->sample_input();
  ok &= j_req_out_l_2->sample_input();
  ok &= j_req_out_l_3->sample_input();
  ok &= j_req_out_l_4->sample_input();
  ok &= j_req_out_l_5->sample_input();
  ok &= j_req_out_l_6->sample_input();
  ok &= j_ad->sample_input();
  ok &= j_adtype->sample_input();
  ok &= j_adp->sample_input();
  ok &= j_pack0->sample_input();
  ok &= j_pack1->sample_input();
  ok &= j_pack2->sample_input();
  ok &= j_pack3->sample_input();
  ok &= j_pack4->sample_input();
  ok &= j_pack5->sample_input();
  ok &= j_pack6->sample_input();
  ok &= j_rst->sample_input();
  ok &= j_por->sample_input();
  ok &= j_par->sample_input();
  ok &= j_err->sample_input();
  ok &= j_change->sample_input();
  ok &= valid_ports->sample_input();
  t_state->new_cycle();
  return ok;
}
int jbus::OutputValues_check(void)
{
  int ok = 1;
  ok &= transaction_name->drive_output();
  ok &= j_ad_out->drive_output();
  ok &= j_adtype_out->drive_output();
  ok &= j_adp_out->drive_output();
  return ok;
}
int jbus::OutputValues_mon(void)
{
  int ok = 1;
  ok &= bus_is_idle->drive_output();
  ok &= uncompleted_accesses->drive_output();
  return ok;
}

void jbus::fork(void *(fn)(void *), void *arg){
  t_state->fork(fn, &t_state, arg);
}
void jbus::fork(void *(fn)(void *), void *arg, thread_state **thread){
  thread_state dummy;
  //Set up but don't start thread
  dummy.fork(fn, thread, arg, 0);
}

#endif

