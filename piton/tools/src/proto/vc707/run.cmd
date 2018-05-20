#!/bin/bash
#SBATCH -N 1   # node count
#SBATCH --ntasks-per-node=1
#SBATCH -t 12:00:00
source ~/.bashrc
cd /tigress/alavrov/chip/XXX #TODO: change to an existing one!
export PITON_ROOT=$PWD; source piton/piton_settings.bash
cd $DV_ROOT/tools/src/proto
echo $DV_ROOT
./protosyn,1.0 -b vc707 --from project
