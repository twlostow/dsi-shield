#!/usr/bin/python

from PIL import Image
im = Image.new("RGB", (1000,1000))

lines = open("frames.dat","r").readlines()

x=0
y=0

for l in lines:
	ls = l.split()
	cmd = ls[0]
	if(cmd == "VSYNC_START"):
		y=0
		x=0
	elif(cmd == "HSYNC_START"):
		print("y %d" % y)
		x=0
	elif(cmd == "PIXELS"):
		n = int(ls[1])
		for i in range(0,n/3):
#			print("x %d y %d" %( x,y))
			r=int(ls[2+i*3],16)
			g=int(ls[2+i*3+1],16)
			b=int(ls[2+i*3+2],16)

			im.putpixel((x,y),(r,g,b))

			x+=1
		y+=1
			
			

		
im.show()
