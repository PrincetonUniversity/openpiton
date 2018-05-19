// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: jbus.h
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
#include "pli_signal.h"
#ifdef D_REENTRANT
#include "threaded_pli.h"
#endif
class mt_Signal : public Signal{
  class thread_state *bus_thread;
  public:
  void wait_for_event(BITS value, int timeout) ;
  void wait_for_event(BITS *value, int timeout) ;
  void wait_next_cycle(void) ;
mt_Signal(int arg_no, thread_state *)                 ;
mt_Signal(int arg_no, thread_state *, int state)      ;
mt_Signal(int arg_no, thread_state *, int top, int bottom) ;

};

class jbus {
#ifdef D_REENTRANT
  int return_status;
  int new_thread;
#endif
public:
  class thread_state *t_state;
  mt_Signal *j_req_out_l_0;
  mt_Signal *j_req_out_l_1;
  mt_Signal *j_req_out_l_2;
  mt_Signal *j_req_out_l_3;
  mt_Signal *j_req_out_l_4;
  mt_Signal *j_req_out_l_5;
  mt_Signal *j_req_out_l_6;
  mt_Signal *j_ad;
  mt_Signal *j_adtype;
  mt_Signal *j_adp;
  mt_Signal *j_ad_out;
  mt_Signal *j_adtype_out;
  mt_Signal *j_adp_out;
  mt_Signal *j_pack0;
  mt_Signal *j_pack1;
  mt_Signal *j_pack2;
  mt_Signal *j_pack3;
  mt_Signal *j_pack4;
  mt_Signal *j_pack5;
  mt_Signal *j_pack6;
  mt_Signal *j_par;
  mt_Signal *j_rst;
  mt_Signal *j_por;
  mt_Signal *valid_ports;
  mt_Signal *j_err;
  mt_Signal *j_change;
  mt_Signal *bus_is_idle;
  mt_Signal *uncompleted_accesses;
  mt_Signal *transaction_name;
  jbus(thread_state *thread = NULL);
  int InputValues();
  int OutputValues_mon();
  int OutputValues_check();
  void fork(void *(fn)(void *), void *arg=NULL);
  void fork(void *(fn)(void *), void *arg, thread_state **thread);
};
