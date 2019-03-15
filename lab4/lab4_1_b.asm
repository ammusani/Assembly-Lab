.data

.text
main:
	li $s0, 0x00AA
	add $t1, 0x8000
	and $t0, $t1, $s0
	slt $s1, $zero, $t0

EXIT:	sw $s0, 0x10000000
	sw $s1, 0x10000004
li $v0, 10
syscall
