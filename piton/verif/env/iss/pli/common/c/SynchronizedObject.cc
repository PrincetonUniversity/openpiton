// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: SynchronizedObject.cc
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
// Description:  Generic class used by a higher-level program to do
//               synchronization between disparate objects. This is defined as
//               a template so that anything can be used as the synchronization
//               key.
//
//------------------------------------------------------------------------------

#include "SynchronizedObject.h"


//------------------------------------------------------------------------------
// Get the current state. This object stays in SYNCTO_FINISHED state until this
// method is called.
template<class T> int SynchronizedObject<T>::GetState()
{
  int val = state;
  if (state == SYNCTO_FINISHED) {
    state = SYNCTO_NOTWAITING;
  }
  return val;
}


//------------------------------------------------------------------------------
// Initiate a sync. Returns 0 if this device is all ready waiting on a sync.
// Returns 1 otherwise. The synclist must be empty when this function is
// called.
template<class T> int SynchronizedObject<T>::InitiateSync(int l, T **idlist)
{
  if (!waiting) {
    for (int i = 0; i < l; i++) {
      synclist->Append(idlist[i]);
    }
    waiting = 1;
    state = SYNCTO_WAITING;
    return 1;
  }
  return 0;
}


//------------------------------------------------------------------------------
// Check if this object is waiting to sync to the given id. If so, that id is
// removed from this object's synclist. Once the synclist is empty, this object
// is done syncing. Returns 1 if this object is waiting for the caller, 0
// otherwise.
template<class T> int SynchronizedObject<T>::SyncTo(T *syncid)
{
  int ret = 0;
  if (waiting) {
    state = SYNCTO_WAITING;
    if (synclist->Find(syncid)) {
      synclist->Remove();
      state = SYNCTO_FOUNDDEV;
      ret = 1;
      if (synclist->Empty()) {
	waiting = 0;
	state = SYNCTO_FINISHED;
      }
    }
  }
  return ret;
}


//------------------------------------------------------------------------------
// Reset the synchronization state for this object, if it is waiting. Returns 1
// if this object was waiting on a sync, 0 otherwise.
template<class T> int SynchronizedObject<T>::ClearSync()
{
  state = SYNCTO_NOTWAITING;
  if (waiting) {
    synclist->Clear();
    waiting = 0;
    return 1;
  }
  return 0;
}
