.data
	number1:	.word 12143
	number2:	.word -1231
	newLine:	.asciiz "\n"
	
.text
	main:
		lw $s0, number1
		lw $s1, number2
		
		mult $s0, $s1
		
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
		add $a0, $zero, $t0
		syscall
		
		j $ra
		
		
