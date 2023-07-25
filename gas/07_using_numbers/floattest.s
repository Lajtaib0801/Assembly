# floattest.s - An example of using floating point numbers

.section .data
value1:
	.float 12.43
value2:
	.double 2353.631
	
.section .bss
	.lcomm data, 8
	
.section .text
.globl _start
_start:
	flds value1			#load single-precision floating point number
	fldl value2			#load double-precision floating point number
	fstl data			#retrieving the top value on the FPU register stack and placing it on a mem. loc.
						#fstl, because it's a double-precision floating point number
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	