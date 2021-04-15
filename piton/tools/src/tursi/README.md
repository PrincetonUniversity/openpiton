Tursi
=====

Tursi is an extensible framework for “pickling” IP blocks based on a
Verilog codebase.

Tursi leverages [FuseSoC](https://github.com/olofk/fusesoc) and [Icarus Verilog](https://github.com/steveicarus/iverilog)
order to “pickle” a chosen design; that is, bring all of the dependent
RTL files together into one industry-standard Verilog file. Any
necessary pre-processing (including for macros) of the HDL description
is done in advance by FuseSoC and Icarus Verilog to remove the need for
EDA tool researchers and developers to understand the design and its
codebase’s build infrastructure.

The main design goal of Tursi is to provide a configurable and
extensible framework for creating “pickled” instances of different
module/design configurations. To meet this goal we utilize the FuseSoC
framework and its Core API (CAPI) description format to describe and
process dependencies across modules.

Dependencies
============

To use Tursi you will need to install FuseSoc and Icarus Verilog in your
computer. The two frameworks have a number of dependencies on other
packages. The most straightforward way to install Tursi’s dependencies
is by using PiP for FuseSoc and your distribution’s package manager for
Icarus Verilog, in this way all secondary dependencies of each package
would be resolved automatically.

FuseSoC
-------

FuseSoC is “a package manager and build system for HDL”. A detailed
documentation of FuseSoC and its capabilities can be found at
<https://fusesoc.readthedocs.io/en/latest/user/index.html>.

FuseSoC’s CAPI description format uses the YAML language and contains
all information regarding which files compose the specified module/core,
possible dependencies to other cores, and EDA tool parameters for a
specific task.

### Installation

      # Installing FuseSoc using PiP
      $ sudo pip install fusesoc

      # Installing latest development version of FuseSoc from git
      $ cd <custom_dir>
      $ git clone https://github.com/olofk/fusesoc
      $ cd  fusesoc
      $ sudo pip install -e .

Icarus Verilog
--------------

Icarus Verilog is “a Verilog simulation and synthesis tool”. It’s main
components are the Verilog compiler and the design simulator.

### Installation

You can find detailed installation instructions for Icarus Verilog at
<https://iverilog.fandom.com/wiki/Installation_Guide>

      # Installing Icarus Verilog on Fedora
      $ sudo dnf install iverilog
      # Installing Icarus Verilog on Ubuntu/Debian
      $ apt-get install iverilog
      
      # Installing latest development version of Icarus Verilog from git
      $ cd <custom_dir>
      $ git clone https://github.com/steveicarus/iverilog
      $ cd iverilog
      $ ./configure
      $ make
      $ sudo make install

Usage
=====

Currenty, Tursi is integrated with the OpenPiton infrastructure. That
means you will have to download OpenPiton and setup the environment
before using Tursi.
As Tursi allows pickling of modules outside of the OpenPiton codebase
you will need to setup the environment for those design correctly before
you are able to use Tursi to create their pickled designs.

A number of pregenerated pickled designs can be found on the
[OpenPiton Design Benchmark (OPDB) repository](https://github.com/PrincetonUniversity/OPDB).

Environment Configuration and Setup
-----------------------------------

To be able to use Tursi you will need to update the PATH environment
variable accordingly. This can be done through the
“piton\_settings.bash” script. Furthermore, you will need to create a
local FuseSoC library, this can be done by using “fusesoc library add
openpiton <library\_root\_dir>”.

      # Get latest version of OpenPiton 
      $ git clone https://github.com/PrincetonUniversity/openpiton

      # Set environment (assuming bash shell)
      $ cd openpiton
      $ export PITON_ROOT=`pwd`
      $ source ./piton/piton_settings.bash
      
      # Create local FuseSoC configuration
      $ fusesoc library add openpiton ${PITON_ROOT}

      # Create dynamic_node pickled file
      $ CORE="openpiton::dynamic_node_2dmesh"
      $ tursi --pickle --fusesoc_core ${CORE} --network_config 2dmesh
      # The pickled file can be found at PICKLE_OUT as defined below
      $ CORE_UNDERSCORE=$(echo ${CORE} | tr ':' '_')
      $ PICKLE_OUT=build/build/${CORE_UNDERSCORE}_0.1/pickle-icarus/${CORE_UNDERSCORE}_0.1

      # Get a summary of tursi options
      $ tursi -h

Adding a New Module
-------------------

To enable the “pickling” of a new module the developer needs only to
create a new CAPI file for the targeted module.
Listing \[lst:capi\_dynamic\_node\] presents the CAPI Core of the
“dynamic\_node module” from OpenPiton, and it can be used as a reference
to create new ones. Besides the files that compose the module and
possible dependencies on other CAPI files, the user needs to define a
build target that performs the “pickling”. This includes the call to
Icarus Verilog and may also include pre-processing steps for
configuration or file generation, like the PyHP preprocessor used by
OpenPiton.

    CAPI=2:
    name: openpiton::dynamic_node:0.1
    description: Top-level Dynamic Node

    filesets:
        rtl:
            files:
                - dynamic_node_top_wrap.v
                - dynamic_node_top.v
            depend:
                - openpiton::dynamic_node_components
                - openpiton::dynamic_node_dynamic
                - openpiton::dynamic_node_common
                - openpiton::piton_include
            file_type: verilogSource

    targets:
        default:
            filesets: [rtl]
            generate: [pyhp_preprocess]

        pickle:
            default_tool: icarus
            filesets: [rtl]
            generate: [pyhp_preprocess]
            toplevel: [dynamic_node_top]
            tools:
                icarus:
                    iverilog_options: [-g 2001 -E]

        verify:
            default_tool: icarus
            filesets: [rtl]
            generate: [pyhp_preprocess]
            toplevel: [dynamic_node_top]
            tools:
                icarus:
                    iverilog_options: [-g 2001]

    generate:
        pyhp_preprocess:
            generator: pyhp_preprocess_gen
            parameters:
                process_me : [[dynamic_node_top_wrap_para.v.pyv, dynamic_node_top_wrap_para.tmp.v],
                              [dynamic_node_top_para.v.pyv, dynamic_node_top_para.tmp.v]]

Following, we provide a targeted brief description of the above
Listing \[lst:capi\_dynamic\_node\] to assist on creating your own CAPI
files. Line 1 is essentially a header required as the first line in the
core description and defines the version of CAPI used in the file. Line
2 provides the name of the module in VLNL (Vendor, Library, Name,
Vendor) format. Line 3 provides a brief description of the module. Lines
5-15 describe the components and dependencies of the module. Lines 7-9
directly provide HDL files that the module depends upon, whereas Lines
10-14 provide dependencies through LVNL IDs. Lines 17-38 describe the
different targets that can be created. Lines 22-29 define the “pickling”
target: Line 23 defines the toolchain that will be used, Line 24 defines
the fileset that composes the target module, Line 25 defines the
pre-processing target that needs to be executed, Line 26 defines the
top-level module of the overall design, and Lines 27-30 define the
parameters that will be passed on the toolchain. For more information
regarding the CAPI format see
<https://fusesoc.readthedocs.io/en/rtd/capi2.html>

By describing the dependencies of a given code base using CAPI a natural
hierarchy of IP blocks is generated. This hierarchy can be utilized to
create a wide range of configurations moving from simpler to more
complex designs as we move towards the root of the dependence tree. CAPI
files clearly describe the dependencies between a module and its
sub-components and eliminate redundancy that would have been unavoidable
in other descriptions, such as Flists. Figure \[fig:OPDB\_hierarchy\]
presents a visualization of the hierarchy of IP blocks that naturally
arises from the CAPI description of OpenPiton’s dependencies.

![\[fig:OPDB\_hierarchy\] OPDB module
hierarchy](figures/OPDB_hierarchy.jpg)

Note that, if the new module is located outside the OpenPiton root
directory, where we have already generated a FuseSoC local library, a
new FuseSoc local library will need to be created at the new modules
root directory.

### Generating a New Pickled Design

To enable a new design on Tursi you will need to make a number of
modifications on its source code.
Currently, Tursi is strict on which modules can be pickled. This is done by checking
an internal dictionary files "fusesoc_core_choices". To allow for the 
new module to be processed by Tursi you will need to update the following structures
of the tursi python script:
 - fusesoc_core_choices
 - fusesoc2toplevel


In case you need to specify additional RTL level defines to customize
your output you can use the `--config_rtl` option on Tursi.

Getting Help & Reporting Issues
-------------------------------

You can use the OpenPiton Google group –
<https://groups.google.com/forum/#!forum/openpiton> – to ask questions
regarding how to use Tursi. In case you identify a bug on the code
please create an issue at the OpenPiton github repository
<https://github.com/PrincetonUniversity/openpiton>.

Current Limitations
-------------------

The current version of Tursi only support pickling of Verilog codebases
due to the dependence on Icarus Verilog. We are working on providing
support for SystemVerilog codebases through SystemVerilog to Verilog
translation. At the moment there are no plans for support other
languages such as VHDL, if you are interested in providing support for a
new language feel free to contact us or submit a Pull Request on the
OpenPiton repository with your modifications that enable that.

Finally, all development, testing, and usage of Tursi and of its output
has been performed on machines running GNU/Linux distributions, thus
support for Windows or MacOS may be buggy or limited.

