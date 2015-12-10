// See LICENSE for license details.

#ifndef RISCV_CSR_ENCODING_H
#define RISCV_CSR_ENCODING_H

#define CSR_ID_CYCLESH 0xc80
#define CSR_ID_CYCLESL 0xc00
#define CSR_ID_TIMEH 0xc81
#define CSR_ID_TIMEL 0xc01
#define CSR_ID_MSCRATCH 0x340
#define CSR_ID_MEPC 0x341
#define CSR_ID_MSTATUS 0x300
#define CSR_ID_MCAUSE 0x342
#define CSR_ID_MIP 0x344
#define CSR_ID_MIE 0x304

#ifdef __GNUC__

#define rv_read_csr(reg) ({ unsigned long __tmp; \
  asm volatile ("csrr %0, " #reg : "=r"(__tmp)); \
  __tmp; })

#define rv_write_csr(reg, val) \
  asm volatile ("csrw " #reg ", %0" :: "r"(val))

#define rv_swap_csr(reg, val) ({ long __tmp; \
  asm volatile ("csrrw %0, " #reg ", %1" : "=r"(__tmp) : "r"(val)); \
  __tmp; })

#define rv_set_csr(reg, bit) ({ unsigned long __tmp; \
  if (__builtin_constant_p(bit) && (bit) < 32) \
    asm volatile ("csrrs %0, " #reg ", %1" : "=r"(__tmp) : "i"(bit)); \
  else \
    asm volatile ("csrrs %0, " #reg ", %1" : "=r"(__tmp) : "r"(bit)); \
  __tmp; })

#define rv_clear_csr(reg, bit) ({ unsigned long __tmp; \
  if (__builtin_constant_p(bit) && (bit) < 32) \
    asm volatile ("csrrc %0, " #reg ", %1" : "=r"(__tmp) : "i"(bit)); \
  else \
    asm volatile ("csrrc %0, " #reg ", %1" : "=r"(__tmp) : "r"(bit)); \
  __tmp; })

#define rv_rdtime() rv_read_csr(time)
#define rv_rdcycle() rv_read_csr(cycle)

#endif

#endif
