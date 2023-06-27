#cmpxchgtest.s - An example of the cmpxchg instruction
#command to make it on 64 bit linux based systems: as -o cmpxchgtest.o cmpxchgtest.s && ld -o cmpxchgtest cmpxchgtest.o
#OR you can use simply: gcc -o cmpxchgtest cmpxchgtest.s BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
data:
    .int 10
.section .text
.globl _start
_start:
    movl $10, %eax
    movl $5, %ebx
    cmpxchg %ebx, data      #compares data with EAX, if they are eq., it moves EBX into data
    movl $1, %eax
    int $0x80
