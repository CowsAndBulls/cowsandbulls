#--This function checks if all the letters in a string are in the alphabet--#

# ARGUEMENTS:
# $a0 holds the string to check for alphabetical characters
#
# RETURN:     
# $v0 holds a one or zero, where 1 means that the string has all alphabetical characters while 0 means it is has at least one non-alphabetical character.

.data
# For testing purposes
#Test: .asciiz "azAZ"

.text
# For testing purposes
#la $a0, Test
.globl isAlpha
isAlpha:

move $v0, $zero

isAlphaLoop:
lb $t0, 0($a0)
# If the null terminator is reached then exit the loop
beqz $t0, alphaLoopEnd 
# TO DO: Implement this logic into assembly
# (curr < 'a' || curr > 'z') && (curr < 'A' || curr > 'Z')

# curr < 'a'
slti $t1, $t0, 'a'
# curr > 'z' 
sgtu $t2, $t0, 'z'
# OR result $t1 and $t2 (curr < 'a' || curr > 'z')
or $t3, $t1, $t2
# curr < 'A' 
slti $t1, $t0, 'A'
# curr > 'Z'
sgtu $t2, $t0, 'Z'
# OR result $t1 and $t2 (curr < 'A' || curr > 'Z')
or $t4, $t1, $t2
# AND result $t3 and $t4 (curr < 'a' || curr > 'z') && (curr < 'A' || curr > 'Z')
and $t5, $t3, $t4

# If $t5 is 1 then is has detected a non-alpha character, so break out of the loop
beq $t5, 1, alphaEnd
addi $a0, $a0, 1
j isAlphaLoop

alphaLoopEnd:
# If it has reached the end of the string there must only be alpha characters in the string
addi $v0, $v0, 1

alphaEnd:
# For testing purposes
#move $t3, $v0
#li $v0, 1
#move $a0, $t3
#syscall
jr $ra
