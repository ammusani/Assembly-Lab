	.file	"exchange.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp							;stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp						;rbp <- rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-48], 8		; [rbp-48] <- 8
	mov	DWORD PTR [rbp-44], 9		; [rbp-44] <- 9
	mov	DWORD PTR [rbp-40], 10		; [rbp-40] <- 10
	mov	DWORD PTR [rbp-36], 11		; [rbp-36] <- 11
	mov	DWORD PTR [rbp-32], 1		; [rbp-32] <- 1
	mov	DWORD PTR [rbp-28], 2		; [rbp-28] <- 2
	mov	DWORD PTR [rbp-24], 3		; [rbp-24] <- 3
	mov	DWORD PTR [rbp-20], 4		; [rbp-20] <- 4
	mov	DWORD PTR [rbp-52], 0		; [rbp-52] <- 0
	jmp	.L2								; jump to instruction set .L2
.L3:										; instruction set .L3
	mov	eax, DWORD PTR [rbp-52]	; eax <- [rbp-52]
	cdqe									; convert word to double word
	mov	edx, DWORD PTR [rbp-48+rax*4] ; edx <- [rbp-48]; because rax = 0
	mov	eax, DWORD PTR [rbp-52]		; eax <- [rbp-52]
	cdqe									; convert word to double word
	mov	DWORD PTR [rbp-16+rax*4], edx ; [rbp-16] <- edx; because rax = 0
	mov	eax, DWORD PTR [rbp-52]		; eax <- [rbp-52]
	cdqe								; convert word to double word
	mov	edx, DWORD PTR [rbp-32+rax*4]	;edx <- [rbp-32]; because rax = 0
	mov	eax, DWORD PTR [rbp-52]			; eax <- [rbp-52]
	cdqe									; convert word to double word
	mov	DWORD PTR [rbp-48+rax*4], edx ; [rbp-48] <- edx; because rax = 0
	mov	eax, DWORD PTR [rbp-52]	; eax <- [rbp-52]
	cdqe									; convert word to double word
	mov	edx, DWORD PTR [rbp-16+rax*4] ;;edx <- [rbp-32]; because rax = 0
	mov	eax, DWORD PTR [rbp-52]	;eax <- [rbp-52];
	cdqe									; convert word to double word
	mov	DWORD PTR [rbp-32+rax*4], edx ; [rbp-32] <- edx; because rax = 0
	add	DWORD PTR [rbp-52], 1	; [rbp-52] <- 1;
.L2:
	cmp	DWORD PTR [rbp-52], 3	; compares that [rbp-52]  <= 3; 
	jle	.L3					; if comp true jump to .L3
	mov	eax, 0			; eax <- 0
	pop	rbp			;rbp <- stack[top -0]
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
