.data
<<<<<<< HEAD:lab3/file_2.asm
.text
	main:
		addi $s0, $zero, 4
		addi $s1, $zero, 3
		addi $s2, $zero, 1
=======

.text

main:
	addi $s0, $zero, 4
	addi $s1, $zero, 3
	addi $s2, $zero, 1
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24:lab3/lab3_2.asm

		addi $s3, $zero, 2
	
		mul $t0, $s0, $s3
		mul $t0, $t0, $s3

		mul $t1, $s1, $s3

<<<<<<< HEAD:lab3/file_2.asm
		sub $s4, $t0, $t1
		add $s4, $s4, $s2

	li $v0, 10
	syscall
=======
	sub $s4, $t0, $t1
	add $s4, $s4, $s2

li $v0, 10
syscall
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24:lab3/lab3_2.asm
