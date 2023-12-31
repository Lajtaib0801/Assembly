#movstest2.s

.section .data
value1:
    .ascii "This is a test string.\n"

.section .bss
    .lcomm output, 23

.section .text
.globl _start
_start:
    leal value1+22, %esi
    leal output+22, %edi

    std                     #set the DF flag --> EDI and ESI will be decremented
    movsb
    movsw
    movsl

    movl $1, %eax
    movl $0, %ebx
    int $0x80
