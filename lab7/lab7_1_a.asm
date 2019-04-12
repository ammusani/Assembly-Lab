.data

_j:	.word	0
l:	.word	14
m:	.word	13
n:	.word	7
k:	.word	6


.globl main

.text

main:
	

	lw	$a1, l
	lw 	$a2, m
	
	jal multi_fun

	add	$t1, $v1, $zero
	add	$v1, $zero, $zero
	
	lw	$t2, n
	div	$t3, $t1, $t2

	lw	$t2, k
	add	$s0, $t3, $t2

	la 	$s1, _j
	sw	$s0, ($s1)

	li	$v0, 10
	syscall

	multi_fun:
		mul	$v1, $a1, $a2
		add	$a1, $zero, $zero
		add	$a2, $zero, $zero

		jr	$ra
