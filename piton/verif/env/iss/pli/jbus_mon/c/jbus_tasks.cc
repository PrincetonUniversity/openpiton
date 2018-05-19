// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbus_tasks.cc
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
***  Program File:  @(#)jbus_tasks.cc
***
***  Version Date:  05/16/01
***
****************************************************************************
****************************************************************************/

#include "pli_signal.h"
#include "jbus_tasks.h"
char *j_pack_string[9];
#define DISPMON_UNIT "jbus_tasks"
#define DISPMON_UNIT_STAT "jbus_tasks_stats"
#define DISPMON_TAG_DEBUG 19
#define DISPMON_TAG  9
//{{{  current driver
int current_driver(BIT req[7], int last_port_driver){

  integer i, id, current_driv;
  current_driv = last_port_driver;

  if (req[last_port_driver] == 0){
    id = current_driv;
    for (i=0; i<7; i++){
      if (req[id]){
        current_driv = id;
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "Changed current driver to %d", id);
        return current_driv;
      }
      if (id != 0)
        id--;
      else
        id = 6;
    }
  }
  return current_driv;
}
//}}}  
//{{{  statistics
int jbus_stats::snoop_delay(int port, unsigned long long int delay){
  if (snoop[port] == NULL)
    snoop[port] = new class port_stat;
  if (delay > snoop[port]->max || !snoop[port]->max_valid){
    snoop[port]->max_valid = 1;
    snoop[port]->max = delay;
  }
  if (delay < snoop[port]->min || !snoop[port]->min_valid){
    snoop[port]->min = delay;
    snoop[port]->min_valid = 1;
  }
  snoop[port]->misc_b++;
  snoop[port]->total += delay;
  return 0;
}
int jbus_stats::report(void){
  int i;
  for (i=0; i< MAX_BUS_MASTERS; i++)
    if (snoop[i] != NULL){
      if (!snoop[i]->max_valid || !snoop[i]->min_valid)
        dispmon(DISPMON_UNIT_STAT, DISPMON_TAG, DISPMON_FLAG, "port %d - no snoops", i);
      else
        dispmon(DISPMON_UNIT_STAT, DISPMON_TAG, DISPMON_FLAG, "port %d, min snoop %lld, max snoop %lld, average %3.3f, total cycles of delay = %lld, number =%lld", i,  snoop[i]->min, snoop[i]->max, (float)snoop[i]->total/(float)snoop[i]->misc_b,  snoop[i]->total, snoop[i]->misc_b);
    }
  for (i=0; i< MAX_BUS_MASTERS; i++)
    if (dok[i] != NULL){
      if (!dok[i]->max_valid || !dok[i]->min_valid)
        dispmon(DISPMON_UNIT_STAT, DISPMON_TAG, DISPMON_FLAG, "port %d - no doks", i);
      else
        dispmon(DISPMON_UNIT_STAT, DISPMON_TAG, DISPMON_FLAG, "port %d, min dok off %lld, max dok off %lld, average %3.3f, cycles off=%lld, number times off =%lld", i,  dok[i]->min, dok[i]->max, (float)dok[i]->total/(float)dok[i]->misc_b, dok[i]->total, dok[i]->misc_b);
    }
  for (i=0; i< MAX_BUS_MASTERS; i++)
    if (aok[i] != NULL){
      if (!aok[i]->max_valid || !aok[i]->min_valid)
        dispmon(DISPMON_UNIT_STAT, DISPMON_TAG, DISPMON_FLAG, "port %d - no aoks", i);
      else
        dispmon(DISPMON_UNIT_STAT, DISPMON_TAG, DISPMON_FLAG, "port %d, min aok off %lld, max aok off %lld, average %3.3f, cycles off=%lld, number times off=%lld", i,  aok[i]->min, aok[i]->max, (float)aok[i]->total/(float)aok[i]->misc_b, aok[i]->total, aok[i]->misc_b);
    }
  return 0;
}
int jbus_stats::aok_off(int id, unsigned long long int cycle){
  if (aok[id] == NULL)
    aok[id] = new class port_stat;
  aok[id]->misc_a = cycle;
  aok[id]->misc_b++;
  return 0;
}
int jbus_stats::aok_on(int id, unsigned long long int cycle){
  if (aok[id] == NULL){
    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "aok on from port %d without a previous aok off", id);
    return 1;
  }
  if (cycle - aok[id]->misc_a > aok[id]->max || !aok[id]->max_valid){
    aok[id]->max = cycle - aok[id]->misc_a;
    aok[id]->max_valid = 1;
  }
  if (cycle - aok[id]->misc_a < aok[id]->min || !aok[id]->min_valid){
    aok[id]->min = cycle - aok[id]->misc_a;
    aok[id]->min_valid = 1;
  }
  aok[id]->total += (cycle - aok[id]->misc_a);
  return 0;
}
int jbus_stats::dok_off(int id, unsigned long long int cycle){
  if (dok[id] == NULL)
    dok[id] = new class port_stat;
  dok[id]->misc_a = cycle;
  dok[id]->misc_b++;
  return 0;
}
int jbus_stats::dok_on(int id, unsigned long long int cycle){
  if (dok[id] == NULL){
    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "dok on from port %d without a previous dok off - might be reporting a fatal problem", id);
    return 1;
  }
  if (cycle - dok[id]->misc_a > dok[id]->max || !dok[id]->max_valid){
    dok[id]->max = cycle - dok[id]->misc_a;
    dok[id]->max_valid = 1;
  }
  if (cycle - dok[id]->misc_a < dok[id]->min || !dok[id]->min_valid){
    dok[id]->min = cycle - dok[id]->misc_a;
    dok[id]->min_valid = 1;
  }
  dok[id]->total += (cycle - dok[id]->misc_a);
  return 0;
}

