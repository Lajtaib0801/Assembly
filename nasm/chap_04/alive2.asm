;alive2.asm

section .data
	msg1	db	"Hello, World!",0
	msg2	db	"Alive and Kicking!",0
	radius	dd	357
	pi		dq	3.14
	fmtstr	db	"%s",10,0		;format for printing a string
	fmtflt	db	"%lf",10,0		;format for printing a float
	fmtint	db	"%d",10,0		;format for an integer
	
section .text
extern printf
global	main
main:
	push	rbp
	mov	rbp, rsp
;print msg1
	mov	rax, 0
	mov	rdi, fmtstr
	mov	rsi, msg1
	call	printf
;print msg2
	mov	rax, 0
	mov	rdi, fmtstr
	mov	rsi, msg2
	call	printf
;print radius
	mov	rax, 0
	mov	rdi, fmtint
	mov	rsi, [radius]
	call	printf
;print pi
	mov	rax, 1
	movq	xmm0, [pi]
	mov	rdi, fmtflt
	call	printf
	mov	rsp, rbp
	pop	rbp
	ret
