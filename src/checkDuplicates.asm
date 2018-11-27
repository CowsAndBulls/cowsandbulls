#--Checks if a given string has any duplicate letters--#

# ARGUEMENTS:
# $a0 holds the string to check for duplicate characters
#
# RETURN:     
# $v0 holds a one or zero, where 1 means that the string has no duplicates while 0 means it is has duplicate characters character.
# (Also assume that string passed only has lowercase letters)

.data
Test: .asciiz "asdfghjkl"

.text
la $a0, Test

move $v0, $zero

checkDupLoop:
lb $t0, 0($a0)
# If the loop reaches a null terminator, end the loop
beqz $t0, dupLoopEnd 
# Make a copy of the arguement and add 1 to it to be the staring value for the second loop
move $t1, $a0
addi $t1, $t1, 1
checkDupLoop2:
lb $t2, 0($t1)
beqz $t2, dupLoopEnd2

# If the loop finds a character that is the same as the current character for the fisrt loop then break out of outer loop
beq $t2, $t0, dupEnd

# Increment iterator by one jump back to loop start
addi $t1, $t1, 1
j checkDupLoop2

dupLoopEnd2:
addi $a0, $a0, 1
j checkDupLoop

dupLoopEnd:
addi $v0, $v0, 1

dupEnd:
# For testing purposes
move $t3, $v0
li $v0, 1
move $a0, $t3
syscall