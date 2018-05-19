# Modified by Princeton University on June 9th, 2015
# ========== Copyright Header Begin ==========================================
# 
# OpenSPARC T1 Processor File: Makefile
# Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
# 
# The above named program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public
# License version 2 as published by the Free Software Foundation.
# 
# The above named program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public
# License along with this work; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
# 
# ========== Copyright Header End ============================================

include ${DV_ROOT}/tools/env/Makefile.system

AR = ar

OS=`uname -r | cut -f1 -d.`

CPPFLAGS= -g -w -I${VCS_HOME}/include $(CFLAGS)

CSRCS = \
	CircularLinkedList.cc DoubleLinkedList.cc \
	ListTree.cc StringTokenizer.cc \
	pli_api.cc pli_signal.cc sync_int.cc 
# Object files to go into the library.
LIB_OBJS = ${CSRCS:%.cc=%.o}
TEMPLATE_OBJS += ./Templates.DB/*.o
TEMPLATE_DIRS = ./Templates.DB
PLIDIR = $(DV_ROOT)/verif/env/iss/pli/sjm/c

LIB     = libjpcommon.a

all:	
	make development

lib:
	@if [ ! -d Templates.DB ]; then mkdir Templates.DB; fi
	rm -f $(LIB)
	make ${LIB}


$(LIB_OBJS):
	$(CCC) $(CPPFLAGS) -c  -o $*.o $*.cc
	ar rv $(LIB) $*.o
#	rm $*.o

${LIB}: $(LIB_OBJS)
	@if [ $(OS) -ne 5 ]; then $(RANLIB) $@; fi; \
	#ar rv $(LIB) $(TEMPLATE_OBJS)
	#rm -rf $(LIB_OBJS) $(TEMPLATE_DIRS)


development: ${LIB_OBJS}
	@if [ -d Templates.DB ]; then \
	ar rv ${LIB} ${LIB_OBJS} ${TEMPLATE_OBJS}; else \
	ar rv ${LIB} ${LIB_OBJS}; fi; 
	rm -rf $(LIB_OBJS) $(TEMPLATE_DIRS)

clean:
	rm -rf ${LIB_OBJS} ${LIB} ${TEMPLATE_DIRS}

# Targets for local testing purposes.
#!!! modify these so they don't get called by above targets.

#strtok_test: strtok_test.cc StringTokenizer.o
#	 $(CCC) -g -o strtok_test strtok_test.cc StringTokenizer.o
#
#StringTokenizer.o: StringTokenizer.h StringTokenizer.cc
#	 $(CCC) -g -c StringTokenizer.cc
#
#catest: catest.cc CircularArray.o CircularDoubleLinkedList.o
#       $(CCC) -g -o catest catest.cc CircularArray.o CircularDoubleLinkedList.o
#
#CircularArray.o: CircularArray.h CircularArray.cc
#       $(CCC) -g -c CircularArray.cc
#
#CircularDoubleLinkedList.o: CircularDoubleLinkedList.h CircularDoubleLinkedList.cc
#       $(CCC) -g -c CircularDoubleLinkedList.cc
#
#clltest: clltest.cc CircularLinkedList.o
#        $(CCC) -g -o clltest clltest.cc CircularLinkedList.o
#
#CircularLinkedList.o: CircularLinkedList.h CircularLinkedList.cc
#        $(CCC) -g -c CircularLinkedList.cc
#
#lltest: lltest.cc LinkedList.o
#         $(CCC) -g -o lltest lltest.cc LinkedList.o
#
#LinkedList.o: LinkedList.h LinkedList.cc
#	 $(CCC) -g -c LinkedList.cc
#
#bttest: bttest.cc BinaryTree.o
#	 $(CCC) -g -o bttest bttest.cc BinaryTree.o -DDEBUG
#
#BinaryTree.o: BinaryTree.h BinaryTree.cc
#	 $(CCC) -g -c BinaryTree.cc


#synctest: synctest.cc sync_int.o
#	 $(CCC) -g -o synctest synctest.cc sync_int.o SynchronizedObject.o
#
#sync_int.o : sync_int.h sync_int.cc BinarySyncTree.h SynchronizedObject.o
#	 $(CCC) -g -c sync_int.cc -DDEBUG
#
#SynchronizedObject.o: SynchronizedObject.h SynchronizedObject.cc LinkedList.o
#	 $(CCC) -g -c SynchronizedObject.cc
