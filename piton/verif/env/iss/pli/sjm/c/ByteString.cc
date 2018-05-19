// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ByteString.cc
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
// Description:  An object that stores an array of bytes.
//
//------------------------------------------------------------------------------

#include "ByteString.h"


//------------------------------------------------------------------------------
// Constructor. Must specify a size, in bytes. Object is invalid because no data
// has been specified.
ByteString::ByteString(int s)
{
  size = s;
  data = new char[size];
  for (int i = 0; i < size; i++) {
    data[i] = 0;
  }
}


//------------------------------------------------------------------------------
// Constructor. Initialize the data with a string representation of a hex
// value. The size is initialized to the length of the string.
ByteString::ByteString(char *str)
{
  size = strlen(str);
  data = new char[size];
  for (int i = 0; i < size; i++) {
    AddByte(i, str[i]);
  }
}


//------------------------------------------------------------------------------
// Copy constructor.
ByteString::ByteString(ByteString &bstr)
{
  size = bstr.size;
  data = new char[size];
  for (int i = (size - 1); i >= 0; i--) {
    data[i] = bstr.data[i];
  }
}


//------------------------------------------------------------------------------
// Copy constructor. Copies only a set of bytes from another ByteString. The
// arguments specify the first and last bytes to copy. It is assumed that both
// are within the range of the argument.
ByteString::ByteString(ByteString &bstr, int start, int len)
{
  size = bstr.size;
  data = new char[size];
  for (int i = 0; i < size; i++) {
    data[i] = 0;
    if ((i >= start) && (i < (start + len))) {
      data[i] = bstr.data[i];
    }
  }
}


//------------------------------------------------------------------------------/
// Destructor.
ByteString::~ByteString()
{
  delete[] data;
}


//------------------------------------------------------------------------------
// Add a byte to the string, given an index.
int ByteString::AddByte(int indx, char d)
{
  if (indx >= size) {
    return 0;
  }
  data[indx] = d;
  return 1;
}


//------------------------------------------------------------------------------
// Add a halfbyte to a given index.
int ByteString::AddHalfByte(int indx, char d)
{
  if (indx >= size) {
    return 0;
  }
  data[indx] <<= 4;
  data[indx] |= d;
  return 1;
}


//------------------------------------------------------------------------------
// Set the data with data from an int, starting at the specified index.
void ByteString::Set(int indx, int d)
{
  if (indx >= size) {
    return;
  }
  int ival;
  for (int i = indx; i < (indx + 4); i++) {
    ival = d & 0xff000000;
    data[i] = (ival >> 24) & 0xff;
    d <<= 8;
  }
}


//------------------------------------------------------------------------------
// Set the data with data from an unsigned long long, starting at the specified
// index.
void ByteString::Set(int indx, ull d)
{
  if (indx >= size) {
    return;
  }
  ull ival;
  for (int i = indx; i < (indx + 8); i++) {
    ival = d & 0xff00000000000000;
    data[i] = (ival >> 56) & 0xff;
    d <<= 8;
  }
}


//------------------------------------------------------------------------------
// Get a byte in this ByteString. Returns 0 if the caller is asking for invalid
// bytes.
char *ByteString::GetByte(int indx)
{
  if (indx >= size) {
    return NULL;
  }
  return &data[indx];
}


//------------------------------------------------------------------------------
// Get a subset of bytes, given a start point and return 4 bytes as an unsigned
// int. If the start point is out of range, return 0.
int ByteString::GetInt(int start)
{
  if (start >= size) {
    return 0;
  }
  unsigned int out = 0;
  for (int i = start; i < (start + 4); i++) {
    out <<= 8;
    if (i < size) {
      out |= (data[i] & 0xff);
    }
  }
  return out;
}


//------------------------------------------------------------------------------
// Get a subset of bytes, given a start point, and return 8 bytes as a ull. If
// the start point is beyond the valid bytes, return 0.
ull ByteString::GetUll(int start)
{
  if (start >= size) {
    return 0;
  }
  ull out = 0;
  for (int i = start; i < (start + 8); i++) {
    out <<= 8;
    if (i < size) {
      out |= (data[i] & 0xff);
    }
  }
  return out;
}


//------------------------------------------------------------------------------
// Copy the values from another ByteString into this one.
void ByteString::Copy(ByteString *bstr)
{
  for (int i = 0; (i < size) && (i < bstr->GetSize()); i++) {
    data[i] = *bstr->GetByte(i);
  }
}


//------------------------------------------------------------------------------
// Copy a set of bytes from another ByteString. The start and end arguments
// specify the first and last bytes to copy from in the argument. It is assumed
// that end is within the range of argument.
void ByteString::Copy(int start, int len, ByteString *bstr)
{
  for (int i = start; (i < (start + len)) && (i < size) && (i < bstr->GetSize()); i++) {
    data[i] = *bstr->GetByte(i);
  }
}


