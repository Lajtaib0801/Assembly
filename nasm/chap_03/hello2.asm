;hello2.asm
section .data
	msg	db	"hello, world",0
	NL	db	0xa   ;new line character
section .bss
section .text
global main
main:
	mov	rax, 1		;1 = write
	mov	rdi, 1		;1 = stdout
	mov	rsi, msg	;string to display
	mov	rdx, 12		;length of the string
	syscall			  ;display it
	mov	rax, 1		;1 = write
	mov	rdi, 1		;1 = stdout
	mov	rsi, NL		;display the new line
	mov	rdx, 1		;length of the string
	syscall			  ;display it
	mov	rax, 60		;60 = exit
	mov	rdi, 0		;exit code
	syscall			  ;perform
