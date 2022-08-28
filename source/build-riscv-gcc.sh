#!/bin/bash
# call with first argument = 0 to checkout only

set -e
ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

mkdir -p $RISCV

cd $RISCV

if [ -z ${NUM_JOBS} ]; then
    NUM_JOBS=1
fi


if ! [ -e $RISCV/bin ]; then

    cd /home/muheet-ghani/riscv-gnu-toolchain

    if [[ $1 -ne "0" || -z ${1} ]]; then
      echo "Compiling RISC-V Toolchain"
      ./configure --prefix=$RISCV > /dev/null
      make -j${NUM_JOBS} > /dev/null
      echo "Compilation Finished"
    fi
fi
