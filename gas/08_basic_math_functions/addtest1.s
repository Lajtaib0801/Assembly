#addtest1.s - An example of the ADD instruction
.section .data
data:
    .int 40
.section .text
.globl _start
_start:
    movl $0, %eax       #zero the EAX
    movl $0, %ebx       #zero the EBX
    movl $0, %ecx       #zero the ECX
    movb $20, %al       #move a byte (20) into al
    addb $10, %al       #add a byte (10) to al
    movsx %al, %eax     #if we want to move the content of a less-byte register into a more-byte register, we need to extend it with more zeros because of the magnitude difference
    movw $100, %cx      #move a word (16bits) into ECX
    addw %cx, %bx       #add CX to BX (these two regs has the same magnitude, so we don't need to worry about the non-zero bits)
    movsx %bx, %ebx     #same as before, it will copy the value of BX into EBX but it'll clear the upper bits aswell
    movl $100, %edx     #copy 100 into EBX
    addl %edx, %edx     #add EDX into EDX (EDX * 2 basically)
    addl data, %eax     #add the value stored in data (40) to EAX
    addl %eax, data     #add the value of EAX to the value of data

    movl $1, %eax
    movl $0, %ebx
    int $0x80

