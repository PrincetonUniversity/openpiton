#!/usr/bin/env python
# Modified by Princeton University on June 9th, 2015
# Copyright (C) 2000 Christopher Craig
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#

"""Parses PyHP documents
"""

from collections import UserString
import code
import sys
import re

__version__ = "$Id: pyhp.py,v 1.12 2000/11/10 17:26:33 ccraig Exp $"

class fbuffer(UserString):
    """Acts sort of like an mmap'ed file with out the file.
    Allows the use of a string object as sys.stdout
    """
    def __init__(self):
        UserString.__init__(self, '')

    def write(self, str):
        self.data += str


class PageData:
    """Allows the modification of body and headers on the fly"""

    def __init__(self):
        self._body = fbuffer()
        self._headers = {}
        self.staticvars = {} # for compatibility

    def addheader(self, invar):
        """
        takes a HTTP header string (of the form 'Key: value') and adds it
        to the header section.  This can be done anywhere in the page.
        """
        s = str(invar)
        t = s.split(':', 1)
        self._headers[t[0]] = t[1]

    def clearall(self):
        """
        clears all data output either to the stdout or to the headers up
        to this point, starting as if no code had been executed and no text
        had been processed.  This is useful for generating error pages.
        """
        self._body.data = ''
        self._headers = {}

    def _writeout(self):
        """sends page out to port, headers first"""

        # print headers
        #self._headers.setdefault('Content-type', 'text/html')
        #for k, v in self._headers.items():
        #    print k + ': ' + v

        #sys.stdout.write('\r\n\r\n')

        # send body to port
        sys.stdout.write(str(self._body))

    def include(self, filename):
        """
        includes file (a file object) as a PyHP file.
        This takes place in a fresh namespace and does not inherit variables
        from the current namespace.  Text and headers generated by the PyHP
        file are inserted at the present place in the document body and
        headers respectively.  This procedure is at least an order of
        magnitude slower than a python 'import' statement, so should be used
        sparingly
        """
        file = open(filename)

        cgienv = {'pyhp': self,
                  'sys':  sys}
        interp = PyHPInterp(cgienv)

        # read in file
        try:
            file.seek(0,0)
            data = file.read()
            if data[0] == '#': # detect shell script syntax
                data = data.split('\n', 1)[1]
        except IOError:
            raise apache.SERVER_RETURN(apache.HTTP_INTERNAL_SERVER_ERROR)

        # split file into sections
        fields = reg.split(data)
        fields = [x for x in fields if len(x)!=0]

        # setup data and parse code
        lineCnt = 1
        for f in fields:
            # strip out right white space to have indented %> possible
            forig = f
            f = f[:-2]
            f = f.rstrip(" ");
            if f[:3] == '<%=': interp.pushvar(f[4:])
            # if f[:3] == '<%=': interp.pushvar(f[4:-2])
            elif f[:3] == '<%-': pass
            # elif f[:2] == '<%': interp.pushcode(f[3:-2])
            elif f[:2] == '<%': interp.pushcode(f[3:], filename, lineCnt)
            else: interp.pushtext(forig)
            # count lines for accurate error reporting in pushcode() below
            tmp = forig.split('\n')
            lineCnt += len(tmp)-1


class PyHPInterp(code.InteractiveInterpreter):
    """Interpreter for PyHP.  Allows mod_python to spawn a seperate
    pseudo interpreter for each script run with its own namespace, but still
    cache module loads"""

    def pushcode(self, codeobj, filename, lineCnt):
        # so.write("PYTHON CODE\n")
        lines = codeobj.split("\n")
        # for line in lines:
        #     so.write("line\n")
        #     so.write(line)
        #     so.write("\n")
        # get the indentation of the first line
        ws = re.compile("^(\s*)(.*)")
        match = ws.match(lines[0])
        ws = match.group(1)
        nws = match.group(2)
        if (len(nws) == 0):
            wslen = 0
        else:
            wslen = len(ws)
        codeobj = ""
        # so.write("NUMINDENTATION is " + `wslen` + '\n')
        for line in lines:
            # so.write("indented line\n")
            # so.write(line[wslen:])
            # so.write("\n");
            line = line[wslen:]
            codeobj += line + "\n"
        # codeobj = "".join(lines)
        try:
            c = code.compile_command(codeobj, '<string>', 'exec')
            self.runcode(c)

        except Exception as err:
            raise type(err)(str(err) + " in code segment starting on line " + str(lineCnt) + ' in pyv file ' + filename)

    def pushvar(self, var):
        cmd = 'sys.stdout.write(str(%s))' % var
        self.runsource(cmd)

    def pushtext(self, text):
        self.locals['sys'].stdout.write(text)


reg = re.compile('(<%.*?%>)', re.S)
pyhp = PageData()

# setup environment
so = sys.__stdout__
sys.stdout = sys.__stdout__ = pyhp._body

# parse code
pyhp.include(sys.argv[1])

# write out data
sys.stdout = sys.__stdout__ = so
pyhp._writeout()
