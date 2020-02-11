#!/usr/bin/python

from fpga_mgmt import *
from ctypes import c_uint16, byref

dip = c_uint16(0)
fpga_mgmt_get_vDIP_status(0, byref(dip))

dip = c_uint16(dip.value & 0b0111111111111111)
fpga_mgmt_set_vDIP(0, dip)

dip = c_uint16(dip.value | 0b1000000000000000)
fpga_mgmt_set_vDIP(0, dip)

