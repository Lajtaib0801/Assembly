#ssetest.s - An example of using 128-bit SSE registers
.section .data
values1:
	.int 1, -1, 0, 135246
values2:
	.quad 1, -1		        #quad is 64bit, so this is 128bit data
.section .text
.globl _start
_start:                     #its basically the same as mmX regs, but 128bit
	movdqu values1, %xmm0	#xmm0 and xmm1 are 128bit registers, we have 8 of them
	movdqu values2, %xmm1

	movl $1, %eax
	movl $0, %ebx
	int $0x80
