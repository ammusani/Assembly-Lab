	.file	"pointers.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp			;; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp		; rbp <- [rsp]
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-32], 90		;[rbp-32] <- 90
	mov	DWORD PTR [rbp-28], 98	;	[rbp-28] <- 98
	lea	rax, [rbp-32]						;rax <- [rbp-32]
	mov	QWORD PTR [rbp-24], rax	;[rbp-24] <- rax
	lea	rax, [rbp-28]						;rax <- [rbp-28]
	mov	QWORD PTR [rbp-16], rax	;[rbp-16] <- rax;
	mov	rax, QWORD PTR [rbp-24]	;rax <- [rbp-24]
	mov	QWORD PTR [rbp-8], rax		;[rbp-8] <- rax
	mov	rax, QWORD PTR [rbp-16]	;rax <- [rbp-16]
	mov	QWORD PTR [rbp-24], rax	;[rbp-24] <- rax
	mov	rax, QWORD PTR [rbp-8]		;rax <- [rbp-8]
	mov	QWORD PTR [rbp-16], rax	;[rbp-16] <- rax
	mov	eax, 0							;eax <- 0
	pop	rbp							; rbp <- stack[top -0];
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
