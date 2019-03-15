.data

.text
main:
	addi $s0, $zero, 20
	addi $s1, $zero, 2
	
	sllv $s0, $s0, $s1
	
li $v0, 10
syscall
