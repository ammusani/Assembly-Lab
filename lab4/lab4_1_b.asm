<<<<<<< HEAD
#Checking whether the given number in register 1 is positive or negative, if negative store value 1 else 0 in register 2 

.data
.text
	main:
		li $s0, 0xA0AABBBB			#storing a random number
		add $t1, 0x80000000			#initializing the number to bit-mask the last digit
		
		and $t0, $t1, $s0			#and bit-masking and storing the value in $t0
		slt $s1, $t0, $zero			#if $t0 is less than zero then the number is negative, so storin 1 in $s1

		li $v0, 1					#system call instruction to print an integer
		la $a0, $s1					#system always prints the interger in $a0, so need to store it in $a0
		syscall						#making the system call

	EXIT:
		sw $s0, 0x10000000			#storing the number in the RAM
		sw $s1, 0x10000004			#storing the value of 1 or 0 in RAM

	li $v0, 10						#system call instruction to exit
	syscall							#making the system call
=======
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
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24
