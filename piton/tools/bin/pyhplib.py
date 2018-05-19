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

import os

#MAX_THREAD = 128;
MAX_TILE = 64;
MAX_X = 8;
MAX_Y = 8;

X_TILES = int(os.environ.get('PTON_X_TILES', '-1'))
#print "//x_tiles:", num_tiles

Y_TILES = int(os.environ.get('PTON_Y_TILES', '-1'))
#print "//y_tiles:", num_tiles

NUM_TILES = int(os.environ.get('PTON_NUM_TILES', '-1'))
#print "//num_tiles:", num_tiles

if X_TILES == -1:
    print "//x_tiles not defined!"
    X_TILES = MAX_X

if Y_TILES == -1:
    print "//y_tiles not defined!"
    Y_TILES = MAX_Y

if NUM_TILES == -1:
    print "//num_tile not defined!"
    if X_TILES != -1 and Y_TILES != -1:
        NUM_TILES = X_TILES*Y_TILES
    else:
        NUM_TILES = MAX_TILE

NUM_THREADS = 2 * NUM_TILES

def Replicate(text):
    newtext = ''
    for i in range(NUM_TILES):
        t = text.replace("0", `i`);
        newtext += t + '\n';
    return newtext;

#import re
#def ReplicateRE(text):
#    regex = " ([^\.:]+)0"
#    newtext = ''
#    for i in range(NUM_TILES):
#        t = re.sub(regex, " \1" + `i`, text)
#        newtext += t + '\n';
#    return newtext;

def ReplicatePattern(text, patterns):
	regex = " ([^\.:]+)0"
	newtext = ''
	for i in range(NUM_TILES):
		t = text
		for p in patterns:
			replacement = p[:-1] + `i`;
			t = t.replace(p, replacement);
		newtext += t + '\n';
	return newtext;

# only difference is that this looks for patterns start with 1 not 0
def ReplicatePattern1(text, patterns):
	regex = " ([^\.:]+)1"
	newtext = ''
	for i in range(NUM_TILES):
		t = text
		for p in patterns:
			replacement = p[:-1] + `i`;
			t = t.replace(p, replacement);
		newtext += t + '\n';
	return newtext;
