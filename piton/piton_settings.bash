# Modified by Princeton University on May 24, 2017

# User needs to define these new variables

#################################################################
#   PITON_ROOT should be set elsewhere, i.e.                    #
#   some .bashrc script, to point to the princeton Piton        #
#   prcessor git repository.                                    #
#################################################################

export DV_ROOT=$PITON_ROOT/piton
export MODEL_DIR=$PITON_ROOT/build

if [ `uname -s` = "SunOS" ]
then
  export CC_BIN="/usr/dist/pkgs/sunstudio_`uname -p`/SUNWspro/bin"
else
  export CC_BIN=/usr/bin
fi

##################################################################
#   These tool variables should be defined elsewhere, i.e. by    #
#   some synopsys profile script.  I do not want ot make them    #
#   system specific. The synopsys profile script on della sets   #
#   these.                                                       #
##################################################################

# Please define VERA_HOME only if you have VERA, otherwise comment it out.

#if [ `uname -s` = "SunOS" -a `uname -p` = "sparc" ]
#then
#  export VERA_HOME=/import/EDAtools/vera/vera,v6.2.10/5.x
#else
#  export VERA_HOME
#fi

# Please define VCS_HOME only if you have VCS, otherwise comment it out.

#export VCS_HOME=

# Please define NCV_HOME only if you have NC-Verilog, otherwise comment it out.

#export NCV_HOME=

# Please define NOVAS_HOME only if you have Debussy, otherwise comment it out.

#if [ `uname -s` = "SunOS" -a `uname -p` = "sparc" ]
#then
#  export NOVAS_HOME=/import/EDAtools/debussy/debussy,v5.3v19/5.x
#fi

# Please define SYN_HOME only if you are running synopsys

#export SYN_HOME=

# Please define SYNP_HOME only if you are running Synplicity

#export SYNP_HOME=

#export LM_LICENSE_FILE=

# New variables (fixed or based on $DV_ROOT)

export TRE_ENTRY=/
export TRE_LOG=nobody
export TRE_SEARCH="$DV_ROOT/tools/env/tools.iver"
export ENVDIR=$DV_ROOT/tools/env
export PERL_MODULE_BASE=$DV_ROOT/tools/perlmod

# Synopsys variables from $SYN_HOME

if [ ! -z $SYN_HOME ]
then
export SYN_LIB=$SYN_HOME/libraries/syn
export SYN_BIN=$SYN_HOME/sparcOS5/syn/bin
fi

# Set Perl related variables
export PERL_CMD="/usr/bin/perl"

# Set path

NEWPATH=".:$DV_ROOT/tools/bin"

if [ ! -z $VCS_HOME ]
then
NEWPATH=$NEWPATH:$VCS_HOME/bin
fi

if [ ! -z $NCV_HOME ]
then
NEWPATH=$NEWPATH:$NCV_HOME/tools.lnx86/bin/64bit
fi

if [ ! -z $ICARUS_HOME ]
then
NEWPATH=$NEWPATH:$ICARUS_HOME/bin
fi

if [ ! -z $MODELSIM_HOME ]
then
NEWPATH=$NEWPATH:$MODELSIM_HOME/bin
fi

if [ ! -z $SYN_BIN ]
then
NEWPATH=$NEWPATH:$SYN_BIN
fi

if [ ! -z $CC_BIN ]
then
NEWPATH=$NEWPATH:$CC_BIN
fi

export PATH="$NEWPATH:$PATH"

# Set library path for the new goldfinger
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DV_ROOT/tools/src/goldfinger/lib
