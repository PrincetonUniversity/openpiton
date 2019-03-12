#!/usr/bin/python
# Copyright (c) 2015 Princeton University
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


import sys, os, getopt
import getpass

def usage ():
    print "Usage: " + sys.argv[0] + " --name=<environment name> [options]"
    print "Options:"
    print "     --verbosity=<verbosity> Set the verbosity of the output."
    print "                             Essentially the amount of comments in the testbench output."
    print "                             0 is less, 1 is more."
    print "     --author=<author>       Set the author of this environment"

def parseCmdArgs ():
    name = None
    verbosity = None
    author = None

    try:
        opts, args = getopt.getopt (sys.argv[1:], "h", ["name=", "verbosity=", "author="])
    except getopt.GetoptError:
        usage ()
        sys.exit (2)

    for opt, arg in opts:
        if opt == "-h":
            usage ()
            sys.exit ()
        elif opt == "--name":
            name = arg
        elif opt == "--verbosity":
            verbosity = int (arg)
        elif opt == "--author":
            author = arg

    if (name == None) :
        print "You must specify an environment name."
        usage ()
        sys.exit (2)

    if (verbosity == None) :
        verbosity = 0

    return name, verbosity, author

def writeTestBenchTemplate (file, name, verbosity, author) :
    file.write ("/*\n")
    file.write (" * This is a test bench for the " + name + " module\n")
    file.write (" *\n")
    if (author == None) :
        file.write (" * Author: " + getpass.getuser() + "\n")
    else :
        file.write (" * Author: " + author + "\n")
    file.write (" */\n\n")
    
    file.write ("`include \"test_infrstrct.v\"\n\n")

    file.write ("`define VERBOSITY 0    // Can override from the command line\n\n")
    
    file.write ("// Testbench helper module\n")
    file.write ("module " + name + "_top_helper\n")
    file.write ("(\n")
    file.write ("    input       clk,\n")
    file.write ("    input       rst_n,\n")
    file.write ("    output reg  done\n")
    file.write (");\n\n")

    file.write ("    //\n")
    file.write ("    // Signal Declarations\n")
    file.write ("    //\n\n")

    file.write ("    // TODO: Fill in SRC_BIT_WIDTH with the sum of all\n")
    file.write ("    //       DUT input widths excluding clk and rst_n\n")
    file.write ("    wire [SRC_BIT_WIDTH-1:0]    src_bits;\n")
    file.write ("    wire                        src_val;\n")
    file.write ("    wire                        src_done;\n\n")

    file.write ("    // TODO: Fill in SINK_BIT_WIDTH with the sum of all\n")
    file.write ("    //       DUT output widths\n")
    file.write ("    wire [SINK_BIT_WIDTH-1:0]   sink_bits;\n")
    file.write ("    wire                        sink_rdy;\n")
    file.write ("    wire                        sink_done;\n\n")

    file.write ("    //\n")
    file.write ("    // Combinational Logic\n")
    file.write ("    //\n\n")

    file.write ("    always @ *\n")
    file.write ("        done = src_done & sink_done;\n\n")

    file.write ("    //\n")
    file.write ("    // Module Instantiations\n")
    file.write ("    //\n\n")

    file.write ("    // Source module\n")
    file.write ("    // TODO: Fill in SRC_BIT_WIDTH with the sum of all\n")
    file.write ("    //       DUT input widths excluding clk and rst_n\n")
    file.write ("    // TODO: Fill in SRC_ENTRIES with the maximum number\n")
    file.write ("    //       of test vectors one of your test cases will have\n")
    file.write ("    // TODO: Fill in SRC_LOG2_ENTRIES with the base 2 log of\n")
    file.write ("    //       SRC_ENTRIES\n")
    file.write ("    test_source\n")
    file.write ("    #(\n")
    file.write ("        .BIT_WIDTH (SRC_BIT_WIDTH),\n")
    file.write ("        .ENTRIES (SRC_ENTRIES),\n")
    file.write ("        .LOG2_ENTRIES (SRC_LOG2_ENTRIES)\n")
    file.write ("    ) src\n")
    file.write ("    (\n")
    file.write ("        .clk (clk),\n")
    file.write ("        .rst_n (rst_n),\n")
    file.write ("        .rdy (rst_n), // TODO: If your DUT has a val/rdy interface hook it up here\n")
    file.write ("        .bits (src_bits),\n")
    file.write ("        .val (src_val), // TODO: if your DUT as a val/rdy interface hook it up here\n")
    file.write ("        .done (src_done)\n")
    file.write ("    );\n\n")

    file.write ("    // Design under test (DUT)\n")
    file.write ("    // TODO: change module name if this is not the correct one\n")
    file.write ("    " + name + " dut\n")
    file.write ("    (\n")
    file.write ("        .clk (clk),\n")
    file.write ("        .rst_n (rst_n),\n")
    file.write ("        // TODO: Fill in your DUT inputs and outputs here,\n")
    file.write ("        //       with the src_bits feeding your inputs and\n")
    file.write ("        //       the sink_bits connected to your outputs.\n")
    file.write ("        //       Below is an example.\n")
    file.write ("        .input0 (src_bits[15:0]),\n")
    file.write ("        .input1 (src_bits[16]),\n")
    file.write ("        .input2 (src_bits[17]),\n")
    file.write ("        .output0 (sink_bits[15:0]),\n")
    file.write ("        .output1 (sink_bits[16])\n")
    file.write ("    );\n\n")

    file.write ("    // Sink module\n")
    file.write ("    // TODO: Fill in SINK_BIT_WIDTH with the sum of all\n")
    file.write ("    //       DUT output widths\n")
    file.write ("    // TODO: Fill in SINK_ENTRIES with the maximum number \n")
    file.write ("    //       of monitor vectors one of your test cases will have\n")
    file.write ("    // TODO: Fill in SINK_LOG2_ENTRIES with the base 2 of\n")
    file.write ("    //       SINK_ENTRIES\n")
    file.write ("    test_sink\n")
    file.write ("    #(\n")
    file.write ("        .VERBOSITY (`VERBOSITY),\n")
    file.write ("        .BIT_WIDTH (SINK_BIT_WIDTH),\n")
    file.write ("        .ENTRIES (SINK_ENTRIES),\n")
    file.write ("        .LOG2_ENTRIES (SINK_LOG2_ENTRIES)\n")
    file.write ("    ) sink\n")
    file.write ("    (\n")
    file.write ("        .clk (clk),\n")
    file.write ("        .rst_n (rst_n),\n")
    file.write ("        .bits (sink_bits),\n")
    file.write ("        .val (rst_n), // TODO: If your DUT has a val/rdy interface hook it up here\n")
    file.write ("        .rdy (sink_rdy), // TODO: If your DUT as a val/rdy interface hook it up here\n")
    file.write ("        .out_data_popped (),\n")
    file.write ("        .done (sink_done)\n")
    file.write ("    );\n\n")

    file.write ("    // Initialize source and sink random delay values\n")
    file.write ("    initial\n")
    file.write ("    begin\n")
    file.write ("        src.RANDOM_DELAY = 0;\n")
    file.write ("        sink.RANDOM_DELAY = 0;\n")
    file.write ("    end\n\n")

    file.write ("endmodule\n\n")

    file.write ("// Top-level testbench module\n")
    file.write ("module " + name + "_top;\n\n")
    
    file.write ("    `TEST_INFRSTRCT_BEGIN(\"" + name + "\")\n\n")

    file.write ("    wire done;\n")
    file.write ("    integer i;\n\n")

    file.write ("    " + name + "_top_helper helper\n")
    file.write ("    (\n")
    file.write ("        .clk (clk),\n")
    file.write ("        .rst_n (rst_n),\n")
    file.write ("        .done (done)\n")
    file.write ("    );\n\n")

    file.write ("    // TODO: Replace \"" + name + "_test1\" with a\n")
    file.write ("    //       descriptive name for this test case.\n")
    file.write ("    //       The first argument to this macro is the \n");
    file.write ("    //       test case number.  This should begin at 1\n");
    file.write ("    //       and increment for subsequent test cases\n");
    file.write ("    `TEST_CASE_BEGIN(1, \"" + name + "_test1\")\n")
    file.write ("    begin\n\n")
    
    if not verbosity :
        file.write ("        // TODO: Setup the test case here.\n\n")
    else :
        file.write ("        // TODO: This is where you setup the test case.\n")
        file.write ("        //       There are a few things you may want to do here:\n")
        file.write ("        //           - Set the RANDOM_DELAY value of the src and sink.\n")
        file.write ("        //             This controls whether a random delay is inserted\n")
        file.write ("        //             between applying signals (src) or checking the\n")
        file.write ("        //             outputs (sink).  Note that if your DUT does not\n")
        file.write ("        //             implement a val/rdy interface that is hooked up to\n")
        file.write ("        //             to the src and sink, the previous value before the\n")
        file.write ("        //             random delay will still be applied/checked since your\n")
        file.write ("        //             DUT has no way of telling/conveying whether the values\n")
        file.write ("        //             being applied/checked are valid.  Set these values to\n")
        file.write ("        //             0 if you do not want a random delay.  They are set by\n")
        file.write ("        //             default to 0.  If you do plan to use these, know that\n")
        file.write ("        //             the values you set will carry over to the next test\n")
        file.write ("        //             case, so you may need to reset them back to 0 or to\n")
        file.write ("        //             a new value if you do not want them to be the same.\n")
        file.write ("        //             Below is an example of setting the random delay to 15\n")
        file.write ("        //             for both the src and sink:\n")
        file.write ("        //\n")
        file.write ("        //                     helper.src.RANDOM_DELAY = 15;\n")
        file.write ("        //                     helper.sink.RANDOM_DELAY = 15;\n")
        file.write ("        //\n")
        file.write ("        //           - Read values from a .vmh file into the src and sink memories.\n")
        file.write ("        //             This allows you to write your test cases in the form of .vmh\n")
        file.write ("        //             and keep them separate from the test bench.  Thus, you will \n")
        file.write ("        //             not need to recompile when you change the test vectors in a\n")
        file.write ("        //             test case.  You could also use the Verilog plusargs system\n")
        file.write ("        //             function to convey which test to run from the command line.\n")
        file.write ("        //             Below is an example of reading test case vectors from\n")
        file.write ("        //             statically configured .vmh files into the src and sink memories:\n")
        file.write ("        //\n")
        file.write ("        //                     $readmemb({test_cases_path, \"test1_src.vmh\"}, helper.src.m_f);\n")
        file.write ("        //                     $readmemb({test_cases_path, \"test1_sink.vmh\"}, helper.sink.m_f);\n")
        file.write ("        //\n")
        file.write ("        //             Note that the variable test_cases_path is set by the `TEST_INFRSTRCT_BEGIN\n")
        file.write ("        //             macro and is read from the command line.  The command line variable is always\n")
        file.write ("        //             set via the $DV_ROOT/tools/src/sims/" + name + ".config file, so you do not\n")
        file.write ("        //             need to worry about it.  It points to the absolute path to your test cases\n")
        file.write ("        //             which is by default set to the test_cases directory in the environment\n")
        file.write ("        //             directory.\n")
        file.write ("        //\n")
        file.write ("        //             Also note that readmemb expects the test vectors to be specified in binary\n")
        file.write ("        //             in the .vmh file, while you can use readmemh if you prefer to write your\n")
        file.write ("        //             .vmh files in hexadecimal.\n")
        file.write ("        //\n")
        file.write ("        //             Below is an example of how you might read the test case specified at the\n")
        file.write ("        //             command line and initialize the src and sink memories based on that:\n")
        file.write ("        //\n")
        file.write ("        //                     $value$plusargs(\"test_case=%s\", test_case);\n")
        file.write ("        //                     $readmemb({test_cases_path, test_case, \"_src.vmh\"}, helper.src.m_f);\n")
        file.write ("        //                     $readmemb({test_cases_path, test_case, \"_sink.vmh\"}, helper.sink.m_f);\n")
        file.write ("        //\n")
        file.write ("        //             Note you will need to declare the variable test_case above, as this\n")
        file.write ("        //             is inside of an always @ * block, where you cannot declare variables.\n")
        file.write ("        //             The test_case variable should be declared as reg like this:\n")
        file.write ("        //\n")
        file.write ("        //                     reg [64*8:1] test_case;  // Max 64 characters\n")
        file.write ("        //\n")
        file.write ("        //             You can specify the test_case variable at the command line of the compiled\n")
        file.write ("        //             simv file for this test bench using the plus arguments, i.e. +test_case=test1.\n")
        file.write ("        //             You can also specify this at the command line of the sims script used to run\n")
        file.write ("        //             the simulations with the sim_run_args switch, i.e. -sim_run_args=+test_case=test1.\n")
        file.write ("        //\n")
        file.write ("        //             For more info on Verilog plusargs, visit: http://www.project-veripage.com/plusarg.php\n")
        file.write ("        //\n")
        file.write ("        //           - Initialize the src and sink memories from Verilog.  This option is\n")
        file.write ("        //             generally good if the test case is rather simple and the memories\n")
        file.write ("        //             can easily be initialized from Verilog. Below is an example of initializing\n")
        file.write ("        //             the memories with random values and may be used for a DUT which just passes\n")
        file.write ("        //             values through, such as a flow-controlled network link:\n")
        file.write ("        //\n")
        file.write ("        //                     for (i = 0; i < helper.src.ENTRIES; i = i + 1)\n")
        file.write ("        //                     begin\n")
        file.write ("        //                         helper.src.m_f[i] = $random;\n")
        file.write ("        //                         helper.sink.m_f[i] = helper.src.m_f[i];\n")
        file.write ("        //                     end\n\n")

    file.write ("        // Apply reset signal\n")
    file.write ("        `TEST_CASE_RESET\n\n")

    file.write ("        // Do a timeout check in case DUT stalls\n");
    file.write ("        // TODO: Ensure the timeout delay is set appropriately for this test case.\n")       
    file.write ("        //       If the value is too small, the test case will always fail because\n")
    file.write ("        //       the source and sink were not able to traverse their memories before\n")
    file.write ("        //       timeout.  If this value is too large, it may affect simulation time\n")
    file.write ("        #100000 `TEST_CHECK(\"Timeout check\", done, `VERBOSITY)\n\n")

    file.write ("        // Reset memories to all x so the next test has fresh memories\n")
    file.write ("        for (i = 0; i < helper.src.ENTRIES; i = i + 1)\n")
    file.write ("            helper.src.m_f[i] = {helper.src.BIT_WIDTH{1'bx}};\n")
    file.write ("        for (i = 0; i < helper.sink.ENTRIES; i = i + 1)\n")
    file.write ("            helper.sink.m_f[i] = {helper.sink.BIT_WIDTH{1'bx}};\n\n")

    file.write ("    end\n")
    file.write ("    `TEST_CASE_END\n\n")

    file.write ("    // TODO: Add additional test cases here.  Be sure to increment\n")
    file.write ("    //       the test number and change the name\n\n")

    file.write ("    // TODO: Replace NUM_TEST_CASES with the number of test cases in this testbench\n")
    file.write ("    `TEST_INFRSTRCT_END(NUM_TEST_CASES)\n\n")

    file.write ("endmodule");

