	.file	"minMax.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp			; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp		; rbp <- [rsp]
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-32], 1	;[rbp-32] <- 1
	mov	DWORD PTR [rbp-28], 45	;[rbp-28] <- 45
	mov	DWORD PTR [rbp-24], 23	;[rbp-24] <- 23
	mov	DWORD PTR [rbp-20], 12	;[rbp-20] <- 12
	mov	DWORD PTR [rbp-16], 342	;[rbp-16] <- 342
	mov	DWORD PTR [rbp-12], 12		;[rbp-12] <- 12
	mov	eax, DWORD PTR [rbp-32]	;eax <- [rbp-32]
	mov	DWORD PTR [rbp-44], eax	;[rbp-44] <- eax
	mov	eax, DWORD PTR [rbp-32]	;eax <- [rbp-32]
	mov	DWORD PTR [rbp-40], eax		;[rbp-40] <- eax
	mov	DWORD PTR [rbp-36], 0		;[rbp-32] <- 0
	jmp	.L2							; jump to .L2
.L5:
	mov	eax, DWORD PTR [rbp-36]	;eax <- [rbp-36]
	cdqe					;double word to quad
	mov	eax, DWORD PTR [rbp-32+rax*4]	;eax <- [rbp-32 + 4]; rax = 1
	cmp	eax, DWORD PTR [rbp-40]			;compare eax <  [rbp-40]
	jle	.L3											;if true jump to L3
	mov	eax, DWORD PTR [rbp-36]			;eax <- [rbp-36]
	cdqe											;double word to quad
	mov	eax, DWORD PTR [rbp-32+rax*4]	;eax <- [rbp-32 + 4]; rax = 1
	mov	DWORD PTR [rbp-40], eax			;[rbp-40] <- eax
	jmp	.L4										; jump to .L4
.L3:
	mov	eax, DWORD PTR [rbp-36]		;eax <- [rbp-36]
	cdqe									;double word to quad
	mov	eax, DWORD PTR [rbp-32+rax*4]	;eax <- [rbp-32 + 4]; rax = 1
	cmp	eax, DWORD PTR [rbp-44]		;compare eax >  [rbp-44]
	jge	.L4										;if true jump to .L4
	mov	eax, DWORD PTR [rbp-36]		;eax <- [rbp-36]
	cdqe										;double word to quad
	mov	eax, DWORD PTR [rbp-32+rax*4]	;eax <- [rbp-32 + 4]; rax = 1
	mov	DWORD PTR [rbp-44], eax		;[rbp-44] <- eax
.L4:
	add	DWORD PTR [rbp-36], 1 			;[rbp-36] <- 1
.L2:
	cmp	DWORD PTR [rbp-36], 5	;compare [rbp-36] <= 5
	jle	.L5								; if true jump to .L5
	mov	eax, 0						; eax <- 0
	pop	rbp						;; rbp <- stack[top -0];
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
