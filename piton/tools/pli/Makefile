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

# Directory paths

TOOL_PLI_DIR = ${DV_ROOT}/tools/pli
VERI_PLI_DIR = ${DV_ROOT}/verif/env/iss/pli

OS = `/bin/uname -s`
CPU = `/bin/uname -p`
BIN_PATH = ${DV_ROOT}/tools/$(OS)/$(CPU)
LIB_PATH = ${DV_ROOT}/tools/$(OS)/$(CPU)/lib

VERA_INCLUDE = ${DV_ROOT}/tools/pli/get_vera_i
VERA_LINK = ${DV_ROOT}/tools/pli/get_vera_l

# VCS .a libraries

LIB_A	=	$(TOOL_PLI_DIR)/mem/libmem_pli.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli.a \
		$(TOOL_PLI_DIR)/utility/libutility_pli.a \
		$(TOOL_PLI_DIR)/iop/libiob.a \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon.a \
		$(VERI_PLI_DIR)/monitor/c/libmonitor.a \
		$(VERI_PLI_DIR)/sjm/c/libsjm.a \
		$(VERI_PLI_DIR)/common/c/libjpcommon.a \
		$(TOOL_PLI_DIR)/simpledram/libsimpledram.a # trin: new PLI library, fake memory model

# ncverilog .a libraries

LIB_A_NCV=	$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.a \
		$(TOOL_PLI_DIR)/utility/libutility_ncv.a \
		$(TOOL_PLI_DIR)/iop/libiob_ncv.a \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_ncv.a \
		$(VERI_PLI_DIR)/monitor/c/libmonitor_ncv.a \
		$(VERI_PLI_DIR)/sjm/c/libsjm_ncv.a \
		$(VERI_PLI_DIR)/common/c/libjpcommon_ncv.a

# ncverilog .so libraries

LIB_SO	=	$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.so \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.so \
		$(TOOL_PLI_DIR)/utility/libutility_ncv.so \
		$(TOOL_PLI_DIR)/iop/libiob_ncv.so \
		$(TOOL_PLI_DIR)/libpli.so \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_ncv.so \
		$(VERI_PLI_DIR)/monitor/c/libmonitor_ncv.so \
		$(VERI_PLI_DIR)/sjm/c/libsjm_ncv.so \
		$(VERI_PLI_DIR)/common/c/libjpcommon_ncv.so

# icarus .a libraries

LIB_A_ICARUS=	$(TOOL_PLI_DIR)/mem/libmem_pli_icarus.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_icarus.a \
		$(TOOL_PLI_DIR)/utility/libutility_icarus.a \
		$(TOOL_PLI_DIR)/iop/libiob_icarus.a \
		$(TOOL_PLI_DIR)/simpledram/libsimpledram_icarus.a \
		$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_icarus.a \
		$(VERI_PLI_DIR)/monitor/c/libmonitor_icarus.a \
		$(VERI_PLI_DIR)/sjm/c/libsjm_icarus.a #\
		$(VERI_PLI_DIR)/common/c/libjpcommon_icarus.a

NCV_EXE = 	ncsim ncelab


# VCS targets 

vcspli: $(LIB_A)

# NC-Verilog targets 

ncvexe: $(NCV_EXE)
ncvpli: $(LIB_SO) $(NCV_EXE)

# Icarus targets 

icaruspli: veriuser.vpi

# VCS .a libraries

