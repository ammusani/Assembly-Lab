#This program generates 2 128-bit integers and performs their addition

.data
    num1:   .space  16  #declairing num1
    num2:   .space  16  #declairing num2
    sum:    .space  16  #declairing sum

.text
    main:
    
        la $a1, num1        #storing the address of the array
        li $s1, 0xFBAB      #storing a number into register $s1
        add $a2, $s1, $zero #storing the number into the argument register
        jal createNum       #calling function to generate num1
        
        la $a1, num2
        li $s2, 0xAABF      #storing a number into register $s1
        add $a2, $s2, $zero #storing the number into the argument register
        jal createNum       #calling function to generate num2

        la $a1, num1        #loading address of num1 in argument register 1
        la $a2, num2        #loading address of num2 in argument register 2
        la $v1, sum         #loading address of sum in return register 1
        jal addNum          #calling the function add the numbers

    li $v0, 10              #call to end the program
    syscall



    createNum:
        addi $t0, $zero, 0              #creating a counter
        addi $t4, $zero, 16             #creating a end statement

        while1:                         #while loop declaration
            beq $t0, $t4, exit1         #checking if t0 = t4 then goto exit
            sw $a2, 0($a1)              #storing the nth byte of the number 
            addi $a2, $a2, 45           #incrementing the value of the value being stored
            addi $a1, $a1, 4            #going to the next word of the number
            addi $t0, $t0, 4            #incrementing the counter
            j while1                    #go to while
        
        exit1:
            addi $t0, $zero, 0          #initializing $t0 to zero
            addi $t4, $zero, 0          #initializing $t4 to zero

    j $ra                               #going back to the caller


    addNum:
        addi $t0, $zero, 0              #creating a counter
        addi $t4, $zero, 16             #creating a end statement
        addi $t3, $zero, 0              #initializing carry

        while2:
            beq $t0, $t4, exit2         #checking if t0 = t4 then goto exit2
            
            lw $t5, 0($a1)              #loading nth word of number 1
            addu $t3, $t3, $t5          #adding nth word of num1 to sum
            lw $t6, 0($a2)              #loading nth word of number 2
            addu $t3, $t3, $t6          #adding nth word of num2 to sum
            sw $t3, 0($v1)              #storing the word into sum
            
            sltu $t1, $t3, $t5          #checking if num1 is greater than sum, if yes than t1 = 1
            sltu $t2, $t3, $t6          #checking if num2 is greater than sum, if yes than t2 = 1
            or $t3, $t2, $t1            #if either of the num1 or num2 is greater than sum then next carry = 1
            
            addi $v1, $v1, 4            #going to the next word of the word
            addi $a1, $a1, 4            #going to the next word of the num1
            addi $a2, $a2, 4            #going to the next word of the num2
            addi $t0, $t0, 4            #incrementing the counter
            j while2                    #goto while2

        exit2:                          #exit after the while
            addi $t0, $zero, 0          #initializing $t0 to zero
            addi $t1, $zero, 0          #initializing $t1 to zero
            addi $t2, $zero, 0          #initializing $t2 to zero
            addi $t3, $zero, 0          #initializing $t3 to zero
            addi $t4, $zero, 0          #initializing $t4 to zero
            addi $t5, $zero, 0          #initializing $t5 to zero
            addi $t6, $zero, 0          #initializing $t6 to zero

    j $ra                               #jumping back to the caller location
    