def writeFlistFile (file, name) :
    file.write ("// Flist for " + name + " testbench environment\n\n")
    file.write (name + "_top.v")

def writeTemplateSrcVmh (file, name) :
    file.write ("/*\n")
    file.write (" * " + name + " test case TEMPLATE (TODO: Replace) source bits file.\n")
    file.write (" * Provides stimuli to the module.\n")
    file.write (" *\n")
    file.write (" * TODO: Set these format bits for your DUT\n")
    file.write (" * Format of bits:\n")
    file.write (" *      * 0 - 15: lfsr_seed\n")
    file.write (" *      * 16: lfsr_ld\n")
    file.write (" *      * 17: lfsr_step\n")
    file.write (" */\n")
    file.write ("01_0000_0000_0000_0001         // Can put comments here to explain test case")

def writeTemplateSinkVmh (file, name) :
    file.write ("/*\n")
    file.write (" * " + name + " test case TEMPLATE (TODO: Replace) sink bits file.\n")
    file.write (" * Provides the bits for the sink to check against.\n")
    file.write (" *\n")
    file.write (" * TODO: Set these format bits for your DUT\n")
    file.write (" * Format of bits:\n")
    file.write (" *      * 0 - 15: lfsr_state_f\n")
    file.write (" *      * 16: lfsr_out_f\n")
    file.write (" */\n")
    file.write ("0_0000_0000_0000_0000         // Can put comments here to explain test case") 