//}}}  

//{{{  transaction_types
  transaction_types::transaction_types(void){
    read = 0;
    write = 0;
    read_return = 0;
    length = 0;
    valid = 0;
    snoop = 0;
    split_transaction = 0;
    memory_operation = 0;
    byte_mask = 0;
    long_string = (char *) "invalid transaction";
    short_string = (char *) "????  ";
    number_executed = 0;
  }
  void transaction_types::init(bit r, bit w, bit rr, int l, bit v, bit sn, bit sp,
       bit mem, bit by, char *lo, char *sh){
    read = r;
    write = w;
    read_return = rr;
    length = l;
    valid = v;
    snoop = sn;
    split_transaction = sp;
    memory_operation = mem;
    byte_mask = by;
    long_string = lo;
    short_string = sh;
  }
//}}}  
//{{{  snoop fifo
  void snoop_fifo_class::report_statistics(void){
    stats.report();
  }
  //{{{  reset queues
  void snoop_fifo_class::reset(int local_ports){
    int i;
    quiet = 1; //stops diagnostic messages being printed
    //clear any AOK/DOK offs
    for (i=0; i<7; i++){
      update_flow_control(i, P_AOK_ON, 0, local_ports);
      update_flow_control(i, P_DOK_ON, 0, local_ports);
    }
    //flush delay queue
    for (i=0; i < MAX_ADOK_RETIME; i++){
      flow_control_sample_and_delay();
    }
    for (i=0; i<FIFO_DEPTH; i++){
      set_valid(i, 0);
    }
    read = 0;
    write = 0;
    valid_masters_mask = 0;
    quiet = 0;
  }
  //}}}  
  //{{{  bit manipulation stuff
  BITS snoop_fifo_class::get_valid(int id){
    BITS ret=0;
    int i;

  //  for (i=FIFO_ENTRY_VALID_BIT; i>=0; i--){
  //    ret = ret << 1;
  //    ret = ret | valid[id][i];
  //  }
    return valid[id];
  }
  void snoop_fifo_class::set_valid(int id, BITS value){
    int i, a;
    int num_active;
    BITS old_entry_valid_bits = valid[id];
    valid[id] = value;
    if (get_bit(old_entry_valid_bits, FIFO_ENTRY_VALID_BIT) != get_bit(valid[id], FIFO_ENTRY_VALID_BIT)){
      num_active=0;
      for (i=0; i<FIFO_DEPTH; i++){
        if (get_bit(valid[i], FIFO_ENTRY_VALID_BIT))
          num_active++;
      }
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "We now have %d active snoop entries - altered %d to %d", num_active, id, get_bit(valid[id], FIFO_ENTRY_VALID_BIT));
    }
  }
  BIT get_bit(BITS val, int position){
    return (val >> position) & 1;
  }
  BITS set_bit(BITS val, int to, int position){
    int mask;
    mask = ~ (1 << position);
    to = to << position;
    return (val & mask) | to;
  }
  //}}}  


  //{{{  pack checking stuff
  void snoop_fifo_class::get_present_master(int id, BITS ack){
    if (ack == P_PRESENT){
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "jbus master %d is present", id);
      valid_masters_mask = set_bit(valid_masters_mask, 1, id);
    }else if (ack == P_NOT_PRESENT){
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "jbus master %d is absent", id);
    }else
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jbus master %d has invalid jpacks for presence test = %d", id, ack);
  }
  int snoop_fifo_class::is_present(int id){
    return get_bit(valid_masters_mask, id);
  }

  int snoop_fifo_class::check_ack(int id, BITS ack){
    if (is_present(id) == 0){
      if (ack != P_NOT_PRESENT){
        dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jpacks have changed for an absent jbus master - id %d, jpacks=%d", id, ack);
      }
      return 0;
    }
    return 1;
  }
  //}}}  

  //{{{  is_snoop / is_flow_control
  int snoop_fifo_class::is_snoop(BITS ack){
    return (ack == P_COHACK || ack == P_COHACKD || ack == P_COHACKS);
  }

  //}}}  

  //{{{  flow control stuff
  int snoop_fifo_class::is_flow_control(BITS ack){
    return (ack == P_AOK_OFF || ack == P_AOK_ON || ack == P_DOK_OFF || ack == P_DOK_ON);
  }
  int snoop_fifo_class::aok_disabled(void){
    return aok_off != 0;
  }
  int snoop_fifo_class::dok_disabled(int id){
    if (id != -1)
      return get_bit(dok_off, id);
    else
      return dok_off != 0;
  }
  void snoop_fifo_class::update_flow_control(int id, BITS ack, unsigned long long int cycle, int local_ports){
    int entry_point, i;
    if (local_ports == 0x7f) /*If system with Bell chip in it*/
      entry_point = AOK_RETIME - 1;
    else
      entry_point = AOK_RETIME + 1;
    switch(ack){
      case P_AOK_OFF:
        if (!quiet) dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "AOK disabled by port %d", id);
        aok_retime[entry_point] = set_bit(aok_retime[entry_point], 1, id);
        if (!quiet)
          stats.aok_off(id, cycle);
        break;
      case P_AOK_ON:
        if (!quiet) dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "AOK enabled by port %d", id);
        aok_retime[entry_point] = set_bit(aok_retime[entry_point], 0, id);
        if (!quiet)
          stats.aok_on(id, cycle);
        break;
      case P_DOK_OFF:
        if (!quiet) dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "DOK disabled by port %d", id);
        dok_retime[entry_point] = set_bit(dok_retime[entry_point], 1, id);
        if (!quiet)
          stats.dok_off(id, cycle);
        break;
      case P_DOK_ON:
        if (!quiet) dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "DOK enabled by port %d", id);
        dok_retime[entry_point] = set_bit(dok_retime[entry_point], 0, id);
        if (!quiet)
          stats.dok_on(id, cycle);
        break;
      default:
        dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "Invalid AOK/DOK value (%d)", ack);
        break;
    }
  }
  void snoop_fifo_class::flow_control_sample_and_delay(void){
    int i;
    dok_off = dok_retime[0];
    aok_off = aok_retime[0];
    for (i=0; i<(MAX_ADOK_RETIME - 1); i++){
      if (i < (DOK_RETIME - 1))
        dok_retime[i] = dok_retime[i+1] & dok_retime[DOK_RETIME - 1];
      if (i < (AOK_RETIME - 1))
        aok_retime[i] = aok_retime[i+1] & aok_retime[AOK_RETIME - 1];
    }
  }
  //}}}  
  //{{{  new
  snoop_fifo_class::snoop_fifo_class(){
    integer i;
    read = 0;
    write = 0;
    valid_masters_mask = 0;
    for (i=0; i<FIFO_DEPTH; i++)    {
      valid[i] = 0;
      share[i] = 0;
      dirty[i] = 0;
      cancelled_own[i] = 0;
      transactions[i] = NULL;
    }
    dok_off = 0;
    aok_off = 0;
    for (i=0; i<3; i++){
      dok_retime[i] = 0;
      aok_retime[i] = 0;
    }
  }
  //}}}  
  //{{{  add pack
  integer snoop_fifo_class::add_pack(integer id, BITS ack, integer *dirty_port, integer *share_port,
    integer *req_id, integer *resp_id, integer *trans_id, int *is_split_transaction, integer *no_copyback, unsigned long long int cycle_number){
    integer ptr;
    BITS valids;

    //find first entry from this port which hasn't been acked yet
    ptr = read;
    valids = get_valid(ptr);
    while ((get_bit(valids, id) || (get_bit(valids, FIFO_ENTRY_VALID_BIT) == 0)) && ptr != write){
      ptr = (ptr  + 1) % FIFO_DEPTH;
      valids = get_valid(ptr);
    }
    //check we haven't gone through all the entries
    if (ptr == write)
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "snoop fifo is empty - too many jpacks on port %d for number of snoops", id);
    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, "%s handshake received from id %d", j_pack_string[ack], id);
    if (transactions[ptr] != NULL){
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, " address, %011llx, identifier=%lld\n", transactions[ptr]->address, transactions[ptr]->transaction_count);
    }else{
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, WRITEMON_FLAG, "\n");
      //transaction purposely not valid if a write transaction
      if (cancelled_own[ptr] && split_transaction[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "late snoop response - dirty data already returned - completing here");
      else if (split_transaction[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "snoop queue entry does not match to a valid request");
    }
    valids = set_bit(valids, 1, id);
    set_valid(ptr, valids);
    if (ack == P_COHACKD){
      if (dirty[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "dirty reported by two ports, previously %d and now %d", port_id[ptr], id);
      if (share[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "dirty snoop reported by %d when shared has already been reported by another port", id);
      dirty[ptr] = 1;
      port_id[ptr] = id;
      if (transactions[ptr] != NULL && split_transaction[ptr]){
        transactions[ptr]->snoop_result_known = 1;
        transactions[ptr]->returning_id = id;
        if (
          ((((req_port_id[ptr] ^ get_agent_id(id)) & get_agent_mask(id)) == 0) ||
          (((req_port_id[ptr] ^ get_agent_id_alt(id)) & get_agent_mask_alt(id)) == 0))
          && transactions[ptr]->type == TTYPE_OWN){
          cancelled_own[ptr] = 1;
          transactions[ptr]->possibly_cancelled_read = 1;
          dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "marking identifier=%lld as complete as port %d still owns line ", transactions[ptr]->transaction_count, id);
        }
      }
    }else if (ack == P_COHACKS){
      if (share[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "share reported by more than one port, now %d", id);
      if (dirty[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "shared snoop reported by %d when dirty has already been reported by port %d", id, port_id[ptr]);
      share[ptr] = 1;
    }
    stats.snoop_delay(id, cycle_number - cycle_count[ptr]);
    if (get_valid(ptr) == (valid_masters_mask | (1 << FIFO_ENTRY_VALID_BIT))){
      //if we now have all the acks for this transaction we can remove it from the fifo
      *dirty_port = dirty[ptr];
      *share_port = share[ptr];
      *req_id = req_port_id[ptr];
      *resp_id = port_id[ptr];
      *trans_id = trans_q_id[ptr];
      *is_split_transaction = split_transaction[ptr];
      *no_copyback = cancelled_own[ptr];
      if (transactions[ptr] != NULL && split_transaction[ptr]){
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "all snoops received for request from %d, transaction %d, identifier=%lld", *req_id, *trans_id, transactions[ptr]->transaction_count);
        transactions[ptr]->snoop_result_known = 1;
      }
      if (share[ptr] && dirty[ptr])
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "snoop fifo has dirty and share tags set");

      //clear all valid bits so entry can be reused
      set_valid(ptr, 0);
      if (split_transaction[ptr])
        transactions[ptr] = NULL;
      //move read pointer to newer entry if we have removed newest one
      if (ptr == read)
        read = (read + 1) % FIFO_DEPTH;
      return 1;
    }

    return 0;
  }
  //}}}  
  //{{{  close_snoop_entry
  void snoop_fifo_class::close_snoop_entry(transaction_class *transaction){
    BITS  valids;
    if (transactions[transaction->snoop_q_ptr] == transaction){
      valids = get_valid(transaction->snoop_q_ptr);
      if (get_bit(valids, FIFO_ENTRY_VALID_BIT)){
        dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "snoops completing after read data returned for identifier=%lld ", transaction->transaction_count);
        cancelled_own[transaction->snoop_q_ptr] = 1;
        transactions[transaction->snoop_q_ptr] = NULL;
      }
    }
  }
  //}}}  

  //{{{  add transaction
  void snoop_fifo_class::add_transation(integer id, integer class_id, int is_split_transaction, transaction_class *transaction, unsigned long long int cycle_number){
    BITS  valids;

    valids = get_valid(write);
    if (get_bit(valids, FIFO_ENTRY_VALID_BIT)){
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "snoop fifo still contains old transactions when trying to add a new one");
    }
    valids = set_bit(0, 1, FIFO_ENTRY_VALID_BIT);
    dirty[write] = 0;
    share[write] = 0;
    req_port_id[write] = id;
    trans_q_id[write] = class_id;
    split_transaction[write] = is_split_transaction;
    if (is_split_transaction){
      if (transaction != NULL){
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "putting transaction info for addr %011llx into snoop q entry %d", transaction->address, write);
      }else{
        dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "adding null transaction");
      }
      transaction->snoop_q_ptr = write;
      transactions[write] = transaction;
      transaction->snoop_result_known = 0;
    }
    cycle_count[write] = cycle_number;
    cancelled_own[write] = 0;
    set_valid(write, valids);
    write = (write + 1) % FIFO_DEPTH;
  }

  //}}}  
  //{{{  check_snoop_timing
  void snoop_fifo_class::check_snoop_timing(unsigned long long int cycle_number, int snoop_timeout){
    int valids, i;
    integer ptr;
    ptr = read;
    valids = get_valid(ptr);
    while (get_bit(valids, FIFO_ENTRY_VALID_BIT) == 0 && ptr != write){
      ptr = (ptr  + 1) % FIFO_DEPTH;
      valids = get_valid(ptr);
    }
    if (get_bit(valids, FIFO_ENTRY_VALID_BIT)){
      if ((int)(cycle_number - cycle_count[ptr]) > snoop_timeout){
        int done=0;
        for (i=0; i< FIFO_ENTRY_VALID_BIT; i++){
          if (!get_bit(valids, i) && is_present(i)){
            if (transactions[ptr] != NULL){
              dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "snoop timeout - port %d has not handshaken snoop for address %011llx, within %d cycles (alter timout using -verarg +jbus_snoop_timeout<value>)",
                i, transactions[ptr]->address, snoop_timeout);
              dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "snoop timeout - port %d has not handshaken snoop for address %011llx, identifier=%lld within %d cycles (alter timout using -verarg +jbus_snoop_timeout<value>)",
                i, transactions[ptr]->address, transactions[ptr]->transaction_count, snoop_timeout);
            }else{
              dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "snoop timeout - port %d has not handshaken snoop for address (null) (probably a write invalidate), within %d cycles (alter timout using -verarg +jbus_snoop_timeout<value>)",
                i, snoop_timeout);
            }
            done = 1;
          }
        }
        if (!done)
          dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "monitor internal error - active entry in snoop queue when all handshakes had been returned - identifier=%lld", transactions[ptr]->transaction_count);
      }
    }
    while (ptr != write){
      valids = get_valid(ptr);
      if (!get_bit(valids, FIFO_ENTRY_VALID_BIT)){
        dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "consistency check failed - younger snoops have completed before the oldest");
        return;
      }
      ptr = (ptr  + 1) % FIFO_DEPTH;
    }
  }
  //}}}  
  //{{{  search_snoop_queue
  int snoop_fifo_class::search_snoop_queue(unsigned long long int addr){
    integer ptr;
    int match = 0, valids;
    ptr = read;
    while (ptr != write){
      valids = get_valid(ptr);
      if (!get_bit(valids, FIFO_ENTRY_VALID_BIT)){
        dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "consistency check failed - snoop q contains invalid entries");
      }else{
        if (transactions[ptr] != NULL){
          dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "entry %d, addr %011llx, valid flags %x", ptr, transactions[ptr]->address, valids, dirty[ptr]);
          if ((addr & ~0x3f) == (transactions[ptr]->address & ~0x3f)){
            match = 1;
          }
        }else
          dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "entry %d, addr (null), valid flags %x", ptr, valids, dirty[ptr]);
      }
      ptr = (ptr  + 1) % FIFO_DEPTH;
    }
    return match;
  }
  //}}}  

