#pushpop.s - An example of using the PUSH and POP instructions
.section .data
data:
    .int 125

.section .text
.globl _start
_start:
    movl $24420, %ecx
    movw $350, %bx
    movb $100, %al
    pushl %ecx          #push 4 bytes onto the stack
    pushw %bx           #push 2 bytes onto the stack
s
    pushl %eax          #push 4 bytes onto the stack
    pushl data          #push the values of data onto the stack (4 bytes)
    pushl $data         #push the memory location of data onto the stack (4 bytes)
    
    popl %eax           #get data from the stack
    popl %eax
    popl %eax
    popw %ax
    popl %eax
    movl $0, %ebx
    movl $1, %eax
    int $0x80
    
