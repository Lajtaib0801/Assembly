#movsxtest.s - An example of the MOVSX instruction
.section .text
.globl _start
_start:
    movw $-79, %cx
    movl $0, %ebx
    movw %cx, %bx
    movsx %cx, %eax     #CX has a smaller range of bytes, so the upper bytes of EAX will be zeroed first, after it copies the value into it
    movl $1, %eax
    movl $0, %ebx
    int $0x80
