#fpuvals.s - An example of pushing floating pont constants

.section .text
.globl main
main:
    fld1
    fldl2t
    fldl2e
    fldpi
    fldlg2
    fldln2
    fldz

    movl $1, %eax
    movl $0, %ebx
    int $0x80
