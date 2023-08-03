#addtest4.s - An example of detecting an overflow condition
.section .data
output:
    .asciz "The result is: %d\n"
.section .text
.globl _start
_start:
    movl $-1590876934, %ebx
    movl $-1259230143, %eax
    addl %eax, %ebx
    jo over                     #jump if the overflow flag is set
    pushl %ebx                  #push the 2nd parameter of printf onto the stack
    pushl $output               #push the 1st parameter of printf onto the stack
    call printf
    add $8, %esp                #clear the stack
    pushl $0
    call exit
over:
    pushl $0
    pushl $output
    call printf
    add $8, %esp
    pushl $0
    call exit
