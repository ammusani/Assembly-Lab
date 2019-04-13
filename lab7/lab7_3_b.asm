#approximate area of the circle with radius r
#area of circle = area of square with daigonal root(2) * r + 4 * (area of traingle touching the circle with base as side of square)

.data
    root_2: .float  1.414
    area:   .float  0.0
    radius: .float  1.2

.text
    .globl  main
    main:
        li.s    $f0, 0.0
        l.s     $f2, radius
        l.s     $f3, root_2
        jal     calc_areaC
        s.s     $f1, area
    
        li  $v0, 10
        syscall

    .globl  calc_areaC
    calc_areaC:
        subu    $sp, $sp, 4
        sw      $ra, ($sp)

        li.s    $f6, 2.0
        jal     calc_areaS
        add.s   $f4, $f1, $f0

        li.s    $f5, 4.0
        jal     calc_areaT
        mul.s   $f5, $f1, $f5

        add.s   $f1, $f5, $f4

        lw		$ra, ($sp)
        addu    $sp, $sp, 4

        jr		$ra					# jump to $ra
    
    .globl  calc_areaS
    calc_areaS:        
        mul.s   $f1, $f2, $f2   #calculating r^2
        mul.s   $f1, $f1, $f6   #area = 2 * r^2
        jr      $ra

    .globl  calc_areaT
    calc_areaT:
        mul.s   $f1, $f2, $f2   #calculating q = r^2
        li.s    $f8, -1.0
        add.s   $f7, $f3, $f8   #calculating p = root(2) - 1
        mul.s   $f1, $f1, $f2   #calculating r = p * q
        div.s   $f1, $f1, $f6   #calculating area = r / 2
        jr      $ra
        