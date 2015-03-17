/***
This code uses the BSD 2-clause license:

Copyright (c) 2011, Andrew "bunnie" Huang / bunnie@bunniestudios.com
All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:

   Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

   Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the
   distribution.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
***/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "matchmoded_timings.h"

#define MODE720P 0
#define MODE1080P24 1
#define MODE1080P30 2
#define MODE1080P25 3
#define HYBRID 4
#define MODE480P 5

typedef unsigned char byte;
/* byte must be 8 bits */

/* int must be at least 16 bits */

/* long must be at least 32 bits */

typedef unsigned short u16;
typedef unsigned int u32;

struct standardTimings {
  byte horizPixels;
  byte AR_refresh;
};

struct saneDescriptor {
  int pixelclock;
  int hActive;
  int hBlank;
  int vActive;
  int vBlank;
  int hFP;
  int hBP;
  int vFP;
  int vBP;
  int hSync;
  int vSync;
  int hSizemm;
  int vSizemm;
  int hborder;
  int vborder;
  
  int syncCode; // sorry, too lazy to implement this in fields
};

struct detailDescriptors {
  byte pixelclockLSB;    // byte 0   // bytes, not u16, to allow for unaligned structure start
  byte pixelclockMSB;    // byte 1
  byte hActiveLSB;   // byte 2
  byte hBlankLSB;    // byte 3
  byte hActiveBlankMSB;  // byte 4
  byte vActiveLSB;   // byte 5
  byte vBlankLSB;    // byte 6
  byte vActiveBlankMSB;  // byte 7
  byte hFrontPorchLSB;  // byte 8
  byte hSyncWidthLSB;   // byte 9
  byte vFPvSyncWidthLSB; // byte 10
  byte miscMSB; // byte 11
  byte hVidSizeLSB; // byte 12
  byte vVidSizeLSB; // byte 13
  byte hvSizeMSB; // byte 14
  byte hborder; // byte 15
  byte vborder; // byte 16
  byte syncdef; // byte 17
};

struct displayName {
  char tag[5]; // initialize to 00 00 00 fc 00
  char name[13];
};

struct displayDataString {
  char tag[5]; // initialize to 00 00 00 fe 00
  char name[13];
};

struct displayLimits {
  char tag[4]; // initialize to 00 00 00 fd
  byte rangeLimits;
  byte minVert;
  byte maxVert;
  byte minHoriz;
  byte maxHoriz;
  byte maxPclk;
  byte timingSupport;
  byte unused[7]; // sequence is 0a 20 20 20 20 20 20 typically
};

struct edid_ {
  byte header[8];
  u16 IDManufacturerName;
  u16 IDProductCode;
  u32 IDSerialNumber;
  byte WeekOfManufacture;
  byte ModelYear;

  byte VersionNumber;
  byte RevisionNumber;

  byte VideoInputDefinition;
  byte HorizontalSize;
  byte VerticalSize;
  byte DisplayGamma;
  byte FeatureSupport;

  byte ChromaRGLow;
  byte ChromaBWLow;
  byte RedXHigh;
  byte RedYHigh;
  byte GreenXHigh;
  byte GreenYHigh;
  byte BlueXHigh;
  byte BlueYHigh;
  byte WhiteXHigh;
  byte WhiteYHigh;

  byte TimingsI;
  byte TimingsII;
  byte TimingsReserved;

  // standard timings 1-8
  struct standardTimings timings[8];

  // detail timings
  struct detailDescriptors detail;

  struct displayDataString dataString;
  struct displayName name;
  struct displayLimits limits;
  
  byte extensionBlockCount;
  byte checksum;
};

struct videoDataBlock {
  byte videoTagCode; // 0x41 if single, 0x42 (or more) if hybrid
};
// a variable number of these follow the videodatablock
struct videoDataBlockDescriptor{
  byte shortDescriptor; 
};

struct audioDataBlock {
  byte audioTagCode; // 0x23
  byte audio[3]; // 09 07 07  fake data: 2 channels, supports 48/44.1/32 and 24-16 bits
};
struct speakerDataBlock {
  byte speakerTagCode; // 0x83
  byte speaker[3]; // 01 00 00 : just fl/fr speakers available
};

struct hdmiBlock {
  byte vendorTagCode; // 0x66
  byte hdmi[6]; // 03 0c 00  10 00  00
};

struct hdmi_top_ {
  byte tag;  // value: 02
  byte revision; // value: 03
  byte offset; // where detail timing descriptors begin
  byte numDescrips; 
  struct videoDataBlock video;
  // video codes, one byte at a time, inserted here
};

