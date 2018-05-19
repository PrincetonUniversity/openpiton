// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: sim_info.h
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
#define MAX_INST_NAME_SIZE 100
class global_sim_info{
  char inst_name[MAX_INST_NAME_SIZE+1];
  unsigned long long sim_time;
  int thread_exit_status;
  public:
  void set_inst_name(char *name);
  char *get_inst_name(void);
  void set_sim_time(unsigned long long time);
  void set_sim_time(unsigned int time);
  unsigned int get_sim_time(void);
  unsigned long long int get_long_sim_time(void);
  void set_exit(void);
  int get_exit(void);
  global_sim_info(void);
};

extern int get_time (int x);
#define CHECK 1
extern int get_plus_arg(int check, char *arg);
extern "C" char             *mc_scan_plusargs(char *);

#define terminate sim_info.set_exit();
