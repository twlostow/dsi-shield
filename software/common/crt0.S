.section    .boot, "ax", @progbits
.global	_start  
_start: 
.extern main
    bi main
