#!/usr/bin/python

#
# DSI Shield
#
# Copyright (C) 2013-2015 twl <twlostow@printf.cc>
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.

import sys
import time
import serial
import struct
import getopt

class SerialIF:
    def __init__(self, device="/dev/ttyUSB0"):
	self.ser = serial.Serial(port=device,baudrate=115200,timeout=30,rtscts=False)

    def reset_board(self):
	self.ser.setRTS(True)
	time.sleep(0.01)
	self.ser.setRTS(False)
	time.sleep(0.01)
	self.ser.setRTS(True)
	time.sleep(0.01)


    def send(self, x):
	if isinstance(x, int):
	    self.ser.write(struct.pack("B", x))
        else:
	    self.ser.write( x )

    def recv(self):
	while True:
	    try:
    		state = self.ser.read(1)
    		return state
	    except:
    		time.sleep(0.01)
    		pass

    def crc_xmodem_update (self, crc, data):
	crc = crc ^ (data << 8)

	for i in range(0, 8):
	    if ( (crc & 0x8000) != 0):
		crc = (crc << 1) ^ 0x1021;
		crc &= 0xffff
	    else:
		crc = crc << 1;
		crc &= 0xffff

	return crc;


    def crc_xmodem(self, data):
        crc = 0
	for c in data:
    	    crc = self.crc_xmodem_update(crc, c)
	return crc


    def rx_frame(self):
	frame=[]

	while True:
	    b = ord(self.recv())
    	    if(b != 0x55):
#    		sys.stderr.write("%c" % b)
		continue
	    b = ord(self.recv())
	    if(b != 0xaa):
#		sys.stderr.write("%c" % b)
		continue
	    break

	frame=[0x55, 0xaa]

	rsp = ord(self.recv())
        l = ord(self.recv())
        l <<= 8
        l |= ord(self.recv())

        for i in range(0, l):
            frame.append(ord(self.recv()))

        crc = ord(self.recv())
        crc <<= 8
        crc |= ord(self.recv())

        return rsp

    def tx_frame(self,command, data):

	frame = []
        frame.append(0x55)
        frame.append(0xaa)
        frame.append(command)
        frame.append( (len(data)>>8) & 0xff)
        frame.append(len(data) & 0xff)

        for b in data:
	    frame.append(b)

	crc = self.crc_xmodem(frame)

	frame.append((crc >> 8) & 0xff)
	frame.append((crc & 0xff))

	for b in frame:
	    self.send(b)


class DSIBootloader:
    def __init__(self, device = "/dev/ttyUSB0"):
	self.sock = SerialIF (device)

    CMD_WRITE_RAM=4
    CMD_FLASH_ERASE_SECTOR=2
    CMD_FLASH_PROGRAM_PAGE=3
    CMD_GO=5
    CMD_BOOT_INIT=1

    RSP_OK=1
    RSP_CRC_ERROR=2
    RSP_VERIFY_ERROR=3
    RSP_BAD_CRC=4
    RSP_HELLO=5

    def command(self, cmd, data):
	while True:
	    self.sock.tx_frame(cmd, data)
	    status = self.sock.rx_frame()

	    if(status != self.RSP_CRC_ERROR):
		break
	    time.sleep(0.1)
	return status

    def cmd_boot_enter(self):
	return self.command (self.CMD_BOOT_INIT, [])

    def cmd_erase_sector(self,addr):
	data=[ (addr >> 24) & 0xff, (addr >> 16) & 0xff, (addr >> 8) & 0xff, addr & 0xff ]
        return self.command (self.CMD_FLASH_ERASE_SECTOR, data)

    def cmd_program_page(self, addr, data):
	buf=[ (addr >> 24) & 0xff, (addr >> 16) & 0xff, (addr >> 8) & 0xff, addr & 0xff ]
	for b in data:
	    buf.append(b)
	return self.command (self.CMD_FLASH_PROGRAM_PAGE, buf)

    def cmd_write_ram(self, addr, data):
	buf=[ (addr >> 24) & 0xff, (addr >> 16) & 0xff, (addr >> 8) & 0xff, addr & 0xff ]
	for b in data:
	    buf.append(b)
#	print(len(buf))
	return self.command (self.CMD_WRITE_RAM, buf)

    def cmd_jump(self,addr):
	buf=[ (addr >> 24) & 0xff, (addr >> 16) & 0xff, (addr >> 8) & 0xff, addr & 0xff ]
	return self.command (self.CMD_GO, buf)

    def boot_enter(self):
	self.sock.reset_board()
	while ( self.sock.rx_frame() != self.RSP_HELLO):
	    pass
	self.cmd_boot_enter()

    SECTOR_SIZE=0x10000
    PAGE_SIZE=0x100

    def program_flash(self, fw):
	remaining = len(fw)
	for i in range(0, (remaining+self.SECTOR_SIZE-1)/self.SECTOR_SIZE):
    	    sys.stdout.write("\rErasing sector 0x%x          " % (i * self.SECTOR_SIZE))
	    sys.stdout.flush()
	    self.cmd_erase_sector(i * self.SECTOR_SIZE)

	p=0
	while(remaining > 0):
	    n = 256 if remaining > 256 else remaining
	    data=[]
	    for b in fw[p:p+n]:
		data.append(ord(b))


	    self.cmd_program_page(p, data)
	    p += n
	    remaining -= n

	    sys.stdout.write("\rProgramming: %.0f%%           " % (float(p) / len(fw) * 100.0))
	    sys.stdout.flush()

	print("\nFlashing complete. Please power-off and power-on again your board.")

    def load_ram(self,image,addr):
	remaining = len(image)

	p=0
	while(remaining > 0):
	    n = 256 if remaining > 256 else remaining
	    data=[]
	    for b in image[p:p+n]:
		data.append(ord(b))
#	    print("addr %x l %d" %( p+addr, len(data)))


	    self.cmd_write_ram(addr + p, data)
	    p += n
	    remaining -= n
	    sys.stdout.write("\rLoading: %.0f%%           " % (float(p) / len(image) * 100.0))
	    sys.stdout.flush()

	self.cmd_jump(addr)
	print("\nBoot done..")



def main(argv):
    our_port="/dev/ttyUSB0"
    do_flash = False
    try:
	opts, args = getopt.getopt(argv[1:],"hfp:",["uart"])
    except getopt.GetoptError:
	print ('Usage: %s [-f] [-p serial_port_device] file.bin' % argv[0])
	sys.exit(2)
    for opt, arg in opts:
	if opt == '-h':
	    print ('Usage: %s [-f] [-p serial_port_device] file.bin' % argv[0])
	    print ('Options:')
	    print ('-f / --flash  - flashes the FPGA bitstream instead of loading the CPU image (can brick your board!)')
	    print ('-p / --port:  - specifies the serial port device (default: %s)' % our_port)
	    sys.exit()
	elif opt in ("-f", "--flash"):
	    do_flash = True
	elif opt in ("-p", "--port"):
	    our_port = arg
	else:
	    print("Unrecognized option '%s'" % opt)

    if len(args) == 0:
	print("No filename specified.")
	sys.exit(2)

    boot = DSIBootloader(our_port)
    fw = open(args[0], "rb").read()

    boot.boot_enter()
    if do_flash:
	boot.program_flash(fw)
    else:
	boot.load_ram(fw, 0x1400)

if __name__ == "__main__":
   main(sys.argv)
