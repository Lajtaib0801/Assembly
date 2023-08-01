#ssefloat.s - An example of moving SSE FP data types

.section .data
value1:
    .float 12.34, 2345.543, -3493.2, 0.44901        #4 32bit float
value2:
    .float -5439.234, 32121.0, 1.0094, 0.000003     #same

.section .bss
    .lcomm data, 16                                 #16bytes local common data reserved

.section .text
.globl _start
_start:
    movups value1, %xmm0                            #move 4 unaligned single precision values into xmm0
    movups value2, %xmm1                            #move 4 unaligned single precision values into xmm1
    movups %xmm0, %xmm2
    movups %xmm0, data

    movl $1, %eax
    movl $0, %ebx
    int $0x80
