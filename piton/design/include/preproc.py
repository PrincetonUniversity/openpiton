#!/usr/bin/python3

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
    #print("preproc.py")
    #print(sys.argv)
    # Parse YAML file
    with open(sys.argv[1], 'r') as yaml_fp:
        try:
            config = yaml.load(yaml_fp)
            #pp = pprint.PrettyPrinter(indent=2)
            #pp.pprint(config)
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
        if out_f[-1] == "h":
            rtl_files += rtl_file_template_h_file.replace("__RTL_FILE_TEMPLATE__", out_f)
        elif out_f[-1] == "v":
            rtl_files += rtl_file_template_v_file.replace("__RTL_FILE_TEMPLATE__", out_f)
        else:
            print("Error: {}".format(out_f))
            assert(0)

    #print("rtl_files:" + rtl_files)
    replace_dict = {"__VLNV_TEMPLATE__" : vlnv,
                    "__RTL_FILES_TEMPLATE__": rtl_files}
    s = include_core_template
    for key, value in replace_dict.items():
        #print(key, value)
        s = s.replace(key, value)

    new_core_file_name = vlnv.split(':')[2]
    full_core_f = new_core_file_name+".core"
    with open(full_core_f, "w") as full_core_fp:
        full_core_fp.write(s)

