/*
 * This work is part of the White Rabbit project
 *
 * Copyright (C) 2011 CERN (www.cern.ch)
 * Author: Tomasz Wlostowski <tomasz.wlostowski@cern.ch>
 *
 * Released according to the GNU GPL, version 2 or any later version.
 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
	if (argc < 3)
		return -1;
	FILE *f = fopen(argv[1], "rb");
	if (!f)
		return -1;
	unsigned char x[4];
	int i = 0;
	int n = atoi(argv[2]);


	int base = 0;
	int file_pos = 0;
    
	if(argc >= 5)
	{
	    file_pos = atoi(argv[3]);
	    base = atoi(argv[4]);
	}

	fseek(f, file_pos, SEEK_SET);

	while (!feof(f) && (n == 0 || (i < n))) {
		fread(x, 1, 4, f);
		printf("@%x %02X%02X%02X%02X\n", (base + i) * 0x4, x[3], x[2], x[1],
		       x[0]);
		i++;
	}

	for (; i < n;) {
		printf("@%x %02X%02X%02X%02X\n", (base + i) * 0x4, 0, 0, 0, 0);
		i++;
	}
	fclose(f);
	return 0;
}
