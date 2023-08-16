#nanotest.s - Another example of using system calls

.section .data
timespec:
    .int 0, 500000000                       #seconds, nanoseconds (500000000 => 0.5 sec)
output:
    .ascii "This is a test\n"
    .equ len, . - output

.section .bss
    .lcomm rem, 8

.section .text
.globl _start
_start:
    movl $10, %ecx

loop1:
    pushl %ecx
    movl $4, %eax
    movl $1, %ebx
    movl $output, %ecx
    movl $len, %edx
    int $0x80

    movl $162, %eax                         #162 => nanosleep
    movl $timespec, %ebx
    movl $rem, %ecx
    int $0x80
    popl %ecx
    loop loop1

    movl $1, %eax
    movl $0, %ebx
    int $0x80