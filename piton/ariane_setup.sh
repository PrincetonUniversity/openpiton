#!/bin/bash
# Copyright 2018 ETH Zurich and University of Bologna.
# Copyright and related rights are licensed under the Solderpad Hardware
# License, Version 0.51 (the "License"); you may not use this file except in
# compliance with the License.  You may obtain a copy of the License at
# http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
# or agreed to in writing, software, hardware and materials distributed under
# this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich
# Date: 26.11.2018
# Description: This script sets up some environment variables for the
# OpenPiton+Ariane simulation and build flow. Important: use a bash shell
# for this, and source it while being in the root folder of OpenPiton.
#
# Make sure you have the following packages installed:
#
# sudo apt install \
#          gcc-7 \
#          g++-7 \
#          gperf \
#          autoconf \
#          automake \
#          autotools-dev \
#          libmpc-dev \
#          libmpfr-dev \
#          libgmp-dev \
#          gawk \
#          build-essential \
#          bison \
#          flex \
#          texinfo \
#          python-pexpect \
#          libusb-1.0-0-dev \
#          default-jdk \
#          zlib1g-dev \
#          valgrind \
#          csh \
#          device-tree-compiler


echo
echo "----------------------------------------------------------------------"
echo "openpiton/ariane path setup"
echo "----------------------------------------------------------------------"
echo

echo "make sure that you source this script in a bash shell in the root folder of OpenPiton"

if [ -z "$BASH" ] || [ ${0: -4} !=  "bash" ]
then
  echo "not in bash ($0), aborting"
  return
fi

SCRIPTNAME=ariane_setup.sh

TEST=`pwd`/piton/
if [[ $(readlink -e "${TEST}/${SCRIPTNAME}") == "" ]]
then
  echo "aborting"
  return
fi

################################
# PITON setup
################################

# set root directory
export PITON_ROOT=`pwd`
export ARIANE_ROOT=${PITON_ROOT}/piton/design/chip/tile/ariane/

## GCC and RISCV GCC setup
export CXX=g++ CC=gcc
# customize this to a fast local disk

if [ "$RISCV" ==  "" ]
then
  export RISCV=$HOME/scratch/riscv_install
fi
export VERILATOR_ROOT=$ARIANE_ROOT/tmp/verilator-4.014/

# setup paths
export PATH=$RISCV/bin:$VERILATOR_ROOT/bin:$PATH
export LIBRARY_PATH=$RISCV/lib
export LD_LIBRARY_PATH=$RISCV/lib
export C_INCLUDE_PATH=$RISCV/include:$VERILATOR_ROOT/include
export CPLUS_INCLUDE_PATH=$RISCV/include:$VERILATOR_ROOT/include

# source OpenPiton setup script
# note: customize this script to reflect your tool setup
source ./piton/piton_settings.bash

if [[ $(readlink -e "${RISCV}/bin/spike") == "" ]]
then
    echo
    echo "----------------------------------------------------------------------"
    echo "setup complete. do not forget to run the following script             "
    echo "if you run the setup for the first time: ./piton/ariane_build_tools.sh"
    echo "----------------------------------------------------------------------"
    echo
else
    echo
    echo "----------------------------------------------------------------------"
    echo "setup complete."
    echo "----------------------------------------------------------------------"
    echo
fi
