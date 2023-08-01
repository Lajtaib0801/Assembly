#paritytest.s - An example of testing parity flag
.section .text
.globl _start
_start:
    movl $1, %eax
    movl $4, %ebx
    subl $3, %ebx       #EBX (4) - 3 = 1
    jp overthere        #if the result of the last instruction is even, it'll jump onto the 'overthere'
    int $0x80
overthere:
    movl $100, %ebx
    int $0x80
