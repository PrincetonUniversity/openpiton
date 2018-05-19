// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: RegisterFile.h
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
// Description:  The register file for SJM.
//
//------------------------------------------------------------------------------

#include "globals.h"
#include "JBus.h"

#ifndef REGISTER_FILE
#define REGISTER_FILE

class RegFileEntry
{
public:
  ByteString *data;
  byte valid;
  int start;

  RegFileEntry(ByteString *bstr, int st, int si) {
    data = new ByteString(si);
    data->Copy(0, st, si, bstr);
    valid = 1;
    start = st;
  }
  ~RegFileEntry() {
    delete data;
  }
  void Write(ByteString *bstr, int st, int si) {
    delete data;
    data = new ByteString(si);
    data->Copy(0, st, si, bstr);
    valid = 1;
    start = st;
  }
  void Invert() {
    char b;
    for (int i = 0; i < data->GetSize(); i++) {
      b = *data->GetByte(i);
      data->AddByte(i, ~b);
    }
  }
  int Size() { return data->GetSize(); }
  void Clear() { valid = 0; }
};


class RegisterFile
{
private:
  char *modname;
//   ByteString **reg_registers;
//   byte *reg_valid;
  RegFileEntry **reg_registers;
  byte reg_ccr;
  int size;

public:
  RegisterFile(char *, int);
  ~RegisterFile();
  void Clear();
  int Set(int, ByteString *, int, int, byte);
  ByteString *Get(int);
  int Invert(int);
  void SetCC(ByteString *, int, int);
  void SetCC(ByteString *, ByteString *, int, int);
  void SetCC(int, int);
  void SetCC(int);
  int GetCCR() { return (int) reg_ccr; }
};

# endif // REGISTER_FILE
