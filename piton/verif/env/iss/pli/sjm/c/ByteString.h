// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: ByteString.h
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
// Description:  An object that stores an array of bytes.
//
//------------------------------------------------------------------------------

#include <stdio.h>
#include <string.h>

#ifndef BYTESTRING_H
#define BYTESTRING_H

typedef unsigned long long ull;


class ByteString {
private:
  char *data;
  int size;

public:
  ByteString(int);
  ByteString(char *);
  ByteString(ByteString &);
  ByteString(ByteString &, int, int);
  ~ByteString();
  int AddByte(int, char);
  int AddHalfByte(int, char);
  void Set(int, int);
  void Set(int, ull);
  char *GetByte(int);
  int GetInt(int);
  ull GetUll(int);
  void Copy(ByteString *);
  void Copy(int, int, ByteString *);
  void Copy(int, int, int, ByteString *);
  void Copy(int, int, int, char);
  int Compare(ByteString *);
  int Compare(int, ByteString *);
  int Compare(int, int, ByteString *);
//   int Valid();
//   int Full();
  int GetSize();
  void Clear();
  char *Print();
};

// Overloaded operators.
int operator==(ByteString &, ByteString &);

#endif // BYTESTRING_H
