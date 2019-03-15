.data

.text
main:
	addi $s0, $zero, 88

	srl $s0, $s0, 3

li $v0, 10
syscall
