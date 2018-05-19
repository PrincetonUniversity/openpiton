// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sync_int.cc
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
// Description:  Integer-based synchroniziation interface.
//
//------------------------------------------------------------------------------

#include <locale.h>
#include "sync_int.h"
#include "BinarySyncTree.h"
#include "SynchronizedObject.h"

#ifdef DEBUG
#include <stdio.h>
#include <stdlib.h>
#endif // DEBUG

#ifndef DEBUG
#ifdef LINUX
extern void dprintf(const char *, ...);
#else
extern void dprintf(...);
#endif
#endif // !DEBUG

typedef SynchronizedObject<int> SyncDev;

BinarySyncTree<SyncDev> *devlist = new BinarySyncTree<SyncDev>();
char *modname = (char *) "sync_int";

// Condition variables.
int devlist_busy = 0;


//------------------------------------------------------------------------------
// Called by pli's to register a list of device ID's. First sets a condition
// variable to protect the device list. Checks that the caller hasn't supplied
// device ID's that have all ready been used.
int sync_register(int num, int *list)
{
  // Check the condition variable.
  while (devlist_busy);

  devlist_busy = 1;

  SyncDev *dev;
  for (int i = 0; i < num; i++) {
    dev = new SyncDev(list[i]);
    if (!devlist->Insert(dev)) {
      devlist_busy = 0;
      return 0;
    }
  }

  // Reset the condition variable.
  devlist_busy = 0;
  return 1;
}


//------------------------------------------------------------------------------
// Initiate a sync. Uses a condition variable so that calls to this function are
// atomic.
int sync_initiate(int caller, int num, int *list)
{
  if (devlist->Empty()) {
    return SYNC_STATE_UNKNOWN;
  }
 
  // Check the condition variable.
  while (devlist_busy);

  devlist_busy = 1;

  int status = SYNC_STATE_UNKNOWN;
  int *checklist = new int[num];
  int checksum = 0;
  int checkval;
  int **passlist = new int *[num];
  SyncDev *dev;
  SyncDev *calldev = devlist->Find(caller);
  // Ask each device that was listed if it is sync'd to the caller's id.
  for (int i = 0, j = 0; i < num; i++) {
    checklist[i] = 0;
    if (list[i] == caller) {
#ifndef DEBUG
      dprintf(modname, 49, 0, "Device %d attempted to sync to itself.", caller);
      devlist_busy = 0;
      return SYNC_STATE_UNKNOWN;
#else
      printf("%s: Device %d attempted to sync to itself.", modname, caller);
      exit(1);
#endif // DEBUG
    }
    if (!(dev = devlist->Find(list[i]))) {
#ifndef DEBUG
      dprintf(modname, 49, 0, "Device %d attempted to sync to nonexistant id %d.",  caller, list[i]);
      devlist_busy = 0;
      return SYNC_STATE_UNKNOWN;
#else
      printf("%s: Device %d attempted to sync to nonexstant id %d.", modname, caller, list[i]);
      exit(1);
#endif // DEBUG
    }
    if (dev->SyncTo(calldev->GetID())) {
      checklist[i] = 1;
    } else {
      passlist[checksum] = dev->GetID();
      checksum++;
    }
  }
  // Not all the devices were sync'd to the caller's id, so it needs to go into
  // sync waiting state.
  if (checksum > 0) {
    if (!calldev->InitiateSync(checksum, passlist)) {
#ifndef DEBUG
      dprintf(modname, 49, 9, "Couldn't initiate sync for device %d because it's all ready waiting on a sync.", caller);
      devlist_busy = 0;
      return SYNC_STATE_UNKNOWN;
#else
      printf("%s: Couldn't initiate sync for device %d because it's all ready waiting on a sync.", modname, caller);
      exit(1);
#endif // DEBUG
    }
    status = SYNC_STATE_WAIT;
  } else {
    status = SYNC_STATE_DONE;
  }

  delete checklist;
  devlist_busy = 0;
  return status;
}


//------------------------------------------------------------------------------
// Check if a device is synced.
int sync_check_status(int caller)
{
  if (devlist->Empty()) {
    return SYNC_STATE_UNKNOWN;
  }

  // Check the condition variable.
  while (devlist_busy);

  devlist_busy = 1;

  int status = SYNC_STATE_UNKNOWN;
  SyncDev *dev = devlist->Find(caller);
  if (dev) {
    int state = dev->GetState();
    if ((state == SYNCTO_FOUNDDEV) || (state == SYNCTO_WAITING)) {
      status = SYNC_STATE_WAIT;
    } else if (state == SYNCTO_FINISHED) {
      status = SYNC_STATE_DONE;
    } else {
      status = SYNC_STATE_NOSYNC;
    }
  }

  devlist_busy = 0;
  return status;
}


//------------------------------------------------------------------------------
// Clear any waiting sync if a device is waiting on a sync. Returns 1 if the
// device was waiting on a sync; returns 0 otherwise.
int sync_clear(int caller)
{
  if (devlist->Empty()) {
    return 0;
  }

  // Check the condition variable.
  while (devlist_busy);

  devlist_busy = 1;

  SyncDev *calldev = devlist->Find(caller);
  int status = calldev->ClearSync();

  devlist_busy = 0;
  return status;
}
