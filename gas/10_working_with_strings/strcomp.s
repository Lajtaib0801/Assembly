#strcomp.s - An example of comparing strings

.section .data
string1:
    .ascii "test"
    len1 = . - string1

string2:
    .ascii "test1"
    len2 = . - string2

.section .text
.globl _start
_start:
    lea string1, %esi
    lea string2, %edi
    movl $len1, %ecx
    movl $len2, %eax
    cmpl %eax, %ecx
    ja longer
    xchg %ecx, %eax
    
longer:
    cld
    repe cmpsb
    je equal
    jg greater

less:
    movl $1, %eax
    movl $255, %ebx
    int $0x80

greater:
    movl $1, %eax
    movl $1, %ebx
    int $0x80

equal:
    movl $len1, %ecx
    movl $len2, %eax
    cmpl %ecx, %eax
    jg greater
    jl less
    movl $1, %eax
    movl $0, %ebx
    int $0x80
