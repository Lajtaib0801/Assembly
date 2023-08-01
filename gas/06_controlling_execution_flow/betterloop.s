#betterloop.s - An example of using loop and jcxz instructions
.section .data
output:
    .asciz "The value is: %d\n"

.section .text
.globl _start
_start:
    movl $0, %ecx
    movl $0, %eax
    jcxz done           #it checks whether the ECX's value is 0 at the beginning, if so, it won't start to iterate at all
loop1:                  #the problem is if we use loop, it will decrease the value of ECX first and after checks whether it is zero or not
    addl %ecx, %eax     #if it's 0 at the beginning, it will run a until it reaches 0 again from -1 to -(2^32) and then 2^32 to 0, it'll last for several seconds, waste of performance
    loop loop1
done:
    pushl %eax
    pushl $output
    call printf
    movl $1, %eax
    movl $0, %ebx
    int $0x80
