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

sudo su
apt-get install -y g++

# Recompile configsrch
cd $DV_ROOT/tools/src/configsrch
make
make install

# Install csh
apt-get install -y csh


# Install required perl packages
cd ~
mkdir piton_tmp
cd piton_tmp
mkdir extract


declare -a pkgLink=("http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.45.tar.gz"
    "http://search.cpan.org/CPAN/authors/id/A/AV/AVIKAK/Algorithm-BitVector-1.24.tar.gz"
    "http://search.cpan.org/CPAN/authors/id/G/GR/GROMMEL/Math-Random-0.71.tar.gz"
    "http://search.cpan.org/CPAN/authors/id/S/ST/STBEY/Bit-Vector-7.4.tar.gz"
    "http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Carp-Clan-6.06.tar.gz"
    "http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-Exception-0.43.tar.gz"
    "http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Sub-Uplevel-0.25.tar.gz")

for i in "${pkgLink[@]}"
do
    wget "$i"
    mkdir extract
    tar xzf *tar.gz -C extract --strip-components=1
    cd extract
    perl Makefile.PL
    make
    make test
    make install
    cd ..
    rm -rf *
done

cd ..
rm -rf piton_tmp


# Enable 32-bit programs
dpkg --add-architecture i386
apt-get update
apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
apt-get clean && apt-get update && apt-get upgrade
apt-get install -f

# Install 32 bit version of gmp
wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gmp4/libgmp3c2_4.3.2+dfsg-2ubuntu1_i386.deb
dpkg -i libgmp3c2_4.3.2+dfsg-2ubuntu1_i386.deb
rm libgmp3c2_4.3.2+dfsg-2ubuntu1_i386.deb

# 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
printf "\nexport LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/lib\n" >> ~/.bashrc
