#!/usr/bin/python3
# Copyright (c) 2019 Princeton University
# All rights reserved.

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

import sys
import yaml
import pprint
import subprocess
import os

include_core_template = """CAPI=2:
name: __VLNV_TEMPLATE__
description: Top-level Piton generated includes

filesets:
    rtl:
        files:
__RTL_FILES_TEMPLATE__
        file_type: verilogSource

targets:
    default:
        filesets: [rtl]

"""
rtl_file_template_h_file = """            - __RTL_FILE_TEMPLATE__: {is_include_file: true}
"""
rtl_file_template_v_file = """            - __RTL_FILE_TEMPLATE__
"""


if __name__ == "__main__":
    # Parse YAML file
    with open(sys.argv[1], 'r') as yaml_fp:
        try:
            config = yaml.load(yaml_fp)
        except yaml.YAMLError as exc:
            print("Error in configuration file:", exc)

    cwd = config["files_root"]
    vlnv = config["vlnv"]

    # Run PyHP for each input/output pair 
    cmd = "pyhp.py"
    io_pairs = config["parameters"]["process_me"]
    rtl_files = ""
    for in_f, out_f in io_pairs:
        full_out_f = out_f
        
        args = [in_f]
        #print("input: {}, output: {}".format(in_f, full_out_f))
        with open(full_out_f, "w") as full_out_fp:
            try:
                subprocess.check_call([cmd] + args,
                                      cwd = cwd,
                                      stdin=subprocess.PIPE,
                                      stdout=full_out_fp)
            except subprocess.CalledProcessError:
                self.errormsg = '"{}" exited with an error code. See stderr for details.'
                raise RuntimeError(self.errormsg.format(str(self)))
        
        # 
        if out_f[-1] == "h": # Header file
            rtl_files += rtl_file_template_h_file.replace("__RTL_FILE_TEMPLATE__", out_f)
        elif out_f[-1] == "v": # Verilog file
            rtl_files += rtl_file_template_v_file.replace("__RTL_FILE_TEMPLATE__", out_f)
        else:
            print("Error: {}".format(out_f))
            assert(0)

    # Create core file based on input and template
    replace_dict = {"__VLNV_TEMPLATE__" : vlnv,
                    "__RTL_FILES_TEMPLATE__": rtl_files}
    s = include_core_template
    for key, value in replace_dict.items():
        #print(key, value)
        s = s.replace(key, value)

    # Write core file
    new_core_file_name = vlnv.split(':')[2]
    full_core_f = new_core_file_name+".core"
    with open(full_core_f, "w") as full_core_fp:
        full_core_fp.write(s)

