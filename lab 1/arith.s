	.file	"arith.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp 							; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp						;rbp <- [rsp]
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-16], 56 	 ;  [rbp-16] <- 56
	mov	DWORD PTR [rbp-12], 52 	; [rbp-12] <- 52
	mov	DWORD PTR [rbp-8], 12 		;[rbp-8] <- 12
	mov	DWORD PTR [rbp-4], 45		;[rbp-4] <- 45
	mov	eax, DWORD PTR [rbp-12]	; eax <- [rbp-12] ; 
	add	DWORD PTR [rbp-16], eax	; [rbp-16] <- [rbp-16] + [eax]; [rbp-16] = 108
	mov	eax, DWORD PTR [rbp-8]		; eax <- [rbp-8]
	sub	DWORD PTR [rbp-12], eax	; [rbp-12] <- [rbp-12] - [eax]; [rbp-12] = 40
	mov	eax, DWORD PTR [rbp-8]		; eax <- [rbp-8];
	imul	eax, DWORD PTR [rbp-4]		; eax <- [rbp-4] * [eax] ; eax = 540
	mov	DWORD PTR [rbp-8], eax		;  [rbp-8] <- eax; [rbp-8] = 540
	mov	eax, DWORD PTR [rbp-8]		; eax <- [rbp-8] 
	cdq									; convert double to quad
	idiv	DWORD PTR [rbp-4]			; eax <-  [rbp-4] / eax ; eax = 12
	mov	DWORD PTR [rbp-8], eax		;  [rbp-8] <- eax; [rbp-8] = 12
	mov	eax, DWORD PTR [rbp-12]	; eax <- [rbp-12] ; 
	and	DWORD PTR [rbp-16], eax	; [rbp-16] <- [rbp-16] & [eax]; [rbp
	mov	eax, DWORD PTR [rbp-4]		; eax <- [rbp-12]
	or	DWORD PTR [rbp-8], eax			; [rbp-8] <- [rbp-8] || [eax]
	mov	eax, DWORD PTR [rbp-8]		; eax <- [rbp-8]
	xor	DWORD PTR [rbp-4], eax			;[rbp-4] <- [rbp-4] ^ [eax]
	mov	eax, 0							; eax <- 0; eax = 0
	pop	rbp							; rbp <- stack[top-0]; 
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
