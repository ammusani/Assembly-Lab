.data
	number1:	.word 12143
	number2:	.word 12431
	newLine:	.asciiz "\n"
	
.text
	main:
		lw $s0, number1
		lw $s1, number2
		
		multu $s0, $s1
		
		mfhi $t0
		jal print
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		mflo $t0
		jal print
		
	li $v0, 10
	syscall
	
	print:
		li $v0, 1
		addu $a0, $zero, $t0
		syscall
		
		j $ra
		
