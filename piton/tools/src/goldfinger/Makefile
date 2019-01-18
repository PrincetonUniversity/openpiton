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

TARGET = goldfinger

OBJS = 	lex.yy.o parser.tab.o\
	gf_error.o tsb.o tsb_link.o goldfinger.o \
	vector.o symtab.o app.o block.o physmap.o linked_section.o \
	split.o block_tsb.o
HDRS =  tsb.h tsb_link.h gf_error.h vector.h split.h \
	gf_types.h symtab.h app.h block.h physmap.h \
	linked_section.h block_tsb.h

PODFILE = goldfinger.pod
MANPAGE = goldfinger.1

POD2MAN = pod2man

VERSION = 1.11



DEFINES = -DVERSION='"$(VERSION)"'
CFLAGS += $(DEFINES) $(OPT)


LEXFLAGS = 
YACCFLAGS = -d 
INSTALL = .

INCLUDES +=
LIBS += -lelf
LDS += 
all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -g -o $@ $(OBJS) $(LDS) $(LIBS)
	rm -f $(INSTALL)/$(TARGET),$(VERSION)
	cp $(TARGET) $(INSTALL)/$(TARGET),$(VERSION)

%.o : %.c $(HDRS)
	$(CC) $(CFLAGS) -c -g $< $(INCLUDES)

lex.yy.c:  lexer.l parser.tab.h
	$(LEX) $(LEXFLAGS) lexer.l

%.tab.c %.tab.h : %.y
	$(YACC) $(YACCFLAGS) $<

clean:
	\rm -f $(OBJS) *~ *.tab.c *.tab.h lex.yy.c goldfinger

clobber: clean
	\rm -f $(TARGET) $(MANPAGE)

doc: $(MANPAGE)

$(MANPAGE): $(PODFILE)
	$(POD2MAN) --section 1 $(PODFILE) -c "OpenSPARC T1 Diag Tools" -r $(VERSION) > $(MANPAGE)

install : $(TARGET)
	tre toolinst $(TARGET) $(VERSION) 

release:
	tre release $(TARGET) $(VERSION)

