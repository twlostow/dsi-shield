#!/usr/bin/python

our_port="/dev/ttyUSB0"

import sys
import time
import serial

ser = serial.Serial(port=our_port,baudrate=115200,timeout=1,rtscts=False)

def send( x ):
  ser.write( x )

def recv():
  while True:
    try:
      time.sleep(0.01)
      state = ser.read(1)
      return state
    except:
#      print("Except!")
      pass

fw = open(sys.argv[1], "rb").read()

ser.setRTS(True)
time.sleep(0.01)
ser.setRTS(False)
time.sleep(0.01)
ser.setRTS(True)
time.sleep(0.01)

print("Init0")
while(recv() != 'B'):
	pass

print("Init1")

while(recv() != 'o'):
	pass
	
while(recv() != 'o'):
	pass
	
while(recv() != 't'):
	pass
	
while(recv() != '?'):
	pass

time.sleep(0.01)

send('Y')

while(recv() != 'O'):
	pass

while(recv() != 'K'):
	pass



time.sleep(10e-6);
l = len(fw)
print("Bootloader OK, writing %d bytes." % l)

send(chr((l >> 24) & 0xff));
time.sleep(100e-6);
send(chr((l >> 16) & 0xff));
time.sleep(100e-6);
send(chr((l >> 8) & 0xff));
time.sleep(100e-6);
send(chr((l >> 0) & 0xff));

n=0
for b in fw:
	n+=1
	send(b)
	time.sleep(100e-6)
	if n % 10000 == 0:
		print("%d/%d bytes programmed." % (n,len(fw)))

while(recv() != 'G'):
	time.sleep(100e-6)

print("Programming done!")

while True:
	b=recv()
	if(b):
		sys.stderr.write(b)
	else:
		time.sleep(0.01)
