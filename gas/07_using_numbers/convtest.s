#convtest.s  - An example of data conversion
.section .data
value1:
    .float 1.25, 124.79, 200.0, -312.5
value2:
    .int 1, -435, 0, -25

.section .bss
    .lcomm data, 16

.section .text
.globl _start
_start:
    cvtps2dq value1, %xmm0              #converts single-precision FP to packed double-precision FP
    cvttps2dq value1, %xmm1             #converts packed single-precision FP to packed doubleword integers
    cvtdq2ps value2, %xmm2              #converts packed doubleword integers to packed single-prec. FP
    movdqu %xmm0, data

    movl $1, %eax
    movl $0, %ebx
    int $0x80
