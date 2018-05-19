// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: jbus_mon.h
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
class jbus_mon {
  transaction_types trans_types[40];
  transaction_class transactions[MAX_TRANS_ENTRIES * MAX_BUS_MASTERS];
  snoop_fifo_class snoop_q;
  jbus_stats stats;
  BIT space[128];
  BIT reqs[7];
  BIT reqs_double_delay[7];
  int to_integer(bit * bus, int invalid);
  void line_start();
  void print_header();
  void print_start_of_line ();
  void handle_packs(BITS *jpacks);
  void jbus_mon::sample_valid_masters(void);
  void next_cycle();
  void next_cycle_POC(int reset=0);
  void handle_estar_change();
  int compare_agent_to_jbus_id(int agent, int jid);
  char *construct_data(char *ptr, BIT  *byte_enables);
  unsigned long long int         cycle_count;
  int reset_estar_on_soft_reset;
  int bus_stalled, bus_stalled_last;
  int local_ports_mask;
  int current_driver_id, current_driver_id_d, next_driver_id;
  int dead_cycles_enabled, logfile_line_start, arthur_mode;
  int logfile_enabled, snoop_timeout;
  int estar_div, estar_change;
  int last_estar_div;
  FILE *logfileid;
public:
  thread_state *main_thread;
  jbus *bus;
  void jbus_monitor(void );
  void finish(void );

};
void *j_mon_entry(void *arg);
