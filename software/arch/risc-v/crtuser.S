  .section    .boot, "ax", @progbits

#define MSTATUS_IE 0x00000001
#define EXCEPT_IRQ (1<<10)
#define EXCEPT_TIMER (1<<9)

 .global _start
_start:
    j _entry



_entry:
	nop
	nop

	la      gp, _gp                 # Initialize global pointer
	la      sp, _fstack
	
	la t0, _fexception_stack
	csrrw t0, mscratch, t0

# clear the bss segment
	la	t0, _fbss
	la	t1, _end
1:
#ifdef __riscv64
	sd	zero,0(t0)
	addi	t0, t0, 8
#else
	sw	zero,0(t0)
	addi	t0, t0, 4
#endif
	bltu	t0, t1, 1b


        call    main

.section .text
.ascii "\n\n\n\n RISC-V rules! \n\n\n\n"
