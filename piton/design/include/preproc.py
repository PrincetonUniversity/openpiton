#!/usr/bin/python3

import sys
import yaml
import pprint
import subprocess
import os

include_template = """CAPI=2:
name: __VLNV_TEMPLATE__
description: Top-level Piton generated includes

filesets:
    rtl:
        files:
            - define.tmp.h: {is_include_file: true}
        file_type: verilogSource

targets:
    default:
        filesets: [rtl]

"""


if __name__ == "__main__":
    print("preproc.py")
    print(sys.argv)
    # Parse YAML file
    with open(sys.argv[1], 'r') as yaml_fp:
        try:
            config = yaml.load(yaml_fp)
            pp = pprint.PrettyPrinter(indent=2)
            pp.pprint(config)
        except yaml.YAMLError as exc:
            print("Error in configuration file:", exc)

    cwd = config["files_root"]
    vlnv = config["vlnv"]

    # Run PyHP for each input/output pair
    cmd = "pyhp.py"
    io_pairs = config["parameters"]["process_me"]
    for in_f, out_f in io_pairs:
        full_out_f = out_f
        
        args = [in_f]
        print("input: {}, output: {}".format(in_f, full_out_f))
        with open(full_out_f, "w") as full_out_fp:
            try:
                subprocess.check_call([cmd] + args,
                                      cwd = cwd,
                                      stdin=subprocess.PIPE,
                                      stdout=full_out_fp)
            except subprocess.CalledProcessError:
                self.errormsg = '"{}" exited with an error code. See stderr for details.'
                raise RuntimeError(self.errormsg.format(str(self)))
        
        full_core_f = "piton_include_gen.core"
        with open(full_core_f, "w") as full_core_fp:
            replace_dict = {"__VLNV_TEMPLATE__" : vlnv}
            s = include_template
            for key, value in replace_dict.items():
                print(key, value)
                s = s.replace(key, value)
            full_core_fp.write(s)

