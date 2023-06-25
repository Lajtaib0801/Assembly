#sizetest3.s - A sample program to view the executable size
#command to make it on 64 bit linux based systems: as -o sizetest3.o sizetest3.s && ld -o sizetest3 sizetest3.o
#OR you can use simply: gcc -o sizetest3 sizetest3.s -no-pie BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
buffer:
	.fill 10000
.section .text
.globl _start
_start:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
