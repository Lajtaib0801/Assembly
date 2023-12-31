#scastest2.s - An example of incorrectly using the SCAS instruction

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
    lodsl
    cld
    repne scasl
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