// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: jbus_checker.cc
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
***  Program File:  @(#)jbus_checker.cc
***
***  Version Date:  08/29/02
***
***  Bus protocol checker for Jbus
****************************************************************************
****************************************************************************/

#ifdef LINUX
#else

#include <stdlib.h>
#include <string.h>
#define DISPMON_TAG  9
#define DISPMON_TAG_DEBUG  16
#define DISPMON_TAG_DEBUG_DEBUG  15
#define DISPMON_UNIT "checker_inc"
#include "jbus.h"
#include "jbus_interface.h"
#include "jbus_tasks.h"
#include "jbus_checker.h"
#undef DISPMON_UNIT
//static char dbg_buff[100], *ptr, dbg_str[100];
//char *DISPMON_UNIT(char *str, int line) { strcpy(dbg_buff, str); strcat(dbg_buff, lltostr((long long)line, dbg_str)); return dbg_buff;}
#define DISPMON_UNIT "jbus_check"
#define DISPMON_UNIT_MEM "jbus_check_mem"
#define DISPMON_UNIT_WRITES "jbus_check_writes"
#define DISPMON_UNIT_J_ERR "jbus_check_jerr"
#define DISPMON_UNIT_J_RESET "jbus_check_reset"
#define DISPMON_UNIT_BAD_TRANSACTION "jbus_check_bad_transaction"
#define DISPMON_UNIT_BACK_TO_BACK "jbus_check_back_to_back"
#define DISPMON_UNIT_BAD_AD_127_64 "jbus_check_bad_ad_127_64"
//{{{  tasks
void jbus_check::handle_estar_change(void){
  int i, delay;
  if ((delay = get_estar_delay())){
    for (i=0; i<delay; i++)
      next_cycle_POC();
  }
  for (i=0; i<32; i++){
    next_cycle_POC();
  }

  if (last_estar_div == -1){
    /*Signifies a reset happened since last estar, and we wish to go restart the sequence*/
    estar_div = 1;
    last_estar_div = 1 ;
  }
  i = estar_div;
  estar_div = get_new_estar_div(estar_div, last_estar_div);
  last_estar_div = i;
 // next_cycle_POC();
}
//{{{  next cycle POC
//This bundles all the cycle based stuff into one place
void jbus_check::next_cycle_POC(int ctrl_p_check, int ad_p_check, int reset_check, int post_reset_check){
  int a, par, this_type;
  int i;
  cycle_count++;
  BIT req[7];
  if (reset_check && !bus->j_adtype->Valid())
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_adtype invalid during reset sequence");
  if (reset_check && !bus->j_ad->Valid())
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_ad invalid during reset sequence");
  if (reset_check && !bus->j_adp->Valid())
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_adp invalid during reset sequence");
  if (post_reset_check && !bus->j_pack0->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack0 invalid during post reset sequence");
  if (post_reset_check && !bus->j_pack1->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack1 invalid during post reset sequence");
  if (post_reset_check && !bus->j_pack2->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack2 invalid during post reset sequence");
  if (post_reset_check && !bus->j_pack3->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack3 invalid during post reset sequence");
  if (post_reset_check && !bus->j_pack4->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack4 invalid during post reset sequence");
  if (post_reset_check && !bus->j_pack5->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack5 invalid during post reset sequence");
  if (post_reset_check && !bus->j_pack6->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack6 invalid during post reset sequence");

  if (post_reset_check && !bus->j_req_out_l_0->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req0 invalid during post reset sequence");
  if (post_reset_check && !bus->j_req_out_l_1->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req1 invalid during post reset sequence");
  if (post_reset_check && !bus->j_req_out_l_2->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req2 invalid during post reset sequence");
  if (post_reset_check && !bus->j_req_out_l_3->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req3 invalid during post reset sequence");
  if (post_reset_check && !bus->j_req_out_l_4->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req4 invalid during post reset sequence");
  if (post_reset_check && !bus->j_req_out_l_5->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req5 invalid during post reset sequence");
  if (post_reset_check && !bus->j_req_out_l_6->Valid()) dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req6 invalid during post reset sequence");
  if (post_reset_check && (bus->j_ad->Value(63,0) != 0xffffffffffffffff ||  bus->j_ad->Value(127,64) != 0xffffffffffffffff))
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_ad not high during post reset sequence");
  if (post_reset_check && bus->j_adtype->Value() != 0xff)
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_adtype not high during post reset sequence");
  if (post_reset_check && bus->j_adp->Value() != 0xf)
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_adp not high during post reset sequence");

  if (ad_p_check){
    //{{{  check ad bus
    par = count_hi_bits(bus->j_adtype->Value(), 8);
    for (a=3; a>=0; a--){
      par = par + count_hi_bits(bus->j_ad->Value( a*32 + 31, a*32));
      if ((par & 1) == bus->j_adp->Value( a, a)){
	if (check_ad_parity)
	  dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "parity error in ad[%d:%d]=%08llx, ", a*32 + 31, a*32, bus->j_ad->Value( a*32 + 31, a*32));
	else
	  dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "Incorrect parity in ad[%d:%d]=%08llx, ", a*32 + 31, a*32, bus->j_ad->Value( a*32 + 31, a*32));
      }
      par = 0;
    }
    //}}}  
  }
  if (check_ctrl_parity && ctrl_p_check){
    //{{{  check pack/req parity
    par = 0;
    retime_par = 0;

    if (local_ports_mask & 1)
      par = par + count_hi_bits(jpacks[0], 3);
    else
      par = par + count_hi_bits(bus->j_pack0->Value(), 3);

    if (local_ports_mask & 0x02)
      par = par + count_hi_bits(jpacks[1], 3);
    else
      par = par + count_hi_bits(bus->j_pack1->Value(), 3);
    if (local_ports_mask & 0x04)
      par = par + count_hi_bits(jpacks[2], 3);
    else
      par = par + count_hi_bits(bus->j_pack2->Value(), 3);
    if (local_ports_mask & 0x08)
      par = par + count_hi_bits(jpacks[3], 3);
    else
      par = par + count_hi_bits(bus->j_pack3->Value(), 3);
    if (local_ports_mask & 0x10)
      par = par + count_hi_bits(jpacks[4], 3);
    else
      par = par + count_hi_bits(bus->j_pack4->Value(), 3);
    if (local_ports_mask & 0x20)
      par = par + count_hi_bits(jpacks[5], 3);
    else
      par = par + count_hi_bits(bus->j_pack5->Value(), 3);
    if (local_ports_mask & 0x40)
      par = par + count_hi_bits(jpacks[6], 3);
    else
      par = par + count_hi_bits(bus->j_pack6->Value(), 3);

    par = par + count_hi_bits(bus->j_req_out_l_0->Value(), 1);
    par = par + count_hi_bits(bus->j_req_out_l_1->Value(), 1);
    par = par + count_hi_bits(bus->j_req_out_l_2->Value(), 1);
    par = par + count_hi_bits(bus->j_req_out_l_3->Value(), 1);
    par = par + count_hi_bits(bus->j_req_out_l_4->Value(), 1);
    par = par + count_hi_bits(bus->j_req_out_l_5->Value(), 1);
    par = par + count_hi_bits(bus->j_req_out_l_6->Value(), 1);
    cycle_count++;
    if (par_last_last == bus->j_par->Value() && cycle_count > 10){
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "parity error in j_req or j_packs");
    }
    par_last_last = par_last;
    par_last = par & 1;
    //}}}  
  }
  if (bus->j_err->Value(6, 0) != 0x00){
    for (i=0; i<7; i++){
      if (bus->j_err->Valid()){
	if (bus->j_err->Value(i, i)){
	  dispmon(DISPMON_UNIT_J_ERR, DISPMON_TAG_ERROR, DISPMON_FLAG, "j_err asserted by jid %d", i);
	  dispmon(DISPMON_UNIT      , DISPMON_TAG,       DISPMON_FLAG, "j_err asserted by jid %d", i);
	}
      }else{
	dispmon(DISPMON_UNIT      , DISPMON_TAG_ERROR,  DISPMON_FLAG, "j_err is undefined");
      }
    }
  }

  jpacks[0] = bus->j_pack0->Value();
  jpacks[1] = bus->j_pack1->Value();
  jpacks[2] = bus->j_pack2->Value();
  jpacks[3] = bus->j_pack3->Value();
  jpacks[4] = bus->j_pack4->Value();
  jpacks[5] = bus->j_pack5->Value();
  jpacks[6] = bus->j_pack6->Value();

  req[0] = bus->j_req_out_l_0->Value(0, 0);
  req[1] = bus->j_req_out_l_1->Value(0, 0);
  req[2] = bus->j_req_out_l_2->Value(0, 0);
  req[3] = bus->j_req_out_l_3->Value(0, 0);
  req[4] = bus->j_req_out_l_4->Value(0, 0);
  req[5] = bus->j_req_out_l_5->Value(0, 0);
  req[6] = bus->j_req_out_l_6->Value(0, 0);
  if (post_reset_check)
    for (i=0; i<7; i++){
      if (req[i] != 1)
	dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_req%d active during post reset sequence", i);
      if (jpacks[i] != 0 && jpacks[i] != 7)
	dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "j_pack%d active during post reset sequence", i);
    }
  next_driver_id = current_driver(req, current_driver_id);


  current_driver_id = next_driver_id;
  for (i=0; i<estar_div; i++){
    bus->j_rst->wait_next_cycle();
    if (bus->j_por->Value() == 0)
      //get out of estar mode ASAP if hard reset
      estar_div = 1;
  }
  if (!bus->j_ad->Valid() && !bus->j_adp->Valid() && !bus->j_adtype->Valid() && dead_cycles_enabled && !arthur_mode)
    /*probably a dead cycle in slow shasta mode*/
    this_type = TTYPE_INVALID;
  else
    this_type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
  if (type_d == TTYPE_INV && this_type != TTYPE_IDLE)
    dispmon("jbus_check_inv", 49, DISPMON_FLAG, "Invalidate opcode should be followed by an idle cycle");

  if (trans_types[this_type].snoop && trans_types[this_type].memory_operation &&
      trans_types[type_d].snoop &&    trans_types[type_d].memory_operation &&
      trans_types[type_dd].snoop &&   trans_types[type_dd].memory_operation &&
      trans_types[type_ddd].snoop &&  trans_types[type_ddd].memory_operation &&
      trans_types[type_dddd].snoop && trans_types[type_dddd].memory_operation)
    {
	/*only an error if five back to back reads from same port id - different from same agent id*/
	if (port_dddd == agent_to_id(bus->j_adtype->Value( 5, 2)) &&
	    port_ddd  == agent_to_id(bus->j_adtype->Value( 5, 2)) &&
	    port_dd   == agent_to_id(bus->j_adtype->Value( 5, 2)) &&
	    port_d    == agent_to_id(bus->j_adtype->Value( 5, 2))){
	  if (agent_to_id(bus->j_adtype->Value( 5, 5))){
	    dispmon(DISPMON_UNIT_BACK_TO_BACK, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "Processor cannot handle more than four back to back cacheable reads");
	    dispmon("jbus_check_back_to_back", 40, DISPMON_FLAG | FORCE_FLAG, "Processor cannot handle more than four back to back cacheable reads");
	  }
	}
  }
  if (trans_types[this_type].snoop && trans_types[this_type].memory_operation &&
      trans_types[type_d].snoop &&    trans_types[type_d].memory_operation &&
      trans_types[type_dd].snoop &&   trans_types[type_dd].memory_operation &&
      trans_types[type_ddd].snoop &&  trans_types[type_ddd].memory_operation)
    {
	/*only an error if five back to back reads from same port id - different from same agent id*/
	if (port_ddd  == agent_to_id(bus->j_adtype->Value( 5, 2)) &&
	    port_dd   == agent_to_id(bus->j_adtype->Value( 5, 2)) &&
	    port_d    == agent_to_id(bus->j_adtype->Value( 5, 2))){
	  if (agent_to_id(bus->j_adtype->Value( 5, 5))){
	    dispmon("jbus_check_back_to_back4", 40, DISPMON_FLAG | FORCE_FLAG, "Found four cacheable reads in a row");
	  }
	}
  }
  type_dddd =  type_ddd;
  type_ddd =  type_dd;
  type_dd =  type_d;
  type_d =  this_type;
  port_dddd = port_ddd;
  port_ddd = port_dd;
  port_dd = port_d;
  if (!bus->j_ad->Valid() && !bus->j_adp->Valid() && !bus->j_adtype->Valid() && dead_cycles_enabled && !arthur_mode)
    port_d = port_d;
  else
    port_d = agent_to_id(bus->j_adtype->Value( 5, 2));

  if (estar_div != 1)
    dispmon(DISPMON_UNIT      , DISPMON_TAG_DEBUG,       DISPMON_FLAG, "estar j_clk");
  //@1 jbus.j_rst == void;
}
//}}}  
//{{{  get trans types
int is_addr_cycle(int type){
  return (type != TTYPE_RET_16 && type != TTYPE_RET_64 && type != TTYPE_RET_ERR);
}

int jbus_check::get_trans_type(BITS adtype, BITS ad){
  int type;
  switch (adtype){
    case 3:{
      //check_bits_valid(info->ad, 47, 43);
      type = bus->j_ad->Value(47, 43) & 0x1f;
    }
    break;
    case 2:{
      type = TTYPE_RET_16;
    }
    break;
    case 1:{
      type = TTYPE_RET_64;
    }
    break;
    case 0:{
      type = TTYPE_RET_ERR;
    }
    break;
    default: {
      dispmon(DISPMON_UNIT, DISPMON_TAG_WARNING, DISPMON_FLAG, "adtype is invalid %b", adtype);
      type = TTYPE_INVALID;
    }
    break;
  }
  return type;
}
//}}}  
//{{{  check reqs
void  *check_reqs_start(void *arg){
  jbus_check *info;
  info = (jbus_check *)arg;
  info->check_reqs();
  return NULL;
}
//{{{  next_req_cycle
void jbus_check::next_req_cycle(integer *driver, integer *new_driver){
char x0_128[129] = {"0000000000000000000000000000000000000000000000000000000000000000"
		      "0000000000000000000000000000000000000000000000000000000000000000"};
char x0_8[9] = {"00000000"};
char x0_4[5] = {"0000"};
char x_128[129] = {"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
			"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"};
char x_8[9] = {"xxxxxxxx"};
char x_4[5] = {"xxxx"};
  int i, a = 0, b = 0;
  dead_cycle = 0;
  drv_d2 = drv_d;
  drv_d = drv;
  drv = current_driver(arb_reqs, drv_d);
  if (arthur_mode){
    *new_driver = drv_d;
    *driver =drv_d2;
  }else{
    *new_driver = drv;
    *driver =drv_d;
  }
  if (*driver != *new_driver){
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "current master (%d) has lowered req and new master %d has requested", *driver, *new_driver);
      if (dead_cycles_enabled && !arthur_mode){
	dead_cycle = 1;
	if (force_x_in_dead_cycle){
	  bus->j_ad_out->Update(x_128);
	  bus->j_adtype_out->Update(x_8);
	  bus->j_adp_out->Update(x_4);
	}else if (force_zero_in_dead_cycle){
	  bus->j_ad_out->Update(x0_128);
	  bus->j_adp_out->Update(x0_4);
	  bus->j_adtype_out->Update(x0_8);
	}
      }
  }
  if (!dead_cycle || bus->j_por->Value() == 0)
    //{{{  init outputs to z
    {
    char z_128[129] = {"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
			  "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"};
    char z_8[9] = {"zzzzzzzz"};
    char z_4[5] = {"zzzz"};
    bus->j_ad_out->Update(z_128);
    bus->j_adtype_out->Update(z_8);
    bus->j_adp_out->Update(z_4);
    }
    //}}}  
  //{{{  sample j_change_l
  if (bus->j_change->Value() == 0){
    if (last_req_estar_div == -1){
      /*Signifies a reset happened since last estar, and we wish to go restart the sequence*/
      req_estar_div = 1;
      last_req_estar_div = 1 ;
    }
    new_req_estar_div = get_new_estar_div(req_estar_div, last_req_estar_div);
    if (pending_req_change)
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "j_change_l asserted before last estar sequence complete");
    if (bus->j_req_out_l_5->Value(0, 0) != 0)
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jid = 5 must being driving the jbus when j_change_l asserted");
    pending_req_change = 1;
    req_estar_countdown = 32 + get_estar_delay();
  }
  if (req_estar_countdown == 0 && pending_req_change){
    last_req_estar_div = req_estar_div;
    req_estar_div = new_req_estar_div;
    pending_req_change = 0;
  }
  if (pending_req_change){
    dispmon(DISPMON_UNIT      , DISPMON_TAG_DEBUG,       DISPMON_FLAG, "req estar change in %d cycles", req_estar_countdown);
    req_estar_countdown--;
  }
  //}}}  
  for (i=0; i<req_estar_div; i++){
    bus->j_rst->wait_next_cycle();
    if (bus->j_por->Value() == 0)
      //get out of estar mode ASAP if hard reset
      req_estar_div = 1;
  }
  if (req_estar_div != 1)
    dispmon(DISPMON_UNIT      , DISPMON_TAG_DEBUG,       DISPMON_FLAG, "req estar j_clk");
  for (i=0; i<7; i++){
    if (new_reqs[i] != 0 && new_reqs[i] != 0x3f)
      dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "six bits of j_req_out_l_%d not consistent - was %02x", i, (unsigned int) new_reqs[i]);
    //change from active low to active high
    reqs[i] = (BIT) (new_reqs[i] == 0);
    arb_reqs[i] = (BIT) (new_arb_reqs[i] == 0);
  }
    new_arb_reqs[0] = bus->j_req_out_l_0->Value(5, 0);
    new_arb_reqs[1] = bus->j_req_out_l_1->Value(5, 0);
    new_arb_reqs[2] = bus->j_req_out_l_2->Value(5, 0);
    new_arb_reqs[3] = bus->j_req_out_l_3->Value(5, 0);
    new_arb_reqs[4] = bus->j_req_out_l_4->Value(5, 0);
    new_arb_reqs[5] = bus->j_req_out_l_5->Value(5, 0);
    new_arb_reqs[6] = bus->j_req_out_l_6->Value(5, 0);
  if (bus->valid_ports->Value(0, 0))
    new_reqs[0] = bus->j_req_out_l_0->Value(5, 0);
  else{
    new_reqs[0] = reqs_double_delay[0];
    reqs_double_delay[0] = (BITS) bus->j_req_out_l_0->Value(5, 0);
  }
  if (bus->valid_ports->Value(1, 1))
    new_reqs[1] = bus->j_req_out_l_1->Value(5, 0);
  else{
    new_reqs[1] = reqs_double_delay[1];
    reqs_double_delay[1] = (BITS) bus->j_req_out_l_1->Value(5, 0);
  }
  if (bus->valid_ports->Value(2, 2))
    new_reqs[2] = bus->j_req_out_l_2->Value(5, 0);
  else{
    new_reqs[2] = reqs_double_delay[2];
    reqs_double_delay[2] = (BITS) bus->j_req_out_l_2->Value(5, 0);
  }
  if (bus->valid_ports->Value(3, 3))
    new_reqs[3] = bus->j_req_out_l_3->Value(5, 0);
  else{
    new_reqs[3] = reqs_double_delay[3];
    reqs_double_delay[3] = (BITS) bus->j_req_out_l_3->Value(5, 0);
  }
  if (bus->valid_ports->Value(4, 4))
    new_reqs[4] = bus->j_req_out_l_4->Value(5, 0);
  else{
    new_reqs[4] = reqs_double_delay[4];
    reqs_double_delay[4] = (BITS) bus->j_req_out_l_4->Value(5, 0);
  }
  if (bus->valid_ports->Value(5, 5))
    new_reqs[5] = bus->j_req_out_l_5->Value(5, 0);
  else{
    new_reqs[5] = reqs_double_delay[5];
    reqs_double_delay[5] = (BITS) bus->j_req_out_l_5->Value(5, 0);
  }
  if (bus->valid_ports->Value(6, 6))
    new_reqs[6] = bus->j_req_out_l_6->Value(5, 0);
  else{
    new_reqs[6] = reqs_double_delay[6];
    reqs_double_delay[6] = (BITS) bus->j_req_out_l_6->Value(5, 0);
  }
}

//}}}  
void  jbus_check::check_reqs(void){
  //{{{  variables
  integer i, wait_time, type, data_cycle_count;
  integer driver = 0, new_driver=0, allow_wrb;
  //}}}  
  //{{{  have an empty cycle at start
  //Need a clock cycle before checking any values, in case they cause dispmon errors
  bus->j_rst->wait_next_cycle();


  new_reqs[0] = bus->j_req_out_l_0->Value(5, 0);
  new_reqs[1] = bus->j_req_out_l_1->Value(5, 0);
  new_reqs[2] = bus->j_req_out_l_2->Value(5, 0);
  new_reqs[3] = bus->j_req_out_l_3->Value(5, 0);
  new_reqs[4] = bus->j_req_out_l_4->Value(5, 0);
  new_reqs[5] = bus->j_req_out_l_5->Value(5, 0);
  new_reqs[6] = bus->j_req_out_l_6->Value(5, 0);
  next_req_cycle(&driver, &new_driver);

      new_req_estar_div = 1;
      req_estar_div = 1;
      last_req_estar_div = 1;
      req_estar_countdown = 0;
      pending_req_change = 0;

  //}}}  
  //BITS mask;
  type = TTYPE_INVALID;
  next_req_cycle(&driver, &new_driver);
  while (1){
      //{{{  reset
      while (bus->j_rst->Value() == 0){
	//NOTE - jbus_check process may change dead cycle settings
	//when a reset occurs. We pick up the changes because we
	//share the jbus_check class
	for (i=0; i<7; i++){
	  reqs[i] = 0;
	  arb_reqs[i] = 0;
	  new_reqs[i] = 0;
	  new_arb_reqs[i] = 0;
	}
	drv_d2 = drv_d = drv = 0;
	new_driver = 0;
	driver = 0;
	data_cycle_count = 0;
	if (bus->j_por->Value() == 0){
	  new_req_estar_div = 1;
	  req_estar_div = 1;
	  last_req_estar_div = 1;
	  req_estar_countdown = 0;
	  pending_req_change = 0;
	  bus->j_rst->wait_for_event(1, MAX_RESET_TIME);
	}else{
	  next_req_cycle(&driver, &new_driver);
	  if (reset_estar_on_soft_reset)
	    last_req_estar_div = -1;
	}
      }
      //}}}  
      if (new_driver != driver){
	//{{{  choose new driver
	//driver is going to change - do arbitration/dead cycles

	if (dead_cycles_enabled){
	  if (arthur_mode){
	    type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "00 getting transaction - type is %s", trans_types[type].long_string);
	    data_cycle_count = trans_types[type].length;
	  }else
	    data_cycle_count = 1;
	  next_req_cycle(&driver, &new_driver);
	  data_cycle_count--;
	}//add extra cycle if dead cycles are enabled
	while (dead_cycle){
	  //bus should be tristate if not in arthur mode
	  if (!arthur_mode){
	    if (force_x_in_dead_cycle || force_zero_in_dead_cycle){
	      if (bus->j_ad->Valid())
		dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "j_ad not X during shasta dead cycle");
	      if (bus->j_adp->Valid())
		dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "j_adp not X during shasta dead cycle");
	      if (bus->j_adtype->Valid())
		dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "j_adtype not X during shasta dead cycle");
	    }else{
	      if (bus->j_ad->Value(63,0) != 0xffffffffffffffff || bus->j_ad->Value(127, 64) != 0xffffffffffffffff ||
		  bus->j_adp->Value() != 0xf || bus->j_adtype->Value() != 0xff)
		dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "jbus is active during shasta dead cycle");
	    }
	    next_req_cycle(&driver, &new_driver);
	  }else{
	    if (data_cycle_count == 0){
	      type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
	      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "0 getting transaction - type is %s", trans_types[type].long_string);
	      data_cycle_count = trans_types[type].length;
	    }
	    next_req_cycle(&driver, &new_driver);
	    data_cycle_count--;
	  }
	}
	if (data_cycle_count == 0){
	  type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
	  dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "1 getting transaction - type is %s", trans_types[type].long_string);
	  if (bus->j_ad->Value( 127, 64) != bus->j_ad->Value( 63, 0) && !trans_types[type].read_return){
	    if (type == TTYPE_IDLE){
	      if (bus->j_ad->Value(111,107) != bus->j_ad->Value(47,43))
		dispmon(DISPMON_UNIT_BAD_AD_127_64, DISPMON_TAG_ERROR, DISPMON_FLAG, "incorrect address cycle driven by new master (%016llx) - top half of ad bus opcode bits do not mirror bottom", bus->j_ad->Value( 63, 0));
	    }
	    //	    else if (is_addr_cycle(type))
	    else if (is_addr_cycle(type) && (type != TTYPE_WRM)) //For Niagara Support
	      dispmon(DISPMON_UNIT_BAD_AD_127_64, DISPMON_TAG_ERROR, DISPMON_FLAG, "incorrect address cycle driven by new master (%016llx) - top half of ad bus does not mirror bottom. type  = %d", bus->j_ad->Value( 63, 0), type);
	  }
	  if (!trans_types[type].valid){
	    dispmon(DISPMON_UNIT_BAD_TRANSACTION, DISPMON_TAG_ERROR, DISPMON_FLAG, "arbitration error - suspect operation type - does not match a vaild transaction type");
	    data_cycle_count = 1;
	  }else
	    data_cycle_count = trans_types[type].length;
	}
	if (!dead_cycles_enabled){
	  next_req_cycle(&driver, &new_driver);
	  data_cycle_count--;
	  if (data_cycle_count == 0){
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "getting another xaction 1 cycle after bus change");
	    type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "getting transaction - type is %s", trans_types[type].long_string);
	    data_cycle_count = trans_types[type].length;
	  }
	}
	allow_wrb = 0;
	if (trans_types[type].read && trans_types[type].snoop)
	  allow_wrb = 1;
	{int curr_driver = new_driver;
	  //{{{  check req is asserted during transaction
	  dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "1 req[%d] is %d, cycle count is %d", curr_driver, reqs[curr_driver], data_cycle_count);
	  while (reqs[curr_driver] == 1){
	    next_req_cycle(&driver, &new_driver);
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "2 req[%d] is %d, cycle count is %d", curr_driver, reqs[curr_driver], data_cycle_count);
	    if (data_cycle_count > 0)
	      data_cycle_count --;
	    if (data_cycle_count == 0){
	      type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
	      data_cycle_count = trans_types[type].length;
	      if (bus->j_ad->Value( 127, 64) != bus->j_ad->Value( 63, 0) && !trans_types[type].read_return){
		if (type == TTYPE_IDLE){
		  if (bus->j_ad->Value(111,107) != bus->j_ad->Value(47,43))
		    dispmon(DISPMON_UNIT_BAD_AD_127_64, DISPMON_TAG_ERROR, DISPMON_FLAG, "incorrect address cycle driven by new master (%016llx) - top half of ad bus opcode bits do not mirror bottom", bus->j_ad->Value( 63, 0));
		}
		//	    else if (is_addr_cycle(type))
		else if (is_addr_cycle(type) && (type != TTYPE_WRM)) //For Niagara Support
		  dispmon(DISPMON_UNIT_BAD_AD_127_64, DISPMON_TAG_ERROR, DISPMON_FLAG, "incorrect address cycle driven by new master (%016llx) - top half of ad bus does not mirror bottom. type  = %d", bus->j_ad->Value( 63, 0), type);
	      }
	      if (!trans_types[type].valid)
		dispmon(DISPMON_UNIT_BAD_TRANSACTION, DISPMON_TAG_WARNING, DISPMON_FLAG, "arbitration error - suspect operation type - does not match a vaild transaction type");
	    }
	  }
	  if (data_cycle_count > 1)
	    dispmon(DISPMON_UNIT, DISPMON_TAG_ERROR, DISPMON_FLAG, "arbitration error - jbus master %d deasserted request too early during a %s transaction", curr_driver, trans_types[type].long_string);
	  //}}}  
	}
	//}}}  
      }else{
	if (reqs[driver] != 1){
	  //{{{  check only single cycle transactions
	  //no requests asserted - must be single cycle transaction
	  //but must make sure we're not sampling data from a previous access
	  if (data_cycle_count == 0){
	    type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
	    dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "getting transaction - type is %s", trans_types[type].long_string);
	    if (!trans_types[type].valid)
	      dispmon(DISPMON_UNIT_BAD_TRANSACTION, DISPMON_TAG_WARNING, DISPMON_FLAG, "arbitration error - suspect operation type");
	    next_req_cycle(&driver, &new_driver);
	    if (trans_types[type].length != 1 && reqs[driver] != 1)
	      dispmon(DISPMON_UNIT_BAD_TRANSACTION, DISPMON_TAG_ERROR, DISPMON_FLAG, "arbitration error - port %d drove a multicycle transaction without requesting", driver);
	  }else
	    next_req_cycle(&driver, &new_driver);
	  data_cycle_count = 0;
	  //}}}  
	}else{
	  //{{{  any transaction if while req is high
	  //current driver has it's req high - can be any transaction
	  dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "current master (%d) has req high", driver);
	  while (reqs[driver] == 1)
	    next_req_cycle(&driver, &new_driver);
	  dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "current master (%d) has lowered req", driver);
	  data_cycle_count = 1;
	  //}}}  
	}
      }
  }
}
//}}}  
//{{{  count_hi_bits
int jbus_check::count_hi_bits(BITS val, int len){
  int count=0, i;
  for (i=0; i<len; i++){
    count += val & 1;
    val = val >> 1;
  }
  return count;
}
//}}}  
//}}}  

