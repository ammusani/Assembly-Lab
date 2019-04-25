.data
    list:   .ascii  "iit tirupati"
    size:   .word   12
.text
    .globl main
    main:
        la		$s0, list
        lw		$s1, size
        addi    $t2, $s1, -1
        add		$t0, $zero, $zero
        li      $t1, 2
        div		$s1, $t1			# $s1 / $t1
        mflo	$t1					# $t2 = floor($t0 / $t1)  
        
        loop:
            beq     $t0, $t1, done
            add     $a0, $s0, $t0
            add     $a1, $s0, $t2
            sub     $a1, $a1, $t0
            jal     swap

            addi    $t0, $t0, 1
            j       loop
       
        done:
            li $v0, 10
            syscall

    .globl swap
    swap:
        lb  $s2, ($a0)
        lb  $s3, ($a1)
        sb  $s2, ($a1)
        sb  $s3, ($a0)
        jr	$ra					# jump to $ra
        