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

## Vivado
export VIVADO_BIN="vivado-2018.1 vivado"

## VCS
VCS_VER="vcs-2017.03-kgf"

# wrap this such that it uses the SEPP package
# (license setup is then done by the SEPP startup script)
eval "function vcs() { command $VCS_VER vcs -full64 \"\$@\"; };"
export -f vcs

export VCS_HOME="/usr/pack/${VCS_VER}/"

## Modelsim
export MODELSIM_VERSION="-10.6b -64"
export MODELSIM_HOME="/usr/pack/modelsim-10.6b-kgf/"

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

#source OpenPiton setup script
source ./piton/piton_settings.bash

git submodule update --init --recursive

echo
echo "----------------------------------------------------------------------"
echo "building RISCV toolchain and tests (if not existing)"
echo "----------------------------------------------------------------------"
echo

# parallel compilation
export NUM_JOBS=4

cd piton/design/chip/tile/ariane/

ci/make-tmp.sh
ci/build-riscv-gcc.sh
ci/install-fesvr.sh
ci/build-riscv-tests.sh
ci/install-dtc.sh
ci/install-spike.sh
ci/get-torture.sh

cd -

echo
echo "----------------------------------------------------------------------"
echo "setup complete"
echo "----------------------------------------------------------------------"
echo
