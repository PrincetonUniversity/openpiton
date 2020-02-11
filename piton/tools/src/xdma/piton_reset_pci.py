#!/usr/bin/python
import os
import mmap


fd = os.open('/dev/xdma0_user', os.O_RDWR | os.O_SYNC)
mapped = mmap.mmap(fd, 32, access=mmap.ACCESS_WRITE)
mapped[0] = b'\x00'
mapped[0] = b'\x01'
#mapped.flush()
mapped.close()
os.close(fd)
