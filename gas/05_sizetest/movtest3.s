#movtest3.s - Another example of using indexed memory locations
#command to make it on 64 bit linux based systems: as -o movtest3.o movtest3.s --32 && ld -dynamic-linker /lib/ld-linux.so.2 -o movtest3 -lc movtest3.o -m elf_i386
#OR you can use simply: gcc -o movtest3 movtest3.s -no-pie -m32 BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
output:                                                 #this'll be the string for the printf
    .asciz "The value is %d\n"
values:
    .int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60     #this is the 'array' what we'll iterate through
.section .text
.globl _start
_start:
    movl $0, %edi                                       #EDI has been sat to 0, this will contain the index where we are in the array
loop:
    movl values(, %edi, 4), %eax                        #move the EDIst element of values to EAX, syntax --> base_address(offset_address, index, size[.int is 4 bytes])
    pushl %eax                                          #push the value of EAX onto the stack (2nd parameter of printf)
    pushl $output                                       #push the value of output onto the stack (1st parameter of printf)
    call printf                                         
    addl $8, %esp                                       #set the stack pointer to default
    inc %edi                                            #increase the EDI by 1
    cmpl $11, %edi                                      #compare 11 with the value of EDI
    jne loop                                            #jump not equal, if EDI not equals to 11, jumps to the loop tag
    movl $0, %ebx                                       #if EDI = 11, move 0 into EBX (return value)
    movl $1, %eax                                       #move 1 into EAX (exit)
    int $0x80                                           #call exit
