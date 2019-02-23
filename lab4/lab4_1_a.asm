#This program counts & the number of 1's and 0's in the 32-bit number and stores it back into data-section of memory

.data
.text
	main: 
		li $s1, 0xAAAA			#storing a number in the a register
		addi $t1, $zero, 32		#a counter
		addiu $t2, $zero, 1		#initializing for and masking
		addiu $t3, $zero, 0		#initializing counter for # of zeros
		addiu $t4, $zero, 0		#initializing counter for # of ones

	P:
		beq $t1, $zero, EXIT	#checking the exiting condition
		and $t5, $s1, $t2		#and bit masking and storing the value in $t5
		slt $t6, $zero, $t5		#checking if $t5 greater than zero or not, if yes storing it into $t6
		beq $t6, $zero, Q		#jumping to Q if $t5 equals to zero
		addiu $t4, $t4, 1		#incrementing # of ones
		j R						#jumping to R, so we don't execute Q

	Q:
		addiu $t3, $t3, 1		#incrementing # of zeroes

	R:
		sll $t2, $t2, 1			#shifting $t2 left, so now next bit will be masked
		addi $t1, $t1, -1		#decrementing the counter
		j P						#jumping to P
	EXIT:
		sw $t3, 0x10000000		#storing the value of # of zeroes in RAM
		sw $t4, 0x10000004		#storing the value of # of ones in RAM

	li $v0, 10					#storing exit value to $v0
	syscall						#system call according the value stored into $v0
