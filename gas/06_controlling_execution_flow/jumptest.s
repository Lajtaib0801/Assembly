#jumptest.s - An example of jmp instruction
.section .text
.globl _start
_start:
    movl $1, %eax
    jmp overhere        #jumps onto the 'overhere' label, the next 2 lines won't be executed
    movl $10, %ebx      #<--
    int $0x80           #<--
overhere:
    movl $20, %ebx
    int $0x80
