![OpenPiton Logo](/docs/openpiton_logo_black.png?raw=true)

# OpenPiton Research Platform   [![Build Status](https://jenkins.princeton.edu/buildStatus/icon?job=cloud/piton_git_push_master)](https://jenkins.princeton.edu/job/cloud/job/piton_git_push_master/)

OpenPiton is the world's first open source, general purpose, multithreaded manycore processor. It is a tiled manycore framework scalable from one to 1/2 billion cores. It is a 64-bit architecture using SPARC v9 ISA with a distributed directory-based cache coherence protocol across on-chip networks. It is highly configurable in both core and uncore components. OpenPiton has been verified in both ASIC and multiple Xilinx FPGA prototypes running full-stack Debian linux. We have released both the Verilog RTL code as well as synthesis and back-end flow. We believe OpenPiton is a great framework for researchers in computer architecture, OS, compilers, EDA, security and more.

OpenPiton has been published in ASPLOS 2016: Jonathan Balkind, Michael McKeown, Yaosheng Fu, Tri Nguyen, Yanqi Zhou, Alexey Lavrov, Mohammad Shahrad, Adi Fuchs, Samuel Payne, Xiaohua Liang, Matthew Matl, and David Wentzlaff. "OpenPiton: An Open Source Manycore Research Framework." In Proceedings of the 21st International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS '16), April 2016.

#### Find out more

