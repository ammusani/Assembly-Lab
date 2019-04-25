.data
    zero:   .double  0.0
    numb1:  .double  7.56
    numb2:  .double  8.2
    numb3:  .double  2.21
    addd:   .double  0.0
    subb:   .double  0.0
    mull:   .double  0.0
    divv:   .double  0.0
    lar:    .double 162644360000000000000.0
    add_pr: .double 0.0
    mul_pr: .double 0.0

.text
    .globl main
    main:
    
        l.d     $f0, zero
        l.d     $f2, numb1
        l.d     $f4, numb2
        l.d     $f6, numb3
        l.d     $f8, lar
        
        add.d   $f10, $f2, $f4
        sub.d   $f12, $f4, $f6
        mul.d   $f14, $f2, $f4
        div.d   $f16, $f2, $f6
        add.d   $f18, $f2, $f8
        mul.d   $f20, $f2, $f8
        
        s.d     $f10, addd
        s.d     $f12, subb
        s.d     $f14, mull
        s.d     $f16, divv
        s.d     $f18, add_pr
        s.d     $f20, mul_pr

    li $v0, 10
    syscall