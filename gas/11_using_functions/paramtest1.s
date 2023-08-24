    #paramtest1.s - Listing command line parameters

    .section .data
output1:
    .asciz "There are %d parameters:\n"
output2:
    .asciz "%s\n"

    .section .text
    .globl _start
_start:
    movl (%esp), %ecx       #first the ESP points to the number of parameters
    pushl %ecx
    pushl $output1
    call printf
    addl $4, %esp           #Add 4 byte to ESP --> points to the program's name
    popl %ecx
    movl %esp, %ebp         #copy ESP into EBP
    addl $4, %ebp           #+4 --> points to the first parameter

loop1:
    pushl %ecx              #here are the number of parameters
    pushl (%ebp)            #first parameter
    pushl $output2
    call printf
    addl $8, %esp           #clear out the output2 and the value of EBX from the stack
    popl %ecx               #pop the last one
    addl $4, %ebp           #next parameter
    loop loop1              #start it from the beginning
    pushl $0
    call exit
