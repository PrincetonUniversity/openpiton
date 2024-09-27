#!/bin/bash

# Use this script to call protosyn using the OpenPIton Framework. Here you can choose the differents "flavours" we can implement

#Colors debug porpuses
R='\033[0;0;31m'    #Red
BR='\033[1;31m'     #Bold Red
BIR='\033[1;3;31m'  #Bold Italic Red
Y='\033[0;0;93m'    #Yellow
BY='\033[1;0;93m'   #Bold Yellow
BC='\033[1;36m'     #Bold Cyan
G='\033[0;32m'      #Green
BP='\033[1;35m'     #Bold Purple
BW='\033[1;37m'     #Bold White
NC='\033[0;0;0m'    #NO COLOR

#help fuction
#    PROTO_OPTIONS=""
function help(){

while getopts 'sh' OPTION; do
  case "$OPTION" in
    s)
        echo -e ${BR} " ACME_EA Naming Convention"
        echo -e ${BW} "First letter: to designate the core (A: Ariane; H: Lagarto Hun) "
        echo -e       " Second letter: to identify the accelerator (x: no accelerator; V: VPU; G: VPU+SA-HEVC+SA-NN)"
        echo -e       " Thrid letter: to identify the Memory Tile (x: no MT, M: Memory Tile)"
        echo -e      ${Y} " ( acme_ea_ahbvcm ); where:"
        echo -e      ${G} "  "a" means the number of cores in the system"
        echo -e               "   "b" means the number of vector lanes"
        echo -e               "   "c" means the number of MT "  ${NC}
        exit 0
    ;;
    h)
      echo -e ${BR}"Help menu "
      echo -e ${BC}"Accelerator_build:"${BW}"\tA script used for the EA to build potential RTL files. Uses OpenPiton Framwork "
      echo -e ${BC}"script usage:"${BW}"\t\t./$(basename "$0") <EA_name> <protosyn_flags>"
      echo -e ${BC}"<EA_name> available combinations :"
      echo -e ${BW} "   acme_ea_4a: \t\tCORE=ariane \tx_tiles=2 \ty_tyles=2"
      echo -e       "   acme_ea_1a: \t\tCORE=ariane \tx_tiles=1 \ty_tyles=1 "
      echo -e       "   acme_ea_1h16v: \tCORE=lagarto \tx_tiles=1 \ty_tyles=1 \tvlanes=16"
      echo -e       "   acme_ea_4h2v: \tCORE=lagarto \tx_tiles=2 \ty_tyles=2 \tvlanes=2"
      echo -e       "   acme_ea_16h: \tCORE=lagarto \tx_tiles=4 \ty_tyles=4 "
      echo -e       "   acme_ea_1h: \t\tCORE=lagarto \tx_tiles=1 \ty_tyles=1 "
      echo -e       "   acme_ea_1h2g: \tCORE=lagarto \tx_tiles=1 \ty_tyles=1 \tvlanes=2 \tSA-HEVC+SA-NN "
      echo -e       "   acme_ea_9h8m: \tCORE=lagarto \tx_tiles=3 \ty_tyles=3 \tmemory_tile=8 "
      echo -e       "   acme_ea_4h2m: \tCORE=lagarto \tx_tiles=2 \ty_tyles=2 \tmemory_tile=2 "
      echo -e       "   acme_ea_4h2v2m: \tCORE=lagarto \tx_tiles=2 \ty_tyles=2 \tvlanes=2 \tmemory_tile=2 "
      echo -e ${BC}"<protosyn_flag> available combinations :"
      echo -e  ${BW}"  pronoc: ProNoC routers"
      echo -e  "  vnpm: \tVivado non project mode"
      echo -e  "  hbm: \t\tHigh Bandwidth Memory. Implement design with HBM memory going first"
      echo -e  "  meep: \tGenerate a file list and a define list to called by the MEEP Shell project flow"
      echo -e  "  eth: \t\tAdd Ethernet controller to implementation"
      echo -e  "  ncmem: \tCreate an alias of the main memory bypassing the cache. Only available with meep option"
      echo -e  "  multimc: \t Multi memory controller" ${NC}
      exit 0
      ;;
    ?)
      echo "script usage: ./$(basename "$0") <EA_name> <protosyn_flags>"
      exit 1
      ;;
  esac
