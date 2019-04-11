<<<<<<< HEAD
#This program generates 2 128-bit integers and performs their addition

.data
    num1:   .space  16  #declairing num1
    num2:   .space  16  #declairing num2
    sum:    .space  16  #declairing sum

.text
    main:
    
        la $a1, num1        #storing the address of the array
        li $s1, 0xFBAB      #storing a number into register $s1
        add $a2, $s1, $zero #storing the number into the argument register
        jal createNum       #calling function to generate num1
        
        la $a1, num2
        li $s2, 0xAABF      #storing a number into register $s1
        add $a2, $s2, $zero #storing the number into the argument register
        jal createNum       #calling function to generate num2

        la $a1, num1        #loading address of num1 in argument register 1
        la $a2, num2        #loading address of num2 in argument register 2
        la $v1, sum         #loading address of sum in return register 1
        jal addNum          #calling the function add the numbers

    li $v0, 10              #call to end the program
    syscall



    createNum:
        addi $t0, $zero, 0              #creating a counter
        addi $t4, $zero, 16             #creating a end statement

        while1:                         #while loop declaration
            beq $t0, $t4, exit1         #checking if t0 = t4 then goto exit
            sw $a2, 0($a1)              #storing the nth byte of the number 
            addi $a2, $a2, 45           #incrementing the value of the value being stored
            addi $a1, $a1, 4            #going to the next word of the number
            addi $t0, $t0, 4            #incrementing the counter
            j while1                    #go to while
        
        exit1:
            addi $t0, $zero, 0          #initializing $t0 to zero
            addi $t4, $zero, 0          #initializing $t4 to zero

    j $ra                               #going back to the caller


    addNum:
        addi $t0, $zero, 0              #creating a counter
        addi $t4, $zero, 16             #creating a end statement
        addi $t3, $zero, 0              #initializing carry

        while2:
            beq $t0, $t4, exit2         #checking if t0 = t4 then goto exit2
            
            lw $t5, 0($a1)              #loading nth word of number 1
            addu $t3, $t3, $t5          #adding nth word of num1 to sum
            lw $t6, 0($a2)              #loading nth word of number 2
            addu $t3, $t3, $t6          #adding nth word of num2 to sum
            sw $t3, 0($v1)              #storing the word into sum
            
            sltu $t1, $t3, $t5          #checking if num1 is greater than sum, if yes than t1 = 1
            sltu $t2, $t3, $t6          #checking if num2 is greater than sum, if yes than t2 = 1
            or $t3, $t2, $t1            #if either of the num1 or num2 is greater than sum then next carry = 1
            
            addi $v1, $v1, 4            #going to the next word of the word
            addi $a1, $a1, 4            #going to the next word of the num1
            addi $a2, $a2, 4            #going to the next word of the num2
            addi $t0, $t0, 4            #incrementing the counter
            j while2                    #goto while2

        exit2:                          #exit after the while
            addi $t0, $zero, 0          #initializing $t0 to zero
            addi $t1, $zero, 0          #initializing $t1 to zero
            addi $t2, $zero, 0          #initializing $t2 to zero
            addi $t3, $zero, 0          #initializing $t3 to zero
            addi $t4, $zero, 0          #initializing $t4 to zero
            addi $t5, $zero, 0          #initializing $t5 to zero
            addi $t6, $zero, 0          #initializing $t6 to zero

    j $ra                               #jumping back to the caller location
    
=======
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

		addu $t5, $t3, $t4	#adding the part of num1 and num2

		sltu $t6, $t5, $t3	#checking if the sum stored is less than any of the original numbers
		sltu $t7, $t5, $t4

		or $t8, $t7, $t8	#if yes, the carry is stored in $t8

		add $t2, $t0, $s0	#loading address of the sum
		lw  $t9, ($t2)		#loading the part of the sum to be modified
		addu $t5, $t5, $t9	#modifying the sum through addition cause may be the carry was there with it
		sw  $t5, ($t2)		#storing back the number

		addi $t0, $t0, 4	#incrementing the addition
		beq $t0, $t1, addDone	#end condition

		addi $t2, 4			#incrementing the sum address to next part to store the carry there
		sw   $t8, ($t2)

		j for				#jumpng back to for

	addDone:
	
	li $v0, 10			#system call to end the code
	syscall
  
>>>>>>> 7fd535fbc92e1a46a32f705cc608888a15624e24
