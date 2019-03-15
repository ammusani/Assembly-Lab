.data

.text
main:
	addi $s0, $zero, 69
	
	sll $s0, $s0, 2

li $v0, 10
syscall
