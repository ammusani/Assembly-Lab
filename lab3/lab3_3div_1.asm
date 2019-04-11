.data
<<<<<<< HEAD:lab3/file_3div_1.asm
.text
	main:
		addi $s0, $zero, 72
		addi $s1, $zero, 2
		
		srlv $s0, $s0, $s1
	
	li $v0, 10
	syscall
=======

.text
main:
	addi $s0, $zero, 72
	addi $s1, $zero, 2
	
	srlv $s0, $s0, $s1

li $v0, 10
syscall
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24:lab3/lab3_3div_1.asm
