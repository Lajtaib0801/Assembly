#movtest1.s - An example of moving data from memory to register
#command to make it on 64 bit linux based systems: as -o movtest1.o movtest1.s && ld -o movtest1 movtest1.o
#OR you can use simply: gcc -o movtest1 movtest1.s -no-pie BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
    value:
        .int 1
.section .text
.globl _start
_start:
    nop
    movl value, %ecx
    movl $1, %eax
    movl $0, %ebx
    int $0x80
