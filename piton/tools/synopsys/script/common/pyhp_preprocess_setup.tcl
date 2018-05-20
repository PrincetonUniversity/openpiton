# Copyright (c) 2016 Princeton University
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

# Pass parameters to PyHP through environment variables

global ::env
set ::env(PTON_X_TILES) $PITON_X_TILES
set ::env(PTON_Y_TILES) $PITON_Y_TILES
set ::env(PTON_NUM_TILES) $PITON_NUM_TILES

set ::env(PTON_NETWORK_CONFIG) $PITON_NETWORK_CONFIG

set ::env(CONFIG_L15_SIZE) $PITON_CONFIG_L15_SIZE
set ::env(CONFIG_L15_ASSOCIATIVITY) $PITON_CONFIG_L15_ASSOCIATIVITY

set ::env(CONFIG_L1D_SIZE) $PITON_CONFIG_L1D_SIZE
set ::env(CONFIG_L1D_ASSOCIATIVITY) $PITON_CONFIG_L1D_ASSOCIATIVITY

set ::env(CONFIG_L1I_SIZE) $PITON_CONFIG_L1I_SIZE
set ::env(CONFIG_L1I_ASSOCIATIVITY) $PITON_CONFIG_L1I_ASSOCIATIVITY

set ::env(CONFIG_L2_SIZE) $PITON_CONFIG_L2_SIZE
set ::env(CONFIG_L2_ASSOCIATIVITY) $PITON_CONFIG_L2_ASSOCIATIVITY