//}}}  
//{{{  transaction_class
  transaction_class::transaction_class(){
    possibly_cancelled_read = 0;
    returning_id_valid = 0;
    valid = 0;
  }

//}}}  

//{{{  init

void init_routine(transaction_types *trans_types){

  j_pack_string[P_IDLE]     = (char *) "--";
  j_pack_string[P_COHACK]   = (char *) "AK";
  j_pack_string[P_COHACKS]  = (char *) "AS";
  j_pack_string[P_COHACKD]  = (char *) "AD";
  j_pack_string[P_AOK_OFF]  = (char *) "A-";
  j_pack_string[P_AOK_ON]   = (char *) "A+";
  j_pack_string[P_DOK_OFF]  = (char *) "D-";
  j_pack_string[P_DOK_ON]   = (char *) "D+";
  j_pack_string[P_INVALID]  = (char *) "??";

  //init(bit r, bit w, bit rr, int l, bit v, bit sn, bit sp,
  //     bit mem, bit by, char *lo, char *sh){
  trans_types[TTYPE_IDLE].init     (0, 0, 0, 1, 1, 0, 0, 0, 0, 
		(char *) "IDLE", (char *) "IDLE");
  trans_types[TTYPE_RD].init       (1, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "Read", (char *) "RD");
  trans_types[TTYPE_RDD].init      (1, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "ReadToDiscard", (char *) "RDD");
  trans_types[TTYPE_RDS].init      (1, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "ReadToShare", (char *) "RDS");
  trans_types[TTYPE_RDSA].init     (1, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "ReadToShareAlways", (char *) "RDSA");
  trans_types[TTYPE_RDO].init      (1, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "ReadToOwn", (char *) "RDO");
  trans_types[TTYPE_OWN].init      (1, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "Ownership", (char *) "OWN");
  trans_types[TTYPE_INV].init      (0, 0, 0, 1, 1, 1, 1, 1, 0, 
		(char *) "Invalidate", (char *) "INV");
  /*new transaction added for Niagara support*/
  //trans_types[TTYPE_CWR].init      (0, 1, 0, 2, 1, 1, 0, 1, 1, 
  //	(char *) "SublineCoherentWrite", (char *) "CWR");

  trans_types[TTYPE_NCWRC].init    (0, 1, 0, 2, 1, 0, 0, 1, 1, 
		(char *) "NonCachedWriteCompressed", (char *) "NCWRC");
  /*new transaction added for Niagara support*/
  trans_types[TTYPE_WRM].init      (0, 1, 0, 5, 1, 1, 0, 1, 1, 
		(char *) "WriteUnderMask", (char *) "WRM");

  trans_types[TTYPE_WRB].init      (0, 1, 0, 5, 1, 0, 0, 1, 0, 
		(char *) "Writeback", (char *) "WRB");
  trans_types[TTYPE_WRBC].init     (0, 1, 0, 5, 1, 0, 0, 1, 0, 
		(char *) "WritebackCancelled", (char *) "WRBC");
  trans_types[TTYPE_WRI].init      (0, 1, 0, 5, 1, 1, 0, 1, 0, 
		(char *) "WriteInvalidate", (char *) "WRI");
  trans_types[TTYPE_WRIS].init     (0, 1, 0, 5, 1, 1, 0, 1, 0, 
		(char *) "WriteInvalidateSelf", (char *) "WRIS");
  trans_types[TTYPE_NCRD].init     (1, 0, 0, 1, 1, 0, 1, 1, 1, 
		(char *) "NonCachedRead", (char *) "NCRD");
  trans_types[TTYPE_NCBR].init     (1, 0, 0, 1, 1, 0, 1, 1, 0, 
		(char *) "NonCachedBlockRead", (char *) "NCBR");
  trans_types[TTYPE_NCWR].init     (0, 1, 0, 2, 1, 0, 0, 1, 1, 
		(char *) "NonCachedWrite", (char *) "NCWR");
  trans_types[TTYPE_NCBWR].init    (0, 1, 0, 5, 1, 0, 0, 1, 0, 
		(char *) "NonCachedBlockWrite", (char *) "NCBWR");
  trans_types[TTYPE_INT].init      (0, 0, 0, 5, 1, 0, 0, 0, 0, 
		(char *) "InterruptRequest", (char *) "INT");
  trans_types[TTYPE_INTACK].init   (0, 0, 0, 1, 1, 0, 0, 0, 0, 
		(char *) "InterruptAck", (char *) "IACK");
  trans_types[TTYPE_INTNACK].init  (0, 0, 0, 1, 1, 0, 0, 0, 0, 
		(char *) "InterruptNack", (char *) "INACK");
  trans_types[TTYPE_XIR].init      (0, 0, 0, 1, 1, 0, 0, 0, 0, 
		(char *) "ExternalReset", (char *) "XIR");
  trans_types[TTYPE_FREEZE].init   (0, 0, 0, 1, 0, 0, 0, 0, 0, 
		(char *) "Freeze", (char *) "FREEZ");
  trans_types[TTYPE_FREEZEACK].init(0, 0, 0, 1, 0, 0, 0, 0, 0, 
		(char *) "FreezeAck", (char *) "FRZAK");
  trans_types[TTYPE_CHANGE].init   (0, 0, 0, 1, 1, 0, 0, 0, 0, 
		(char *) "Change", (char *) "CHNGE");
  trans_types[TTYPE_RET_16].init   (0, 0, 1, 1, 1, 0, 0, 0, 0, 
		(char *) "ReturnDataSingle", (char *) "READ1");
  trans_types[TTYPE_RET_64].init   (0, 0, 1, 4, 1, 1, 0, 0, 0, 
		(char *) "ReturnDataFour", (char *) "READ4");
  trans_types[TTYPE_RET_ERR].init  (0, 0, 1, 1, 1, 0, 0, 0, 0, 
		(char *) "ReturnDataError", (char *) "RDERR");

}
//}}}  
//{{{  check_bits_valid
void check_bits_valid(bit * bits, integer finish, integer start){
  integer j;
  for (j=start; j<finish; j++){
    if (bits[j] != 0 && bits[j] != 1){
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "invalid bits present");
    }
  }
}
//}}}  
//{{{  get address owner
BITS get_address_owner(BITS address){
  int agent_id = (address >> 36) & 0xe; //Get agent id
 // dispmon(DISPMON_UNIT, 0, DISPMON_FLAG, "address is %llx", address);
  if (get_bit(address, 42) == 0 && (get_bit(address, 40) || get_bit(address, 39) || get_bit(address, 38))){
    //agent id can be one of six CPUs, also allows I/O bridges
    //   if (addr > 5 && addr != 8 && addr != 12)
    //  dispmon(DISPMON_UNIT, DISPMON_TAG_WARNING, DISPMON_FLAG, "cacheable access to address %011llx does not map onto any jbus masters", address);
    //Niagara Support: agent id can be Cpu 0-7, I/O bridges 0 and 1
    if ((agent_id > 7) && (agent_id != 12) && (agent_id != 14))
      dispmon(DISPMON_UNIT, DISPMON_TAG_WARNING, DISPMON_FLAG, "cacheable access to address %011llx does not map onto any jbus masters", address);
  }

  if (get_bit(address, 42) && !get_bit(address, 41)){
    //if a[42] and a[41] not set, this is a config access to 8Mbyte noncacheable space
    agent_id = (address >> 23) & 0x1f;
    if((agent_id >= 1) && (agent_id <= 7)) //for Niagara Support: req 0 is used for cpu 0-7
      return 0;
    return (address >> 23) & 0x1f;
  }
  else{
    //normal cached/noncached access
    agent_id = (address >> 36) & 0x1f;
    if((agent_id >= 1) && (agent_id <= 7)) //for Niagara Support: req 0 is used for cpu 0-7
      return 0;
    return (address >> 36) & 0x1f;
  }
}
int is_cacheable_address(BITS address){
  return get_bit(address, 42) == 0;
}

