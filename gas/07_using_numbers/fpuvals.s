#fpuvals.s - An example of pushing floating pont constants

.section .text
.globl main
main:
    fld1                #pushes +1.0 onto the FPU stack
    fldl2t              #pushes log(base 2)10 onto the FPU stack
    fldl2e              #pushes log(base 2)e onto the FPU stack
    fldpi               #pushes pi onto the FPU stack
    fldlg2              #pushes log(base 10)2 onto the FPU stack
    fldln2              #pushes log(base e)2 onto the FPU stack
    fldz                #pushes +0.0 onto the FPU stack

    movl $1, %eax
    movl $0, %ebx
    int $0x80
