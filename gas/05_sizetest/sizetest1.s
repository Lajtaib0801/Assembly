#sizetest1.s - A sample program to view the executable size
#command to make it on 64 bit linux based systems: as -o sizetest1.o sizetest1.s && ld -o sizetest1 sizetest1.o
#OR you can use simply: gcc -o sizetest1 sizetest1.s -no-pie BUT in this case you have to use 'main' instead of '_start' entry point
.globl _start
_start:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
