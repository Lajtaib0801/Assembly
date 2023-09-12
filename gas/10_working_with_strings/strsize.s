#strsize.s - Finding the size of a string using SCAS

.section .data
string1:
    .asciz "Tesing, one, two, three, testing.\n"

.section .text
.globl _start
_start:
    leal string1, %edi
    movl $0xffff, %ecx
    movb $0, %al
    cld
    repne scasb
    jne notfound
    subw $0xffff, %cx
    neg %cx
    dec %cx
    movl $1, %eax
    movl %ecx, %ebx
    int $0x80

notfound:
    movl $1, %eax
    movl $0, %ebx
    int $0x80