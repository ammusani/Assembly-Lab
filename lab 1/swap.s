	.file	"swap.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp	; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	; [rbp] <- [rsp]
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-8], 90	;[rbp-8] <- 90
	mov	DWORD PTR [rbp-4], 80	;[rbp-4] <- 80
	mov	eax, DWORD PTR [rbp-4]	;eax <- [rbp-4] 
	add	DWORD PTR [rbp-8], eax	;[rbp-8] <- eax
	mov	eax, DWORD PTR [rbp-4]	;eax <- [rbp-4]
	mov	edx, DWORD PTR [rbp-8]	;edx <- [rbp-8]
	sub	edx, eax		;edx <- eax
	mov	eax, edx		;eax <- edx
	mov	DWORD PTR [rbp-4], eax	;[rbp-4] <- eax; [rbp-4] = 90 
	mov	eax, DWORD PTR [rbp-4]	;eax <- [rbp-4]
	sub	DWORD PTR [rbp-8], eax	;[rbp-8] <- eax; [rbp-8] = 80
	mov	eax, 0			;eax <- 0
	pop	rbp			;rbp <- stack[top -0];
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
