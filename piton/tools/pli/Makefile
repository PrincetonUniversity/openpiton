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

OS = `uname -s`
CPU = `uname -m`
BIN_PATH = ${DV_ROOT}/tools/$(OS)/$(CPU)
LIB_PATH = ${DV_ROOT}/tools/$(OS)/$(CPU)/lib

# VCS .a libraries

LIB_A	=	$(TOOL_PLI_DIR)/mem/libmem_pli.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli.a \
		$(TOOL_PLI_DIR)/iop/libiob.a

# ncverilog .a libraries

LIB_A_NCV=	$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.a \
		$(TOOL_PLI_DIR)/iop/libiob_ncv.a

# ncverilog .so libraries

LIB_SO	=	$(TOOL_PLI_DIR)/mem/libmem_pli_ncv.so \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_ncv.so \
		$(TOOL_PLI_DIR)/iop/libiob_ncv.so \
		$(TOOL_PLI_DIR)/libpli.so

# icarus .a libraries

LIB_A_ICARUS=	$(TOOL_PLI_DIR)/mem/libmem_pli_icarus.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_icarus.a \
		$(TOOL_PLI_DIR)/iop/libiob_icarus.a

# icarus .a libraries

LIB_A_MODELSIM=	$(TOOL_PLI_DIR)/mem/libmem_pli_modelsim.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_modelsim.a \
		$(TOOL_PLI_DIR)/iop/libiob_modelsim.a
		
# riviera .a libraries

LIB_A_RIVIERA=	$(TOOL_PLI_DIR)/mem/libmem_pli_riviera.a \
		$(TOOL_PLI_DIR)/socket/libsocket_pli_riviera.a \
		$(TOOL_PLI_DIR)/iop/libiob_riviera.a

NCV_EXE = 	ncsim ncelab


# VCS targets 

vcspli: $(LIB_A)

# NC-Verilog targets 

ncvexe: $(NCV_EXE)
ncvpli: $(LIB_SO) $(NCV_EXE)

# Icarus targets 

icaruspli: veriuser.vpi

# Modelsim targets 

modelsimpli: libmodelsimpli.so

# Riviera targets 

rivierapli: librivierapli.so

# VCS .a libraries

$(TOOL_PLI_DIR)/mem/libmem_pli.a:
	(cd $(TOOL_PLI_DIR)/mem; make)
	(rm -f $(LIB_PATH)/libmem_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli.a:
	(cd $(TOOL_PLI_DIR)/socket; make)
	(rm -f $(LIB_PATH)/libsocket_pli.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob.a:
	(cd $(TOOL_PLI_DIR)/iop; make)
	(rm -f $(LIB_PATH)/libiob.a)
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

$(TOOL_PLI_DIR)/iop/libiob_ncv.so:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.ncv)
	(rm -f $(LIB_PATH)/libiob_ncv.so)
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

$(TOOL_PLI_DIR)/iop/libiob_icarus.a:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.icarus)
	(rm -f $(LIB_PATH)/libiob_icarus.a)
	cp $@ $(LIB_PATH)

# Modelsim .a libraries

$(TOOL_PLI_DIR)/mem/libmem_pli_modelsim.a:
	(cd $(TOOL_PLI_DIR)/mem; make -f Makefile.modelsim)
	(rm -f $(LIB_PATH)/libmem_pli_modelsim.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli_modelsim.a:
	(cd $(TOOL_PLI_DIR)/socket; make -f Makefile.modelsim)
	(rm -f $(LIB_PATH)/libsocket_pli_modelsim.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob_modelsim.a:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.modelsim)
	(rm -f $(LIB_PATH)/libiob_modelsim.a)
	cp $@ $(LIB_PATH)
	
# Riviera .a libraries

$(TOOL_PLI_DIR)/mem/libmem_pli_riviera.a:
	(cd $(TOOL_PLI_DIR)/mem; make -f Makefile.riviera)
	(rm -f $(LIB_PATH)/libmem_pli_riviera.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/socket/libsocket_pli_riviera.a:
	(cd $(TOOL_PLI_DIR)/socket; make -f Makefile.riviera)
	(rm -f $(LIB_PATH)/libsocket_pli_riviera.a)
	cp $@ $(LIB_PATH)

$(TOOL_PLI_DIR)/iop/libiob_riviera.a:
	(cd $(TOOL_PLI_DIR)/iop; make -f Makefile.riviera)
	(rm -f $(LIB_PATH)/libiob_riviera.a)
	cp $@ $(LIB_PATH)

clean:
	make clean_vcs 
	make clean_ncv
	make clean_icarus
	make clean_modelsim
	make clean_riviera

clean_vcs:
	rm -rf $(LIB_A)

clean_ncv:
	rm -rf $(LIB_SO) $(LIB_A_NCV) $(NCV_EXE) veriuser.o
	rm -rf $(BIN_PATH)/ncelab $(BIN_PATH)/ncsim

clean_icarus:
	rm -rf $(LIB_A_ICARUS)

clean_modelsim:
	rm -rf $(LIB_A_MODELSIM)

clean_riviera:
	rm -rf $(LIB_A_RIVIERA)
	
ncelab: 
	$(CCC) -o ncelab \
	${NCV_HOME}/tools/inca/lib/64bit/ncelab.o \
	-L$(LIB_PATH) -lsocket_pli_ncv \
	-lpli \
	-lmem_pli_ncv \
	-liob_ncv \
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
	-lmem_pli_ncv \
	-liob_ncv \
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

#Icarus PLI support
veriuser_modelsim.o: veriuser.c
	$(CC) -fpic -c -o veriuser_modelsim.o veriuser.c \
	$(MODELSIM_CC_OPTS)

#Riviera PLI support
 veriuser_riviera.o: veriuser.c
	$(CC) -fpic -c -DUSE_VPI -DRIVIERA -I${RIVIERA_HOME}/interfaces/include -o veriuser_riviera.o veriuser.c \
	$(RIVIERA_CC_OPTS) 	
	
veriuser.vpi: $(LIB_A_ICARUS) veriuser_icarus.o
	$(CXX) -shared -o $@ veriuser_icarus.o \
	-L$(ICARUS_HOME)/lib -lvpi \
	-lveriuser \
	-L$(LIB_PATH) -lsocket_pli_icarus \
	-lmem_pli_icarus \
	-liob_icarus \
        $(ADDITIONAL_ARGS)
	(rm -f $(LIB_PATH)/$@)
	cp $@ $(LIB_PATH)
	(rm -f $@)
	(rm -f veriuser_icarus.o)

libmodelsimpli.so: $(LIB_A_MODELSIM) veriuser_modelsim.o
	$(CXX) -shared -o $@ veriuser_modelsim.o \
	-L$(LIB_PATH) -lsocket_pli_modelsim \
	-lmem_pli_modelsim \
	-liob_modelsim \
        $(ADDITIONAL_ARGS)
	(rm -f $(LIB_PATH)/$@)
	cp $@ $(LIB_PATH)
	(rm -f $@)
	(rm -f veriuser_modelsim.o)
	
librivierapli.so: $(LIB_A_RIVIERA) veriuser_riviera.o
	$(CXX) -shared -o $@ veriuser_riviera.o \
	$(LIB_A_RIVIERA) \
        $(ADDITIONAL_ARGS)
	(rm -f $(LIB_PATH)/$@)
	cp $@ $(LIB_PATH)
	(rm -f $@)
	(rm -f veriuser_riviera.o)
