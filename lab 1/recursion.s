	.file	"recursion.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp		; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	; [rbp] <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 16		;rsp <- rsp - 16
	mov	esi, 4		;esi <- 4
	mov	edi, 2		;edi <- 2
	call	powR		;calling powR function
	mov	DWORD PTR [rbp-4], eax	; [rbp-4] <- eax
	mov	eax, DWORD PTR [rbp-4]	; eax <- [rbp-4]
	mov	esi, eax		; esi <- eax
	mov	edi, OFFSET FLAT:.LC0
	mov	eax, 0			;eax <- 0
	call	printf			;calling printf
	mov	eax, 0			;eax <- 0
	leave				; leaving programme
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	powR
	.type	powR, @function
powR:
.LFB1:
	.cfi_startproc
	push	rbp		; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	; [rbp] <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 16		;;rsp <- rsp - 16
	mov	DWORD PTR [rbp-4], edi	;[rbp-4] <- edi
	mov	DWORD PTR [rbp-8], esi	;;[rbp-8] <- esi
	cmp	DWORD PTR [rbp-8], 0	;compare [rbp-8] == 0
	jne	.L4			;if true jump to .L4
	mov	eax, 1			; eax <- 1
	jmp	.L5			; jump to .L5
.L4:
	mov	eax, DWORD PTR [rbp-8]	;eax <- [rbp-8]
	lea	edx, [rax-1]		;edx <- [rax - 1]
	mov	eax, DWORD PTR [rbp-4]	;;eax <- [rbp-4]
	mov	esi, edx		;esi <- edx
	mov	edi, eax		;edi <- eax
	call	powR			; calling powR function
	imul	eax, DWORD PTR [rbp-4]	;eax <- eax * [rbp-4]
.L5:					
	leave		;return
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	powR, .-powR
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
