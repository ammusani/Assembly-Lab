.data

.text

main:
	add $s0, $zero, 45
	add $s1, $zero, 33
	
	and $s2, $s1, $s0
	or $s3, $s1, $s0
	xor $s4, $s1, $s0
	nor $s5, $s4, $zero
	
li $v0, 10
syscall
