// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: cCollection.H
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
//----------------------------------------------------------------------
//----------------------------------------------------------------------
// File			:  cCollection.h
// Creation Date	:  Thu Apr 20 12:36:11 PDT 1995
// Description		:  (Renamed from collection.h created 2/13/95)
//			   Implements the cCollection class, which uses
//			   C++ templates so that the client can create a
//			   collection of any class of objects.
//----------------------------------------------------------------------

#include <iostream>
#include <stdlib.h>
#include <assert.h>

const int kblocksize = 16;

//-------------------------------------------------------------------------
//  This cCollection class will behave much like an array.  Operator[] is
//  defined and elements are indexed relative to zero.  The "logical length"
//  of the collection, accessible through the method Length(), is relative
//  to 1, so the legal indices are 0 through (Length() - 1).  The main
//  difference from an array is the ability to grow or shrink the length.
//-------------------------------------------------------------------------

template <class T>
class cCollection {

  public:

    //  ### Constructors ###
    //
    //  Client may specify an initial logical length of the collection.
    //  "allocLengthHint" is a suggestion as to an efficient increment to
    //  use when allocating memory (i.e. block size).
    //
    //  Valid values for initialLength are any integer greater than or equal
    //  to 0.  Valid values for allocLengthHint are integers greater than 0.
    //  Default value for block size is intended to be sensible for small
    //  collections.

    cCollection(int initialLength = 0, int allocLengthHint = kblocksize);

    cCollection(const cCollection<T>& source) { Copy(source); }

    //  ### Destructor ###

    ~cCollection(void) { delete[] theCollection; }

    //  ### Accessors ###

    //  Length()
    //
    //  Return the "logical length" of the collection, or the number of
    //  elements added by client(s).  This may be less than the actual
    //  allocated space, to which the client does not have access.
    //  Remember, "logical length" unlike the index space, is relative to 1.

    int Length(void) const { return logicalLen; }

    T& operator[](int elemNum) { 
	assert((elemNum >= 0) && (elemNum < logicalLen));
	return theCollection[elemNum];
    }

    const T& operator[](int elemNum) const {
	assert((elemNum >= 0) && (elemNum < logicalLen));
	return theCollection[elemNum];
    }

    cCollection<T>& operator=(const cCollection<T>& source);

    //  Resize()
    //
    //  Change the size of the collection to have logical length "newLen"
    //  which may mean growing or shrinking the current collection.  If
    //  "newLen" is less than the current logical length, elements zero
    //  through (newlen - 1) will be retained, and the rest will be
    //  discarded.
    //
    //  Note: if the actual size is shrinking by an allocation increment,
    //  or a number greater than that, memory will be freed and reallocated.

    void Resize(int newLen);

    //  AddElem()
    //
    //  Add an element to the end of the collection.  Increases the logical
    //  length of the collection by one;

    T* AddElem(const T& elem);

  protected:

    void CopyList(int limit, const T* source);

    void Copy(const cCollection<T>& source);

    int ComputeNumBlocks(int size) {
	return (size / blockSiz + ((size % blockSiz) ? 1 : 0));
    }

    int		logicalLen;
    int		blockSiz;
    int		numBlocks;
    T*		theCollection;

  friend ostream& operator<<(ostream& os, const cCollection<T>& set);
};

//  ### Implementations ###

template <class T>
cCollection<T>::cCollection(int initialLength, int allocLengthHint) :
    logicalLen(initialLength), blockSiz(allocLengthHint), numBlocks(0),
    theCollection(NULL) {

    assert(logicalLen >= 0);
    assert(blockSiz > 0);
    if (logicalLen > 0) {
	numBlocks = ComputeNumBlocks(logicalLen);
	theCollection = new T[numBlocks * blockSiz];
	assert(theCollection != NULL);
    }
}

template <class T>
void cCollection<T>::Resize(int newLen) {
    T* tempCollection;
    assert(newLen >= 0);

    //  Bigger or smaller, if the number of memory blocks now needed is
    //  different, we will allocate a new array and copy in contents as
    //  needed.  Then we will free the old buffer.

    if (numBlocks != ComputeNumBlocks(newLen)) {
	tempCollection = theCollection;
	numBlocks = ComputeNumBlocks(newLen);

	//  Since resize can grow or shrink the collection, pass the
	//  smaller of logicalLen or newLen to the array-contents-copy
	//  helper method CopyList().

	CopyList((newLen < logicalLen) ? newLen : logicalLen, tempCollection);
	if (logicalLen > 0) {
	    delete[] tempCollection;
	}
    }
    logicalLen = newLen;
}

template <class T>
cCollection<T>& cCollection<T>::operator=(const cCollection<T>& source) {

    if (this != &source) {
	delete[] theCollection;
	Copy(source);
    }
    return *this;
}

template <class T>
void cCollection<T>::CopyList(int limit, const T* source) {
    if (numBlocks > 0) {
	theCollection = new T[numBlocks * blockSiz];
	assert(theCollection != NULL);

	for (int i = 0; i < limit; i++)  theCollection[i] = source[i];
    }
    else theCollection = NULL;
}

template <class T>
void cCollection<T>::Copy(const cCollection<T>& source) {
    numBlocks = source.numBlocks;
    blockSiz = source.blockSiz;
    logicalLen = source.logicalLen;
    CopyList(logicalLen, source.theCollection);
}

template <class T>
T* cCollection<T>::AddElem(const T& elem) {

    // Note: Resize changes logicalLen.

    if (logicalLen >= (numBlocks * blockSiz)) Resize(logicalLen + 1);

    else ++logicalLen;

    // Note: logicalLen is rel to 1, collection is rel to 0

    theCollection[logicalLen - 1] = elem;
    return &(theCollection[logicalLen - 1]);
}

template <class T>
ostream& operator<<(ostream& os, const cCollection<T>& set) {
    for (int i = 0; i < set.Length(); i++)
	os << set[i] << endl;
    return os;
}
