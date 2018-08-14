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

# -*- coding: iso-8859-1 -*-
import random, sys, os, re, copy
import subprocess

TAG_WIDTH = 4
MAX_TAG = 2**4
DEBUG = True
SRC_WIDTH = 1 + 1 + 4 + 1 + 1 + 4
SINK_WIDTH = 1
INIT_DELAY = 2
TEST_NUMBER = 1
REPL_WIDTH = 12
MAX_REPL = 2**REPL_WIDTH - 1
RUN_AUTOTEST = True
FAILED_NUM = 0
MAX_SEED = 2**64
GIVEN_SEED = False
GLOBAL_SEED = 8009695215885370494
# 8009695215885370494 - failed if add a credit after replenishment
# 5814297448342363655 - failed if we DO NOT add a credit
# 15745218250188573024, 13255105679087963479, 15249831481881330638, 17854957273109901710


class DmbrConf(object):
    def __init__(self, isdefault):
        self.bin_num = 10
        self.bin_max_cred = 63
        self.repl_time = 0
        if isdefault:
            self.bin_scale = 4
            self.bin_cred_list = [63,63,63,63,63,63,63,63,63,63]#[2,1,2,2,3,4,5,6,7,8]
        else:
            self.bin_scale = random.randint(1,5) # TODO: reasonable?
            self.bin_cred_list = [random.randint(0,self.bin_max_cred) for i in range(self.bin_num)]
        self.bin_time_list = [i << self.bin_scale for i in range(self.bin_num)]
        for i in range(self.bin_num):
            self.repl_time += self.bin_time_list[i] * self.bin_cred_list[i]
        if not isdefault:
            mult = random.randint(1,5)
            tmp_res = self.repl_time * mult
            if tmp_res > MAX_REPL:
                self.repl_time = MAX_REPL
            else:
                self.repl_time = tmp_res
        # expected average inter-arrival time
        self.exp_interv = float(self.repl_time)/sum(self.bin_cred_list)

    def printConf(self, stream=sys.stderr):
        print >> stream, "Bin configuration:"
        for i in range(len(self.bin_cred_list)):
            print >> stream, "bin%2d: cred: %d , time: %d" % (i, self.bin_cred_list[i], self.bin_time_list[i])
        print >> stream, "Scale: %d" % self.bin_scale
        print >> stream, "Replenish time: %d" % self.repl_time
        print >> stream, "Expected average inter-arrival time: %d" % self.exp_interv

class RunConf(object):
    def __init__(self, dmbr_conf):
        i = 64
        while (dmbr_conf.repl_time * i > 999999):
            i -= 1
        self.max_sim_cycles = dmbr_conf.repl_time * i # TODO: increase?

class DmbrEnvConf(object):
    def __init__(self, dmbr_conf):
        self.max_interval = 10*(2**dmbr_conf.bin_scale) + 5

