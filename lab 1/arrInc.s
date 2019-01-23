	.file	"arrInc.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	push	rbp				;stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp		; rbp <- rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16			;rsp <- rsp -16
	mov	edi, 16			; edi <- 16; edi = 16
	call	malloc				; calling memory allocation
	mov	QWORD PTR [rbp-8], rax	; 	 [rbp-8] <- rax ; 
	mov	rax, QWORD PTR [rbp-8]			;rax <- [rbp-8]
	mov	DWORD PTR [rax], 1			rax <- 1
	mov	rax, QWORD PTR [rbp-8]		 ;rax <- [rbp-8]
	lea	rdx, [rax+4]						;rdx <- [rax + 4];	rdx =1
	mov	QWORD PTR [rbp-8], rdx		; [rbp-8] <- rdx
	mov	DWORD PTR [rax], 2			; rax <- 2
	mov	rax, QWORD PTR [rbp-8]			;rax <- [rbp-8]
	lea	rdx, [rax+4]							;rdx <- [rax + 4];	rdx = 2
	mov	QWORD PTR [rbp-8], rdx		; [rbp-8] <- rdx
	mov	DWORD PTR [rax], 3			; rax <- 3
	mov	rax, QWORD PTR [rbp-8]			;rax <- [rbp-8]
	lea	rdx, [rax+4]							;rdx <- [rax + 4];	rdx = 3
	mov	QWORD PTR [rbp-8], rdx				; [rbp-8] <- rdx
	mov	DWORD PTR [rax], 4				; rax <- 4; rax = 4
	mov	eax, 0							;eax <- 0; eax = 0
	leave									;return
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
