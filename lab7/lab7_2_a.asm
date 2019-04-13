#this is a recusrive program to calculate fibonacci number of the given position

.data
    N:      .word   11      #the value whose fib is to be calculated
    fib_n:  .word   0       #the fibonacci number

.text
    .globl main
    main:

        # li    $v0, 5
        # syscall
        # sw    $v0, N

        lw  $a0, N          #loading the value of N in the argument register
        jal fib				#jump to fib and save position to $ra
        sw  $v0, fib_n      #storing the solution from return register

        add $a0, $v0, $zero #transfering value from return register to argument
        li  $v0, 1          #calling to print
        syscall

        li $v0, 10          #calling to terminate
		syscall


    .globl  fib
    fib:
        subu    $sp, $sp, 12    #making space in stack
        sw      $ra, ($sp)      #storing return address
        sw      $s0, 4($sp)     #storing value of $s0
        sw      $s1, 8($sp)     #storing value of $s1
        
        add     $s0, $a0, $zero #storing value of a0 in s0
        
        li      $v0, 1          #branch in case a0 equals 1
        beq     $a0, 1, done    #

        li      $v0, 0          #branch in case a0 equals 0
        beq     $a0, 0, done    #

        addi    $a0, $s0, -1    #calling for n - 1
        jal     fib
        add     $s1, $v0, $zero #storing return value for n - 1 in $s1

        addi    $a0, $s0, -2    #calling for n - 2
        jal     fib

        add     $v0, $v0, $s1   #fib_n = fib_n-1 + fib_n-2

        done:
            lw      $ra, 0($sp)
            lw      $s0, 4($sp)
            lw      $s1, 8($sp)
            addu    $sp, $sp, 12
            jr	    $ra					# jump to $ra
            