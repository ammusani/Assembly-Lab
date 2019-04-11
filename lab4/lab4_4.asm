.data
    numb1:  .word 11
    numb2:  .word 110
    high:   .word 0
    low:    .word 0

.text
    main:

        lw		$t1, numb1		#loading multiplicand 
        lw		$t2, numb2		#loading multiplier
        addi	$s1, $zero, 0   # 0 - 31 bits of result
        addi    $s2, $zero, 0   # 32 - 63 bits of result
        addi    $t0, $zero, 0   #couter
        addi    $t4, $zero, 32  #
        li      $t7, 0x80000000
        
        multier:
            beq  $t0, $t4, endd
            addi $t0, $t0, 1
            and  $t5, $t1, $t7
            beq  $t5, $zero, shift

            addd:
                and     $t8, $t7, $s1
                addu	$s1, $s1, $t2		# $s1 = s11 + 2t2
                and     $t9, $t7, $s1
                xor     $t3, $t8, $t9
                beq     $t3, $zero, shift

                add		$s2, $s2, $t3
                

            shift:
                beq     $t0, $t4, endd
                and     $t9, $t7, $s1
                sll     $s1, $s1, 1
                sll     $s2, $s2, 1
                sll     $t1, $t1, 1
                bne		$t7, $t9, multier	
                
                add     $s2, $s2, 1
                
            
            j multier
        endd:
            sw		$s1, low 
            sw      $s2, high
        
        li		$v0, 10		# $v0 =10 
        syscall
