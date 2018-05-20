#!/bin/bash
# Copyright (c) 2017 Princeton University
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


# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy Xilinx ddr3 model files
cp $XILINX_VIVADO/ids_lite/ISE/coregen/ip/xilinx/other/com/xilinx/ip/mig_7series_v2_0/data/dlib/7series/ddr3_sdram/sim/ddr3_model.v $DIR
cp $XILINX_VIVADO/ids_lite/ISE/coregen/ip/xilinx/other/com/xilinx/ip/mig_7series_v2_0/data/dlib/7series/ddr3_sdram/sim/ddr3_model_parameters.vh $DIR

# Replace directives
sed -i -e 's/%cntInfo_l//g' $DIR/ddr3_model.v
if [ "$1" == "GENESYS2" ]
then
    sed -i -e 's/%MEM_DENSITY/1Gb/g' $DIR/ddr3_model.v
    sed -i -e 's/%MEM_SPEEDGRADE/107/g' $DIR/ddr3_model.v
    sed -i -e 's/%MEM_DEVICE_WIDTH/16/g' $DIR/ddr3_model.v
fi
