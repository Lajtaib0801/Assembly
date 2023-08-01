#movtest4.s - An example of indirect addressing
#command to make it on 64 bit linux based systems: as -o movtest4.o movtest4.s && ld -o movtest4 movtest4.o
#OR you can use simply: gcc -o movtest4 movtest4.s -no-pie BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
values:
	.int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60	#create an array with 4 bit numbers
.section .text
.globl _start
_start:
	movl values, %eax				#move the first element of values into EAX	
	movl $values, %edi				#move the memory location of values into EDI	
	movl $100, 4(%edi)				#overwrite the 2nd element of the values with 100
	movl $1, %edi					#move 1 into EDI
	movl values(, %edi, 4), %ebx	#move the 'values[1]' element into EBX (this will be the exit value)
	movl $1, %eax					#move 1 into EAX (exit)
	int $0x80					    #call exit
