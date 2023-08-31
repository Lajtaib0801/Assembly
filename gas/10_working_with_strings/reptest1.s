#reptest1.s - An example of using REP instruction

.section .data
value1:
    .ascii "This is a test string.\n"

.section .bss
    .lcomm output, 23

.section .text
.globl _start
_start:
    leal value1, %esi
    leal output, %edi
    
    movl $23, %ecx
    cld
    rep movsb

    movl $1, %eax
    movl $0, %ebx
    int $0x80
    