class Dmbr(object):
    def __init__(self, conf):
        self.conf = conf
        self.bin_time_list = copy.deepcopy(conf.bin_time_list)
        self.bin_scale = self.conf.bin_scale
        self.base_bin_conf = copy.deepcopy(conf.bin_cred_list)
        self.bin_credits_list = copy.deepcopy(conf.bin_cred_list)
        self.repl_time = self.conf.repl_time
        self.interval = 0
        self.bin_width = 1 << (self.conf.bin_scale - 1)
        self.prev_req_time = -2 #TODO: dirty hack?
        self.stall_cnt = 0
        self.stall_out = 0
        self.was_req_under_stall = False
        self.tag_bin_dict = dict()
        self.tag_interval_dict = dict()
        self.tag_no_bin_dict = dict()
        self.additional_interv = 0
        self.repl_cnt = 1 # TODO: hack for the beginning
        self.total_stall_cnt = 0
        self.total_l1_req_cnt = 0

    def makeCycle(self, log_file, cycle, l1_val, l1_tag, l2_resp_val, l2_miss_val, l2_resp_tag):
        bin_hit_num = None
        if l1_val == 1:
            self.total_l1_req_cnt += 1
            # if (l2_resp_val == 1) and (l2_miss_val == 0): # if was hit in L2,
            #   self.additional_interv += self.tag_interval_dict[l2_resp_tag]
            self.interval += cycle - self.prev_req_time - 1 + self.additional_interv
            self.prev_req_time = cycle
            if DEBUG:
                print >> log_file, "--->  request from L1, tag=%d" % l1_tag
                self.printBinCredits(log_file)
                print >> log_file, "inter-arrival time: %d" % self.interval
                print >> log_file, "add_counter: %d" % self.additional_interv

            if sum(self.bin_credits_list) == 0:
                print >> log_file, "request without subtraction!"
                self.was_req_under_stall = True
                if self.repl_cnt == self.conf.repl_time:                
                    self.stall_cnt = 0
                else:
                    self.stall_cnt = 1


            found_credit = False
            i = self.conf.bin_num - 1
            while (i >= 0):
                if found_credit:
                    break
                bin_time = self.bin_time_list[i]
                bin_credits = self.bin_credits_list[i]
                if (self.interval >= bin_time) and (bin_credits > 0):
                    bin_hit_num = i
                    self.bin_credits_list[i] -= 1
                    found_credit = True
                i -= 1

            if DEBUG:
                if found_credit:
                    print >> log_file, "Found credit in bin %d" % bin_hit_num
                else:
                    print >> log_file, "Not found a credit!"

            if not found_credit:
                i = 0
                while i < self.conf.bin_num:
                    bin_time = self.bin_time_list[i]
                    bin_credits = self.bin_credits_list[i]
                    if (self.interval < bin_time) and (bin_credits > 0):
                        bin_hit_num = i
                        self.bin_credits_list[i] -= 1
                        self.stall_cnt = bin_time - self.interval
                        if DEBUG:
                            print >> log_file, "Stall for %d cycles" % self.stall_cnt
                        break
                    i += 1

            if not self.was_req_under_stall:
                self.tag_bin_dict[l1_tag] = bin_hit_num
                self.tag_interval_dict[l1_tag] = self.interval
                self.tag_no_bin_dict[l1_tag] = False
            else:
                self.tag_no_bin_dict[l1_tag] = True

            self.interval = 0
            self.additional_interv = 0



        # TODO: isn't specified except in Verilog
        # if (l1_val == 1) and (sum(self.bin_credits_list) == 0):
        #   self.was_req_under_stall = True
        #   self.stall_cnt = 1
        repl_this_cycle = self.repl_cnt == self.conf.repl_time
        if repl_this_cycle: # TODO hack?
            self.repl_cnt = 0
            for i in range(self.conf.bin_num):
                self.bin_credits_list[i] = self.base_bin_conf[i]
            self.was_req_under_stall = False
            # self.stall_cnt = 0
        else:
            self.repl_cnt += 1

        print >> log_file, "repl_cnt: %d" % self.repl_cnt

        if self.stall_out == 1:
            self.total_stall_cnt += 1

        if self.was_req_under_stall: # don't stall an extra cycle in case of replenishment
            if self.repl_cnt == 0:
                self.stall_cnt = 0
            else:            
                self.stall_cnt = 1

        if self.stall_cnt > 0:
            self.stall_out = 1
            self.stall_cnt -= 1
        else:
            self.stall_out = 0

        #################################################
        #################################################
        # end of interaction between L1 and DMBR
        #################################################
        #################################################
        if (l2_resp_val == 1):
            if DEBUG:
                print >> log_file, "--->  response from L2, tag=%d" % l2_resp_tag
                print >> log_file, "      missed in L2: %d" % l2_miss_val
            if l2_miss_val == 0:
                if not self.tag_no_bin_dict[l2_resp_tag]:
                    bin_num = self.tag_bin_dict[l2_resp_tag]
                    if (self.bin_credits_list[bin_num] < self.conf.bin_max_cred) and not ((l1_val == 1) and (bin_hit_num == bin_num) and repl_this_cycle):
                        self.bin_credits_list[bin_num] += 1
                        if DEBUG:
                            print >> log_file, "      returned a credit to bin %d" % bin_num
                    #if l1_val == 0:    # if a request from L1 and a response from L2 are simultaneous, add_interval was counted above
                self.additional_interv += self.tag_interval_dict[l2_resp_tag] # always increase add counter, if if for a request under stall




        return self.stall_out

    def printBinCredits(self, log_file):
        print >> log_file, "Credits in bins:"
        print >> log_file, self.bin_credits_list

    def printBinMargins(self, stream=sys.stderr):
        for i in range(self.conf.bin_num):
            print >> stream, "bin%2d" % i,
            print >> stream, "[ %3d, %3d )" % (i << self.bin_scale, (i+1) << self.bin_scale),
            print >> stream, "- %3d" % ((i + 1 ) << self.bin_scale)

    def getExpInterv(self):
	    return self.conf.exp_interv

