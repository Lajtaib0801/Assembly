# movtest2.s - An example of moving register data to memory
#command to make it on 64 bit linux based systems: as -o movtest2.o movtest2.s && ld -o movtest2 movtest2.o
#OR you can use simply: gcc -o movtest2 movtest2.s -no-pie BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
    value:
        .int 1
.section .text
.globl _start
_start:
    nop
    movl $100, %eax
    movl %eax, value
    movl $1, %eax
    movl $0, %ebx
    int $0x80
