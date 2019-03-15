.data
	num1:	.space	16
	num2:	.space	16
	sum:	.space	16

.text
main:
	la $s1, num1	#storing the address of num1
	la $s2, num2	#storing the address of num2
	la $s0, sum	#storing the sum

	li $t0, 0x7623  #loading the first part of the number
	sw $t0, ($s1)

	li $t0, 0x4311
	sw $t0, 4($s1)
	
	li $t0, 0xaaaa
	sw $t0, 8($s1)
	
	li $t0, 0xccaa
	sw $t0, 12($s1)

	li $t0, 0x8624  #loading the first part of the number
    sw $t0, ($s2)

    li $t0, 0x1311
    sw $t0, 4($s2)

    li $t0, 0xbaaa
    sw $t0, 8($s2)

    li $t0, 0xccda
    sw $t0, 12($s2)

	addi $t0, $zero, 0	#counter
	addi $t1, $zero, 16	#checking value

	for:
	
	add $t2, $t0, $s1	#loading address of num1 part to be accessed
	lw  $t3, ($t2)		#loading value of num1 part to be accessed
	
	add $t2, $t0, $s2	#same as above for num2
	lw  $t4, ($t2)
	
	add $t5, $t3, $t4	#adding the part of num1 and num2

	slt $t6, $t5, $t3	#checking if the sum stored is less than any of the original numbers
	slt $t7, $t5, $t4
	
	or $t8, $t7, $t8	#if yes, the carry is stored in $t8
	
	add $t2, $t0, $s0	#loading address of the sum
	lw  $t9, ($t2)		#loading the part of the sum to be modified
	add $t5, $t5, $t9	#modifying the sum through addition cause may be the carry was there with it
	sw  $t5, ($t2)		#storing back the number

	addi $t0, $t0, 4	#incrementing the addition
	beq $t0, $t1, addDone	#end condition
	
	addi $t2, 4			#incrementing the sum address to next part to store the carry there
	sw   $t8, ($t2)
	
	j for				#jumpng back to for

	addDone:
	
	li $v0, 10			#system call to end the code
	syscall
  