- More information about OpenPiton is available at www.openpiton.org
- [Follow us on Twitter!](https://www.twitter.com/openpiton)
- Get help from others by joining our [Google Group](https://groups.google.com/group/openpiton)
- Keep up-to-date with the latest releases at the [OpenPiton Blog](https://openpiton-blog.princeton.edu)

If you use OpenPiton in your research please reference our ASPLOS 2016 paper mentioned above and send us a citation of your work.

#### Documentation

There are several detailed pieces of documentation about OpenPiton in the docs folder listed below:

- [OpenPiton Simulation Manual](http://parallel.princeton.edu/openpiton/docs/sim_man.pdf)
- [OpenPiton Microarchitecture Specification](http://parallel.princeton.edu/openpiton/docs/micro_arch.pdf)
- [OpenPiton FPGA Prototype Manual](http://parallel.princeton.edu/openpiton/docs/fpga_man.pdf)
- [OpenPiton Synthesis and Back-end Manual](http://parallel.princeton.edu/openpiton/docs/synbck_man.pdf)

We also host GitHub repositories for other parts of the project, including:

- [Piton Linux Kernel](https://github.com/PrincetonUniversity/piton-linux)
- [Piton Hypervisor](https://github.com/PrincetonUniversity/piton-sw)

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

> Note: if you would like to decrease the testbench monitor output to a minimum, append `-config_rtl=MINIMAL_MONITORING` to your build command in step 2. above.

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


#### Preliminary Support for Ariane RV64IMAC Core

![blockdiag](/docs/openpiton_ariane_blockdiag.png?raw=true)

This version of OpenPiton has preliminary support for the [64bit Ariane RISC-V processor](https://github.com/pulp-platform/ariane) from ETH Zurich.
To this end, Ariane has been equipped with a different L1 cache subsystem that follows a write-through protocol and that has support for cache invalidations and atomics.
This L1 cache system is designed to connect directly to the L1.5 cache provided by OpenPiton's P-Mesh.

Check out the sections below to see how to run the RISC-V tests or simple bare-metal C programs in simulation.

> Note that the system has only been tested with a 1x1 tile configuration. Verification of more advanced features such as cache coherency among multiple tiles is still a work-in-progress, although simple test programs do work in the manycore setting (see below).

> All RISC-V atomics except LR/SC are supported and tested.

> For simulation, Questasim 10.6b is needed (older versions might work, but have not been tested).

> You will need Vivado 2017.3 or newer to build an FPGA bitstream with Ariane.


##### Environment Setup

In addition to the OpenPiton setup described above, you have to adapt the paths in the `ariane_setup.sh` script to match with your installation (note that only Questasim is supported at the moment). Source this script from the OpenPiton root folder and build the RISC-V tools with `ariane_build_tools.sh` if you are running this for the first time:
1. ```cd $PITON_ROOT/```
2. ```source piton/ariane_setup.sh```
3. ```piton/ariane_build_tools.sh```

Step 3. will then download and compile the RISC-V toolchain and assembly tests for you.

> Note that the address map is different from the standard OpenPiton configuration. DRAM is mapped to `0x8000_0000`, hence the assembly tests and C programs are linked with this offset. Have a look at `piton/design/xilinx/genesys2/devices_ariane.xml` for a complete address mapping overview.

> Also note that we use a slightly adapted version of `syscalls.c`. Instead of using the RISC-V FESVR, we use the OpenPiton testbench monitors to observe whether a test has passed or not. Hence we added the corresponding pass/fail traps to the exit function in `syscalls.c`.

##### Running RISC-V Tests and Benchmarks

The RISC-V benchmarks are precompiled in the tool setup step mentioned above. You can run individual benchmarks by first building the simulation model with

1. ```cd $PITON_ROOT/build```
2. ```sims -sys=manycore -x_tiles=1 -y_tiles=1 -msm_build -ariane```

Then, invoke a specific riscv test with the `-precompiled` switch as follows

```sims -sys=manycore -msm_run -x_tiles=1 -y_tiles=1 rv64ui-p-addi.S -ariane -precompiled```

This will look for the precompiled ISA test binary named `rv64ui-p-addi` in the RISC-V tests folder `$ARIANE_ROOT/tmp/riscv-tests/build/isa` and run it.

In order to run a RISC-V benchmark, do

```sims -sys=manycore -msm_run -x_tiles=1 -y_tiles=1 dhrystone.riscv -ariane -precompiled```

The printf output will be directed to `fake_uart.log` in this case (in the build folder).

> Note: if you see the `Warning: [l15_adapter] return type 004 is not (yet) supported by l15 adapter.` warning in the simulation output, do not worry. This is only generated since Ariane does currently not support OpenPiton's packet-based interrupt packets arriving over the memory interface.



##### Running Custom Programs

You can also run test programs written in C. The following example program just prints 32 times "hello_world" to the fake UART (see `fake_uart.log` file).

1. ```cd $PITON_ROOT/build```
2. ```sims -sys=manycore -x_tiles=1 -y_tiles=1 -msm_build -ariane```
3. ```sims -sys=manycore -msm_run -x_tiles=1 -y_tiles=1 hello_world.c -ariane -rtl_timeout 10000000```

And a simple hello world program running on multiple tiles can run as follows:

1. ```cd $PITON_ROOT/build```
2. ```sims -sys=manycore -x_tiles=4 -y_tiles=4 -msm_build -ariane```
3. ```sims -sys=manycore -msm_run -x_tiles=4 -y_tiles=4  hello_world_many.c -ariane -finish_mask 0x1111111111111111 -rtl_timeout 1000000```

In the example above, we have a 4x4 Ariane tile configuration, where each core just prints its own hart ID (hardware thread ID) to the fake UART. Synchronization among the harts is achieved using an atomic ADD operation.

> Note that we have to adjust the finish mask in this case, since we expect all 16 cores to hit the pass/fail trap.

##### Regressions

The RISC-V ISA tests, benchmarks and some additonal simple example programs have been added to the regression suite of OpenPiton, and can be invoked as described below.

- RISC-V ISA tests are grouped into the following four batches, where the last two are the regressions for atomic memory operations (AMOs):

```sims -group=ariane_tile1_asm_tests_p -sim_type=msm```
```sims -group=ariane_tile1_asm_tests_v -sim_type=msm```
```sims -group=ariane_tile1_amo_tests_p -sim_type=msm```
```sims -group=ariane_tile1_amo_tests_v -sim_type=msm```

- RISC-V benchmarks can be run with:

```sims -group=ariane_tile1_benchmarks -sim_type=msm```

- Simple hello world programs and AMO tests for 1 tile can be invoked with

```sims -group=ariane_tile1_simple -sim_type=msm```

- And a multicore "hello world" example running on 16 tiles can be run with

```sims -group=ariane_tile16_simple -sim_type=msm```


If you would like to get an overview of the exit status of a regression batch, step into the regression subfolder and call `regreport . -summary`.


##### FPGA Mapping on Genesys2 Board

We currently have support for the Genesys2 board. Make sure you have Vivado 2017.3 or newer, and run the following command in order to build a bitstream with one Ariane tile,

```protosyn -b genesys2 -d system --core=ariane --uart-dmw ddr```

Once you have loaded the bitstream onto the FPGA using the Vivado Hardware Manager or a USB drive plugged into the Genesys2, you first need to connect the UART/USB port of the Genesys2 board to your computer and flip switch 7 on the board as described in the [OpenPiton FPGA Prototype Manual](http://parallel.princeton.edu/openpiton/docs/fpga_man.pdf). Then you can use pitonstream to run a list of tests on the FPGA:

```pitonstream -b genesys2 -d system -f ./tests.txt --core=ariane```

The tests that you would like to run need to be specified in the `test.txt` file, one test per line (e.g. `hello_world.c`).

##### Planned Improvements

The following items are currently under development and will be released soon.

- Thorough validation of cache coherence.

- RISC-V Compliant Debug. Debug support is included, but not fully tested, yet.

- RISC-V Compliant Interrupt Controllers. The CLINT and PLIC have been included, but are not fully tested yet.

- RISC-V FESVR support in simulation.

- Support for simulation with Synopsys VCS.

- Performance enhancements (cache re-parameterization, write-buffer throughput).

- Synthesis flow for large FPGAs.

- Floating point support.

- Automatic device tree generation for bootrom.

- Single-core and SMP Linux support.

Stay tuned!
