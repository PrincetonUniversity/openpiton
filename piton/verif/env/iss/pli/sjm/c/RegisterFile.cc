// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: RegisterFile.cc
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
// Description:  The register file for SJM.
//
//------------------------------------------------------------------------------

#include "RegisterFile.h"

//------------------------------------------------------------------------------
// Constructor. Must specify the number of entries for the register file.
RegisterFile::RegisterFile(char *name, int s)
{
  modname = new char[strlen(name)+1];
  strcpy(modname, name);

  size = s;
//   reg_valid = new byte[size];
//   reg_registers = new ByteString *[size];
//   for (int i = 0; i < size; i++) {
//     reg_registers[i] = new ByteString(DEFAULT_CACHE_LINE_SIZE);
//     reg_valid[i] = 0;
//   }
  reg_registers = new RegFileEntry *[size];
  for (int i = 0; i < size; i++) {
    reg_registers[i] = NULL;
  }
  reg_ccr = 0;
}


//------------------------------------------------------------------------------
// Destructor.
RegisterFile::~RegisterFile()
{
  delete modname;
  delete[] reg_registers;
}


//------------------------------------------------------------------------------
// Clear the contents of the register file.
void RegisterFile::Clear()
{
  for (int i = 0; i < size; i++) {
    if (reg_registers[i]) {
      reg_registers[i]->Clear();
//     reg_valid[i] = 0;
    }
  }
  reg_ccr = 0;
}


//------------------------------------------------------------------------------
// Put data into the register file. May set the ccr register.
int RegisterFile::Set(int r, ByteString *bstr, int start, int len, byte setcc)
{
  if ((r < 0) || (r >= size)) {
    dprintf(modname, 49, 0, "Invalid register file index %d.", r);
    return NULL;
  }

//   reg_registers[r]->Copy(bstr);
//   reg_valid[r] = 1;
  if (!reg_registers[r]) {
    reg_registers[r] = new RegFileEntry(bstr, start, len);
  } else {
    reg_registers[r]->Write(bstr, start, len);
  }

  if (setcc) {
    SetCC(bstr, start, len);
  }
  return 1;
}


//------------------------------------------------------------------------------
// Get data from the register file.
ByteString *RegisterFile::Get(int r)
{
  if ((r < 0) || (r >= size)) {
    dprintf(modname, 49, 0, "Invalid register file index %d.", r);
    return NULL;
  }

//   if (!reg_valid[r]) {
  if (!reg_registers[r]->valid) {
    dprintf(modname, 49, 0, "Attempting to access invalid register %d.", r);
    return NULL;
  }
  return reg_registers[r]->data;
}


//------------------------------------------------------------------------------
// Invert a register.
int RegisterFile::Invert(int r)
{
  if ((r < 0) || (r >= size)) {
    dprintf(modname, 49, 0, "Invalid register file index %d.", r);
    return 0;
  }
  if (!reg_registers[r]->valid) {
    dprintf(modname, 49, 0, "Attempting to access invalid register %d.", r);
    return 0;
  }
  reg_registers[r]->Invert();
  return 1;
}


//------------------------------------------------------------------------------
// Set the ccr register, using the given ByteString. Compares the ByteString to
// zero. The ccr register is set to -1 if the ByteString is less than 0, 1 if
// the ByteString is greater than 0, 0 if the ByteString is equal to 0.
void RegisterFile::SetCC(ByteString *bstr, int start, int len)
{
  ByteString *cmpstr = new ByteString(bstr->GetSize());
//   reg_ccr = bstr->Compare(cmpstr);
  SetCC(bstr, cmpstr, start, len);
  delete cmpstr;
}


//------------------------------------------------------------------------------
// Set the ccr regsister by comparing two ByteStrings. The ccr register is set
// to -1 if bstr0 is less than bstr1, 1 if bstr0 is greater than bstr1, 0 if
// the ByteStrings are equal;
void RegisterFile::SetCC(ByteString *bstr0, ByteString *bstr1, int start, int len)
{
  ByteString *b0 = new ByteString(len);
  ByteString *b1 = new ByteString(len);
  b0->Copy(0, start, len, bstr0);
  b1->Copy(0, start, len, bstr1);
  reg_ccr = b0->Compare(b1);
  delete b0;
  delete b1;
}


//------------------------------------------------------------------------------
// Set the ccr register by comparing two registers in the register file.
void RegisterFile::SetCC(int r0, int r1)
{
  if (!reg_registers[r0] || !reg_registers[r1]) {
//   if (!reg_registers[r0]->valid  || !reg_registers[r1]->valid) {
    dprintf(modname, 49, 0, "Attempting to compare invalid registers %d or %d", r0, r1);
    return;
  }
  if (reg_registers[r0]->Size() != reg_registers[r1]->Size()) {
    dprintf(modname, 49, 0, "Attempting to compare registers %d and %d, which were loaded with differently-sized data.", r0, r1);
    return;
  }
//   SetCC(reg_registers[r0]->data, reg_registers[r1]->data);
  reg_ccr = reg_registers[r0]->data->Compare(reg_registers[r1]->data);
}


//------------------------------------------------------------------------------
// Set the ccr register.
void RegisterFile::SetCC(int n)
{
  if (!n) {
    reg_ccr = 0;
  } else {
    reg_ccr = 1;
  }
}
