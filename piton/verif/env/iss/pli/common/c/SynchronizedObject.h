// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: SynchronizedObject.h
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
// Description:  Generic class used by a higher-level program to do
// synchronization between disparate objects. This is defined as a template
// so that anything can be used as the synchronization key.
//
//------------------------------------------------------------------------------

#include "LinkedList.h"

#ifndef SYNCHRONIZEDOBJECT_H
#define SYNCHRONIZEDOBJECT_H

#define SYNCTO_FINISHED    1
#define SYNCTO_FOUNDDEV    2
#define SYNCTO_WAITING     0
#define SYNCTO_NOTWAITING -1

template<class T>
class SynchronizedObject
{
private:
  // ID of this object.
  T ID;
  // The current state of this object.
  int state;
  // Set when the object is waiting on a sync.
  int waiting;
  // List of ID's this object wants to sync to.
  LinkedList<T> *synclist;

public:
  SynchronizedObject(T id) {
    ID = id;
    state = SYNCTO_NOTWAITING;
    waiting = 0;
    synclist = new LinkedList<T>();
  }
  ~SynchronizedObject() { delete synclist; }
  T *GetID() { return &ID; }
  int GetState();
  int InitiateSync(int, T **);
  int SyncTo(T *);
  int ClearSync();
};
#include "SynchronizedObject.cc"
#endif // SYNCHRONIZEDOBJECT_H
