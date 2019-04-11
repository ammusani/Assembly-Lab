.data
<<<<<<< HEAD:lab3/file1_1.asm
.text
	main:
		addi $s0, $zero, 10
		addi $s1, $zero, 20
	
		add $s2, $zero, $s1
		add $s1, $zero, $s0
		add $s0, $zero, $s2

		addi $s2, $zero, 0
		
	li $v0, 10
	syscall
=======

.text
main:
	addi $s0, $zero, 10
	addi $s1, $zero, 20
	
	add $s2, $zero, $s1
	add $s1, $zero, $s0
	add $s0, $zero, $s2

li $v0, 10
syscall
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24:lab3/lab3_1_1.asm
