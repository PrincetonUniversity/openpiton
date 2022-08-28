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
# Description: This script builds the RISCV toolchain, benchmarks, assembly tests
# the RISCV FESVR and the RISCV Torture framework for OpenPiton+Ariane configurations.
# Please source the ariane_setup.sh first.
#
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
#          csh


echo
echo "----------------------------------------------------------------------"
echo "building RISCV toolchain and tests (if not existing)"
echo "----------------------------------------------------------------------"
echo

if [[ "${RISCV}" == "" ]]
then
    echo "Please source ariane_setup.sh first, while being in the root folder."
else

  git submodule update --init --recursive piton/design/chip/tile/ariane

  # parallel compilation
  export NUM_JOBS=4

  cd piton/design/chip/tile/ariane/

  # not all tools are required at the moment
  ci/make-tmp.sh
  cd /home/$USER/MARCore1/openpiton
  #source/build-riscv-gcc.sh
  source/install-fesvr.sh
  # ci/build-riscv-tests.sh
  # ci/install-dtc.sh
  source/install-spike.sh
  # ci/get-torture.sh
  source/install-verilator.sh

  # build the RISCV tests if necessary
  cd piton/design/chip/tile/ariane/
  cd tmp

  git clone https://github.com/riscv/riscv-tests.git
  cd riscv-tests
  git submodule update --init --recursive
  autoconf
  mkdir -p build

  # link in adapted syscalls.c such that the benchmarks can be used in the OpenPiton TB
  cd benchmarks/common/
  rm syscalls.c util.h
  ln -s ${PITON_ROOT}/piton/verif/diag/assembly/include/riscv/ariane/syscalls.c
  ln -s ${PITON_ROOT}/piton/verif/diag/assembly/include/riscv/ariane/util.h
  cd -

  cd build
  ../configure --prefix=$ROOT/tmp/riscv-tests/build

  make clean
  make isa        -j${NUM_JOBS} > /dev/null
  make benchmarks -j${NUM_JOBS} > /dev/null
  make install
  cd ${PITON_ROOT}

  echo
  echo "----------------------------------------------------------------------"
  echo "build complete"
  echo "----------------------------------------------------------------------"
  echo

fi
