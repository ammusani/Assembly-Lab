.data 0x10000000
arr1: .space 24          #declairing array 1
len: .word 6             #declairing size length
arr2: .space 24          #declairing array 2 

.text
main:

    li $t0, 8         #Storing 8 as a value on temp resistor
    li $t1, 17        #Storing 17 as a value on temp resistor
    la $s0, arr1      #Storing address of arr1
    la $s1, arr2      #Storing address of arr2
   # lw $s2, $s0
   # lw $s3, $s1
    lw $s4, len         #Storing length
    addi $t2, $zero, 0  #initializing counter

    def: beq $t2, $s4, res  #if counter equals to len jump to res
        sw $t0, 0($s0)      #store value in array 1
        sw $t1, 0($s1)      #store value in array 2
        addi $t0, $t0, 5    #changing value to add in arr 1
        addi $t1, $t1, 3    #changing value to add in arr 2
        addi $s0, $s0, 4    #incrementing location in array 1
        addi $s1, $s1, 4    #incrementing location in array 2
        addi $t2, $t2, 1    #incrementing counter
        j def               #goes back up

    res: addi $t2, $zero, 0 #initializing counter
        li $t3, 4
        mul $t3, $t3, $s4   #setting subtracting value
        sub $s0, $s0, $t3   #taking array 1 back to initial state
        sub $s1, $s1, $t3   #taking array 2 back to initial state

    exc: beq $t2, $s4, exit #if counter equals to 6 jump to exit
        lw $t4, 0($s0)      #storing value of array 1 in temp 1
        lw $t5, 0($s1)      #storing value of array 2 in temp 2
        sw $t5, 0($s0)      #temp 2 to array 1
        sw $t4, 0($s1)      #temp 1 to array 2
        addi $t2, $t2, 1    #incrementing counter by 1
        addi $s0, $s0, 4    #incrementing location in array 1
        addi $s1, $s1, 4    #incrementing location in array 2
        j exc               #goes back up

    exit: li $v0, 10        #storing syscall varible to exit
        syscall             #making the system call