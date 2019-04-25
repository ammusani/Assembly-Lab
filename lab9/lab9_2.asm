.data
    n:  .word   3
    A:  .float  3.0, 1.1, 2.2, 4.6, 7.8, 1.2, 1.3, 2.3, 9.8
    B:  .float  3.3, 6.1, 8.2, 9.6, 3.8, 5.2, 3.3, 1.3, 10.8
    C:  .float  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
.text
    .globl main
    main:
      lw    $t1, n
      addi  $t0, $zero, 4
      mul   $t1, $t1, $t1
      mul   $t1, $t1, $t0

      add   $t2, $zero, $zero
      la    $s1, A
      la    $s2, B
      la    $s0, C

      loop:
        beq $t2, $t1, done

        add     $t3, $s1, $t2
        l.s     $f1, ($t3)
        add     $t3, $s2, $t2
        l.s     $f2, ($t3)
        add.s   $f0, $f1, $f2
        add     $t3, $s0, $t2
        s.s     $f0, ($t3)

        add     $t2, $t2, $t0
        j		loop				# jump to loop
        
    done:
        li $v0, 10
        syscall