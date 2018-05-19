// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: threaded_pli.cc
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

#include "threaded_pli.h"
#include "errno.h"
#include "stdlib.h"
#include "stdio.h"
thread_state::thread_state(void) {
  next = NULL;
  new_thread = 1;
  first_cycle = 1;
  thread_exit_status = 0;
  parent = NULL;
}

void thread_state::wait_next_cycle(void){
  int i, b, c;
  if (!first_cycle)
    sem_post(&sem_ack);
  else
    first_cycle = 0;
  if (thread_exit_status)
    thr_exit(NULL);
  i = 0;
  b = sem_wait(&sem);
  while (b != 0 && i++ < 10){
    if (b != 0)
      c = errno;
    b = sem_wait(&sem);
  }
  if (i != 0)
    printf("Received error from sem_wait %d, retried OK\n", c);
  if (b != 0){
    printf("Semaphore failure - retries failed - cannot continue\n");
    abort();
  }
}

void thread_state::fork(void *(fn)(void *), thread_state **par, void *arg, int start){
  thread_state *th, *ptr;

  th = new class thread_state;
  th->parent = *par;
  sem_init(&th->sem_ack, 0, 0);
  sem_init(&th->sem, 0, 0);
  th->next = NULL;
  thr_create(0, 0, (void*(*)(void*))fn, arg,
                   THR_SUSPENDED, &th->thread_id);

  if (*par != NULL){
    ptr = *par;
    while (ptr->next != NULL)
      ptr = ptr->next;
    ptr->next = th;
  }else
    //First call - this is setting up the parent
    *par = th;
  if (start)
    thr_continue(th->thread_id);
}
void thread_state::new_cycle(void){
  thread_state *th;
  int i, b, c;
 // sim_info.set_inst_name(tf_mipname());
 // sim_info.set_sim_time((unsigned long long)tf_gettime());

  th = this;
  while (th!=NULL){
    sem_post(&th->sem);
    th->new_thread = 0;
    th = th->next;
  }

  th = this;
  while (th!=NULL){
    if (!th->new_thread){
      i = 0;
      b = sem_wait(&th->sem_ack);
      while (b != 0 && i++ < 10){
        if (b != 0)
          c = errno;
        b = sem_wait(&th->sem_ack);
      }
      if (i != 0)
        printf("Received error from sem_wait %d, retried OK\n", c);
      if (b != 0){
        printf("Semaphore failure - retries failed - cannot continue\n");
        abort();
      }
    }
    th = th->next;
  }
}

#endif

