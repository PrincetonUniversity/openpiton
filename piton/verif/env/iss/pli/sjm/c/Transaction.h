// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: Transaction.h
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
//------------------------------------------------------------------------------
//
// Description:  Class that describes a transaction.
//
//------------------------------------------------------------------------------

#include "JBus.h"

#ifndef TRANS_H
#define TRANS_H

class Transaction {
public:
  int type;
  ull addr;
  // Optional data field.
  ByteString *data;
  // The size of the transaction.
  int size;
  // j_id of the destination.
  int destID;
  // The location of this transaction in the outstanding read buffer.
  int orb_indx;
  // The cache state for this transaction.
  char state;
  // The byte mask.
  //short mask;
  ull mask;  /*Niagara Support*/
  // Set if this is a multi-cycle transaction.
  int multi;
  // Set if we need to hold the bus for the next transaction.
  int atomic;
  // ECC bits for read return data.
  char ecc[4];
  // new addition to allow us to make up our own bus encodings
  int raw;
  Transaction();
  Transaction(int, ull, int, int, char, ull); /*Niagar Support -change last argument type*/
  ~Transaction();
};

#endif //TRANS_H
