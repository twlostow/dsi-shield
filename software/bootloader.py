#!/usr/bin/python

our_port="/dev/ttyUSB0"

import sys
import time
import serial

ser = serial.Serial(port=our_port,baudrate=115200,timeout=1,rtscts=False)


fw = open(sys.argv[1], "rb").read()

ser.setRTS(True)
time.sleep(0.1)
ser.setRTS(False)
time.sleep(0.1)

while(ser.read(1) != 'B'):
	pass

while(ser.read(1) != 'o'):
	pass
	
while(ser.read(1) != 'o'):
	pass
	
while(ser.read(1) != 't'):
	pass
	
while(ser.read(1) != '?'):
	pass

time.sleep(0.01)

ser.write('Y')

while(ser.read(1) != 'O'):
	pass

while(ser.read(1) != 'K'):
	pass



time.sleep(10e-6);
l = len(fw)
ser.write(chr((l >> 8) & 0xff));
time.sleep(100e-6);
ser.write(chr((l >> 0) & 0xff));

for b in fw:
	ser.write(b)
	time.sleep(100e-6)

while(ser.read(1) != 'G'):
	pass

print("Programming done!")
while True:
	b=ser.read(1)
	if(b):
		sys.stdout.write(b)
	else:
		time.sleep(0.01)