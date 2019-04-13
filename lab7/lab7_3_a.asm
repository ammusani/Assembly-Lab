#Equations:
#y = 3 + x^4
#x = z^3 + 2
#z = p^2 + p^3
#p = 6*m
#m = custom value
#the following program calculates the above equations, though here answer goes out of range

.data
    y:      .word   0
    x:      .word   0
    z:      .word   0
    p:      .word   0
    m:      .word   1

.text
    .globl main
    main:
        jal  calc_y
        sw  $v0, y

        li  $v0, 10
        syscall

    .globl  calc_y
    calc_y:
        subu    $sp, $sp, 4     #making space in the stack
        sw      $ra, ($sp)      #storing return address

        jal     calc_x          #calculating value of x
        sw      $v0, x          #storing value of x

        mul     $s0, $v0, $v0   #x^2 = x * x
        mul     $s0, $s0, $s0   #x^4 = x^2 * x^2

        addi    $v0, $s0, 3     #y = 3 + x^4

        lw		$ra, ($sp)		#loading value of return address
        addu    $sp, $sp, 4     #decrementing the size of stack

        jr		$ra					# jump to $ra
         
    .globl  calc_x
    calc_x:
        subu    $sp, $sp, 4     #making space in the stack
        sw      $ra, ($sp)      #storing return address

        jal     calc_z          #calculating value of z
        sw      $v0, z          #storing value of z

        mul     $s0, $v0, $v0   #z^2 = z * z
        mul     $s0, $s0, $v0   #z^3 = z^2 * z

        addi    $v0, $s0, 2     #x = z^3 + 2

        lw		$ra, ($sp)		#loading value of return address
        addu    $sp, $sp, 4     #decrementing the size of stack

        jr		$ra					# jump to $ra    

    .globl  calc_z
    calc_z:
        subu    $sp, $sp, 4     #making space in the stack
        sw      $ra, ($sp)      #storing return address

        jal     calc_p          #calculating value of p
        sw      $v0, p          #storing value of p

        mul     $s0, $v0, $v0   #p^2 = p * p
        mul     $s1, $s0, $v0   #p^3 = p^2 * p

        add     $v0, $s0, $s1   #z = p^2 + p^3

        lw		$ra, ($sp)		#loading value of return address
        addu    $sp, $sp, 4     #decrementing the size of stack

        jr		$ra				# jump to $ra

    .globl  calc_p
    calc_p:
        lw      $s0, m
        li      $s1, 6
        mul     $v0, $s0, $s1   # p = 6 * m

        jr      $ra             #jump to $ra