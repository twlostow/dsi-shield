#!/usr/bin/python

from PIL import Image
im = Image.open("hackaday-logo.png")

pix = im.load()

prev = 0
l=0


print("static const uint8_t Img_data1[] = {");
for y in range(0, im.size[1]):
	for x in range(0, im.size[0]):
		cur = pix[x, y]
		if(cur!=prev or l == 127):
			if(prev):
				print ("0x%02x," % (l | 0x80))
			else:
				print ("0x%02x," % (l))
			l = 0
		else:
			l=l+1
		prev=cur

if(prev):
	print ("0x%02x" % (l | 0x80))
else:
	print ("0x%02x" % (l))

print("};");
print("static const struct rle_bitmap img1 = { %d, %d, Img_data1 };" % (im.size[0], im.size[1]));
			
