.data
.text
	main:
		addi $s0, $zero, 4
		addi $s1, $zero, 3
		addi $s2, $zero, 1

		addi $s3, $zero, 2
	
		mul $t0, $s0, $s3
		mul $t0, $t0, $s3

		mul $t1, $s1, $s3

		sub $s4, $t0, $t1
		add $s4, $s4, $s2

	li $v0, 10
	syscall
