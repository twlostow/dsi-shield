#include <stdint.h>

struct rv_trap_context {
    uint32_t r[32];
    uint32_t mstatus;
    uint32_t mepc;
    uint32_t mbadaddr;
    uint32_t mcause;
};

void undefined_insn_handler( struct rv_trap_context *ctx )
{
    uint32_t insn = *(volatile uint32_t *)( ctx->mepc );

    ctx->r[0] = 0;

    uint32_t rs1 = ctx->r[(insn >> 15) & 0x1f];
    uint32_t rs2 = ctx->r[(insn >> 20) & 0x1f];
    uint32_t rdi = (insn >> 7) & 0x1f;

    // we support MUL natively
    if ( (insn & 0xfe00707f) == 0x2001033 ) // MULH
        ctx->r[rdi] = ( (int64_t)(int32_t)rs1 * (int64_t)(int32_t) rs2) >> 32;
    else if ( (insn & 0xfe00707f) == 0x2002033 ) // MULHSU
        ctx->r[rdi] = ((int64_t)(int32_t)rs1 * (uint64_t) rs2) >> 32;
    else if ( (insn & 0xfe00707f) == 0x2003033 ) // MULHU
        ctx->r[rdi] = ((uint64_t) rs1 * (uint64_t) rs2) >> 32;
    else if ( (insn & 0xfe00707f) == 0x2004033 ) // DIV
        ctx->r[rdi] = (int32_t)rs1 / (int32_t) rs2;
    else if ( (insn & 0xfe00707f) == 0x2005033 ) // DIVU
        ctx->r[rdi] = (uint32_t)rs1 / (uint32_t) rs2;
    else if ( (insn & 0xfe00707f) == 0x2006033 ) // REM
        ctx->r[rdi] = (int32_t)rs1 % (int32_t) rs2;
    else if ( (insn & 0xfe00707f) == 0x2007033 ) // REMU
        ctx->r[rdi] = (uint32_t)rs1 % (uint32_t) rs2;

    ctx->mepc += 4;

    asm volatile ("csrc mip, 0x4"); // clear exception
}