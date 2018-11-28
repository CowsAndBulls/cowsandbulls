#--This is the check length function. It checks if a given string is of length 4 by iterating through every character until it reaches a byte eqaul to zero (same as null terminator)--#

# ARGUEMENTS:
# $a0 holds the string to check for its length
#
# RETURN:     
# $v0 holds a one or zero, where 1 means that the string is length 4 while 0 means it is not

.data
# For testing purposes
#Test: .asciiz "four"

.text
# For testing purposes
#la $a0, Test

strLen:

# Loads the i byte of the word (Throws exception if there is no word given)
lb $t0, 0($a0)
# If we have reached the null terminator then the loop ends
beq $t0, $zero, lenLoopEnd
# Otherwise, increase count and i by one
addi $a0, $a0, 1
addi $t1, $t1, 1
j strLen

lenLoopEnd:
# For testing purposes
#li $v0, 1
#move $a0, $t1
#syscall

# Assume that the return value is false
move $v0, $0
# Make the return true if the length is four
beq $t1, 4, lenTrue
#move $v0, $0
j lenEnd

lenTrue:
addi $v0, $v0, 1

lenEnd:
# For testing purposes				
#move $t3, $v0
#li $v0, 1
#move $a0, $t3
#syscall
