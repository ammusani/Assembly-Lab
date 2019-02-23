.data
    num1:    .space  16  #declairing num1
    num2:   .space  16  #declairing num2

.text
    main:
        addi $t1, $zero, 0xFF
        addi $t2, $zero, 0xAA
        
        add $a2, $t1, $zero
        jal createNum1
        
        add $a2, $t2, $zero
        jal createNum2

        addi $t1, $zero, 0
        addi $t2, $zero, 0

        la $a1, num1
        la $a2, num2

    li $v0, 10      #call to end the program
    syscall



    createNum1:
        addi $t0, $zero, 0              #creating a counter
        addi $t4, $zero, 16             #creating a end statement
        
        while1:                          #while loop declaration
            beq $t0, $t4, exit1         #checking if t0 = t4 then goto exit
            sw	$a2, num1($t0)          #storing the (t0/4)th byte of the number
            addi $a2, $a2, 45           #incrementing the value of the value being stored
            addi $t0, $t0, 4            #incrementing the counter
            j while1                     #go to while
        exit1:
        
    j $ra                               #going back to the caller


    createNum2:
        addi $t0, $zero, 0              #creating a counter
        addi $t4, $zero, 16             #creating a end statement
        
        while2:                          #while loop declaration
            beq $t0, $t4, exit2          #checking if t0 = t4 then goto exit
            sw	$a2, num2($t0)          #storing the (t0/4)th byte of the number
            addi $a2, $a2, 45           #incrementing the value of the value being stored
            addi $t0, $t0, 4            #incrementing the counter
            j while2                    #go to while
        exit2:
            addi $t0, $zero, 0
            addi $t4, $zero 0
        
    j $ra                               #going back to the caller