.data
    zero:   .float  0.0
    numb1:  .float  7.56
    numb2:  .float  8.2
    numb3:  .float  2.21
    addd:   .float  0.0
    subb:   .float  0.0
    mull:   .float  0.0
    divv:   .float  0.0
    lar:    .float 162644360000000000000.0
    add_pr: .float 0.0
    mul_pr: .float 0.0

.text
    .globl main
    main:
    
        l.s     $f0, zero
        l.s     $f1, numb1
        l.s     $f2, numb2
        l.s     $f3, numb3
        l.s     $f4, lar
       
        add.s   $f5, $f1, $f2
        sub.s   $f6, $f2, $f3
        mul.s   $f7, $f1, $f2
        div.s   $f8, $f1, $f3
        add.s   $f9, $f1, $f4
        mul.s   $f10, $f1, $f4

        s.s     $f5, addd
        s.s     $f6, subb
        s.s     $f7, mull
        s.s     $f8, divv
        s.s     $f9, add_pr
        s.s     $f10, mul_pr

    li $v0, 10
    syscall