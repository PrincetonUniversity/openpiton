// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ReadOutBuffer.cc
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
// Description:  The outstanding read return buffer for SJM.
//
//------------------------------------------------------------------------------

#include "ReadOutBuffer.h"


//int ReadOutBuffer::ORB_timeout = J_READBUFF_TIMEOUT;

//------------------------------------------------------------------------------
// Constructor.
ReadOutBuffer::ReadOutBuffer(char *name, Cache *c, RegisterFile *r, int buffersize)
{
  readbuffersize = buffersize;
  modname = new char[strlen(name)+1];
  strcpy(modname, name);
  ORB_timeout = J_READBUFF_TIMEOUT;
  cache = c;
  regfile = r;

  for (int i = 0; i < readbuffersize; i++) {
    entries[i] = new ReadBuffEntry();
  }
  numvalid = 0;

}


//------------------------------------------------------------------------------
// Destructor.
ReadOutBuffer::~ReadOutBuffer()
{
  delete modname;
  delete[] entries;
//   for (int i = 0; i < readbuffersize; i++) {
//     delete entries[i];
//   }
}


//------------------------------------------------------------------------------
// Determines if expdata needs to be compared to indata, based in the
// transaction type.
int ReadOutBuffer::CompareData(int t)
{
  if ((t == T_RD) || (t == T_RDD) || (t == T_RDS) || (t == T_RDSA) || (t == T_NCRD) || (t == T_NCBRD)) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Determines if indata should be modified with expdata, based on the
// transaction type.
int ReadOutBuffer::ModifyData(int t)
{
  if (t == T_RDO) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Reset. Clear the buffer entries.
void ReadOutBuffer::Reset()
{
  for (int i = 0; i < readbuffersize; i++) {
    entries[i]->Clear();
  }
  numvalid = 0;
}


//------------------------------------------------------------------------------
// Add an entry to the buffer. Returns the index the for the new entry, or -1
// if the entry could not be added.
int ReadOutBuffer::Add(ReadBuffEntry *entry)
{
  if (Full()) {
    return -1;
  }

  // Find an empty entry.
  for (int i = 0; i < readbuffersize; i++) {
    if (!entries[i]->valid) {
      delete entries[i];
      entries[i] = entry;
      entries[i]->valid = 1;
      if (CompareData(entry->type)) {
	entries[i]->compare = 1;
      }
      if (ModifyData(entry->type)) {
	entries[i]->modify = 1;
      }
      numvalid++;
      return i;
    }
  }
  return -1;
}


//------------------------------------------------------------------------------
// Add an entry to the buffer, given data for that entry.
int ReadOutBuffer::Add(int t, ull a, int sz, char st, int reg, byte cc)
{
  if (Full()) {
    return -1;
  }

  // Find an empty entry.
  for (int i = 0; i < readbuffersize; i++) {
    if (!entries[i]->valid) {
      entries[i]->valid = 1;
      entries[i]->type = t;
      entries[i]->addr = a;
      entries[i]->dsize = sz;
      entries[i]->cstate = st;
      entries[i]->reg = reg;
      entries[i]->setcc = cc;
      if (CompareData(t)) {
	entries[i]->compare = 1;
      }
//      dprintf(modname, 0, 0, "ReadOutBuffer::Add: t==%d, so entries[%d]->compare set to %d", t, i, entries[i]->compare);
      if (ModifyData(t)) {
	entries[i]->modify = 1;
      }
      numvalid++;
      return i;
    }
  }
  return -1;
}


//------------------------------------------------------------------------------
// Add expected data to an entry.
int ReadOutBuffer::AddData(int indx, ByteString *bstr)
{
  if (!entries[indx]->valid) {
    return 0;
  }
  entries[indx]->expdata->Copy(bstr);
  entries[indx]->dvalid = 1;
  return 1;
}


//------------------------------------------------------------------------------
// Expect a RDERR packet for an entry.
int ReadOutBuffer::ExpectErrorPkt(int indx, int rderr_type)
{
  if (!entries[indx]->valid) {
    return 0;
  }
  entries[indx]->expected_rderr_type = rderr_type;
  entries[indx]->expect_rderr = 1;
  return 1;
}


//------------------------------------------------------------------------------
// Invalidate an entry.
void ReadOutBuffer::Remove(int indx)
{
  entries[indx]->Clear();
  numvalid--;
}


//------------------------------------------------------------------------------
// Get an entry for processing. Returns NULL if trying to access an invalid
// entry.
ReadBuffEntry *ReadOutBuffer::Get(int indx)
{
  if (!entries[indx]->valid) {
    return NULL;
  }
  return entries[indx];
}


//------------------------------------------------------------------------------
// Set the compare bit for a specific entry.
int ReadOutBuffer::SetCompare(int indx)
{
  if (!entries[indx]->valid) {
    return 0;
  }
  entries[indx]->compare = 1;
  return 1;
}


//------------------------------------------------------------------------------
// Set the modify bit for a specific entry.
int ReadOutBuffer::SetModify(int indx)
{
  if (!entries[indx]->valid) {
    return 0;
  }
  entries[indx]->modify = 1;
  return 1;
}


//------------------------------------------------------------------------------
// Unset the modify bit.
int ReadOutBuffer::UnsetModify(int indx)
{
  if (!entries[indx]->valid) {
    return 0;
  }
  entries[indx]->modify = 0;
  return 1;
}


//------------------------------------------------------------------------------
// Sets an entry as being on the bus. Returns 1 if the entry is valid, 0
// otherwise.
int ReadOutBuffer::SetOnBus(int indx)
{
  if (!entries[indx]->valid) {
    return 0;
  }
  entries[indx]->onbus = 1;
  entries[indx]->timeoutcnt++;
  return 1;
}


//------------------------------------------------------------------------------
// Returns the address of a particular index.
ull ReadOutBuffer::GetAddress(int indx)
{
  return entries[indx]->addr;
}


//------------------------------------------------------------------------------
// Checks if the given address is in the buffer and is marked as outstanding.
// Assume that the address is correct, meaning the bits [3:0] are 0x0, and
// bits [5:4] containthe byte order.
int ReadOutBuffer::Contains(ull addr)
{
  for (int i = 0; i < readbuffersize; i++) {
    if (entries[i]->MatchAddress(addr)) {
      return 1;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Check if the caller should block on an address because the address is in
// the read buffer or an entry in the read buffer will modify the same cache
// line as the given address.
int ReadOutBuffer::BlockOn(ull addr)
{
  for (int i = 0; i < readbuffersize; i++) {
    if (entries[i]->valid && (entries[i]->MatchAddress(addr) || (cache->GetIndexBits(entries[i]->addr) == cache->GetIndexBits(addr)))) {
      return 1;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Checks if a transaction for the given index has been put onto the bus.
int ReadOutBuffer::OnBus(int indx)
{
  return entries[indx]->onbus;
}


//------------------------------------------------------------------------------
// Checks if a transaction for the given address has been put onto the bus.
// Assume the address is correct.
int ReadOutBuffer::OnBus(ull addr)
{
  for (int i = 0; i < readbuffersize; i++) {
    if (entries[i]->MatchAddress(addr)) {
      return entries[i]->onbus;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// Set the blocking condition for an entry. Returns 1 if the address is located.
// Returns 0 otherwise.
int ReadOutBuffer::SetBlocking(void *arg)
{
  Snoop *snp = (Snoop *) arg;
//   for (int i = 0; i < readbuffersize; i++) {
//     if (entries[i]->MatchAddress(addr)) {
//       entries[i]->blocking = 1;
//       return 1;
//     }
//   }
  if (entries[snp->orb_indx]->MatchAddress(snp->addr)) {
    entries[snp->orb_indx]->blocking = 1;
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Check if an entry has the blocking condition set.
int ReadOutBuffer::IsBlocking(ull addr)
{
  for (int i = 0; i < readbuffersize; i++) {
    if (entries[i]->MatchAddress(addr)) {
      return entries[i]->blocking;
    }
  }
  return 0;
}


//------------------------------------------------------------------------------
// A read error packet was received. If the outstanding read was expecting data,
// report an error. Otherwise just report the packet.
void ReadOutBuffer::ReportError(int indx, byte type)
{
  char msg[1024];
  if (ReadBuffEntry::GetREADERRType(type) == NULL) {
    dprintf(modname, 49, 0, "Invalid read error type %d.", type);
    return;
  } else {
    sprintf(msg, "Received %s RDERR for outstanding read entry %d", ReadBuffEntry::GetREADERRType(type), indx);
  }
//  dprintf(modname, 0, 0, "entries[%d]->valid = %d, entries[%d]->compare = %d, entries[%d]->dvalid = %d", indx, entries[indx]->valid, indx, entries[indx]->compare, indx, entries[indx]->dvalid);
  if (!(entries[indx]->valid)) {
    dprintf(modname, 49, 0, "%s.  The read entry is also invalid.", msg);
  } else if (entries[indx]->expect_rderr) {
    if (entries[indx]->expected_rderr_type == type) {
      dprintf(modname, 0, 0, "%s while this read was expecting this error", msg);
    } else {
      dprintf(modname, 49, 0, "%s while this read was expecting %s error", msg, ReadBuffEntry::GetREADERRType(type));
    }
  } else if (entries[indx]->compare && entries[indx]->dvalid) {
    dprintf(modname, 49, 0, "%s while this read was expecting data", msg);
  } else {
    dprintf("sjm_read_error", 49, 0, "%s.", msg);
    dprintf(modname, 0, 0, "%s.", msg);
  }
  Remove(indx);
}


//------------------------------------------------------------------------------
// Returns 1 if the buffer is empty, 0 otherwise.
int ReadOutBuffer::Empty()
{
  if (numvalid == 0) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Returns 1 if the buffer is full, 0 otherwise.
int ReadOutBuffer::Full()
{
  if (numvalid == readbuffersize) {
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Cycle this module.
void ReadOutBuffer::Cycle()
{
  for (int i = 0; i < readbuffersize; i++) {
    if (entries[i]->dataret && !((SnoopControl *) snpctrl)->SnoopPending(i)) {
      dprintf(modname, 0, 0, "Data returned to index %d in the outstanding read buffer.", i);

      // Report ecc errors first.
      for (int j = 0; j < 4; j++) {
	if (entries[i]->ecc[j] == ECC_CORRECT) {
	  dprintf(modname, 0, 0, "Correctable ECC err on %d-th 16 bytes.", j + 1);
	} else if (entries[i]->ecc[j] == ECC_UNCORRECT) {
	  dprintf(modname, 0, 0, "Uncorrectable ECC err on %d-th 16 bytes.", j + 1);
	}
      }

      ByteString *bstr = entries[i]->indata;

      int cmp_start = entries[i]->addr & 0x3f;
      int cmp_len = entries[i]->dsize;

      // Make sure the overrun test is satisfied.
      if (cmp_len == DEFAULT_CACHE_LINE_SIZE) {
	cmp_len -= cmp_start;
      }

      if ((get_trans_type(entries[i]->type) == TYPE_NCREAD) && (entries[i]->dsize <= 16) && ((entries[i]->mask & 0xffff) != 0xffff)) {
	// 16B READIO, must mask. Compare starts at beginning of quadword. Must
	// compare whole quadword.
	cmp_start &= 0x30;
	cmp_len = 16;
	for (int j = 0; j < 16; j++) {
	  if (!(entries[i]->mask & 0x1)) {
	    bstr->AddByte((entries[i]->addr & 0x30) + j, 0);
	  }
	  entries[i]->mask >>= 1;
	}
      }

      short miscompare = 0;
      // Compare the data received to the data expected.
      if (entries[i]->compare && entries[i]->dvalid && !entries[i]->expdata->Compare(cmp_start, cmp_len, bstr)) {
	if (!entries[i]->setcc) {
	  dprintf(modname, 49, 8, "Expected read data for address 0x%llx does not match what was returned on the bus.\n\t\texpected:\n\t\t0x%0.16llx 0x%0.16llx\n\t\t0x%0.16llx 0x%0.16llx\n\t\t0x%0.16llx 0x%0.16llx\n\t\t0x%0.16llx 0x%0.16llx\n\t\treturned:\n\t\t0x%0.16llx 0x%0.16llx\n\t\t0x%0.16llx 0x%0.16llx\n\t\t0x%0.16llx 0x%0.16llx\n\t\t0x%0.16llx 0x%0.16llx\n", entries[i]->addr,
		  entries[i]->expdata->GetUll(0), entries[i]->expdata->GetUll(8),
		  entries[i]->expdata->GetUll(16), entries[i]->expdata->GetUll(24),
		  entries[i]->expdata->GetUll(32), entries[i]->expdata->GetUll(40),
		  entries[i]->expdata->GetUll(48), entries[i]->expdata->GetUll(56),
		  bstr->GetUll(0), bstr->GetUll(8), bstr->GetUll(16), bstr->GetUll(24),
		  bstr->GetUll(32), bstr->GetUll(40), bstr->GetUll(48), bstr->GetUll(56));
	} else {
	  dprintf(modname, 0, 0, "Expected data for read to address 0x%llx does not match what was returned on the bus.", entries[i]->addr);
	}
	miscompare = 1;
      }
      // Put the line into the cache, unless it should not be cached.
      if (entries[i]->modify) {
	// Overwrite the desired bytes.
	if (entries[i]->compare) {
	  // This entry was created by LOCK. Data is written regardless of
	  // compare state.
	  bstr->Copy(entries[i]->addr & 0x3f, (entries[i]->addr & 0x3f) + entries[i]->dsize,
		     entries[i]->dsize, (char)0xff);
	} else if (!miscompare) {
	  bstr->Copy(entries[i]->addr & 0x3f, entries[i]->dsize, entries[i]->expdata);
	}
      }
      /*      if ((entries[i]->type != T_RDD) && (entries[i]->type != T_NCRD) && (entries[i]->type != T_NCBRD)) {*/
      if ((entries[i]->type != T_RDD) /*&& (entries[i]->type != T_RDS) && 
					(entries[i]->type != T_RDSA)*/ && 
	  (entries[i]->type != T_NCBRD) && (entries[i]->type != T_NCRD)) 
	{ //For Niagara support, prevent RDS(A) from caching its data
	dprintf(modname, 0, 0, "Caching line to address 0x%llx, state %c", entries[i]->addr, Cache::GetStateString(entries[i]->cstate));
	dprintf(modname, 0, 0, "0x%0.16llx 0x%0.16llx", bstr->GetUll(0), bstr->GetUll(8));
	dprintf(modname, 0, 0, "0x%0.16llx 0x%0.16llx", bstr->GetUll(16), bstr->GetUll(24));
	dprintf(modname, 0, 0, "0x%0.16llx 0x%0.16llx", bstr->GetUll(32), bstr->GetUll(40));
	dprintf(modname, 0, 0, "0x%0.16llx 0x%0.16llx", bstr->GetUll(48), bstr->GetUll(56));
	// Line has all ready been evicted by this point. Line must be
	// invalidated before written.
	if (!cache->ChangeState(entries[i]->addr, CSTATE_I)) {
	  dprintf(modname, 49, 0, "Problem transition cacheline for 0x%llx to state %c", entries[i]->addr, Cache::GetStateString(CSTATE_I));
	}
	if (!cache->WriteLine(entries[i]->addr, bstr, entries[i]->cstate)) {
	  dprintf(modname, 49, 0, "Problem writing cache with address 0x%llx, state %c", entries[i]->addr, Cache::GetStateString(entries[i]->cstate));
	}
      }

      // Put the data into the register file, if necessary.
      if (entries[i]->reg > -1) {
	regfile->Set(entries[i]->reg, entries[i]->indata, entries[i]->addr & 0x3f, entries[i]->dsize, 0);
      }
      if (entries[i]->setcc) {
	if (entries[i]->compare && entries[i]->dvalid) {
	  regfile->SetCC(miscompare);
	} else {
	  regfile->SetCC(entries[i]->indata, entries[i]->addr & 0x3f, entries[i]->dsize);
	}
      }

      if (bstr != entries[i]->indata) {
	delete bstr;
      }
      // Clear the entry from the buffer.
      Remove(i);
    } else if (entries[i]->onbus) {
      if (++entries[i]->timeoutcnt >= ORB_timeout) {
	dprintf("sjm_readbuffer_timeout", 49, 0, "Timeout exceeded for entry %d, address: 0x%llx.", i, entries[i]->addr);
	dprintf(modname, 0, 0, "Timeout exceeded for entry %d, address: 0x%llx.", i, entries[i]->addr);
	entries[i]->Clear();
      }
    }
  }
}