struct hdmi_mid_ {
  // audio data block collection
  struct audioDataBlock audio;
  // speaker allocation data block
  struct speakerDataBlock speaker;
  // vendor-specific datablock: This has the mandatory HDMI vendor block
  struct hdmiBlock hdmi;

  // descriptors are appended here...
  // ...
  // ...
  // ...
  // pad to zero and add checksum
};

byte calcsum(unsigned char *block) {
  int i;
  byte sum = 0;
  for( i = 0; i < 127; i++ ) {
    sum += block[i];
  }
  return( 256 - sum );
}

void make_insane(struct saneDescriptor *sane, struct detailDescriptors *insane) {
  u16 pixclk;
  
  pixclk = (sane->pixelclock / 10000) & 0xFFFF;
  insane->pixelclockLSB = pixclk & 0xFF;
  insane->pixelclockMSB = (pixclk >> 8) & 0xFF;
  insane->hActiveLSB = sane->hActive & 0xFF;
  insane->hBlankLSB = sane->hBlank & 0xFF;
  insane->hActiveBlankMSB = (((sane->hActive >> 8) & 0xF) << 4) | ((sane->hBlank >> 8) & 0xF);
  insane->vActiveLSB = sane->vActive & 0xFF;
  insane->vBlankLSB = sane->vBlank & 0xFF;
  insane->vActiveBlankMSB = (((sane->vActive >> 8) & 0xF) << 4) | ((sane->vBlank >> 8) & 0xF);
  insane->hFrontPorchLSB = sane->hFP & 0xFF;
  insane->hSyncWidthLSB = sane->hSync & 0xFF;
  insane->vFPvSyncWidthLSB = ((sane->vFP & 0xF) << 4) | (sane->vSync & 0xF);
  insane->miscMSB = (((sane->hFP >> 8) & 0x3) << 6) |
    (((sane->hSync >> 8) & 0x3) << 4 ) |
    (((sane->vFP >> 4) & 0x3) << 2 ) |
    (((sane->vSync >> 4) & 0x3) << 0 );
  insane->hVidSizeLSB = sane->hSizemm & 0xFF;
  insane->vVidSizeLSB = sane->vSizemm & 0xFF;
  insane->hvSizeMSB = (((sane->hSizemm >> 8) & 0xF) << 4) | (((sane->vSizemm >> 8) & 0xF) << 0);
  insane->hborder = sane->hborder;
  insane->vborder = sane->vborder;
  insane->syncdef = sane->syncCode;
  
}

int modeSupportedByNetv(int mode, struct timing_range **timing) {
  int i = 0;
  
  while(timings[i] != NULL) {
    if( mode == (timings[i])->number ) {
      if( timing != NULL ) {
	*timing = timings[i];
      }
      return 1;
    }
    i++;
  }

  return 0;
}


