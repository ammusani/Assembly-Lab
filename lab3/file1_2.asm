main:
	addi $s0, $zero, 20
	addi $s1, $zero, 55
	
	add $s0, $s0, $s1
	sub $s1, $s0, $s1
	sub $s0, $s0, $s1
