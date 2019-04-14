#This program finds occurence of a number in the code

.data
    arr:        .word  0, 4, 8, 9, 1, 2, 4, 5, 5, 5, 20, 10, 1, 4, 5, 77, 89, 12, 33
    size:       .word   19
    element:    .word   2
    count:      .word   0
.text
    .globl  main
    main:
        li		$v0, 5
        syscall
        sw		$v0, element

        lw		$a0, element		# loading the argument
        jal		search				# jump to search and save position to $ra
        add		$a0, $v0, $zero		# $a0 = $v1 + $zero
        sw      $v0, count          # storing the count
        
        li		$v0, 1		        # $v0 = 1, print output
        syscall

        li      $v0, 10             # terminate
        syscall

    .globl  search
    search:
        add     $t0, $zero, $zero   # i = 0
        lw      $t1, size           # loading the size
        la		$t2, arr            # loading the array address
        li      $t3, 4              # loading 4 in $t3
        mul     $t1, $t1, $t3       # multiplying $t1 with 4
        add     $v0, $zero, $zero   # making v0 = 0
       
       
        #the loop to search
        loop:
            beq     $t0, $t1, done      # if $t0 = $t1, loop is to be finished
            add     $t5, $t2, $t0       #
            lw      $t4, ($t5)          # loading the number from the array

            # checks if they are eqaul, if yes increments count by 1
            bne     $t4, $a0, notEqual  # if both number are not equal go to not equal
            addi	$v0, $v0, 1	        # $v0 = $v0 + 1
            
            notEqual:
            add     $t0, $t0, $t3
            j		loop				# jump to loop
            
        
            done:
                jr		$ra				# jump to $ra
                