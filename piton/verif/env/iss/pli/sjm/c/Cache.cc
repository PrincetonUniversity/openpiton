// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: Cache.cc
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
// Description:  Directe-mapped, configurable cache.
//
//------------------------------------------------------------------------------

#include "Cache.h"


//------------------------------------------------------------------------------
// Constructor. Must be given a width, in bytes.
CacheLine::CacheLine(int w)
{
  width = w;
  data = new ByteString(width);
  tag = -1;
  state = CSTATE_I;
}


//------------------------------------------------------------------------------
// Destructor.
CacheLine::~CacheLine()
{
  delete data;
}

//------------------------------------------------------------------------------
// Change the state of this line. Returns 1 if the transition was valid, 0
// otherwise.
int CacheLine::ChangeState(char nstate)
{
  if ((nstate != state) &&
      ((state == CSTATE_M) && ((nstate == CSTATE_E) || (nstate == CSTATE_S))) ||
      ((state == CSTATE_O) && ((nstate == CSTATE_E) || (nstate == CSTATE_S))) ||
      ((state == CSTATE_E) && (nstate == CSTATE_O)) ||
      ((state == CSTATE_S) && ((nstate == CSTATE_O) || (nstate == CSTATE_E))) ||
      ((state == CSTATE_I) && (nstate == CSTATE_O))) {
    return 0;
  }
//   dprintf("cache", 0, 0, "Transitioning %c->%c.", Cache::GetStateString(state), Cache::GetStateString(nstate));
  state = nstate;
  return 1;
}


//------------------------------------------------------------------------------
// Print a state change.
void CacheLine::PrintStateChange(int i, char s)
{
  dprintf("cache", 0, 0, "Changing state for cache entry %d, tag 0x%llx, %c->%c", i, tag, Cache::GetStateString(state), Cache::GetStateString(s));
}




//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Default constructor. Uses the default cache and cacheline sizes.
Cache::Cache()
{
  linewidth = DEFAULT_CACHE_LINE_SIZE;
  numlines = DEFAULT_CACHE_SIZE / DEFAULT_CACHE_LINE_SIZE;
  numsets = 1;
  initCache();
}


//------------------------------------------------------------------------------
// Constructor. Caller specifies a cache size, in bytes.
Cache::Cache(int size)
{
  linewidth = DEFAULT_CACHE_LINE_SIZE;
  numlines = size / DEFAULT_CACHE_LINE_SIZE;
  numsets = 1;
  initCache();
}


//------------------------------------------------------------------------------
// Constructor. Caller specifies the size and associativity.
Cache::Cache(int size, int sets)
{
  linewidth = DEFAULT_CACHE_LINE_SIZE;
  numsets = sets;
  numlines = size / (numsets * DEFAULT_CACHE_LINE_SIZE);
  initCache();
}


//------------------------------------------------------------------------------
// Constructor. Caller specifies a cache size and linewidth, both in bytes.
// Cache::Cache(int size, int width)
// {
//   linewidth = width;
//   numlines = size / width;
//   numsets = 1;
//   initCache();
// }


//------------------------------------------------------------------------------
// Destructor.
Cache::~Cache()
{
  for (int i = 0; i < numlines; i++) {
    delete table[i];
  }
  delete table;
}


//------------------------------------------------------------------------------
// Returns a character representation of the cache state.
char Cache::GetStateString(char c)
{
  if (c == CSTATE_M) {
    return 'M';
  }
  if (c == CSTATE_O) {
    return 'O';
  }
  if (c == CSTATE_E) {
    return 'E';
  }
  if (c == CSTATE_S) {
    return 'S';
  }
  if (c == CSTATE_I) {
    return 'I';
  }
  // Should never reach this point.
  return -1;
}


//------------------------------------------------------------------------------
// Clear the contents of the cache. Sets all lines to invalid.
void Cache::Clear()
{
  for (int i = 0; i < numlines; i++) {
    CacheLine *cline = table[i];
//     dprintf("cache", 11, 0, "Changing state for cache entry %d, tag 0x%llx", i, cline->tag);
    cline->ChangeState(CSTATE_I);
  }
}