void jbus_check::jbus_checker(void ){
  int src_id, trans_id, class_id, i, type;
 // int a, par, retime_par;

  // start of top block
  integer         consecutive_idles_count; //Used to end sim
  int already_forked = 0, por_reset=0, first_reset=1;
  BIT  be_space[20];
  BIT  *byte_enables=be_space;
  //transaction_class transactions[MAX_TRANS_ENTRIES * MAX_BUS_MASTERS];
  par_last=0; par_last_last=0;
  //{{{  init outputs to z
  {
  char z_128[129] = {"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
			"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"};
  char z_8[9] = {"zzzzzzzz"};
  char z_4[5] = {"zzzz"};
  bus->j_ad_out->Update(z_128);
  bus->j_adtype_out->Update(z_8);
  bus->j_adp_out->Update(z_4);
  }
  //}}}  

  init_routine (trans_types);
  cycle_count = 0;
  estar_div = 1;
  current_driver_id = 0;
  //{{{  parse plus args
  //NOTE arthur/dead cycle plusargs have no effect until a second reset occurs,
  //cos we have to power up in one dead cycle, sampled by receiver mode
  if (mc_scan_plusargs((char *)"no_j_ad_parity") != NULL)
    check_ad_parity = 0;
  else
    check_ad_parity = 1;

  if (mc_scan_plusargs((char *)"no_j_ctrl_parity") != NULL)
    check_ctrl_parity = 0;
  else
    check_ctrl_parity = 1;

  dead_cycles_enabled = 1;
  arthur_mode = 1;

  if (mc_scan_plusargs((char *)"no_jreq_checks") != NULL)
    check_requests = 0;
  else
    check_requests = 1;

  if (mc_scan_plusargs((char *)"no_x_in_dead_cycle") != NULL)
    force_x_in_dead_cycle = 0;
  else
    force_x_in_dead_cycle = 1;

  if (mc_scan_plusargs((char *)"zero_in_dead_cycle") != NULL){
    force_x_in_dead_cycle = 0;
    force_zero_in_dead_cycle = 1;
  }else
    force_zero_in_dead_cycle = 0;

  if (mc_scan_plusargs((char *)"estar_soft_reset") != NULL)
    reset_estar_on_soft_reset = 1;
  else
    reset_estar_on_soft_reset = 0;

  //}}}  
  for (i=0; i<10; i++)
    bus->j_rst->wait_next_cycle();
  if (bus->j_por->Value() == 1)
    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "First jbus reset seems too short. j_por inactive after only 10 cycles");

 // bus->j_rst->wait_for_event(1, MAX_RESET_TIME);
  dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "jbus protocol checker v%s", "1.85");
  if (check_requests)
    bus->fork(check_reqs_start, this);
  consecutive_idles_count = 0;
  while (consecutive_idles_count < TIMEOUT_VALUE){
    while (bus->j_rst->Value() == 0){
      if (bus->j_por->Value() == 1){
	next_cycle_POC(0, 0, 0);
      }else{
	por_reset = 1;
	estar_div = 1;
	bus->j_rst->wait_next_cycle();
      }
      if (bus->j_rst->Value() == 1){
	port_dddd = port_ddd = port_dd = port_d = 0;
	type_dddd =  type_ddd =  type_dd  =  type_d = 0;
	local_ports_mask = bus->valid_ports->Value(6, 0);
	if (por_reset){
	  dead_cycles_enabled = 1;
	  last_estar_div = 1;
	  arthur_mode = 1;
	}else{
	  if (first_reset)
	    dispmon(DISPMON_UNIT_J_RESET, DISPMON_TAG_ERROR, DISPMON_FLAG | FORCE_FLAG, "First jbus reset must be a por one - j_rst_l seen low without j_por_l low");
	  //{{{  work out dead cycle behavior
	  if (mc_scan_plusargs((char *)"default_dead") != NULL){
	    dead_cycles_enabled = 1;
	    arthur_mode = 1;
	  }
	  if (mc_scan_plusargs((char *)"default_nosample_dead") != NULL){
	    dead_cycles_enabled = 1;
	    arthur_mode = 0;
	  }
	  //if (mc_scan_plusargs((char *)"default_nodead") != NULL){
	  //  dead_cycles_enabled = 0;
	  //  arthur_mode = 0;
	  //}

	  // shasta_default behavior (default_nodead) occurs by default
	  dead_cycles_enabled = 0;
	  arthur_mode = 0;


	  if (mc_scan_plusargs((char *)"dead") != NULL){
	    dead_cycles_enabled = 1;
	    arthur_mode = 1;
	  }
	  if (mc_scan_plusargs((char *)"nosample_dead") != NULL){
	    dead_cycles_enabled = 1;
	    arthur_mode = 0;
	  }
	  if (mc_scan_plusargs((char *)"nodead") != NULL){
	    dead_cycles_enabled = 0;
	    arthur_mode = 0;
	  }

	  //}}}  
	  if (reset_estar_on_soft_reset)
	    last_estar_div = -1;
	}
	for (i=0; i<40; i++)
	  next_cycle_POC(0, 0, 1, 1);
	first_reset = 0;
	por_reset = 0;
	cycle_count = 0;
      }
    }
    type = get_trans_type(bus->j_adtype->Value( 7, 6), bus->j_ad->Value( 47, 43));
    if (type != TTYPE_INVALID){
      //{{{  output name to verilog
      {
      int a, len;
      len =  strlen(trans_types[type].short_string);
      for (a=0; a < len; a++){
	bus->transaction_name->Update((BITS)trans_types[type].short_string[(len - a) - 1],a*8+7,a*8);
      }
      for (a=len; a<16; a++){
	bus->transaction_name->Update((BITS)' ',a*8+7,a*8);
      }
      }
      //}}}  
      if (trans_types[type].valid == 1){
	//{{{  do checks
	int warned;
	//{{{  memory transaction
	if (trans_types[type].memory_operation == 1){
	  int first_set_enable = -1, relaxed_check_mask;
	  w_transaction.address = bus->j_ad->Value(42, 0);
	  for (i=0; i<16; i++){
	    byte_enables[i] = bus->j_ad->Value(48+i, 48+i);
	    if (first_set_enable < 0 &&  byte_enables[i] == 1)
	      first_set_enable = i;
	  }
	  //{{{  relax the byteenable check to cope with PCI cases
	  /*
	  if pa[2:0] == 0, first byte enable can be any from 0-7
	  if pa[2:0] == 1,2,3,5,6,7 byte enable must match pa[2:0]
	  if pa[2:0] == 4, first byte enable must be any from 4-7
	  */

	  switch (w_transaction.address & 0x7){
	    case 0:
	      relaxed_check_mask = ~7;
	      break;
	    case 4:
	      relaxed_check_mask = ~3;
	      break;
	    default:
	      relaxed_check_mask = ~0;
	      break;
	  }
	  //}}}  
	  if (trans_types[type].byte_mask == 0){
	    if (bus->j_ad->Value( 63, 48) != 0)
	      dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "byteenables not zero during a no byte access transaction");
	  }
	  /* Removing NCWR byteenable checks
	  else{
	    if (first_set_enable == -1)
	      dispmon(DISPMON_UNIT, DISPMON_TAG, DISPMON_FLAG, "Null access - byteenables all clear during a byte access instruction - not checking a[3:0] validity");
	    else if ((((int)(w_transaction.address & 0xf)) ^ first_set_enable) & relaxed_check_mask){
	      dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "byteenable error - first addressed byte is %d, first set byte enable is %d", (int) (w_transaction.address & 0xf), first_set_enable);
	    }
	  }
	  */
	  src_id = bus->j_adtype->Value( 5, 2);
	  trans_id = bus->j_adtype->Value( 1, 0);
	  class_id = src_id * MAX_TRANS_ENTRIES + trans_id;
	  if ((trans_types[type].snoop || type == TTYPE_WRB || type == TTYPE_WRBC) && bus->j_ad->Value(42, 41) != 0)
	    dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "cacheable memory access with a[42:41] != 0");
	  if (!trans_types[type].snoop && bus->j_ad->Value(42, 42) != 1){
	    if (type != TTYPE_WRB && type != TTYPE_WRBC)
	      dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "non-cacheable memory access with a[42] != 1");
	  }
	  if ((trans_types[type].length > 2 && trans_types[type].write) || type == TTYPE_NCBR){
	    if (bus->j_ad->Value( 5, 4) != 0){
	      dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "non-cacheable block read and block/cacheable write transactions must have a[5:4] == 0");
	    }
	  }
	  if(trans_types[type].write && trans_id != 0){
	    dispmon(DISPMON_UNIT_MEM, DISPMON_TAG_ERROR, DISPMON_FLAG, "write transactions must have adtype[1:0] == 0");
	  }
	  for (i=0; i<16; i++)
	    w_transaction.byteenables[i] = byte_enables[i];
	  w_transaction.type = type;
	}else if (type == TTYPE_CHANGE){
	  handle_estar_change();
	}

	//}}}  
	warned = 0;
	for (i=0; i< trans_types[type].length; i++){
	  //{{{  check adtype is zero for data cycle (except WRB ECC error)
	  if (trans_types[type].write && i != 0){
	    if (bus->j_adtype->Value() != 0x0 && !warned){
	      if (i == 1 && bus->j_adtype->Value() == 0x40 && type == TTYPE_WRB)
		dispmon(DISPMON_UNIT_WRITES, DISPMON_TAG_DEBUG, DISPMON_FLAG, "ECC error during writeback");
	      else{
		warned = 1;
		dispmon(DISPMON_UNIT_WRITES, DISPMON_TAG_ERROR, DISPMON_FLAG, "adtype should be zero during write data cycles");
	      }
	    }
	  }
	  //}}}  
	  next_cycle_POC();
	}
	//}}}  
      }else{
	type = TTYPE_INVALID;
      }
    }
    if (type == TTYPE_INVALID){
      //{{{  need to calculate/check parity even if the xaction is invalid
      next_cycle_POC();
      //}}}  
    }
    if (!bus->j_ad->Valid() && !bus->j_adp->Valid() && !bus->j_adtype->Valid() && dead_cycles_enabled && !arthur_mode){
      //probably a dead cycle
      dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "jbus dead cycle");
      next_cycle_POC(1, 0);
      while (!bus->j_ad->Valid() && !bus->j_adp->Valid() && !bus->j_adtype->Valid() && (bus->j_por->Value() == 1) && bus->j_rst->Value() == 1){
	dispmon(DISPMON_UNIT, DISPMON_TAG_DEBUG, DISPMON_FLAG, "Extra dead cycles - this should only happen when AOK is disabled");
	next_cycle_POC(1, 0);
      }
    }

  }
} // end of program jp_jbus_mon

void *j_checker_entry(void *arg){
  jbus_check *info;
  info = (jbus_check *)arg;
  info->jbus_checker();
  return NULL;
}

#endif

