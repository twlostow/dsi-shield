/***
This code uses the BSD 2-clause license:

Copyright (c) 2011
  Andrew "bunnie" Huang / bunnie@bunniestudios.com
  Sean Cross / scross@chumby.com
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
#ifndef _MATCHMODE_TIMING_RANGES_H_
#define _MATCHMODE_TIMING_RANGES_H_

enum timing_status {
	STATUS_UNKNOWN,		/* Daemon just started up */
	STATUS_OK,		/* Running in a supported mode */
	STATUS_DISCONNECTED,	/* No sink connected */
	STATUS_INVALID,		/* Source is running in an unsupported mode, or disconnected */
	STATUS_NOSOURCE,        /* No source connected */
};

struct timing_info {
	unsigned int hactive;
	unsigned int vactive;
	int htotal;
	unsigned int vtotal_pix;
	unsigned int vtotal_lines;
	unsigned int h_fp;
	unsigned int h_bp;
	unsigned int v_fp_pix;
	unsigned int v_fp_lines;
	unsigned int v_bp_pix;
	unsigned int v_bp_lines;
	unsigned int hsync_width;
	unsigned int vsync_width_pix;
	unsigned int vsync_width_lines;
	unsigned int refclock_count;
	unsigned int lcd_de_latency_lines;
	unsigned int lcd_vsync_latency_lines;
	unsigned int fields;
	double pixclk_in_MHz;
	double ns_per_pix;
	enum timing_status status;
};

struct timing_range {
  struct timing_info lower;
  struct timing_info upper;
  struct timing_info actual;
  char *name;
  int number;
  int syncCode;
};

static struct timing_range mode_1 = {
	.actual = {
		.hactive = 640,
		.vactive = 480,

		.htotal = 800,
		.vtotal_lines = 525,

		.h_fp = 48,
		.h_bp = 16,
		.hsync_width = 96,

		.v_fp_lines = 10,
		.v_bp_lines = 33,
		.vsync_width_lines = 2,

		.pixclk_in_MHz = 25.175,

		.status = STATUS_OK,
		.fields = 1,
	},
	.name = "mode 1 480p 4:3",
	.number = 1,
	.syncCode = 0x18,  // digital separate sync, vertical sync is negative; hsync is negative
};

static struct timing_range mode_2 = {
	.actual = {
		.hactive = 720,
		.vactive = 480,

		.htotal = 858,
		.vtotal_lines = 525,

		.h_fp = 60,
		.h_bp = 16,
		.hsync_width = 62,

		.v_fp_lines = 9,
		.v_bp_lines = 30,
		.vsync_width_lines = 6,

		.pixclk_in_MHz = 27.0,

		.status = STATUS_OK,
		.fields = 1,
	},
	.name = "mode 2 480p anamorphic",
	.number = 2,
	.syncCode = 0x1e,  // digital separate sync, vertical sync is positive; hsync is positive
};

static struct timing_range mode_4 = {
	.actual = {
		.hactive = 1280,
		.vactive = 720,

		.htotal = 1650,
		.vtotal_lines = 750,

		.h_fp = 220,
		.h_bp = 110,
		.hsync_width = 40,

		.v_fp_lines = 5,
		.v_bp_lines = 20,
		.vsync_width_lines = 5,

		.pixclk_in_MHz = 74.176,

		.status = STATUS_OK,
		.fields = 1,
	},
	.name = "mode 4 720p60",
	.number = 4,
	.syncCode = 0x1e,  // digital separate sync, vertical sync is positive; hsync is positive
};

static struct timing_range mode_5 = {
	.actual = {
		.hactive = 1920,
		.vactive = 540,

		.htotal = 2200,
		.vtotal_lines = 562,

		.h_fp = 148,
		.h_bp = 92,
		.hsync_width = 40,

		.v_fp_lines = 16,
		.v_bp_lines = 2,
		.vsync_width_lines = 4,

		.pixclk_in_MHz = 74.176,

		.status = STATUS_OK,
		.fields = 2,
	},
	.name = "mode 5 1080i",
	.number = 5,
	.syncCode = 0x1e,  // digital separate sync, vertical sync is positive; hsync is positive
};

static struct timing_range mode_17 = {
	.actual = {
		.hactive = 720,
		.vactive = 576,

		.htotal = 864,
		.vtotal_lines = 625,

		.h_fp = 68,
		.h_bp = 12,
		.hsync_width = 64,

		.v_fp_lines = 5,
		.v_bp_lines = 39,
		.vsync_width_lines = 5,

		.pixclk_in_MHz = 27.00,

		.status = STATUS_OK,
		.fields = 1,
	},
	.name = "mode 17 576p PAL",
	.number = 17,
	.syncCode = 0x18,  // digital separate sync, vertical sync is negative; hsync is negative
};

static struct timing_range mode_19 = {
	.actual = {
		.hactive = 1280,
		.vactive = 720,

		.htotal = 1980,
		.vtotal_lines = 750,

		.h_fp = 220,
		.h_bp = 440,
		.hsync_width = 40,

		.v_fp_lines = 5,
		.v_bp_lines = 20,
		.vsync_width_lines = 5,

		.pixclk_in_MHz = 74.250,

		.status = STATUS_OK,
		.fields = 1,
	},
	.name = "mode 19 720p50",
	.number = 19,
	.syncCode = 0x1e,  // digital separate sync, vertical sync is positive; hsync is positive
};

static struct timing_range mode_20 = {
	.actual = {
		.hactive = 1920,
		.vactive = 540,

		.htotal = 2640,
		.vtotal_lines = 562,

		.h_fp = 148,
		.h_bp = 528,
		.hsync_width = 44,

		.v_fp_lines = 16,
		.v_bp_lines = 2,
		.vsync_width_lines = 4,

		.pixclk_in_MHz = 74.25,

		.status = STATUS_OK,
		.fields = 2,
	},
	.name = "mode 20 1080i50",
	.number = 20,
	.syncCode = 0x1e,  // digital separate sync, vertical sync is positive; hsync is positive
};


static struct timing_range mode_32 = {
	.actual = {
		.hactive = 1920,
		.vactive = 1080,

		.htotal = 2750,
		.vtotal_lines = 1125,

		.h_fp = 148,
		.h_bp = 638,
		.hsync_width = 44,

		.v_fp_lines = 4,
		.v_bp_lines = 36,
		.vsync_width_lines = 5,

		.pixclk_in_MHz = 74.176,

		.status = STATUS_OK,
		.fields = 1,
	},
	.name = "mode 32 1080p24",
	.number = 32,
	.syncCode = 0x1e,  // digital separate sync, vertical sync is positive; hsync is positive
};

static struct timing_range *timings[] = {
	&mode_1,
	&mode_2,
	&mode_4,
	&mode_5,
	&mode_17,
	&mode_19,
	&mode_20,
	&mode_32,
	NULL,
};


#endif /* _MATCHMODE_TIMING_RANGES_H_ */
