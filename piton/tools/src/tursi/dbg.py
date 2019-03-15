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

# For Python 2 and 3 print compatibility
from __future__ import print_function 

import sys, inspect

DEBUG = True

class clr:
    RED     = '\033[31m'
    YELLOW  = '\033[33m'
    BLUE    = '\033[34m'
    CYAN    = '\033[36m'
    RST_CLR = '\033[0m'

def getFuncLine():
    # stack: [0] - current, [1] - print_* function, [2] - program
    frame_record = inspect.stack()[2]
    frame = frame_record[0]
    info = inspect.getframeinfo(frame)
    fname_short = info.filename.split('/')[-1]
    retval = "%s:%3d" % (fname_short, info.lineno)
    return retval

def print_debug(msg, fstream=sys.stderr):
    if DEBUG:
        msg_print = clr.CYAN + "[DEBUG] " + getFuncLine() + clr.RST_CLR + ": " + msg
        print(msg_print, file=fstream)
    else:
        pass

def print_info(msg, fstream=sys.stderr):
    msg_print = clr.BLUE + "[INFO]  " + getFuncLine() + clr.RST_CLR + ": " + msg
    print(msg_print, file=fstream)

def print_warning(msg, fstream=sys.stderr):
    msg_print = clr.YELLOW + "[WARN]  " + getFuncLine() + clr.RST_CLR + ": " + msg
    print(msg_print, file=fstream)

def print_error(msg, fstream=sys.stderr):
    msg_print = clr.RED + "[ERROR] " + getFuncLine() + clr.RST_CLR + ": " + msg
    print(msg_print, file=fstream)
