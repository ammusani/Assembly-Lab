.data

.text

main:

	addiu $s0, $zero, 32
	li $s1, 0xAAAA
	addi $t1, $zero, 32
	addiu $t2, $zero, 1
	addiu $t3, $zero, 0
	addiu $t4, $zero, 0

P:	beq $t1, $zero, EXIT
	and $t5, $s1, $t2
	slt $t6, $zero, $t5
	beq $t6, $zero, Q
	addiu $t4, $t4, 1
	j R

Q:	addiu $t3, $t3, 1

R:	sll $t2, $t2, 1
	addi $t1, $t1, -1
	j P
EXIT:	sw $t3, 0x10000000
	sw $t4, 0x10000004 
	li $v0, 10
	syscall