$(TOOL_PLI_DIR)/mem/libmem_pli.a:
	(cd $(TOOL_PLI_DIR)/mem; make)
	(rm -f $(LIB_PATH)/libmem_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli.a:
	(cd $(TOOL_PLI_DIR)/socket; make)
	(rm -f $(LIB_PATH)/libsocket_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/utility/libutility_pli.a:
	(cd $(TOOL_PLI_DIR)/utility; make)
	(rm -f $(LIB_PATH)/libutility_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob.a:
	(cd $(TOOL_PLI_DIR)/iop; make)
	(rm -f $(LIB_PATH)/libiob.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon.a:
	(cd $(VERI_PLI_DIR)/jbus_mon/c; make)
	(rm -f $(LIB_PATH)/libjbus_mon.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/monitor/c/libmonitor.a:
	(cd $(VERI_PLI_DIR)/monitor/c; make)
	(rm -f $(LIB_PATH)/libmonitor.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/sjm/c/libsjm.a:
	(cd $(VERI_PLI_DIR)/sjm/c; make)
	(rm -f $(LIB_PATH)/libsjm.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/common/c/libjpcommon.a:
	(cd $(VERI_PLI_DIR)/common/c; make)
	(rm -f $(LIB_PATH)/libjpcommon.a)
	cp $@ $(LIB_PATH)

# princeton trin new
$(TOOL_PLI_DIR)/simpledram/libsimpledram.a:
	(cd $(TOOL_PLI_DIR)/simpledram; make)
	(rm -f $(LIB_PATH)/libsimpledram.a)
	cp $@ $(LIB_PATH)

# ncverilog .so libraries

$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.so:
	(cd $(TOOL_PLI_DIR)/mem; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libmem_pli_ncv.so)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.so:
	(cd $(TOOL_PLI_DIR)/socket; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libsocket_pli_ncv.so)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/utility/libutility_ncv.so:
	(cd $(TOOL_PLI_DIR)/utility; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libutility_ncv.so)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob_ncv.so:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libiob_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_ncv.so:
	(cd $(VERI_PLI_DIR)/jbus_mon/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libjbus_mon_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/monitor/c/libmonitor_ncv.so:
	(cd $(VERI_PLI_DIR)/monitor/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libmonitor_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/sjm/c/libsjm_ncv.so:
	(cd $(VERI_PLI_DIR)/sjm/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libsjm_ncv.so)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/common/c/libjpcommon_ncv.so:
	(cd $(VERI_PLI_DIR)/common/c; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libjpcommon_ncv.so)
	cp $@ $(LIB_PATH)

# Icarus .a libraries

$(TOOL_PLI_DIR)/mem/libmem_pli_icarus.a:
	(cd $(TOOL_PLI_DIR)/mem; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libmem_pli_icarus.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli_icarus.a:
	(cd $(TOOL_PLI_DIR)/socket; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libsocket_pli_icarus.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/utility/libutility_icarus.a:
	(cd $(TOOL_PLI_DIR)/utility; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libutility_icarus.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob_icarus.a:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libiob_icarus.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/jbus_mon/c/libjbus_mon_icarus.a:
	(cd $(VERI_PLI_DIR)/jbus_mon/c; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libjbus_mon_icarus.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/monitor/c/libmonitor_icarus.a:
	(cd $(VERI_PLI_DIR)/monitor/c; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libmonitor_icarus.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/sjm/c/libsjm_icarus.a:
	(cd $(VERI_PLI_DIR)/sjm/c; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libsjm_icarus.a)
	cp $@ $(LIB_PATH)

$(VERI_PLI_DIR)/common/c/libjpcommon_icarus.a:
	(cd $(VERI_PLI_DIR)/common/c; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libjpcommon_icarus.a)
	cp $@ $(LIB_PATH)

# princeton trin new
$(TOOL_PLI_DIR)/simpledram/libsimpledram_icarus.a:
	(cd $(TOOL_PLI_DIR)/simpledram; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libsimpledram_icarus.a)
	cp $@ $(LIB_PATH)

clean:
	make clean_vcs 
	make clean_ncv
	make clean_icarus

clean_vcs:
	rm -rf $(LIB_A)

clean_ncv:
	rm -rf $(LIB_SO) $(LIB_A_NCV) $(NCV_EXE) veriuser.o
	rm -rf $(BIN_PATH)/ncelab $(BIN_PATH)/ncsim

clean_icarus:
	rm -rf $(LIB_A_ICARUS)

	
ncelab: 
	$(CCC) -o ncelab \
	${NCV_HOME}/tools/inca/lib/64bit/ncelab.o \
	-L$(LIB_PATH) -lsocket_pli_ncv \
	-lpli \
	-lutility_ncv \
	-ljbus_mon_ncv \
	-lmonitor_ncv \
	-lmem_pli_ncv \
	-liob_ncv \
	-lsjm_ncv \
	-ljpcommon_ncv \
	-L${NCV_HOME}/tools/inca/lib/64bit -lvoids \
	`$(VERA_LINK)` \
	-L${CC_BIN}/../lib/CC4 \
	-L/usr/lib64 $(NCV_LD_LIBS) -lnsl -ldl \
	-L/lib64 -lm -lrt -lc
	(rm -f $(BIN_PATH)/ncelab)
	cp $@ $(BIN_PATH)
	(rm -f ncelab)

ncsim:  
	$(CCC)  -o ncsim \
	${NCV_HOME}/tools/inca/lib/64bit/ncsim.o \
	main.cc \
	-L$(LIB_PATH) -lsocket_pli_ncv \
	-lpli \
	-lutility_ncv \
	-ljbus_mon_ncv \
	-lmonitor_ncv \
	-lmem_pli_ncv \
	-liob_ncv \
	-lsjm_ncv \
	-ljpcommon_ncv \
	-L${NCV_HOME}/tools/lib/64bit -ludm -lsimcontrol \
	-L${NCV_HOME}/tools/inca/lib/64bit -lvoids \
	`$(VERA_LINK)` \
	-L${CC_BIN}/../lib/CC4 \
	-L/usr/lib64 $(NCV_LD_LIBS) -lnsl -ldl \
	-L/lib64 -lm -lrt -lc 
	(rm -f $(BIN_PATH)/ncsim)
	cp $@ $(BIN_PATH)
	(rm -f ncsim)

veriuser.o:	veriuser.c
	$(CC) -fPIC -c -o veriuser.o veriuser.c -I${NCV_HOME}/tools/include \
	`$(VERA_INCLUDE)` $(NCV_CC_OPTS)

$(TOOL_PLI_DIR)/libpli.so:	veriuser.o
	$(LD) $(NCV_LD_OPTS) -o libpli.so veriuser.o
	(rm -f veriuser.o $(LIB_PATH)/libpli.so)
	cp $@ $(LIB_PATH)

vpi_user.o:	vpi_user.c
	$(CC) -fPIC -c -o vpi_user.o vpi_user.c -I${NCV_HOME}/tools/include \
	`$(VERA_INCLUDE)` $(NCV_CC_OPTS)

libvpi.so:	vpi_user.o
	$(LD) $(NCV_LD_OPTS) -o libvpi.so vpi_user.o
	(rm -f vpi_user.o $(LIB_PATH)/libvpi.so)
	cp $@ $(LIB_PATH)

#Icarus PLI support
veriuser_icarus.o: veriuser.c
	$(CC) -fpic -c -o veriuser_icarus.o veriuser.c \
	$(ICARUS_CC_OPTS)

veriuser.vpi: $(LIB_A_ICARUS) veriuser_icarus.o
	$(CC) -shared -o $@ veriuser_icarus.o \
	-L$(ICARUS_ROOT)/lib -lvpi \
	-lveriuser \
	-L$(LIB_PATH) -lsocket_pli_icarus \
	-lsimpledram_icarus \
	-lutility_icarus \
	-ljbus_mon_icarus \
	-lmonitor_icarus \
	-lmem_pli_icarus \
	-liob_icarus \
	-lsjm_icarus
	(rm -f $(LIB_PATH)/$@)
	cp $@ $(LIB_PATH)
	(rm -f $@)
	(rm -f veriuser_icarus.o)
