	.file	"swap.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-8], 90
	mov	DWORD PTR [rbp-4], 80
	mov	eax, DWORD PTR [rbp-4]
	add	DWORD PTR [rbp-8], eax
	mov	eax, DWORD PTR [rbp-4]
	mov	edx, DWORD PTR [rbp-8]
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR [rbp-4], eax
	mov	eax, DWORD PTR [rbp-4]
	sub	DWORD PTR [rbp-8], eax
	mov	eax, 0
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
