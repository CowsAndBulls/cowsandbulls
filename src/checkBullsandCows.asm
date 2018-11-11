#------------ This will check for number of bulls and cows -------------#
.text

# s0: secret code
# s1: userInput
#
# RETURN::
# s4: number of Bulls
# s5: number of cows


Start:
#Make everything zero except for s0 s1, and s7
add $t0, $zero, $zero
add $t1, $zero, $zero
add $t2, $zero, $zero
add $t3, $zero, $zero
add $t4, $zero, $zero
add $t5, $zero, $zero
add $t6, $zero, $zero
add $t7, $zero, $zero

#Store the return address
addi $sp, $sp, -4
sw $ra, 0($sp)


xor $t0, $s0, $s1 # We want to see if our guess is the same as our code
beq  $t0, $zero, Win


Bulls:

#Using the result of xor earlier we will check is we have any bulls in out user guess

add $t2, $zero, $zero  #$t2, which hold the number of bulls, gets reset
andi $t3, $t0, 0xFF000000 #get first character of $t0, the result of xor

bne $t3, $zero, Bull2 #If the digit does not equal, move on

addi $t2, $t2, 1 #else add 1 to numBulls

Bull2:
andi $t3, $t0, 0x00FF0000 #get second character of $t0, the result of xor

bne $t3, $zero, Bull3 #If the digit does not equal, move on

addi $t2, $t2, 1 #else add 1 to numBulls

Bull3:
andi $t3, $t0, 0x0000FF00 #get third character of $t0, the result of xor

bne $t3, $zero, Bull4 #If the digit does not equal, move on

addi $t2, $t2, 1 #else add 1 to numBulls

Bull4:
andi $t3, $t0, 0x000000FF #get fourth character of $t0, the result of xor

bne $t3, $zero, EndBull #If the digit does not equal, move on

addi $t2, $t2, 1 #else add 1 to numBulls


EndBull:
move $s4, $t2 #This stores the number of Bulls in $s4


###FIX ME### - Still buggy, but working slightly better.
Cows:
#Checking the number of cows 
add $t2, $zero, $zero #make $t2 zero
add $t6, $zero, $zero #$t6 (i = 0)

add $t7, $zero, 7 #We compare to this to break our loop

add $t4, $zero, $s1 #t4, shift result, starts with the user input value

Loop:
jal Shift #call the shift
xor $t0, $s0, $t4
add $t2, $zero, $zero  #$t2, which hold the number of bulls, gets reset
andi $t3, $t0, 0xFF000000 #get first character of $t0, the result of xor
bne $t3, $zero, Cow2 #If the digit does not equal, move on
addi $t2, $t2, 1 #else add 1 to numCows

Cow2:
andi $t3, $t0, 0x00FF0000 #get second character of $t0, the result of xor
bne $t3, $zero, Cow3 #If the digit does not equal, move on
addi $t2, $t2, 1 #else add 1 to numCows

Cow3:
andi $t3, $t0, 0x0000FF00 #get third character of $t0, the result of xor
bne $t3, $zero, Cow4 #If the digit does not equal, move on
addi $t2, $t2, 1 #else add 1 to numCows

Cow4:
andi $t3, $t0, 0x000000FF #get fourth character of $t0, the result of xor
bne $t3, $zero, EndCow #If the digit does not equal, move on
addi $t2, $t2, 1 #else add 1 to numCows

EndCow:
move $s5, $t2
addi $t6, $t6, 1 #i++
bne $t6, $t7, Loop


#Restore Stuff
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra

Shift:
andi $t5, $t4, 0xFF000000 #grab the first Character
sll $t4, $t4, 8 #Shift over by one letter
srl $t5, $t5, 24 #Shift the first character to the end
add $t4, $t4, $t5 #Add the two together
jr $ra

Win:
#This currently just ends the program
li $a0 10
syscall






