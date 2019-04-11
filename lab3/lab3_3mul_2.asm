.data
<<<<<<< HEAD:lab3/file_3mul_2.asm
.text
	main:
		addi $s0, $zero, 69	
		sll $s0, $s0, 2
	
	li $v0, 10
	syscall
=======

.text
main:
	addi $s0, $zero, 69
	
	sll $s0, $s0, 2

li $v0, 10
syscall
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24:lab3/lab3_3mul_2.asm
