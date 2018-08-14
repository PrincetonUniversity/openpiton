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

import os, re, sys
from gen_signals import DmbrConf
RUN_NUM = 1

def setDmbrConf(conf, run_num):
	prev_dir = os.getcwd()
	os.chdir("../../../diag/assembly/princeton/")
	fin = open("dmbr_stream_hyper_base.s", "r")
	fout = open("dmbr_stream_hyper_gen.s", "w")
	cont = fin.read()
	# substitution
	for i in range(conf.bin_num):
		cont = re.sub(r'(#define\s+TEST_CRED_BIN_%d\s+)(\d+)' % i, r'\g<1>%d' % conf.bin_cred_list[i], cont)	
	cont = re.sub(r'(#define\s+TEST_BIN_SCALE\s+)(\d+)', r'\g<1>%d' % conf.bin_scale, cont)	
	cont = re.sub(r'(#define\s+TEST_REPL_INTERVAL\s+)(\d+)', r'\g<1>%d' % conf.repl_time, cont)
	cont = re.sub(r'(#define\s+TEST_EXPECTED_INTERV_AVG\s+)(\d+)', r'\g<1>%d' % conf.exp_interv, cont)

	print >> fout, cont
	fin.close()
	fout.close()
	os.system('cp dmbr_stream_hyper_gen.s dmbr_assembly.s')
	os.chdir(prev_dir)

def runTest(log_file, conf):
	prev_dir = os.getcwd()
	os.chdir('vcs_assembly_work')
	comp_cmd = "sims -sys=manycore -x_tiles=1 -y_tiles=1 -vcs_build -build_id=lavrov_test"
	run_cmd = "sims -sys=manycore -vcs_run -rtl_timeout=50000 -build_id=lavrov_test -dmbr dmbr_stream_hyper_gen.s"
	#os.system(comp_cmd)
	os.system(run_cmd)
	sim_log_file = open("sims.log", "r")
	content = sim_log_file.read()
	m = re.search("HIT GOOD TRAP", content)
	if m == None:
		print >> log_file, "\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		print >> log_file, " Real inter-arrival time is less than 0.9 * EXPECTED"
		print >> log_file, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	else:
		print >> log_file, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		print >> log_file, "Difference between expected and real inter-arrival time"
		print >> log_file, "is less than 10 %"
		print >> log_file, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	conf.printConf(log_file)
	os.chdir(prev_dir)

def main():
	# print 'Hello LEHA!!'
	log_file = open("assembly.log", "w")
	for i in range(RUN_NUM):
		dmbr_conf = DmbrConf(isdefault=False)
		setDmbrConf(dmbr_conf, i)
		# runTest(log_file, dmbr_conf)
	log_file.close()

if __name__ == '__main__':
	main()

