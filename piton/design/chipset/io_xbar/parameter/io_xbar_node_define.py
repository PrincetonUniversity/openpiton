# ========== Copyright Header Begin ============================================
# Copyright (c) 2015 Princeton University
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Princeton University nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# ========== Copyright Header End ============================================

import math
import sys
import pyhplib 
import os

devices = pyhplib.ReadDevicesXMLFile()

num_phys_devices = 0
max_port = -1
for i in range(len(devices)):
    if not devices[i]["virtual"]:
        num_phys_devices += 1
    if devices[i]["portnum"] > max_port:
        max_port = devices[i]["portnum"]

assert(max_port == num_phys_devices - 1)

DYNAMIC_NODE_PORT = num_phys_devices
DYNAMIC_NODE_PORT_LOG2 = int(math.ceil(math.log(DYNAMIC_NODE_PORT, 2)))
DYNAMIC_NODE_PORT_P_3 = DYNAMIC_NODE_PORT + 3
DYNAMIC_NODE_PORT_P_3_LOG2 = int(math.ceil(math.log(DYNAMIC_NODE_PORT_P_3, 2)))

def print_ports (s):
    for a in range (DYNAMIC_NODE_PORT):
        print (s % a)

def print_ports_nm1 (s):
    for a in range (DYNAMIC_NODE_PORT - 1):
        print (s % a)    

def print_ports_2 (s):
    for a in range (DYNAMIC_NODE_PORT):
        print (s % (a, a))

def print_ports_nm1_3_nl (s):
    for a in range (DYNAMIC_NODE_PORT - 1):
        print (s % (a, a, a))
    print ""

def print_ports_nl (s):
    print_ports(s)
    print ""

def print_ports_nl_nm1 (s):
    print_ports_nm1(s)
    print ""

def string_ports_oneline (s1 , s2):
    for a in range (DYNAMIC_NODE_PORT):
        s1 = s1 + (s2 % a)
    return s1

def print_ports_oneline (s1 , s2):
    for a in range (DYNAMIC_NODE_PORT):
        s1 = s1 + (s2 % a)
    s1 = s1[:-1] + ";"
    print (s1)

def string_ports_oneline_2 (s1, s2):
    for a in range (DYNAMIC_NODE_PORT):
        s1 = s1 + (s2 % (a, a))
    return s1

def print_ports_oneline_2 (s1 , s2):
    for a in range (DYNAMIC_NODE_PORT):
        s1 = s1 + (s2 % (a, a))
    s1 = s1[:-1] + ";"
    print (s1)

#generate direction default_dir s.t. msg from default_dir has priority when going to dir
def gen_default_dir (dir):
    default_dir = (dir + (DYNAMIC_NODE_PORT - 1) / 2) % (DYNAMIC_NODE_PORT - 1)
    if (dir == DYNAMIC_NODE_PORT - 1):
        default_dir = (0 + (DYNAMIC_NODE_PORT - 1) / 2) % (DYNAMIC_NODE_PORT - 1)
    return default_dir
