// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: pli_signal.cc
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
***  Program File:  @(#)pli_signal.cc
***
***  Version Date:  02/24/00
***
****************************************************************************
****************************************************************************/

#include "pli_signal.h"

//------------------------------------------------------------------------------
// Constructor.
Signal::Signal(void)
{
  valid = 0;
  prev = NULL;
 curr = NULL;
  next = NULL;
  display_mode = CHECK_ALL;
}
Signal::Signal(int arg_no)
{
  valid = 1;
  name_valid = 0;
  sprintf(sig_name, "<arg name %d>", arg_no);
  arg_num = arg_no;
  prev = new s_acc_vecval;
  curr = new s_acc_vecval;
  next = new s_acc_vecval;
  active = 1;
  expr_ngroups = 1;
  expr_vec_size = 1;
  prev->bval = -1;
  curr->bval = -1;
  next->bval = -1;
  display_mode = CHECK_ALL;
}


//------------------------------------------------------------------------------
// Constructor. Allows the active state to be set.
Signal::Signal(int arg_no, int state)
{
  valid = 1;
  sprintf(sig_name, "<arg name %d>", arg_no);
  arg_num = arg_no;
  name_valid = 0;
  prev = new s_acc_vecval;
  curr = new s_acc_vecval;
  next = new s_acc_vecval;
  active = 1;
  expr_ngroups = 1;
  expr_vec_size = 1;
  active = state;
  prev->bval = -1;
  curr->bval = -1;
  next->bval = -1;
  display_mode = CHECK_ALL;

}
Signal *Signal::copy(Signal *t){
  int i;
  for (i=0; i<expr_ngroups; i++){
    t->prev[i] = this->prev[i];
    t->curr[i] = this->curr[i];
    t->next[i] = this->next[i];
  }
  return t;
}

//------------------------------------------------------------------------------
// Constructor. Allows the active state to be set.
Signal::Signal(int arg_no, int top, int bottom)
{
  int size_in_ints, i;

  valid = 1;
  sprintf(sig_name, "<arg name %d>", arg_no);
  arg_num = arg_no;
  name_valid = 0;
  size_in_ints = ((top - bottom) / 32) + 1 ;
  prev = new s_acc_vecval  [size_in_ints];
  curr = new s_acc_vecval  [size_in_ints];
  next = new s_acc_vecval  [size_in_ints];
  active = 1;
  expr_ngroups = size_in_ints;
  expr_vec_size = (top - bottom) + 1;
  for (i=0; i<size_in_ints; i++){
    prev[i].bval = -1;
    curr[i].bval = -1;
    next[i].bval = -1;
  }
  display_mode = CHECK_ALL;
}
//------------------------------------------------------------------------------
void Signal::set_display_mode(enum display_levels level){
  display_mode = level;
}

//------------------------------------------------------------------------------
// Update the signal. Returns 0 if the argument is invalid.
int Signal::sample_input()    {
  int i;
  struct t_tfexprinfo expr;
  s_tfnodeinfo node;

  for (i=0; i<expr_ngroups; i++){
    prev[i] = curr[i];
  }
  tf_exprinfo(arg_num, &expr);
  if (!name_valid && expr.expr_type != tf_readonly){
    tf_nodeinfo(arg_num, &node);
    if (node.node_symbol != NULL){
      name_valid = 1;
      strncpy(sig_name, node.node_symbol, 100);
    }
  }

  dprintf(DISPMON_STRING, DISPMON_DEBUG_DEBUG_TAG,0, "in : %d %d %d", expr.expr_type, arg_num, tf_sizep(arg_num));
  for (i=0; i<expr_ngroups; i++){
    curr[i].aval = expr.expr_value_p[i].avalbits;
    curr[i].bval = expr.expr_value_p[i].bvalbits;
  }
  next = curr; //set outputs to new inputs, so if no changes are made, the signals aren't altered.
  return 1;
}

int Signal::drive_output(){
  struct t_tfexprinfo expr;
  s_tfnodeinfo node;
  int i;

  tf_exprinfo(arg_num, &expr);
  if (!name_valid && expr.expr_type != tf_readonly){
    tf_nodeinfo(arg_num, &node);
    if (node.node_symbol != NULL){
      name_valid = 1;
      strncpy(sig_name, node.node_symbol, 100);
    }
  }
  for (i=0; i<expr_ngroups; i++){
    expr.expr_value_p[i].avalbits = next[i].aval;
    expr.expr_value_p[i].bvalbits = next[i].bval;
  }
  dprintf(DISPMON_STRING, DISPMON_DEBUG_DEBUG_TAG,0, "out: %d %d", expr.expr_type, arg_num);
  if (expr.expr_type != tf_readonly)
    tf_propagatep(arg_num);
  else
    dprintf(DISPMON_STRING, DISPMON_DEBUG_TAG,0, "can\'t propagate value to \'%s\'", sig_name);
  return 1;
}
int Signal::Update(BITS value)
{
  //if ((val != 'x') && (val != 'z') && (val != 1) && (val != 0)) {
 //   return 0;
 // }

  next->aval = value;
  next->bval = 0;
  return 1;
}

int Signal::Update(char *value)
{
  int count;
  p_acc_vecval val;
  val = next;
  val->aval = 0;
  val->bval = 0;
  count = 0;
  while (*value != '\0'){
    if (count == expr_vec_size){
      dprintf(DISPMON_STRING, 48,0, "update pattern larger than size of signal \'%s\' (%d)", sig_name, expr_vec_size);
      return 0;
    }
    val->aval = val->aval << 1;
    val->bval = val->bval << 1;
    if (*value == 'x' ||  *value == 'z')
      val->bval = val->bval | 1;
    switch (*value){
      case '0': case 'z': break;
      case '1': case 'x': val->aval = val->aval | 1; break;
      default :
        dprintf(DISPMON_STRING, 48,0, "can't update \'%s\' to value %c", sig_name, *value);
        return 0;
        break;
    }
    count++;
    value++;
    if ((count % 32) == 0){
      val++;
      if (*value != '\0'){
        val->aval = 0;
        val->bval = 0;
      }
    }
  }
  return 1;
}



int Signal::Update(BITS value, int top, int bottom)
{
  unsigned long long int val32, mask32, mask32_top, update_lo, update_hi;

  //Sorry its so complex. This shifts a 32 bit value to the correct positions
  //in the signal structure, which is made up of a number of 32 bit words.
  //At most two consecutive words in the structure can be altered, so the
  //old values get anded out and then the result is ored with the new value.
  //NOTE this assumes that the bits in the datastructure start from bit 0

  if ((top - bottom) > 32 || (top - bottom) < 0){
    dprintf(DISPMON_STRING, 48, 0, "cannot update \'%s\' with a vector %d bits wide - max is 32 ", sig_name, (top - bottom) + 1);
    return 0;
  }
  update_lo = bottom / 32;
  update_hi = top / 32;
  if (update_hi > expr_ngroups){
    dprintf(DISPMON_STRING, 48, 0, "cannot update \'%s\' bit %d as it is larger than the bus width ", sig_name, top);
    return 0;
  }
  bottom = bottom % 32;
  top = top % 32;
  val32 = value << bottom;
  mask32 = 0xffffffff;
  mask32 = (mask32 << bottom) & 0xffffffff;
  if (update_hi == update_lo){
    mask32_top = 0xffffffff;
    mask32_top = mask32_top >> 31 - top;
    mask32 = mask32 & mask32_top;
  }
  next[update_lo].aval = (next[update_lo].aval & ~mask32) | val32;
  next[update_lo].bval =  next[update_lo].bval & ~mask32;
  if (update_hi != update_lo){
    mask32 = -1;
    mask32 = mask32 << (top + 1);
    val32 = value >> bottom - 32;
    next[update_hi].aval = (next[update_hi].aval & ~mask32) | val32;
    next[update_hi].bval =  next[update_hi].bval & ~mask32;
  }
  return 1;
}


//------------------------------------------------------------------------------
// Returns the current value of the signal.
BITS Signal::Value()
{
  if (curr->bval){
    if (curr->aval){
      if (display_mode >= CHECK_UNKNOWN)
        dprintf(DISPMON_STRING, 48, 0, "\'%s\' has unknown value", sig_name);
    }else{
      if (display_mode >= CHECK_TRISTATE)
        dprintf(DISPMON_STRING, 12, 0,"\'%s\' is tristated", sig_name);
    }
  }
  return curr->aval;
}

//------------------------------------------------------------------------------
// Returns the current value of the signal.
char Signal::Value_c()
{
  if (curr->bval){
    if (curr->aval)
      return 'x';
    else
      return 'z';
  }else{
    if (curr->aval)
      return '1';
    else
      return '0';
  }
}

//------------------------------------------------------------------------------
// Returns the current value of the signal.
BITS Signal::Value(int top, int bottom)
{
  int lo, hi;
  BITS val, mask;
  lo = bottom / 32;
  hi = top / 32;
  if (hi > expr_ngroups){
    dprintf(DISPMON_STRING, 49, 0,"\'%s\' bus index is out of range(%d,%d)", sig_name, top, bottom);
    return 0;
  }
  if ((hi - lo) > 1){
    dprintf(DISPMON_STRING, 49, 0,"\'%s\' implementation restriction - cannot retrieve value split over > 2 32-bit words", sig_name);
    return 0;
  }

  bottom = bottom % 32;
  top = top % 32;

  if (hi == lo)
    mask = (((BITS)1) << (top + 1)) - 1;
  else{
    if (top == 31)
      mask = -1;
    else
      mask = (((BITS)1) << (top + 33)) - 1;
  }
  val = (
        ((((BITS)curr[lo].aval & 0xffffffff) | ((BITS)curr[hi].aval << 32)))
        & mask)
        >> bottom;

  if (((((BITS)curr[lo].bval & 0xffffffff) | ((BITS)curr[hi].bval << 32))) & mask){
    if (display_mode >= CHECK_UNKNOWN)
      dprintf(DISPMON_STRING, 48, 0,"\'%s\' has unknown value", sig_name);
  }
  return val;
}


//------------------------------------------------------------------------------
// Returns 1 of the Signal underwent a 0->1 transition. Return 0 otherwise.
int Signal::Rising()
{
  if ((prev->aval == 0) && (curr->aval == 1)) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns 1 if the signal underwent a 1->0 transition. Returns 0 otherwise.
int Signal::Falling()
{
  if ((prev->aval == 1) && (curr->aval == 0)) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Checks if the signal is currently active.
int Signal::Active()
{
  if (((active == SIGNAL_ACTIVE_HI) && (curr->aval == 1)) || ((active == SIGNAL_ACTIVE_LO) && (curr->aval == 0))) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Checks if the signal is currently valid. Values of 1, 0, and 'z' are
// considered valid, hence just check for X.
int Signal::Valid()
{
  int i, size, mask;
  size = expr_vec_size;
  if (size >= 32){
    // Check all full 32bit chunks of signal here, by making sure all bits of a and bval are set
    for (i=0; i < expr_vec_size; i+=32){
      //if any bit of a & b is set, that must be a X somewhere in the bus
      if (curr[i / 32].aval & curr[i / 32].bval != 0x0)
        return 0;
      size -= 32;
    }
  }
  // Check any part word chunks here - make a mask showing which words to check
  mask = (1 << size) - 1;
  if (((curr[expr_vec_size/ 32].aval & curr[expr_vec_size/ 32].bval) & mask) != 0)
    return 0;
  return 1;
}


//------------------------------------------------------------------------------
// Checks if the signal is tristated.
int Signal::Tristated()
{
  int i, size, mask;
  size = expr_vec_size;
  if (size >= 32){
    // Check all full 32bit chunks of signal here, by making sure all bits of a and bval are set
    for (i=0; i < expr_vec_size; i+=32){
      if (curr[i / 32].aval != 0 || curr[i / 32].bval != 0xffffffff)
        return 0;
      size -= 32;
    }
  }
  // Check any part word chunks here - make a mask showing which words to check, then use an
  // XOR to set any bits which aren't one. Then mask off unused bits, and check result is zero
  mask = (1 << size) - 1;
  if ((curr[expr_vec_size/ 32].aval & mask) != 0 || ((curr[expr_vec_size/ 32].bval ^ 0xffffffff) & mask) != 0)
    return 0;
  return 1;
}
