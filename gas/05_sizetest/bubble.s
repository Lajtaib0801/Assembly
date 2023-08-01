#bubble.s - An example of the XCHG instruction
.section .data
values:
    .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl _start
_start:
    movl $values, %esi      #values memory location into ESI
    movl $9, %ecx           #this is the 
    movl $9, %ebx
loop:
    movl (%esi), %eax       #moves the first value of ESI into EAX
    cmp %eax, 4(%esi)       #compares EAX with the 2nd element of ESI
    jge skip                #jump greater equal, if EAX>=ESI 2nd element, jumps to skip
    xchg %eax, 4(%esi)      #swaps EAX and 2nd element of ESI
    movl %eax, (%esi)       #moves the content of EAX into the the first element of ESI
skip:
    add $4, %esi            #adds 4 to the ESI (value's memory location) --> now, the array will start from the 2nd elemnt
    dec %ebx                #EBX--
    jnz loop                #jump not zero, ZF is not set, EBX != 0
    dec %ecx                #ECX--
    jz end                  #if ZF is set, ECX == 0, jump to end
    movl $values, %esi      #moves the location of values into ESI
    movl %ecx, %ebx         
    jmp loop                #jumps to loop
end:                        #program exits
    movl $1, %eax           
    movl $0, %ebx
    int $0x80

/*
a bubble sort algorithm looks like this in a higher level lang. btw

for (int i = array_size - 1; i > 0; i--)
{
    for (int j = 0; j < i; j++)
    {
        if (array[j] > array[j + 1])
            swap(array[j], array[j + 1]);
    }
}
*/


