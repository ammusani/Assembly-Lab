.data
.text
	main:
		addi $s0, $zero, 72
		addi $s1, $zero, 2
		
		srlv $s0, $s0, $s1
	
	li $v0, 10
	syscall