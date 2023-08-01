#cmptest.s - An exampple of using CMP and JGE instruction
.section .text
.globl _start
_start:
    movl $15, %eax
    movl $10, %ebx
    cmp %eax, %ebx      #it'll subtract the value of EAX from EBX
    jge greater         #if EBX >= EAX (EBX - EAX >= 0) it'll jump to greater, in this case 10 is not greater than 15, so we won't jump onto the 'greater' label
    movl $1, %eax
    int $0x80
greater:                #from this the code won't be executed|
    movl $20, %ebx      #                                    |
    movl $1, %eax       #                                    v
    int $0x80
