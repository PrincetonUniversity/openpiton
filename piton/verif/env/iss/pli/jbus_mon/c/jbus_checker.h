// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: jbus_checker.h
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
#include "threaded_pli.h"
class jbus_check {
  transaction_types trans_types[40];
  transaction_class w_transaction;
  //snoop_fifo_class snoop_q;

  BIT reqs[7];
  BITS new_reqs[7];
  BIT arb_reqs[7];
  BITS new_arb_reqs[7];
  BITS reqs_double_delay[7];
  BIT space[128];
  BITS jpacks[7];
  int type_d, type_dd, type_ddd, type_dddd; /*Remember last four cycles - force to idle if not address cycles*/
  int port_d, port_dd, port_ddd, port_dddd; /*Remember last four cycles  - to make sure all types are from same port*/
  int local_ports_mask;
  int check_ctrl_parity;
  int reset_estar_on_soft_reset;
  int arthur_mode;
  int check_ad_parity;
  int force_x_in_dead_cycle;
  int dead_cycle;
  int force_zero_in_dead_cycle;
  int check_requests,   retime_par;
  int get_trans_type(BITS adtype, BITS ad);
  void next_cycle_POC(int ctrl=1, int ad=1, int reset=0, int post_reset=0);
  void next_cycle();
  void next_req_cycle(integer *driver , integer *new_driver);
  void handle_estar_change(void);
  int count_hi_bits(BITS val, int len=32);
  int         cycle_count, current_driver_id, next_driver_id, dead_cycles_enabled;
  BIT par_last, par_last_last;
  int drv_d2, drv_d, drv;
  int estar_div;
  int last_estar_div;
  int new_req_estar_div, req_estar_div, last_req_estar_div;
  int req_estar_countdown, pending_req_change;
public:
  thread_state *main_thread;
  jbus *bus;
  void check_reqs(void );
  void parity_checks(void);
  void jbus_checker(void );

};
void *j_checker_entry(void *arg);
