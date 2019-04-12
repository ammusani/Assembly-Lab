.data

n:	.word	4
m:	.word	0

.text
	.globl main
	main:
		lw	$a0, n
		jal	fib
		sw	$v0, m

		li $v0, 10
		syscall

	.globl fib
	fib:
		subu	$sp, $sp, 16
		sw	$ra, ($sp)
		sw	$a0, 4($sp)

		add	$s0, $a0, $zero
		addi	$t0, $zero, 1

		li	$v0, 1

		beq	$s0, $zero, done
		beq	$s0, $t0, done

		lw	$s0, 4($sp)
		addi	$a0, $s0, -1
		jal	fib
		sw	$v0, 8($sp)

		lw	$s0, 4($sp)
		addi	$a0, $s0, -2
		jal	fib
		sw	$v0, 12($sp)

		lw	$t1, 8($sp)
		lw	$t2, 12($sp)

		add	$v0, $t1, $t2

		done:
		lw	$ra, ($sp)
		lw	$a0, 4($sp)
		addu	$sp, $sp, 4
		jr	$ra
