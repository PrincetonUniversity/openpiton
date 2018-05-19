// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: threaded_pli.h
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
#include <thread.h>
#include <semaphore.h>
#ifndef THREADED_PLI_H
#define THREADED_PLI_H
class thread_state {
  private:
  int new_thread;
  int first_cycle;
  int thread_exit_status;
  sem_t sem;
  sem_t sem_ack;
  public:
  class thread_state *next, *parent;
  thread_t thread_id;
  thread_state(void);
  void wait_next_cycle(void) ;
  //void wait_next_cycle(char *unit, enum port_ids id, int top_bit, int bottom_bit, BIT64 expected) ;
  void new_cycle(void);
  void fork(void *(fn)(void *), thread_state **parent, void *, int start=1);
};
#endif