//------------------------------------------------------------------------------
// Writes a single word of data to the cache, with a state. Returns 1 if
// successful, 0 if not. Offset field is ignored.
int Cache::WriteLine(ull adin, ByteString *datain, char stin)
{
  ull lnum = GetIndexBits(adin);
  ull tag = GetTagBits(adin);

  CacheLine *cline = table[lnum];
  cline->tag = tag;
  cline->data->Copy(datain);
//   dprintf("cache", 0, 0, "Changing state for cache entry %d, tag 0x%llx, %c->%c", lnum, cline->tag, GetStateString(cline->state), GetStateString(stin));
  cline->PrintStateChange(lnum, stin);
  return cline->ChangeState(stin);
}


//------------------------------------------------------------------------------
// Write a string of bytes into a cache line. Where to start writing is
// determined by the offset.
int Cache::Write(ull adin, ByteString *datain, char stin)
{
  ull lnum = GetIndexBits(adin);
  ull tag = GetTagBits(adin);
  ull offset = GetOffsetBits(adin);

  CacheLine *cline = table[lnum];
  cline->tag = tag;
  cline->data->Copy(offset, DEFAULT_WORD_SIZE, datain);
//   dprintf("cache", 0, 0, "Changing state for cache entry %d, tag 0x%llx, %c->%c", lnum, cline->tag, GetStateString(cline->state), GetStateString(stin));
  cline->PrintStateChange(lnum, stin);
  cline->ChangeState(stin);
  return 1;
}


//------------------------------------------------------------------------------
// Read a line from the cache and puts it into the dout arg. Return 1 if the
// word can be read, 0 otherwise. Offset field is ignored.
ByteString *Cache::ReadLine(ull adin)
{
  ull lnum = GetIndexBits(adin);
  CacheLine *cline = table[lnum];
  if (cline->state == CSTATE_I) {
    return NULL;
  }
  return cline->data;
}


//------------------------------------------------------------------------------
// Get the address of a line, using the line num from another address. The
// offset is not added.
ull Cache::GetAddress(ull adin)
{
  ull lnum = GetIndexBits(adin);

  CacheLine *cline = table[lnum];
  lnum <<= indexshift;
  lnum |= (cline->tag << tagshift);
  return lnum;
}


//------------------------------------------------------------------------------
// Get the tag of a line, given the address as the index.
ull Cache::GetTag(ull adin)
{
  ull lnum = GetIndexBits(adin);

  CacheLine *cline = table[lnum];
  return cline->tag;
}


//------------------------------------------------------------------------------
// Get the state of a line, given its address.
char Cache::GetState(ull adin)
{
  ull lnum = GetIndexBits(adin);
  CacheLine *cline = table[lnum];
  return cline->state;
}


//------------------------------------------------------------------------------
// Change the state of a line, but only if the tags match.
int Cache::ChangeState(ull adin, char stin)
{
  ull lnum = GetIndexBits(adin);
  CacheLine *cline = table[lnum];
//   dprintf("cache", 0, 0, "Changing state for cache entry %d, tag 0x%llx, %c->%c", lnum, cline->tag, GetStateString(cline->state), GetStateString(st));
  cline->PrintStateChange(lnum, stin);
  return cline->ChangeState(stin);
}


//------------------------------------------------------------------------------
// Checks if a line is in the cache. The tag must match exactly, but offset is
// ignored.
int Cache::Contains(ull adin)
{
  ull lnum = GetIndexBits(adin);
  ull tag = GetTagBits(adin);
  
  if (table[lnum]->tag == tag) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Initializer for the constructors.
void Cache::initCache()
{
  // The shift amount for the lnum field is the same as the number of bits in
  // the offset field.
  indexshift = (log10((double)linewidth)) / 0.301;
  int nlnumbits = (log10((double)numlines)) / 0.301;

  // Generate the offset mask.
  offsetmask = 0;
  for (int i = 0; i < indexshift; i++) {
    offsetmask <<= 1;
    offsetmask |= 1;
  }
  // Generate the line num mask.
  indexmask = 0;
  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < nlnumbits; i++) {
      indexmask <<= 1;
      indexmask |= 1;
    }
  }
  indexmask <<= indexshift;
  // Generate the tag mask.
  tagmask = ~(indexmask ^ offsetmask);
  tagshift = indexshift + nlnumbits;
  // Generate the cache lines.
  table = new CacheLine *[numlines];
  if (1) { // <--------------------------------------------------- compiler hack
    for (int i = 0; i < numlines; i++) {
      table[i] = new CacheLine(linewidth);
    }
  }
}