def writeConfigFile (file, name) :
    file.write ("// Tesbench configuration file for the " + name + " environment\n\n")

    file.write ("<" + name + ">\n")
    file.write ("    -model=" + name + "\n")
    file.write ("    // TODO: Specify top level module(s) to be simulated\n")
    file.write ("    -toplevel=" + name + "_top\n")
    file.write ("    -novera_build\n")
    file.write ("    -novera_run\n")
    file.write ("    // TODO: Change the flist file for the DUT which specifies all\n")
    file.write ("    //       the source files for your DUT if it is not correct.\n")
    file.write ("    -flist=$DV_ROOT/design/" + name + "/rtl/Flist." + name + "\n")
    file.write ("    // TODO: Add flist files for any other modules your DUT depends on.\n")
    file.write ("    //       For example:\n")
    file.write ("    //\n")
    file.write ("    //               -flist=$DV_ROOT/design/common/rtl/Flist.clib_common\n")
    file.write ("    -flist=$DV_ROOT/verif/env/" + name + "/" + name + ".flist\n")
    file.write ("    -flist=$DV_ROOT/verif/env/test_infrstrct/test_infrstrct_include.flist\n")
    file.write ("    -env_base=$DV_ROOT/verif/env/" + name + "\n")
    file.write ("    -vcs_build_args=+incdir+$DV_ROOT/verif/env/test_infrstrct/\n")
    file.write ("    -vcs_build_args=+notimingcheck\n")
    file.write ("    -vcs_build_args=+nospecify\n")
    file.write ("    -vcs_build_args=+nbaopt\n")
    file.write ("    -vcs_build_args=-Xstrict=1 -notice\n")
    file.write ("    -vcs_build_args=-e SimvMain $DV_ROOT/verif/env/iss/pli/main.cc\n")
    file.write ("    -sim_run_args=+test_cases_path=$DV_ROOT/verif/env/" + name + "/test_cases/\n")
    file.write ("</" + name + ">")

