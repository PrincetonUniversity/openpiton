Accellera Universal Verification Methodology
version 1.2

(C) Copyright 2007-2012 Mentor Graphics Corporation
(C) Copyright 2007-2012 Cadence Design Systems, Incorporated
(C) Copyright 2006-2012 Synopsys Inc.
(C) Copyright 2012 Cypress Semiconductor Corp.
All Rights Reserved Worldwide

The UVM kit is licensed under the Apache-2.0 license.  The full text of
the license is provided in this kit in the file LICENSE.txt

Installing the kit
------------------

Installation of UVM requires first unpacking the kit in a convenient
location.

    % mkdir path/to/convenient/location
    % cd path/to/convenient/location
    % gunzip -c path/to/UVM/distribution/tar.gz | tar xvf -

You should define the $UVM_HOME environment variable to that
convenient location using an absolute path name. The following
instructions assume that this variable is appropriately set.

   % setenv UVM_HOME /absolute/path/to/convenient/location

You must then obtain from your SystemVerilog tool vendor a tool-specific
distribution overlay. That overlay may be specific to the machine
architecture and/or operating system you are using. Make sure you provide
the output of the '$UVM_HOME/bin/uvm_os_name' script as well as the version
of the simulator you are using when requesting a UVM overlay from your vendor.

            % $UVM_HOME/bin/uvm_os_name
   IUS:     % irun -version
   Questa:  % vlog -version
   VCS:     % vcs -ID

Follow the installation instructions provided by your tool vendor for
installing the overlay in your UVM installation.

Note to EDA vendors: to support multiple tool-specific overlays in the
same UVM distribution, please locate any tool-specific files in a
tool-specific sub-directory.


Using the UVM
-------------

You must compile the file $UVM_HOME/src/uvm.sv first. You will need
to specify the location of $UVM_HOME/src as a include directory in your
compilation command line using the +incdir+ command-line option.

You can then make the UVM library accessible to your SystemVerilog
code by importing the package 'uvm_pkg' in the appropriate scope.

   import uvm_pkg::*;

To use the UVM short-hand macros, it is necessary to include the file
"uvm_macros.svh". This will also necessitate that you specify the
location of $UVM_HOME/src as a include directory.

`include "uvm_macros.svh"

You will also need to compile the file $UVM_HOME/src/dpi/uvm_dpi.cc
and/or specify the location of the resulting UVM DPI shared library to
your simulator. This is a simulator-specific process.  Please refer to
your simulator documentation.



Prerequisites
-------------

- IEEE1800 compliant SV simulator
- gmake-compliant make to execute Makefile based examples
- C compiler to compile the DPI code (if not otherwise provided by tool vendor)


Running the examples
--------------------

The examples assume the following steps to be completed:

- The Compiler/Simulator environment has been setup according to the vendors 
  instruction and you can execute compile/simulation on the commandline.

To run any of the examples:

1. change to the example dir (ex: cd examples/trivial)
2. execute "make -f Makefile.{ius|vcs|questa}" depending upon your simulator vendor to run the example. 
The makefiles assume a gmake compiliant make tool.

optional:
- to see the commands and steps executed use "make -f Makefile.{ius|vcs|questa} -n"

- to run against an uvm installation in a different location override the makefile variable UVM_HOME
  make -f Makefile.ius UVM_HOME=`ncroot`/tools/uvm
  
 


------------------------------------------------------------------------
