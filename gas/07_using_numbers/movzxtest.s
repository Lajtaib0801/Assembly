# movzxtest.s - An exmapple of using MOVZX instruction

.section .text
.globl _start
_start:
  movl $279, %ecx
  movzx %cl, %ebx
  movl $1, %eax
  int $0x80
