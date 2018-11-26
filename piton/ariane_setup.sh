#!/bin/bash
#
# this script sets up some environment variables for the OpenPiton+Ariane
# simulation and build flow. Important: use a bash shell for this,
# and source it while being in the root folder of OpenPiton.
#

echo
echo "----------------------------------------------------------------------"
echo "openpiton/ariane path setup"
echo "----------------------------------------------------------------------"
echo

echo "make sure that you source this script in a bash shell in the root folder of OpenPiton"

if [ "$0" !=  "bash" ] && [ "$0" != "-bash" ]
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

## GCC and RISCV GCC setup
export CXX=g++-7.2.0 CC=gcc-7.2.0
export RISCV=/usr/scratch2/dolent1/gitlabci/riscv_install

# setup paths
export PATH=$PATH:${RISCV}/bin
export LIBRARY_PATH=$RISCV/lib
export LD_LIBRARY_PATH=$RISCV/lib:/usr/pack/gcc-7.2.0-af/linux-x64/lib64/
export C_INCLUDE_PATH=$RISCV/include:/usr/pack/gcc-7.2.0-af/linux-x64/include
export CPLUS_INCLUDE_PATH=$RISCV/include:/usr/pack/gcc-7.2.0-af/linux-x64/include
export ARIANE_ROOT=${PITON_ROOT}/piton/design/chip/tile/ariane/

# source OpenPiton setup script
# note: customize this script to reflect your tool setup
source ./piton/piton_settings.bash

if [[ $(readlink -e "${RISCV}/bin/spike") == "" ]]
then
    echo
    echo "----------------------------------------------------------------------"
    echo "setup complete. do not forget to run the ariane_build_tools.sh script"
    echo "if you run this for the first time."
    echo "----------------------------------------------------------------------"
    echo
else
    echo
    echo "----------------------------------------------------------------------"
    echo "setup complete."
    echo "----------------------------------------------------------------------"
    echo
fi