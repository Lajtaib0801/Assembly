#scastest1.s - An example of SCAS instruction

.section .data
string1:
    .ascii "This is a test - a long test string to scan."
    length = . - string1

string2:
    .ascii "-"

.section .text
.globl _start
_start:
    leal string1, %edi
    leal string2, %esi
    movl $length, %ecx
    lodsb
    cld
    repne scasb
    jne notfound
    subw $length, %cx
    neg %cx
    movl $1, %eax
    movl %ecx, %ebx
    int $0x80

notfound:
    movl $1, %eax
    movl $0, %ebx
    int $0x80