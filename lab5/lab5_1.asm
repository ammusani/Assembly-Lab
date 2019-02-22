.data
	number1:	.word 12143	#Declairing number 1
	number2:	.word 12431	#Declairing number 2
	newLine:	.asciiz "\n"	#Declairing new Line
	
.text
	main:
		lw $s0, number1		#Loading number 1
		lw $s1, number2		#Loading number 2
		
		multu $s0, $s1		#Multiplying two integers
		
		mfhi $t0		#Moving from hi to general purpose register
		jal print		#calling print function
		
		li $v0, 4		#Printing a new Line iNSTRUCTION
		la $a0, newLine
		syscall
		
		mflo $t0		#Moving from lo to general purpose register
		jal print		#calling print function
		
	li $v0, 10			#syscall to terminate
	syscall
	
	print:		
		li $v0, 1		#printing integer instruction
		addu $a0, $zero, $t0	#storing int in printing register
		syscall			#making the syscall
			
		j $ra			#jumping back to caller
		