BITS get_agent_id (int current_driver){
  switch (current_driver){
    case 0: return 0;
    case 1: return 1;
    case 2: return 2;
    case 3: return 3;
    case 4: return 0x4;
    case 5: return 0xe;
    case 6: return 8;
    default: dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "invalid port id (%d) - cannot convert to an agent id", current_driver);
  }
  return 0;
}

BITS get_agent_id_alt (int current_driver){
  switch (current_driver){
    case 0: return 0;
    case 1: return 1;
    case 2: return 2;
    case 3: return 3;
    case 4: return 0x4;
    case 5: return 0xe;
    case 6: return 5;
    default: dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "invalid port id (%d) - cannot convert to an agent id", current_driver);
  }
  return 0;
}

BITS get_agent_mask (int current_driver){
  switch (current_driver){
    case 0:
    case 1:
    case 2:
    case 3: return 0xf;
    case 4: return 0x4;
    case 5: return 0xe;
    case 6: return 0xc;
  }
  return 0;
}

BITS get_agent_mask_alt (int current_driver){
  switch (current_driver){
    case 0:
    case 1:
    case 2:
    case 3: return 0xf;
    case 4: return 0x4;
    case 5: return 0xe;
    case 6: return 0xf;
  }
  return 0;
}

int agent_to_id (BITS agent_id){
 // dispmon(DISPMON_UNIT, 0, DISPMON_FLAG, "agent id is %llx", agent_id);

  if (agent_id & 0xc){
    if ((agent_id & 0xf) == 4)
      //cpu 5
      return 4;
    if ((agent_id & 0xf) == 5)
      //cpu 6
      return 6;
    if ((agent_id & 0xc) == 8)
      return 6;
    if ((agent_id & 0xe) == 0xe)
      //addr x111x
      return 5;
    if ((agent_id & 0xe) == 0xc)
      //addr x110x
      return 4;
  }else
    //addr x0000->x0011
    return agent_id & 3;
}
//}}}  
int get_new_estar_div(int old_div, int old_old_div){
  char *str;
  if ((str = mc_scan_plusargs((char *)"jbus_estar_div_")) != NULL){
    if (!strcmp(str, "all")){
      //{{{  transition through speeds as per arthur spec
      switch(old_div){
        case 1:
        case 32:
          return 2;
        case 2:
          switch(old_old_div){
            case 1: return 32;
            case 32: return 1;
            default: dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "bad estar transition sequence %d to %d", old_old_div, old_div);
              break;
          }
          break;
        default: dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "bad estar transition setting %d", old_div);
          break;
      }
      //}}}  
    }else{
      //{{{  switch between two speeds
      if(old_div != 1){
        dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "returning to full speed operation");
        return 1;
      }
      switch(atoi(str)){
        case 2:
          dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "changing to /2 mode");
          return 2;
        case 32:
          dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "changing to /32 mode");
          return 32;
        default: dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "bad estar transition setting +jbus_estar_div_%d", atoi(str));
          break;
      }
      //}}}  
    }
  }else{
    //{{{  default of switch between 1 and 32
    if (old_div == 32){
      dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "changing to /1 mode");
      return 1;
    }else{
      dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "changing to /32 mode");
      return 32;
    }
    //}}}  
  }
}
int get_estar_delay(void){
  char *str;
  if ((str = mc_scan_plusargs((char *)"jbus_estar_delay")) != NULL){
    dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "using estar delay of %d cycles", strtol(str, NULL, 10));
    return strtol(str, NULL, 10);
  }else return 0;
}

