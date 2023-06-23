#Write processor's Vendor ID with linux system calls
#command to make it on 64 bit linux based systems: as -o cpuid.o cpuid.s && ld -o cpuid cpuid.o
.section .data
output:                     
    .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"

.section .text
.globl _start
_start:
    movl $0, %eax           #move 0 into the EAX register
    cpuid                   #call CPUID instruction --> the vendor id string pieces are placed consecutively into the EBX, EDX, ECX registers
    movl $output, %edi      #move the output's memory location into the EDI register
    movl %ebx, 28(%edi)     #overwrites the value of EBX into and from the EDI's 28st address (relative location, like pointers)
    movl %edx, 32(%edi)     #overwrites the value of EBX into and from the EDI's 32nd address
    movl %ecx, 36(%edi)     #overwrites the value of EBX into and from the EDI's 36st address
    movl $4, %eax           #move 4 into EAX --> system call value (write)
    movl $1, %ebx           #move 1 into EBX --> contains the file descriptor to write to (in UNIX like systems everything is handled as a file)
    movl $output, %ecx      #move output's address into the ECX register --> contains the first address of the string
    movl $42, %edx          #move 42 into EDX --> length of the string
    int $0x80               #software interrupt, tells the kernel that we want to invoke a syscall (now system write)
    movl $1, %eax           #move 1 into EAX --> this is the number of exit syscall
    movl $0, %ebx           #move 0 into EBX --> this is the return value of exit, it can be anything, if everything went well we usually write 0 (return 0)
    int $0x80               #invokes the exit syscall
