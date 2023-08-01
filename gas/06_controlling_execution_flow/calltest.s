#calltest.s - An example of using CALL instruction

.section .data
output:
    .asciz "This is section %d\n" 
.section .text
.globl _start
_start:
    pushl $1
    pushl $output
    call printf
    add $8, %esp        #clear the stack
    call overhere       #if we use a call, it'll jump over the 'overhere' label, but will jump back after the 'ret' is executed, like a function call
    pushl $3
    pushl $output
    call printf
    add $8, %esp
    pushl $0
    call exit           #here we will exit
overhere:
    pushl %ebp          #it's a function basically, so we need to save the EBP and then load it back to know where to go back
    movl %esp, %ebp
    pushl $2
    pushl $output
    call printf
    add $8, %esp
    movl %ebp, %esp
    popl %ebp
    ret