class DmbrEnv(object):
    def __init__(self, conf):
        self.conf = conf
        self.l1_tag_list = [i for i in range(MAX_TAG)]
        self.l1_try_req = False
        self.l1_req_delay = 5
        self.l2_tag_dict = dict()

    def makeCycle(self, log_file, cycle_num, stall):
        self.l1_try_req = (self.l1_req_delay == 0) or self.l1_try_req # TODO: randomize
        if self.l1_req_delay == 0:
            self.l1_req_delay = random.randint(0,self.conf.max_interval)  # TODO: add 0
        else:
            self.l1_req_delay -= 1

        if self.l1_try_req and not stall and (len(self.l1_tag_list) > 0):
            l1_val = 1
            self.l1_try_req = False
            l1_tag = random.choice(self.l1_tag_list)
            self.l1_tag_list.remove(l1_tag)
            if l1_tag in self.l2_tag_dict.keys():
                raise "Duplication of tag %d" % l1_tag
                exit(2)
            self.l2_tag_dict[l1_tag] = random.randint(2,100) # TODO: min resp int from L2 ???
        else:
            l1_val = 0
            l1_tag = 0

        if DEBUG:
            print >> log_file, "waiting for a response in L2:",
            print >> log_file, self.l2_tag_dict

        was_l2_ans = False
        for key in self.l2_tag_dict.keys():
            if self.l2_tag_dict[key] <= 0:
                l2_val = 1
                l2_tag = key
                self.l2_tag_dict.pop(l2_tag)
                self.l1_tag_list.append(l2_tag)
                l2_miss_val = random.choice([0,1,1,1])
                was_l2_ans = True
                break

        for key in self.l2_tag_dict.keys():
            self.l2_tag_dict[key] -= 1

        if not was_l2_ans:
            l2_val = 0
            l2_tag = 0
            l2_miss_val = 0


        return (l1_val, l1_tag, l2_val, l2_tag, l2_miss_val)

def binFill(val, binwidth):
    bin_val = bin(val)[2:]
    l = len(bin_val)
    if l >= binwidth:
        return bin_val[:binwidth]
    else:
        return (binwidth - l)*'0' + bin_val

def binWidth(val):
    i = 0
    if val == 1:
        return 1
    while 2**i < val:
        i += 1
    return i

def setTopParams(dmbr_conf, run_conf):
    prev_dir = os.getcwd()
    os.chdir("..")
    fin = open("dmbr_test_top_base.v", "r")
    fout = open("dmbr_test_top.v", "w")
    cont = fin.read()
    cont = re.sub(r'.binScaleIn.*\(.*\)', '.binScaleIn (%d)' % dmbr_conf.bin_scale, cont)
    cont = re.sub(r'.replenishCyclesIn.*\(.*\)', '.replenishCyclesIn (%d)' % dmbr_conf.repl_time, cont)
    cont = re.sub(r'(localparam\s+SRC_ENTRIES\s+=\s*)\d+;', r'\g<1>%d;' % run_conf.max_sim_cycles, cont)
    cont = re.sub(r'(localparam\s+SINK_ENTRIES\s+=\s*)\d+;', r'\g<1>%d;' % run_conf.max_sim_cycles, cont)
    cont = re.sub(r'(localparam\s+SRC_LOG2_ENTRIES\s+=\s*)\d+;', r'\g<1>%d;' % binWidth(run_conf.max_sim_cycles), cont)
    cont = re.sub(r'(localparam\s+SINK_LOG2_ENTRIES\s+=\s*)\d+;', r'\g<1>%d;' % binWidth(run_conf.max_sim_cycles), cont)
    for i in range(dmbr_conf.bin_num):
        cont = re.sub(r'.creditIn_%d.*\(.*\)' % i, '.creditIn_%d (%d)' % (i,dmbr_conf.bin_cred_list[i]), cont)

    print >> fout, cont
    fin.close()
    fout.close()
    os.chdir(prev_dir)

