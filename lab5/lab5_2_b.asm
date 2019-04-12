.data
	Divisor:	.word	3
	Dividend:	.word	-11
	Quotient:	.word	0
	Remainder:	.word	0
.text

	main:
		lw	$s0, Remainder
		lw	$s1, Divisor
		lw	$s2, Dividend
		lui	$s3, 0x8000
		addi	$s4, $zero, 32
		addi	$t0, $zero, 0
		lui	$s5, 0xffff
		ori	$s5, $s5, 0xffff

		and	$t2, $s1, $s3
		and	$t3, $s2, $s3

		bne	$t2, $s3, done1
		xor	$s1, $s1, $s5
		addi	$s1, $s1, 1
		
		done1:
		bne	$t3, $s3, done2
		xor	$s2, $s2, $s5
		addi	$s2, $s2, 1

		done2:
			xor	$t4, $t3, $t2
	
		shiftL:
			beq	$s4, $t0, end
			
			and	$t1, $s2, $s3
			sll	$s2, $s2, 1
			sll	$s0, $s0, 1
			bne	$t1, $s3, jump
			addi	$s0, $s0, 1

			jump:
			sub	$s0, $s0, $s1
			and	$t1, $s0, $s3
			bne	$t1, $s3, jump2

			add	$s0, $s0, $s1
			j	jump3

			jump2:
				add	$s2, $s2, 1

			jump3:
			addi	$t0, $t0, 1
			j	shiftL

		end:
			bne	$t3, $s3, end2
			xor	$s0, $s0, $s5
			add	$s0, $s0, 1

			end2:
				bne	$t4, $s3, end3
				xor	$s2, $s2, $s5
				addi	$s2, $s2, 1			

		end3:
			sw	$s0, Remainder
			sw	$s2, Quotient

		li	$v0, 10
		syscall
