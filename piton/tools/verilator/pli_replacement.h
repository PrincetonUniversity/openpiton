// Modified by Princeton University on March 18th, 2019
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: iob_main.cc
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
#include "global.h"
#include "b_ary.h"
#include "bw_lib.h"
#include "list.h"
#include "verilated.h"

class pli_replacement {
public:
    b_tree_node_ptr sysMem;//b_try for memory
    b_tree_atom_ptr data[32];
    KeyType      last_addr[32];
    // CONSTRUCTORS
    pli_replacement();
    ~pli_replacement() {}
    // METHODS
    // This function will be called from a instance created in Verilog
    inline vluint32_t my_math(vluint32_t in) {}

    vluint64_t get_eight_byte(char* data, KeyType key);
    
    void write_eight_byte(char* data, KeyType key, vluint64_t val);

    vluint64_t read_64b_call(vluint64_t key_var);
    
    void write_64b_call(vluint64_t key_var, vluint64_t val);
};
