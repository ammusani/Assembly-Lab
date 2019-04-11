.data

.text

main:
	add $s0, $zero, 35
	add $s1, $zero, 12
	add $s2, $zero, 0xABCD
	
	xor $s0, $s0, $s0		#making number zero using XOR
	mul $s1, $s1, -1		#2's complement without adding 1
	xor $s2, $s2, 0xFFFF		#1's complement

li $v0, 10
syscall