unsigned char *make_edid(char *modelist) {
  struct saneDescriptor sane;
  unsigned char *bytes;
  int i;
  struct edid_ edid;
  byte *output_edid;
  
  edid.header[0] = 0;
  edid.header[1] = 0xff;
  edid.header[2] = 0xff;
  edid.header[3] = 0xff;
  edid.header[4] = 0xff;
  edid.header[5] = 0xff;
  edid.header[6] = 0xff;
  edid.header[7] = 0;

  edid.IDManufacturerName = 0x0d0d; //chm = 0x3 0x8 0xd -> 0 000 1101 0000 1101
  edid.IDProductCode = 0x654e; // Ne
  edid.IDSerialNumber = 0x1;
  edid.WeekOfManufacture = 0xff;
  edid.ModelYear = 0x15; // 2011

  edid.VersionNumber = 0x1;
  edid.RevisionNumber = 0x3;

  edid.VideoInputDefinition = 0x80;
  edid.HorizontalSize = 16; // bravia does this hack
  edid.VerticalSize = 9;
  edid.DisplayGamma = 0x78; // 2.2 gamma
  edid.FeatureSupport = 0x0a; // no low power modes, RGB & YCrCb, preferred mode is native
  // may want to tweak above to 0x02 if there are compatibility issues.
  
  edid.ChromaRGLow = 0xd; // copied from sony bravia TV
  edid.ChromaBWLow = 0xc9;
  edid.RedXHigh = 0xa0;
  edid.RedYHigh = 0x57;
  edid.GreenXHigh = 0x47;
  edid.GreenYHigh = 0x98;
  edid.BlueXHigh = 0x27;
  edid.BlueYHigh = 0x12;
  edid.WhiteXHigh = 0x48;
  edid.WhiteYHigh = 0x4c;
 
  edid.TimingsI = 0; // let's see if we can get off with supporting no standard timings
  edid.TimingsII = 0;
  edid.TimingsReserved = 0;

  i = 0;
  // 720p timing, mode 4
  if( modelist[4] || modelist[19] ) {
    edid.timings[i].horizPixels = 0x81; // 1280
    edid.timings[i].AR_refresh = 0xc0; // 16:9, 60 hz
  } else {
    edid.timings[i].horizPixels = 1; 
    edid.timings[i].AR_refresh = 1;
  }

  i = 1;
  // 480p timing, mode 2
  if( modelist[2] ) {
    edid.timings[i].horizPixels = 0x3b; // 720x480
    edid.timings[i].AR_refresh = 0x0; // 16:10, 60 hz
  } else {
    edid.timings[i].horizPixels = 1; 
    edid.timings[i].AR_refresh = 1;
  }
    
  for( i = 2; i < 8; i++ ) { // all bogus timings
    edid.timings[i].horizPixels = 1; // 1920 @ 24 hz not representable
    edid.timings[i].AR_refresh = 1;
  }

  if( modelist[127] ) { // make a 720p-style default mode

    sane.pixelclock = 64583000;
    sane.hActive = 720;
    sane.hBlank = 128+16;
    sane.vActive = 1280;
    sane.vBlank = 70;
    sane.hFP = 64;
    sane.hBP = 64;
    sane.vFP = 30;
    sane.vBP = 30;
    sane.hSync = 16;
    sane.vSync = 10;
    sane.hSizemm = 70;
    sane.vSizemm = 120;
    sane.hborder = 0;
    sane.vborder = 0;
    sane.syncCode = 0x1e; // digital separate sync, vertical sync is positive; hsync is positive

  } else if( modelist[126] ) {

    sane.pixelclock = 48437500;
    sane.hActive = 640;
    sane.hBlank = 128+12;
    sane.vActive = 960;
    sane.vBlank = 55-10;
    sane.hFP = 62;
    sane.hBP = 62;
    sane.vFP = 27;
    sane.vBP = 27-10;
    sane.hSync = 14;
    sane.vSync = 1;
    sane.hSizemm = 60;
    sane.vSizemm = 100;
    sane.hborder = 0;
    sane.vborder = 0;
    sane.syncCode = 0x1e; // digital separate sync, vertical sync is positive; hsync is positive

  } else if( modelist[125] ) {


    sane.pixelclock = 83333333; //64583000;
    sane.hActive = 1080;
    sane.hBlank = 96;
    sane.vActive = 1920;
    sane.vBlank = 15;
    sane.hFP = 36;
    sane.hBP = 46;
    sane.vFP = 10;
    sane.vBP = 4;
    sane.hSync = 14;
    sane.vSync = 1;
    sane.hSizemm = 60;
    sane.vSizemm = 100;
    sane.hborder = 0;
    sane.vborder = 0;
    sane.syncCode = 0x1e; // digital separate sync, vertical sync is positive; hsync is positive

  }else if( modelist[124] ) {


    sane.pixelclock = 108333333; //26411290; //64583000;
    sane.hActive = 1080;
    sane.hBlank = 46 + 46 + 1;
    sane.vActive = 1920;
    sane.vBlank = 15;
    sane.hFP = 46;
    sane.hBP = 46;
    sane.vFP = 10;
    sane.vBP = 1;
    sane.hSync = 1;
    sane.vSync = 1;
    sane.hSizemm = 60;
    sane.vSizemm = 100;
    sane.hborder = 0;
    sane.vborder = 0;
    sane.syncCode = 0x1e; // digital separate sync, vertical sync is positive; hsync is positive

  }

  else { // 480p anamorphic
    sane.pixelclock = 27000000;
    sane.hActive = 720;
    sane.hBlank = 386;
    sane.vActive = 1280;
    sane.vBlank = 45;
    sane.hFP = 192;
    sane.hBP = 40;
    sane.vFP = 48;
    sane.vBP = 30;
    sane.hSync = 8;
    sane.vSync = 1;
    sane.hSizemm = 160;
    sane.vSizemm = 90;
    sane.hborder = 0;
    sane.vborder = 0;
    sane.syncCode = 0x1e; // digital separate sync, vertical sync is positive; hsync is positive
  }

  make_insane(&sane, &(edid.detail));

  edid.dataString.tag[0] = 0x0;
  edid.dataString.tag[1] = 0x0;
  edid.dataString.tag[2] = 0x0;
  edid.dataString.tag[3] = 0xfe;
  edid.dataString.tag[4] = 0x0;
  strncpy(edid.dataString.name, "DSI Shield   ", 13);

  edid.name.tag[0] = 0;
  edid.name.tag[1] = 0;
  edid.name.tag[2] = 0;
  edid.name.tag[3] = 0xfc;
  edid.name.tag[4] = 0;

  strncpy(edid.name.name, "DSI Shield   ", 13);

  edid.limits.tag[0] = 0x0;
  edid.limits.tag[1] = 0x0;
  edid.limits.tag[2] = 0x0;
  edid.limits.tag[3] = 0xfd;

  edid.limits.rangeLimits = 0;

  // a generic limits field that covers most modes
  edid.limits.minVert = 0x17;
  edid.limits.maxVert = 60; // 60 hz
  edid.limits.minHoriz = 26; 
  edid.limits.maxHoriz = 46;
  edid.limits.maxPclk = 8; // 80 MHz max

  edid.limits.timingSupport = 0;
  edid.limits.unused[0] = 0xa;
  edid.limits.unused[1] = 0x20;
  edid.limits.unused[2] = 0x20;
  edid.limits.unused[3] = 0x20;
  edid.limits.unused[4] = 0x20;
  edid.limits.unused[5] = 0x20;
  edid.limits.unused[6] = 0x20;

  edid.extensionBlockCount = 1; // for the HDMI block

  edid.checksum = calcsum((unsigned char *) &edid);

  output_edid = calloc(128, sizeof(unsigned char));
  if( output_edid == NULL ) {
    fprintf(stderr, "can't allocate 128 bytes. Man, you are screwed!\n" );
    return NULL;
  }

  memcpy( output_edid, &edid, sizeof(edid) );

  // now print out the assembled edid as a sanity check
  for( i = 0; i < 128; i++ ) {
    if( ((i % 16) == 0) && (i != 0) ) {
      printf( "\n" );
    }
    printf( "%02x ", output_edid[i] );
  }

  printf( "\n" );

  return output_edid;
}

