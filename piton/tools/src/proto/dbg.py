# Copyright (c) 2017 Princeton University
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

import sys

DEBUG = True

class clr:
    RED     = '\033[31m'
    YELLOW  = '\033[33m'
    BLUE    = '\033[34m'
    CYAN    = '\033[36m'
    RST_CLR = '\033[0m'

def print_debug(msg, fstream=sys.stderr):
    if DEBUG:
        msg_print = clr.CYAN + "DEBUG" + clr.RST_CLR + ": " + msg
        print >> fstream, msg_print
    else:
        pass

def print_info(msg, fstream=sys.stderr):
    msg_print = clr.BLUE + "INFO" + clr.RST_CLR + ": " + msg
    print >> fstream, msg_print

def print_warning(msg, fstream=sys.stderr):
    msg_print = clr.YELLOW + "WARNING" + clr.RST_CLR + ": " + msg
    print >> fstream, msg_print

def print_error(msg, fstream=sys.stderr):
    msg_print = clr.RED + "ERROR" + clr.RST_CLR + ": " + msg
    print >> fstream, msg_print