#cmpxchg8btest.s - An example of cmpxchg8btest instruction
#command to make it on 64 bit linux based systems: as -o cmpxchg8btest.o cmpxchg8btest.s && ld -o cmpxchg8btest cmpxchg8btest.o
#OR you can use simply: gcc -o cmpxchg8btest cmpxchg8btest.s BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
data:
    .byte 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88    #look, in the memory locations the bytes are arranged differently (reversed order)

.section .text
.globl _start
_start:
    movl $0x44332211, %eax
    movl $0x88776655, %edx
    movl $0x11111111, %ebx
    movl $0x22222222, %ecx      #cmpxchg8b is the same as cmpxchg but it works with 8-byte datas
    cmpxchg8b data              #cmpxchg8b will compare the data's content with the EDX:EAX regs (EDX upper bits, EAX lower)
    movl $0, %ebx
    movl $1, %eax
    int $0x80
