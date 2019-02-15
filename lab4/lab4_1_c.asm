main:
	addi $s0, $zero, 32
	addi $s3, $zero, 1
        li $s1, 0x0001
        addi $t1, $zero, 32
        addiu $t2, $zero, 1
        addiu $t3, $zero, 0
        addiu $t4, $zero, 0

P:      beq $t1, $zero, EXIT
        and $t5, $s1, $t2
        slt $t6, $zero, $t5
	beq $t1, $s0, S
	xor $t8, $t7, $t6
	add $t7, $zero, $t6
	beq $t8, $zero, R
	
S:      beq $t6, $zero, Q

T:      addiu $t4, $t4, 1
	add $t7, $t6, $zero
        j R

Q:      addiu $t3, $t3, 1

R:      sll $t2, $t2, 1
        addi $t1, $t1, -1
        j P

EXIT:   sw $t3, 0x10000000
        sw $t4, 0x10000004

