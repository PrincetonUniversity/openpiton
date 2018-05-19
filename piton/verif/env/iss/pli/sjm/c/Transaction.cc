// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Transaction.cc
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
//------------------------------------------------------------------------------
//
// Description:  Class that describes a transaction.
//
//------------------------------------------------------------------------------
#include "Transaction.h"


//------------------------------------------------------------------------------
// Default constructor.
Transaction::Transaction()
{
  type = -1;
  addr = -1;
  data = new ByteString(64);
  size = 0;
  orb_indx = -1;
  destID = -1;
  state = -1;
  mask = 0;
  multi = 0;
  atomic = 0;
  for (int i = 0; i < 4; i++) {
    ecc[i] = 0;
  }
  raw = 0;
}


//------------------------------------------------------------------------------
// Constructor./*Niagara Support -change last argument type*/
Transaction::Transaction(int t, ull a, int id, int indx, char st, ull msk)
{
  type = t;
  addr = a;
  data = new ByteString(64);
  size = 0;
  orb_indx = indx;
  destID = id;
  state = st;
  mask = msk;
  multi = 0;
  atomic = 0;
  for (int i = 0; i < 4; i++) {
    ecc[i] = 0;
  }
  raw = 0;
}


//------------------------------------------------------------------------------
// Destructor.
Transaction::~Transaction()
{
  delete data;
}
