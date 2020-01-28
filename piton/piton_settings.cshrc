# Modified by Princeton University on May 24, 2017

# User needs to define these new variables

#################################################################
# mmckeown:                                                     #
#   PITON_ROOT should be set elsewhere, i.e.                    #
#   some .bashrc script, to point to the princeton Piton        #
#   prcessor git repository.                                    #
#################################################################

setenv DV_ROOT $PITON_ROOT/piton
setenv MODEL_DIR $PITON_ROOT/build

if (`uname -s` == "SunOS") then
  setenv CC_BIN "/usr/dist/pkgs/sunstudio_`uname -p`/SUNWspro/bin"
else
  setenv CC_BIN /usr/bin
endif

##################################################################
# mmckeown:                                                      #
#   These tool variables should be defined elsewhere, i.e. by    #
#   some synopsys profile script.  I do not want ot make them    #
#   system specific. The synopsys profile script on della sets   #
#   these.                                                       #
##################################################################

# Please define VERA_HOME only if you have VERA, otherwise comment it out.

#if ((`uname -s` == "SunOS") && (`uname -p` == "sparc")) then
#  setenv VERA_HOME /import/EDAtools/vera/vera,v6.2.10/5.x
#else
#  setenv VERA_HOME
#endif

# Please define VCS_HOME only if you have VCS, otherwise comment it out.

#setenv VCS_HOME /import/EDAtools/vcs/vcs7.1.1R21

# Please define NCV_HOME only if you have NC-Verilog, otherwise comment it out.

#setenv NCV_HOME /import/EDAtools/ncverilog/ncverilog.v5.3.s2/5.x

# Please define NOVAS_HOME only if you have Debussy, otherwise comment it out.

#if ((`uname -s` == "SunOS") && (`uname -p` == "sparc")) then
#  setenv NOVAS_HOME /import/EDAtools/debussy/debussy,v5.3v19/5.x
#endif

# Please define SYN_HOME only if you are running synopsys

#setenv SYN_HOME "/import/EDAtools/synopsys/synopsys.vX-2005.09"

# Please define SYNP_HOME only if you are running Synplicity

#setenv SYNP_HOME "/import/EDAtools/synplicity/synplify.v8.6.1/fpga_861"

#setenv LM_LICENSE_FILE ""


# define vivado version if it deviates from the default
#setenv VIVADO_BIN "vivado"

# Please define MODELSIM_HOME only if you have MODELSIM, otherwise comment it out.

#setenv MODELSIM_VERSION "-10.6b -64"
#setenv MODELSIM_HOME ""

# Please define RIVIERA_HOME only if you have Riviera-PRO, otherwise comment it out.

#export RIVIERA_HOME=

# New variables (fixed or based on $DV_ROOT)

setenv TRE_ENTRY /
setenv TRE_LOG nobody
setenv TRE_SEARCH "$DV_ROOT/tools/env/tools.iver"
setenv ENVDIR $DV_ROOT/tools/env
setenv PERL_MODULE_BASE $DV_ROOT/tools/perlmod

# Synopsys variables from $SYN_HOME

setenv SYN_LIB $SYN_HOME/libraries/syn
setenv SYN_BIN $SYN_HOME/sparcOS5/syn/bin

# Set Perl related variables
setenv PERL_CMD "/usr/bin/perl"

# Set path

setenv PATH "$DV_ROOT/tools/bin:$NCV_HOME/tools/bin:$VCS_HOME/bin:$VERA_HOME/bin:$SYN_BIN/:$CC_BIN/:$PATH"

set path = (. $DV_ROOT/tools/bin $NCV_HOME/tools/bin $VCS_HOME/bin $VERA_HOME/bin $SYN_BIN $CC_BIN $path)

setenv LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$DV_ROOT/tools/src/goldfinger/lib"
