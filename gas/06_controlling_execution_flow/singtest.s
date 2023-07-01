#singtest.s - An example of using the sign flag
.section .data
value:
    .int 21, 15, 34, 11, 6, 50, 32, 80, 10, 2
output:
    .asciz "The value is: %d\n"
.section .text
.globl _start
_start:
    movl $9, %edi
loop:
    pushl value(, %edi, 4)  #pushes the EDIst element of value onto the stack
    pushl $output           #pushes the memory location of output onto the stack
    call printf
    add $8, %esp            #set the ESP to the default value
    dec %edi                #decrement EDI by 1
    jns loop                #jump not sign, if EDI reaches -1, it exits
    movl $1, %eax
    movl $0, %ebx
    int $0x80
