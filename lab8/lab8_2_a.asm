#regroup array in such a manner that all 1's are together and all 0's are together

.data
    array:      .word   0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0
    size:       .word   17

.text
    .globl main
    main:
        la		$a0, array		# $a0 = address of array
        lw		$a1, size		# $a1 = size
        jal		grouping		# jump to grouping and save position to $ra
        
        li $v0, 10
        syscall

    .globl grouping
    grouping:
        add     $t0, $zero, $zero
        addi    $t1, $zero, 4
        mul     $t1, $t1, $a1
        
        add     $s0, $zero, $zero   #count of number of zeros
        add     $s1, $zero, $zero   #count of number of ones

        add     $t3, $zero, $zero
        addi    $t4, $zero, 1

        .globl loop
        loop:
            beq     $t0, $t1, swap

            add     $t2, $a0, $t0
            lw      $t2, ($t2)

            bne     $t2, $t3, notZero
            add     $s0, $s0, $t4
            addi    $t0, $t0, 4
            j       loop

            notZero:
            bne     $t2, $t4, done
            add     $s1, $s1, $t4

            done:
            addi    $t0, $t0, 4
            j       loop

    .globl swap
    swap:
        add     $t0, $zero, $zero
        addi    $t1, $zero, 4
        mul     $t2, $s0, $t1
        mul     $t5, $s1, $t1
        add     $t5, $t5, $t2
        addi    $t6, $zero, 1

        loop1:
            beq $t0, $t2, loop2
            add $t7, $a0, $t0
            sw  $t3, ($t7)
            add $t0, $t0, $t1
            j   loop1

        loop2:
            beq $t0, $t5, done2
            add $t7, $a0, $t0
            sw  $t4, ($t7)
            add $t0, $t0, $t1
            j   loop2

        done2:
            jr	$ra
            