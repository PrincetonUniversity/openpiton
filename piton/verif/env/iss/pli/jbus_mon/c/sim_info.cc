// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sim_info.cc
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
#include "veriuser.h"
#include "tf_proto_cc.h"
#include "sim_info.h"
#include <string.h>
global_sim_info::global_sim_info(void){
  inst_name[0] = '\0';
  sim_time = 0;
  thread_exit_status = 0;
}

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