def main():
    for test_cnt in range(TEST_NUMBER):
        print "Running %d out of %d" % (test_cnt+1, TEST_NUMBER)

        log_file = open("model.log", "w")
        src_file = open("simple_src.vmh", "w")
        sink_file = open("simple_sink.vmh", "w")
        if not GIVEN_SEED:            
            SEED = random.randint(0,MAX_SEED)
        else:
            SEED = GLOBAL_SEED
        random.seed(SEED)
        print >> log_file, " seed = %d" % SEED
        dmbr_conf = DmbrConf(isdefault=False)
        dmbr_conf.printConf(log_file)
        run_conf = RunConf(dmbr_conf)
        env_conf = DmbrEnvConf(dmbr_conf)
        dmbr = Dmbr(dmbr_conf)
        dmbr_env = DmbrEnv(env_conf)
        stall = 0
        setTopParams(dmbr_conf, run_conf)

        print >> sink_file, "0\n0"

        for cycle_num in xrange(run_conf.max_sim_cycles):
            #TODO: control of 'proc_ld'
            #TODO: make in a procedure
            if cycle_num < INIT_DELAY:
                print >> src_file, "%s" % ('1' + (SRC_WIDTH-1)*'0')
                print >> sink_file, "%s" % (SINK_WIDTH*'0')
            else:
                (l1_val, l1_tag, l2_val, l2_tag, l2_miss_val) = dmbr_env.makeCycle(log_file, cycle_num, stall)
                if DEBUG:
                    print >> log_file, "\n------------------"
                    print >> log_file, "cycle# %d" % (cycle_num-1) # in order to consistent with index_f in test_sink
                    print >> log_file, "------------------"
                l1_tag_bin_filled = binFill(l1_tag, TAG_WIDTH)
                l2_tag_bin_filled = binFill(l2_tag, TAG_WIDTH)
                print >> src_file, "%s%d%s%d%d%s" % (0, l1_val, l1_tag_bin_filled, l2_val, l2_miss_val, l2_tag_bin_filled)
                print >> log_file, "%s_%d_%s_%d_%d_%s" % (0, l1_val, binFill(l1_tag, TAG_WIDTH), l2_val, l2_miss_val, l2_tag_bin_filled)
                stall = dmbr.makeCycle(log_file, cycle_num, l1_val, l1_tag, l2_val, l2_miss_val, l2_tag)
                print >> sink_file, "%d" % stall

        src_file.close()
        sink_file.close()

        # script_path = os.getcwd()
        # print script_path
        # vcs_word_dir = os.environ["MODEL_DIR"]
        # os.chdir(vcs_word_dir)
        # comp_cmd = "sims -sys=dmbr_test -vcs_build -vcs_use_cm -vcs_cm_args=line+tgl+cond+branch -vcs_cm_name=test_%d -build_id=dmbr_test -vcs_build_args=-debug_all" % test_cnt
        # run_cmd = "sims -sys=dmbr_test -vcs_run -vcs_use_cm -vcs_cm_args=line+tgl+cond+branch -vcs_cm_name=test_%d -build_id=dmbr_test" % test_cnt
        # os.system(comp_cmd)
        # os.system(run_cmd)
        # sim_log_file = open("sims.log", "r")
        # content = sim_log_file.read()
        # os.chdir(script_path)
        # m = re.search(".*FAILED.*", content)
        # if m != None:
        #     print >> all_tests_file, "\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        #     print >> all_tests_file, "               TEST #%d FAILED" % test_cnt
        #     print >> all_tests_file, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        #     print >> all_tests_file, "The first failed message:"
        #     print >> all_tests_file, m.group()
        #     fail_cnt += 1
#             cmd = "cp %s ../failed/failed_waves_%d.vcd" % (os.path.join(vcs_word_dir, "dmbr_test.vcd"),test_cnt)
#             os.system(cmd)
        #     cmd = "cp %s ../failed/failed_vcs_log_%d.vcd" % (os.path.join(vcs_word_dir, "sims.log"),test_cnt)
        #     os.system(cmd)
        #     cmd = "cp simple_src.vmh ../failed/failed_src_%d.vmh" % test_cnt
        #     os.system(cmd)
        #     cmd = "cp simple_sink.vmh ../failed/failed_sink_%d.vmh" % test_cnt
        #     os.system(cmd)
        #     cmd = "cp sim.log ../failed/failed_model_log_%d.vmh" % test_cnt
        #     os.system(cmd)
        #     cmd = "cp ../dmbr_test_top.v ../failed/failed_top_%d.v" % test_cnt
        #     os.system(cmd)
        # else:
        #     print >> all_tests_file, "\n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        #     print >> all_tests_file, "               TEST #%d PASSED" % test_cnt
        #     print >> all_tests_file, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        # dmbr.printBinMargins(all_tests_file)

        if dmbr.total_stall_cnt != 0:
            stall_perc = 100*float(dmbr.total_stall_cnt)/run_conf.max_sim_cycles
        else:
            stall_perc = 0.

        avg_inter_time = float(run_conf.max_sim_cycles)/dmbr.total_l1_req_cnt
        exp_req_num = float(run_conf.max_sim_cycles)/dmbr_conf.repl_time * sum(dmbr_conf.bin_cred_list)

        print >> log_file, '\n\n\n'
        print >> log_file, "DMBR was stalled for %.4f %% of all time" % stall_perc
        print >> log_file, "Average interval for L1 requests: %.1f cycles" % avg_inter_time
        print >> log_file, "Expected interval: %.1f cycles" % dmbr.getExpInterv()
        print >> log_file, "Real number of all requests from L1: %d" % dmbr.total_l1_req_cnt
        print >> log_file, "Expected number of requests from L1: %d" % exp_req_num

        log_file.close()

if __name__ == '__main__':
    main()
    
