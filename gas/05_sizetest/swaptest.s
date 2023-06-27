#swaptest.s - An example of using BSWAP instruction
#command to make it on 64 bit linux based systems: as -o swaptest.o swaptest.s && ld -o swaptest swaptest.o
#OR you can use simply: gcc -o swaptest swaptest.s BUT in this case you have to use 'main' instead of '_start' entry point
.section .text
.globl _start
_start:
    movl $0x12345678, %ebx      #move 0x12345678 into EBX
    bswap %ebx                  #swap the BYTES order => 0x12345678 --> 0x78563412
    movl $1, %eax
    int $0x80
