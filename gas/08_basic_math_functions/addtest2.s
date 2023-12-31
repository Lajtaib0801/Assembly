#addtest2.s - An example of ADD instruction ad negative numbers

.section .data
data:
    .int -40

.section .text
.globl _start
_start:
    movl $-10, %eax
    movl $-200, %ebx
    movl $80, %ecx
    addl data, %eax     #addx works both with signed and unsigned integers
    addl %ecx, %eax
    addl %ebx, %eax
    addl %eax, data
    addl $210, data
    movl $1, %eax
    movl $0, %ebx
    int $0x80
