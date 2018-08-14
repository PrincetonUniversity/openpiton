![OpenPiton Logo](/docs/openpiton_logo_black.png?raw=true)

# OpenPiton Research Processor   [![Build Status](https://jenkins.princeton.edu/buildStatus/icon?job=cloud/piton_git_push_master)](https://jenkins.princeton.edu/job/cloud/job/piton_git_push_master/)

OpenPiton is the world’s first open source, general purpose, multithreaded manycore processor. It is a tiled manycore framework scalable from one to 1/2 billion cores. It is a 64-bit architecture using SPARC v9 ISA with a distributed directory-based cache coherence protocol across on-chip networks. It is highly configurable in both core and uncore components. OpenPiton has been verified in both ASIC and multiple Xilinx FPGA prototypes running full-stack Debian linux. We have released both the Verilog RTL code as well as synthesis and back-end flow. We believe OpenPiton is a great framework for researchers in computer architecture, OS, compilers, EDA, security and more.

OpenPiton has been published in ASPLOS 2016: Jonathan Balkind, Michael McKeown, Yaosheng Fu, Tri Nguyen, Yanqi Zhou, Alexey Lavrov, Mohammad Shahrad, Adi Fuchs, Samuel Payne, Xiaohua Liang, Matthew Matl, and David Wentzlaff. "OpenPiton: An Open Source Manycore Research Framework." In Proceedings of the 21st International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS '16), April 2016.

More information about OpenPiton is available in www.openpiton.org 

If you use OpenPiton in your research please reference our ASPLOS 2016 paper mentioned above and send us a citation of your work.

#### Documentations

There are several detailed documentations about OpenPiton in the docs folder listed below:

- OpenPiton Simulation Manual
- OpenPiton Microarchitecture Specification
- OpenPiton FPGA Prototype Manual
- OpenPiton Synthesis and Back-end Manual



#### Environment Setup
- The ```PITON_ROOT``` environment variable should point to the root of the OpenPiton repository
- The Synopsys environment for simulation should be setup separately by the user.  Besides adding correct paths to your ```PATH``` and ```LD_LIBRARY_PATH``` (usually accomplished by a script provided by Synopsys), the OpenPiton tools specifically reference the ```VCS_HOME``` environment variable which should   point to the root of the Synopsys VCS installation.
    - **Note**: Depending on your system setup, Synopsys tools may require the ```-full64``` flag.  This can easily be accomplished by adding a bash function as shown in the following example for VCS (also required for URG):

        ```bash
        function vcs() { command vcs -full64 "$@"; }; export -f vcs
        ```

- Run ```source $PITON_ROOT/piton/piton_settings.bash``` to setup the environment
    - A CShell version of this script is provided, but OpenPiton has not been tested for and currently does not support CShell

- Note: On many systems, you must run the ```mktools``` command once to rebuild a number of the tools before continuing. If you see issues later with building or running simulations, try running ```mktools``` if you have not already.

- Top level directory structure:
    - piton/
        - All OpenPiton design and verification files
    - docs/
        - OpenPiton documentation
    - build/
        - Working directory for simulation and simulation models
    
==========================

#### Building a simulation model
1. ```cd $PITON_ROOT/build```
2. ```sims -sys=manycore -x_tiles=1 -y_tiles=1 -vcs_build``` builds a single tile OpenPiton simulation model.
3. A directory for the simulation model will be created in ```$PITON_ROOT/build``` and the simulation model can now be used to run tests.  For more details on building simulation models, please refer to the OpenPiton documentation.

==========================

#### Running a simulation
1. ```cd $PITON_ROOT/build```
2. ```sims -sys=manycore -x_tiles=1 -y_tiles=1 -vcs_run princeton-test-test.s``` runs a simple array summation test given the simulation model is already built.
3. The simulation will run and generate many log files and simulation output to stdout.  For more details on running a simulation, provided tests/simulations in the test suite, and understanding the simulation log files and output, please refer to the OpenPiton documentation.

==========================

#### Running a regression
A regression is a set of simulations/tests which run on the same simulation model.

1. ```cd $PITON_ROOT/build```
2. ```sims -sim_type=vcs -group=tile1_mini``` runs the simulations in the tile1_mini regression group.
3. The simuation model will be built and all simulations will be run sequentially.  In addition to the simulation model directory, a directory will be created in the form ```<date>_<id>``` which contains the simulation results.
4. ```cd <date>_<id>```
5. ```regreport $PWD > report.log``` will process the results from each of the regressions and place the aggregated results in the file ```report.log```.  For more details on running a regression, the available regression groups, understanding the regression output, and specifying a new regression group, please refer to the OpenPiton documentation.

==========================

#### Running a continuous integration bundle
Continuous integration bundles are sets of simulations, regression groups, and/or unit tests.  The simulations within a bundle are not required to have the same simulation model.  The continuous integration tool requires a job queue manager (e.g. SLURM, PBS, etc.) to be present on the system in order parallelize simulations.

1. ```cd $PITON_ROOT/build```
2. ```contint --bundle=git_push``` runs the git_push continuous integration bundle which we ran on every commit when developing Piton.  It contains a regression group, some assembly tests, and some unit tests.
3. The simulation models will be built and all simulation jobs will be submitted
4. After all simulation jobs complete, the results will be aggregated and printed to the screen.  The individual simulation results will be saved in a new directory in the form ```contint_<bundle name>_<date>_<id>``` and can be reprocessed later to view the aggregated results again.
5. The exit code of the command in Step 2 indicates whether all tests passed (zero exit code) or at least one failed (non-zero exit code).
6. For more details on running continuous integration bundles, the available bundles, understanding the output, reprocessing completed bundles, and creating new bundles, please refer to the OpenPiton documentation. 

==========================
