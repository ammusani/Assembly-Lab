#this is a recursive program to calculate factorial of a number.

.data
	N:      .word	10       #the number whose factorial is to be calculated
	fact_n:	.word	0        #the factorial

.text
	.globl main
	main:
		
		# li    $v0, 5
		# syscall
        # sw    $v0, N
		
		lw  $a0, N          #loading N into argument register
		jal fact            #calling the factorial function
		sw  $v0, fact_n     #storing the solution from return register in the system
		
        add $a0, $v0, $zero #transfering value from return register to argument
        li  $v0, 1          #calling to print
        syscall

		li $v0, 10          #calling to terminate
		syscall

        
		
	.globl fact
	fact:
		subu    $sp, $sp, 8     #making space in stack
		sw      $ra, ($sp)      #storing retrun address
		sw      $s0, 4($sp)     #storing the value of s0
		
		li	    $v0, 1          #return value as 1, argument is 0
		beq	    $a0, 0, done    #going to done in case argument is 1
		
		
		add 	$s0, $a0, $zero #storing argument is s0
		sub 	$a0, $a0, 1     #decrementing the argument
		jal 	fact            #calling fatoring on n - 1
		
		mul 	$v0, $s0, $v0   #here the magic happens, when the value is returned it is stored in $v0, $s0 is multiplied to $v0 and stored back again there to return
		
		done:
			lw  	$ra, ($sp)  #restoring the value of return address
			lw  	$s0, 4($sp) #restoring the value of s0
			addu    $sp, $sp, 8 #decrementing the space of stack
			jr  	$ra         #going back to the caller