#! /usr/bin/env python

import subprocess
import os
import sys
import re

# from http://stackoverflow.com/questions/377017/test-if-executable-exists-in-python
# Thanks, "Jay"!
def which(program):
    def is_exe(fpath):
        return os.path.isfile(fpath) and os.access(fpath, os.X_OK)

    fpath, fname = os.path.split(program)
    if fpath:
        if is_exe(program):
            return program
    else:
        for path in os.environ["PATH"].split(os.pathsep):
            exe_file = os.path.join(path, program)
            if is_exe(exe_file):
                return exe_file

    return None


sw_vers = which('sw_vers')
if sw_vers:
    subp = subprocess.Popen([sw_vers], stdout=subprocess.PIPE,
            stderr=subprocess.PIPE)
    return_code = subp.wait()
    if return_code != 0:
        sys.exit(0)
    version_info = subp.stdout.read()
    #looks like this:
    #ProductName:	Mac OS X
    #ProductVersion:	10.7.4
    #BuildVersion:	11E53
    version = re.search(r'(10\.\d+)\.\d+', version_info)
    if version:
        sys.stdout.write(version.groups()[0])