def writePlatConfigFile (file, name) :
    file.write ("    -vcs_build_args=-V -lm -lc\n")
    file.write ("    -vcs_build_args=-lnsl\n")

def main ():
    name, verbosity, author = parseCmdArgs ()

    # Get the location of DV_ROOT
    if not "DV_ROOT" in os.environ :
        print "DV_ROOT environment variable is not defined"
        sys.exit (2)
    dvRoot = os.environ['DV_ROOT'] + "/"

    # Get locations of environments and sims src
    envDir = dvRoot + "verif/env/"
    simsSrcDir = dvRoot + "tools/src/sims/"

    # Check if an environment already exists with this name
    if os.path.isdir(envDir + name) or os.path.exists(simsSrcDir + name + ".config") :
        print "Environment with specified name ('" + name + "') already exists."
        sys.exit (2)

    # Make directory for this environment
    os.mkdir (envDir + name)

    # Make directory for test cases
    os.mkdir (envDir + name + "/test_cases")

    # Generate test bench file
    testBenchFile = open (envDir + name + "/" + name + "_top.v", "w")
    writeTestBenchTemplate (testBenchFile, name, verbosity, author)
    testBenchFile.close ()

    # Generate flist file
    flistFile = open (envDir + name + "/" + name + ".flist", "w")
    writeFlistFile (flistFile, name)
    flistFile.close ()

    # Generate template .vmh files
    templateSrcVmh = open (envDir + name + "/test_cases/" + "test_template_src.vmh", "w")
    writeTemplateSrcVmh (templateSrcVmh, name)
    templateSrcVmh.close ()
    templateSinkVmh = open (envDir + name + "/test_cases/" + "test_template_sink.vmh", "w")
    writeTemplateSinkVmh (templateSinkVmh, name)
    templateSinkVmh.close ()

    # Generate config file
    configFile = open (simsSrcDir + name + ".config", "w")
    writeConfigFile (configFile, name)
    configFile.close ()

    # Generate platform config file
    platConfigFile = open (simsSrcDir + name + ".Linux.x86_64", "w")
    writePlatConfigFile (platConfigFile, name)
    platConfigFile.close ()

    # Include config file in main sims config file
    simsConfigFile = open (simsSrcDir + "sims.config", "a")
    simsConfigFile.write ("#include \"" + name + ".config\"\n")
    simsConfigFile.close ()

if __name__ == "__main__" :
    main()
