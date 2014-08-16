// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2006 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            408-826-6000 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@latticesemi.com
// =============================================================================/
//                         FILE DETAILS
// Project      : LatticeMico32
// File         : lm32_functions.v
// Title        : Common functions
// Version      : 6.1.17
//              : Initial Release
// Version      : 7.0SP2, 3.0
//              : No Change
// Version      : 3.5
//              : Added function to generate log-of-two that rounds-up to
//              : power-of-two
// =============================================================================
					  
function integer clogb2;
input [31:0] value;
begin
   for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1)
        value = value >> 1;
end
endfunction 

function integer clogb2_v1;
input [31:0] value;
reg   [31:0] i;
reg   [31:0] temp;
begin
   temp = 0;
   i    = 0;
   for (i = 0; temp < value; i = i + 1)  
	temp = 1<<i;
   clogb2_v1 = i-1;
end
endfunction

