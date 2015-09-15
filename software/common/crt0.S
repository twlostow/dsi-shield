.section    .boot, "ax", @progbits
.global	_start  
_start: 
.extern main
    xor     r0, r0, r0
    /* Setup stack and global pointer */
    mvhi    gp, hi(_gp)
    ori     gp, gp, lo(_gp)
    mvhi    r1, hi(_fbss)
    ori     r1, r1, lo(_fbss)
    mvi     r2, 0
    mvhi    r3, hi(_ebss)
    ori     r3, r3, lo(_ebss)
    sub     r3, r3, r1
    calli   memset
    mvi     r1, 0
    mvi     r2, 0
    mvi     r3, 0

    bi main
