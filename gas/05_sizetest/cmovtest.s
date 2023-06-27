#cmovtest.s - An example of the CMOV instructions
#command to make it on 64 bit linux based systems: as -o cmovtest.o cmovtest.s --32 && ld -dynamic-linker /lib/ld-linux.so.2 -o cmovtest -lc cmovtest.o -m elf_i386
#OR you can use simply: gcc -o cmovtest cmovtest.s -no-pie -m32 BUT in this case you have to use 'main' instead of '_start' entry point
.section .data
output:
    .asciz "The largest value is %d\n"
values:
    .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
    movl values, %ebx                                   #moves the first value of values into EBX
    movl $1, %edi                                       #moves 1 into EDI
loop:
    movl values(, %edi, 4), %eax                        #moves the values[EDI] element into EAX
    cmp %ebx, %eax                                      #compares EBX, and EAX (2nd operand - 1st operand, 0 <, 0 >, 0 =)
    cmova %eax, %ebx                                    #if 2nd operand is greater than 1st (EAX>EBX), it moves EAX into EBX
    inc %edi                                            #EDI + 1
    cmp $10, %edi                                       #compares EDI and 10
    jne loop                                            #jump not equal, if EDI is not 10 then jump into the loop label
    pushl %ebx                                          #pushes EBX onto the stack
    pushl $output                                       #pushes output onto the stack
    call printf                                         
    addl $8, %esp
    pushl $0
    call exit
