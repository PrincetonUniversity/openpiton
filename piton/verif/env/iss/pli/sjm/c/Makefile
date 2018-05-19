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

RM = rm
CPPFLAGS = -w -I${VCS_HOME}/include
CPPFLAGS += -I${DV_ROOT}/verif/env/iss/pli/common/c
CPPFLAGS += -I.  -DFIFO_METHOD

OS=`uname -r | cut -f1 -d.`
############################################################
# C source files to be linted.
CSRCS =	main.cc SJM.cc Arbiter.cc InterruptControl.cc SnoopControl.cc \
	ByteString.cc  Parser.cc Command.cc Cache.cc Transaction.cc \
	ReadOutBuffer.cc MemoryControl.cc RegisterFile.cc

TEMPLATE_OBJS = ./Templates.DB/*.o
TEMPLATE_DIRS =  ./Templates.DB

PLIDIR = $(DV_ROOT)/verif/env/iss/pli/sjm/c

all:
	make development
lib:
	@if [ ! -d $(PLIDIR)/Templates.DB ]; then mkdir $(PLIDIR)/Templates.DB; fi
	/bin/rm -f ${LIB}
	make ${LIB}

lint:
	lint $(CFLAGS) $(CSRCS)
# Object files to go into the library.
LIB_OBJS = ${CSRCS:%.cc=%.o}

LIB	= libsjm.a

TAB	= jbus.tab

################################################
# below here only generic rules which depend on
# LIB TAB etc.

LOCAL = $(LIB) $(TAB) 
local: $(LOCAL)
kill_local:
	rm -f $(LOCAL)
INSTALL = $(LOCAL:%=../lib/%)
install: $(INSTALL)
kill_install:
	rm -f $(INSTALL)

../lib/%.a: %.a
	$(CP) -f $< $@
	$(RANLIB) $@

../lib/%.tab: %.tab
	$(CP) -f $< $@

$(LIB_OBJS):
	$(CCC) $(CPPFLAGS) -c $(CFLAGS) -o $*.o $*.cc
	# ar rv $(LIB) $*.o
	# rm $*.o

${LIB}: $(LIB_OBJS)
	@if [ $(OS) -ne 5 ]; then $(RANLIB) $@; fi; \
	ar rv $(LIB) $(TEMPLATE_OBJS)
	rm -rf $(LIB_OBJS) $(TEMPLATE_DIRS)


${VER_LIB}:	${VER_LIB}(${LIB_OBJS})

pli_clean clean:
	rm -rf ${LIB_OBJS} ${LIB} $(TEMPLATE_DIRS)

development: ${LIB_OBJS}
	@if [ -d $(PLIDIR)/Templates.DB ]; then \
	ar rv $(LIB) $(LIB_OBJS) $(TEMPLATE_OBJS); else \
	ar rv $(LIB) $(LIB_OBJS) ; fi;
	rm -rf $(LIB_OBJS) $(TEMPLATE_DIRS)


#.o:
#	echo $<
#	$(CCC) $(CFLAGS) $(CPPFLAGS) -c -o $*.o $<
#
#
#
#dlltest: dll_test.cc DoubleLinkedList.o
#	 $(CCC) -g -o dlltest dll_test.cc DoubleLinkedList.o
#
#listtreetest: listtreetest.cc DoubleLinkedList.o ListTree.o
#	 $(CCC) -g -o listtreetest listtreetest.cc DoubleLinkedList.o ListTree.o
#
#memorytester: memorytest.cc DoubleLinkedList.o ListTree.o Memory.o
#	 $(CCC) -g -o memorytester memorytest.cc DoubleLinkedList.o ListTree.o Memory.o
#
#DoubleLinkedList.o: DoubleLinkedList.h DoubleLinkedList.cc
#	 $(CCC) -g -c DoubleLinkedList.cc
#
#parsetest: parsetest.cc ByteString.o Command.o Parser.o
#	 $(CCC) -g -o parsetest parsetest.cc ByteString.o Command.o Parser.o
#
#ByteString.o: ByteString.h ByteString.cc
#	 $(CCC) -g -c ByteString.cc
#
#
#Parser.o: Parser.h Parser.cc
#	 $(CCC) -g -c Parser.cc
#
#cachetest: cachetest.cc ByteString.o Cache.o
#	 $(CCC) -g -o cachetest cachetest.cc ByteString.o Cache.o
#
#
#qtest: qtest.cc nQueue.o
#	 $(CCC) -g -o qtest qtest.cc nQueue.o $(CPPFLAGS)
#
