#cpuid with printf (C library calls)
#command to make it on 64 bit linux based systems: as -o cpuid2.o cpuid2.s --32 && ld -dynamic-linker /lib/ld-linux.so.2 -o cpuid2 -lc cpuid2.o -m elf_i386
#OR you can use simply: gcc -o cpuid2 cpuid2.s -no-pie -m32 BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
output:
	.asciz "The processor Vendor ID is '%s'\n"	#asciz adds \0 to the end of the string, ascii doesn't
							        #printf expects a null terminated string, so we need it
.section .bss						#the value of the buffer is not defined, so it goes into the .bss
	.lcomm buffer, 12				#this will contain the 12 bytes long vendor id

.section .text
.globl _start
_start:
	movl $0, %eax					#moves 0 into EAX, this defines the CPUID output option
	cpuid						    #call cpuid --> moves string pieces into the EBX, EDX, EXC registers
	movl $buffer, %edi				#buffer's location moved into the EDI register
	movl %ebx, (%edi)				#moves the contents of EBX (first 4 bytes of the ID) into the first 4 bytes of the location stored in the EDI
	movl %edx, 4(%edi)				#moves the contents of EDX (5th-8th bytes of the ID) into the 5-8 bytes from the location stored in EDI
	movl %ecx, 8(%edi)				#moves the contents of ECX (9th-12th bytes of the ID) into the 9-12 bytes from the location stored in EDI
	pushl $buffer					#pushes the buffers location into the stack, this will be the 2nd parameter of the printf
	pushl $output					#pushes the $outputs location into the stack, this will be the 1st parameter of the printf
	call printf					    #calls printf
	addl $8, %esp					#adds 8 to the ESP (stack pointer), with this we can LOGICALLY erase its content (2 4-bytes data, so we need to add 8 to 'clear' it)
	pushl $0					    #pushes 0 into the stack, this will be the sole parameter of the exit function
	call exit					    #we call it