//------------------------------------------------------------------------------
// Copy a set of bytes from another ByteString. Must specify the start point in
// both ByteStrings.
void ByteString::Copy(int start0, int start1, int len, ByteString *bstr)
{
  for (int i = start0, j = start1; (i < (start0 + len)) && (j < (start1 + len)) && (i < size) && (j < bstr->GetSize()); i++, j++) {
    data[i] = *bstr->GetByte(j);
  }
}

//------------------------------------------------------------------------------
//set a series of bytes to specified value

void ByteString::Copy(int start0, int start1, int len, char value)
{
  for (int i = start0, j = start1; (i < (start0 + len)) && (i < size); i++) {
    data[i] = value;
  }
}


//------------------------------------------------------------------------------
// Compares this object to another. Returns -1 if this ByteString is less than
// the argument, 0 if they are equal, and 1 if this Bytestring is greater than
// the argument.
int ByteString::Compare(ByteString *bstr)
{
  int ret = 0;
  // For simplicity, copy the argument into a ByteString of length equal to
  // this one. Shorter strings are 0 extended, longer ones are truncated.
  ByteString *nstr = new ByteString(size);
  nstr->Copy(bstr);

  // Compare the highest order bytes to check for negativity.
  char nbyte = *nstr->GetByte(0);
  if ((data[0] < 0) && (nbyte >= 0)) {
    // This string is negative, argument is not.
    ret = -1;
  }
  if ((data[0] >= 0) && (nbyte < 0)) {
    // The argument is negative, this string is not.
    ret = 1;
  }
  if (ret != 0) {
    delete nstr;
    return ret;
  }
  // They're both negative or both positive. Have to compare everything.
  for (int i = 0; i < size; i++) {
    nbyte = *nstr->GetByte(i);
    if (data[i] != nbyte) {
      if ((int) data[i] < (int) nbyte) {
	ret = -1;
	break;
      }
      if ((int) data[i] > (int) nbyte) {
	ret = 1;
	break;
      }
    }
  }
  delete nstr;
  return ret;
}


//------------------------------------------------------------------------------
// Compares a specific number of bytes between this object and another object.
// It is assumed that num specifies the number of lower order bytes to compare.
int ByteString::Compare(int num, ByteString *bstr)
{
  ByteString *tstr = new ByteString(num);
  tstr->Copy(this);
  int ret = tstr->Compare(bstr);
  delete tstr;
  return ret;
}


//------------------------------------------------------------------------------
// Compares a specific number of bytes between this object and another, given
// a start point. Both start and len must be within the bounds of both strings.
int ByteString::Compare(int start, int len, ByteString *bstr)
{
  if ((size <= start) || (bstr->GetSize() <= start) ||
      ((start + len) > size) || ((start + len > bstr->GetSize()))) {
    return 0;
  }

  for (int i = start; i < start + len; i++) {
    if (data[i] != *bstr->GetByte(i)) {
      return 0;
    }
  }
  return 1;
}


//------------------------------------------------------------------------------
// Checks if this object is valid.
// int ByteString::Valid()
// {
//   return valid;
// }


//------------------------------------------------------------------------------
// Returns 1 if the ByteString is full, 0 otherwise.
// int ByteString::Full()
// {
//   if (ptr == size) {
//     return 1;
//   }
//   return 0;
// }


//------------------------------------------------------------------------------
// Returns the size.
int ByteString::GetSize()
{
  return size;
}


//------------------------------------------------------------------------------
// Clears the data to all 0.
void ByteString::Clear()
{
  for (int i = 0; i < size; i++) {
    data[i] = 0;
  }
//   ptr = size;
//   valid = 1;
}


//------------------------------------------------------------------------------
// Print the byte string as a series of hex numbers.
char *ByteString::Print()
{
  int tmp = size / 4;
  if (size % 4) {
    tmp++;
  }
  // char *outbuf = new char[tmp];
  char *outbuf = new char[256];
  sprintf(outbuf, "0x");
  int len = 2;
  for (int i = 0; i < size; i++) {
    if ((i != 0) && ((i % 8) == 0)) {
      sprintf(&outbuf[len], " 0x");
      len += 3;
    }
    tmp = data[i] & 0xff;
    if (tmp == 0) {
      sprintf(&outbuf[len], "00");
    } else {
      sprintf(&outbuf[len], "%02x", tmp);
    }
    len += 2;
  }
  return outbuf;
}



// Overloaded operators. -------------------------------------------------------

//------------------------------------------------------------------------------
// Returns 1 if the ByteStrings are identical. They are not identical if the
// sizes don't match, regardless of their content.
// int operator==(ByteString &bstr0, ByteString &bstr1)
// {
//   if (bstr0.size != bstr1.size) {
//     return 0;
//   }
//   for (int i = 0; i < bstr0.size; i++) {
//     if (bstr0.data[i] != bstr1.data[i]) {
//       return 0;
//     }
//   }
//   return 1;
// }
