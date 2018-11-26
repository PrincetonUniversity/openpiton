#!/bin/bash
#
# this script builds the RISCV toolchain, benchmarks, assembly tests and torture for
# ariane. make sure that you source the ariane_setup.sh first.

echo
echo "----------------------------------------------------------------------"
echo "building RISCV toolchain and tests (if not existing)"
echo "----------------------------------------------------------------------"
echo

if [[ $(readlink -e "${RISCV}") == "" ]]
then
    echo "Please source ariane_setup.sh first, while being in the root folder."
    exit 
fi

git submodule update --init --recursive

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
echo "build complete"
echo "----------------------------------------------------------------------"
echo
