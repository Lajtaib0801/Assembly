#addtest3.s - An example of detecting a carry condition
.section .text
.globl _start
_start:
    movl $0, %ebx
    movb $190, %bl
    movb $100, %al
    addb %al, %bl
    jc over             #jump if the carry flag is set (BL > 255), this works with unsigned integers
    movl $1, %eax
    int $0x80

over:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
