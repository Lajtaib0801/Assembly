#bcdtest.s - An example of using BCD integer values
.section .data
data1:
	.byte 0x34, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00    #BCD value representing 1234
data2:
	.int 2
.section .text
.globl _start
_start:
	fbld data1                                                          #load data1 onto the FPU register stack (ST0)
	fimul data2                                                         #multiply ST0 with data2
	fbstp data1                                                         #moves the result (still stored in ST0) into data1
	movl $1, %eax
	movl $0, %ebx
	int $0x80