done
}

# Execute the help function
help $1
#####################



if [ x$1 == x ]; then
   echo Missing arguments
   echo Usage: $0 EA_flavours meep_config
   help
   exit 1
fi

#EA Flavours function: Selection of the production and test bitstreams
function ea_flavours() {
    local eaName=$1
    PROTO_OPTIONS=""
    case "$eaName" in
        acme_ea_4a)
            CORE=ariane
            XTILES=2
            YTILES=2
            NTILES=$(($XTILES * $YTILES))
            echo -e ${BP}"    Selected build configuration: Ariane 2x2 Golden Reference " ${NC}
            ;;
        acme_ea_1a)
            CORE=ariane
            XTILES=1
            YTILES=1
            NTILES=$(($XTILES * $YTILES))
            echo -e ${BP}"    Selected build configuration: Ariane 1x1" ${NC}
            ;;
        acme_ea_1h16v)
            CORE=lagarto
            XTILES=1
            YTILES=1
            VLANES=16
            NTILES=$(($XTILES * $YTILES))
            PROTO_OPTIONS+=" --vpu_enable --vlanes $VLANES "
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 1x1 16 Vector Lanes" ${NC}
            ;;
        acme_ea_4h2v)
            CORE=lagarto
            XTILES=2
            YTILES=2
            VLANES=2
            NTILES=$(($XTILES * $YTILES))
            PROTO_OPTIONS+=" --vpu_enable --vlanes $VLANES "
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 2x2 2 Vector Lanes " ${NC}
            ;;
        acme_ea_1h2g)
            CORE=lagarto
            XTILES=1
            YTILES=1
            VLANES=2
            NTILES=$(($XTILES * $YTILES))
            PROTO_OPTIONS+=" --sa_nn_enable --sa_hevc_enable --vpu_enable --vlanes $VLANES "
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 1x1 2 Vector Lanes Systolic Arrays NN and HEVC " ${NC}
            ;;
        acme_ea_1h)
            CORE=lagarto
            XTILES=1
            YTILES=1
            NTILES=$(($XTILES * $YTILES))
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 1x1  " ${NC}
            ;;
        acme_ea_9h8m)
            CORE=lagarto
            XTILES=3
            YTILES=3
            NTILES=$(($XTILES * $YTILES))
            PROTO_OPTIONS+=" --multimc $NTILES "
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 3x3, 8 extra MC (corresponding HBM channels should be enabled in accelerator_def.csv) " ${NC}
            ;;
        acme_ea_4h2m)
            CORE=lagarto
            XTILES=2
            YTILES=2
            NTILES=$(($XTILES * $YTILES))
            PROTO_OPTIONS+=" --multimc 2 --multimc_indices 1,2 "
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 2x2, 2 extra MC (corresponding HBM channels should be enabled in accelerator_def.csv) " ${NC}
            ;;
        acme_ea_4h2v2m)
            CORE=lagarto
            XTILES=2
            YTILES=2
            VLANES=2
            NTILES=$(($XTILES * $YTILES))
            PROTO_OPTIONS+=" --vpu_enable --vlanes $VLANES --multimc 2 --multimc_indices 1,2 "
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 2x2, 2 Vector Lanes, 2 extra MC (corresponding HBM channels should be enabled in accelerator_def.csv)" ${NC}
            ;;
        acme_ea_16h)
            CORE=lagarto
            XTILES=4
            YTILES=4
            NTILES=$(($XTILES * $YTILES))
            echo -e ${BP}"    Selected build configuration: Lagarto Hun 4x4  " ${NC}
            ;;
    esac
}

function ea_options() {
    case "$1" in
        pronoc)
        PROTO_OPTIONS+=" --pronoc"
        echo -e ${BC}"    Added ProNoc routers " ${NC}
        ;;
        vnpm)
        PROTO_OPTIONS+=" --vnpm "
        echo -e ${BC}"    Vivado Non Project mode " ${NC}
        ;;
        hbm)
        PROTO_OPTIONS+=" --hbm"
        echo -e ${BC}"    HBM " ${NC}
        ;;
        meep)
        PROTO_OPTIONS+=" --meep "
        echo -e ${BC}"    MEEP " ${NC}
        ;;
        eth)
        PROTO_OPTIONS+=" --eth "
        echo -e ${BC}"    Ethernet " ${NC}
        ;;
        ncmem)
        PROTO_OPTIONS+=" --ncmem "
        echo -e ${BC}"    Main memory bypassing the cache " ${NC}
        ;;
        multimc)
        PROTO_OPTIONS+=" --multimc "
        echo -e ${BC}"    Multi memory controller " ${NC}
        ;;
        [0-9])
        PROTO_OPTIONS+=$1
        ;;
    esac
}

