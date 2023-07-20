;hello4.asm
extern printf									;tell the compiler that we will use an external function (printf)
section .data
	msg		db	"Hello, World!",0				;we need zero-terminated strings, if we use printf
	fmtstr	db	"This is our string: %s",10,0	;formatstring, like C

section .text
global main
main:
	push	rbp
	mov		rbp, rsp
	mov		rdi, fmtstr
	mov		rsi, msg
	mov		rax, 0
	call printf
	mov		rsp, rbp
	pop		rbp
	mov		rax, 60
	mov		rdi, 0
	syscall
