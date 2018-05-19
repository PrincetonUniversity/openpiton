// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbus_interface.cc
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

#ifdef LINUX
#else

#include "jbus.h"
#include "jbus_tasks.h"
#include "jbus_mon.h"
#include "jbus_checker.h"
// #include "sim_info.h"
// class global_sim_info sim_info;

/*{{{  monitor i/f stuff*/
jbus_mon mon_info;

extern "C" void new_jbus_mon_cycle(void) {
  // sim_info.get_exit();
  // sim_info.set_inst_name(tf_mipname());
  // sim_info.set_sim_time((unsigned long long)tf_gettime());
   mon_info.bus->InputValues();
}

extern "C" void update_jbus_mon_outputs(void) {
  // sim_info.get_exit();
  // sim_info.set_inst_name(tf_mipname());
  // sim_info.set_sim_time((unsigned long long)tf_gettime());
   mon_info.bus->OutputValues_mon();
}

extern "C" void jbus_mon_reset_change() {
  //   sim_info.get_exit();
  // mon_info.reset_change();
}

extern "C" void jbus_mon_do_finish(){
        mon_info.finish();
}
extern "C" void jbus_mon_init(int data, int reason){
  static int started, done_finish;
  switch (reason) {
    case reason_finish:
    /*  if (!done_finish){
        done_finish = 1;
      }
      break; */
    default:
      if (!started){
        mon_info.bus->fork(j_mon_entry, &mon_info, &mon_info.main_thread);
        mon_info.bus = new jbus(mon_info.main_thread);
        thr_continue(mon_info.main_thread->thread_id);
        started = 1;
      }
      break;
  }
}
/*}}}  */
/*{{{  check i/f stuff*/
jbus_check check_info;

extern "C" void new_jbus_check_cycle(void) {
 //  sim_info.get_exit();
 //  check_info.new_cycle();
  check_info.bus->InputValues();

}

extern "C" void jbus_check_reset_change() {
 //  sim_info.get_exit();
 //  check_info.reset_change();

}

extern "C" void update_jbus_check_outputs(void) {
   check_info.bus->OutputValues_check();
}

extern "C" void jbus_check_init(int data, int reason){
  static int started;
  switch (reason) {
    case reason_finish:
      break;
    default:
      if (!started){
        check_info.bus->fork(j_checker_entry, &check_info, &check_info.main_thread);
        check_info.bus = new jbus(check_info.main_thread);
        thr_continue(check_info.main_thread->thread_id);
        started = 1;
      }
      break;
  }
}
/*}}}  */

#endif