unsigned char* make_hdmi(char *modelist) {
  struct saneDescriptor sane;
  struct hdmi_top_ hdmi_top;
  struct hdmi_mid_ hdmi_mid;
  int i, j;
  int num_modes;
  byte videoShortDescriptor[128]; // lazy, allocating a max-sized buffer instead of mallocing
  struct detailDescriptors hdmiDetail[128];
  struct timing_range *modeTiming;
  byte *hdmi; 

  for( i = 0; i < 128; i++ ) {
    videoShortDescriptor[i] = 0;
  }

  num_modes = 0;
  for( i = 0; i < 128; i++ ) {
    // edit list to throw away unsupported modes by NeTV --
    // we want the intersection of the monitor's modes and NeTV's modes
    // note this is a little "unclean" because this is called after
    // the EDID making routine by the parent program. Curretly, we
    // ASSUME (correctly, at least of this code writing)
    // that the EDID making routine doesn't depend on this step.......!
    if( !modeSupportedByNetv(i, NULL) ) {
      modelist[i] = 0;
    }
    if( modelist[i] ) 
      num_modes++;
  }

  hdmi_top.tag = 0x2;
  hdmi_top.revision = 0x3;

  hdmi_top.numDescrips = 0x40 | (num_modes & 0xF);

  hdmi_top.offset = 4 + sizeof(struct videoDataBlock) + 
    sizeof(struct videoDataBlockDescriptor) * num_modes +
    sizeof(struct audioDataBlock) + 
    sizeof(struct speakerDataBlock) +
    sizeof(struct hdmiBlock);

  hdmi_top.video.videoTagCode = 0x40 | (num_modes & 0xF); // lower nibble is # of resolutions describd

  j = 0;
  for( i = 0; i < 128; i++ ) {
    if( modelist[i] ) {
      if( modeSupportedByNetv(i, NULL) ) {
	if( i == 4 ) {
	  // mark mode 4 as native if it comes up
	  videoShortDescriptor[j] = i | 0x80;
	} else {
	  videoShortDescriptor[j] = i;
	}
	j++;
      }
    }
  }

  hdmi_mid.audio.audioTagCode = 0x23;
  hdmi_mid.audio.audio[0] = 0x09;
  hdmi_mid.audio.audio[1] = 0x07;
  hdmi_mid.audio.audio[2] = 0x07;

  hdmi_mid.speaker.speakerTagCode = 0x83;
  hdmi_mid.speaker.speaker[0] = 0x1;
  hdmi_mid.speaker.speaker[1] = 0x0;
  hdmi_mid.speaker.speaker[2] = 0x0;
  
  hdmi_mid.hdmi.vendorTagCode = 0x66;
  hdmi_mid.hdmi.hdmi[0] = 0x3;
  hdmi_mid.hdmi.hdmi[1] = 0xc;
  hdmi_mid.hdmi.hdmi[2] = 0x0;
  hdmi_mid.hdmi.hdmi[3] = 0x10;
  hdmi_mid.hdmi.hdmi[4] = 0x0;
  hdmi_mid.hdmi.hdmi[5] = 0x0;

  j = 0;
    printf("?\n");
  for( i = 0; i < 128; i++ ) {
    if( modelist[i] ) {
	printf("Mode %d\n",i);
      if( modeSupportedByNetv(i, &modeTiming) ) {
	printf("Mode %d supported\n", i);
	sane.pixelclock = modeTiming->actual.pixclk_in_MHz * 1000000;
	sane.hActive = modeTiming->actual.hactive;
	sane.hBlank = modeTiming->actual.h_fp + modeTiming->actual.h_bp + modeTiming->actual.hsync_width;
	sane.vActive = modeTiming->actual.vactive;
	sane.vBlank = modeTiming->actual.v_fp_lines + modeTiming->actual.v_bp_lines + modeTiming->actual.vsync_width_lines;
	sane.hFP = modeTiming->actual.h_fp;
	sane.hBP = modeTiming->actual.h_bp;
	sane.vFP = modeTiming->actual.v_fp_lines;
	sane.vBP = modeTiming->actual.v_bp_lines;
	sane.hSync = modeTiming->actual.hsync_width;
	sane.vSync = modeTiming->actual.vsync_width_lines;
	sane.hSizemm = 160;
	sane.vSizemm = 90;
	sane.hborder = 0;
	sane.vborder = 0;
	sane.syncCode = modeTiming->syncCode;
	make_insane(&sane, &(hdmiDetail[j]));
      }
      j++;
    }
  }
  
  // now build the actual final HDMI record for write-out
  // first, zero out the array
  hdmi = calloc(128, sizeof(unsigned char));
  if( hdmi == NULL ) {
    fprintf(stderr, "can't allocate 128 bytes. Man, you are screwed!\n" );
    return NULL;
  }

  // now additively copy the structure fields in
  i = 0;
  memcpy( hdmi, &hdmi_top, sizeof(hdmi_top) );
  i += sizeof(hdmi_top);
  for( j = 0; j < num_modes; j++ ) {
    hdmi[i] = videoShortDescriptor[j];
    i++;
  }
  // insert the mid-structure
  memcpy( &(hdmi[i]), &hdmi_mid, sizeof(hdmi_mid) );
  i += sizeof(hdmi_mid);

  // copy over the detail descriptors until we're out of space, saving one byte for a checksum
  for( j = 0; (j < num_modes) && ((i + sizeof(struct detailDescriptors)) < 127 ); j++ ) {
    memcpy( &(hdmi[i]), &(hdmiDetail[j]), sizeof(struct detailDescriptors) );
    i += sizeof(struct detailDescriptors);
  }

  // calculate the checksum
  hdmi[127] = calcsum(hdmi);

  // now print out the assembled hdmi record as a sanity check
  for( i = 0; i < 128; i++ ) {
    if( ((i % 16) == 0) && (i != 0) ) {
      printf( "\n" );
    }
    printf( "%02x ", hdmi[i] );
  }

  printf( "\n" );

  return hdmi;
}

main()
{
    char modelist[128];
    memset(modelist, 0, 128);
    modelist[124] = 1;

    unsigned char *edid = make_edid(modelist);

    FILE *f=fopen("edid.bin","wb");
    fwrite(edid,1,128,f);
    fclose(f);

    f=fopen("edid.v","wb");
    int i;
    for(i=0;i<128;i++)
	fprintf(f,"edid[%d] = 8'h%02x;\n", i, edid[i]);
    fclose(f);

    f=fopen("edid_oculus.h","wb");
    fprintf(f,"{");
    for(i=0;i<128;i++)
	fprintf(f,"0x%02x%c", edid[i], i==127 ? ' ' : ',');
    fprintf(f,"}");
    fclose(f);

}