# Check the input arguments
# The first one must be the EA, second one will be PROTOSYN_FLAG
function ea_selected() {
declare -A map=( [acme_ea_4a]=1 [acme_ea_1a]=1 [acme_ea_1h16v]=1 [acme_ea_4h2v]=1 [acme_ea_1h2g]=1 [acme_ea_1h]=1 [acme_ea_9h8m]=1 [acme_ea_4h2m]=1 [acme_ea_4h2v2m]=1 [acme_ea_16h]=1 )
ea_is=$1
if [[ ${map["$ea_is"]} ]] ; then
    echo "EA_selection: $ea_is"
    ea_flavours $ea_is
else
    echo -e ${BY}"EA selection: ${BIR}  $ea_is ${BY} is not supported" ${NC}
    exit 1
fi
shift
}

## Build configurations
#Right flag names
function protosyn_flags() {
 declare -A map1=( [pronoc]=1 [vnpm]=1 [hbm]=1 [meep]=1 [eth]=1 [ncmem]=1 [multimc]=1)
 ea_conf=$1

if [ x$1 == x ]; then
    echo -e ${R}"    No added meep optional configuration arguments. Used mandatory ones --meep --eth --ncmem --hbm " ${NC}
    PROTO_OPTIONS+="--meep --eth --ncmem --hbm"
elif [[ ${map1["$ea_conf"]} ]] || [[ $ea_conf =~ ^[0-9]+$ ]]; then
   ea_options $ea_conf
else
    echo -e ${BY}"EA protosyn flags: "${BIR} "$1" ${BY}"is not supported" ${NC}
    exit 1
fi
}

#read the input array and set the specific flags
array=("$@")

for i in "${array[@]}"
do
    if [ $# -eq 0 ]; then
        echo "No arguments passed. Please provide some arguments."
    elif [ $# -eq 1 ]; then
        ea_selected $1
        protosyn_flags
    elif [ $# -gt 1 ]; then
        if [[ $i  != *"acme_ea"* ]]; then
            protosyn_flags $i
        else
            ea_selected $1
        fi
    fi

done

echo "______________________________________________________________________________________________________________"
echo -e ${BW}"Final result : $CORE x_tiles=$XTILES y_tiles=$YTILES num_tiles=$NTILES , flags: $PROTO_OPTIONS" ${NC}
echo ".............................................................................................................."

#Export the accelerator main variables
#Export the accelerator variables
#create env file to export to Openpiton Framework
echo "$( dirname $(readlink -f ${BASH_SOURCE[0]}) )"
path=$( dirname $(readlink -f ${BASH_SOURCE[0]}) )
ENV_FILE=$path/env_accelerator.sh
if [ -f "$ENV_FILE" ]; then
    rm $ENV_FILE
    touch $ENV_FILE
else
    touch $ENV_FILE
fi

echo "#Accelerator_build.sh environment" >> $ENV_FILE
export CORE
echo "export CORE=$CORE" >> $ENV_FILE
export XTILES
echo "export XTILES=$XTILES" >> $ENV_FILE
export YTILES
echo "export YTILES=$YTILES" >> $ENV_FILE
export NTILES
echo "export NTILES=$NTILES">> $ENV_FILE
export PROTO_OPTIONS
echo "export PROTO_OPTIONS=$PROTO_OPTIONS" >> $ENV_FILE


#check the variables are not empty

if [ -z "$CORE" ] ; then
      echo "Can't execute protosyn command"
else

      echo "Execute protosyn command to build the infrastructure with OP"
      make acc_framework CORE=$CORE XTILES=$XTILES YTILES=$YTILES NTILES=$NTILES PROTO_OPTIONS="$PROTO_OPTIONS" || (echo -e ${BR}"make Accelerator with OpenPiton Framework failed $$?"${NC}; exit 1)
fi



