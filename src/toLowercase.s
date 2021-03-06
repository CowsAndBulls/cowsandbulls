#--This function converts uppercase characters in a string to lowercase--#

# ARGUEMENTS:
# $a0 holds the string to convert uppercase characters to lowercase
#
# RETURN:     
# $v0 holds the arguement string except all uppercase letters are converted to lowercase
# (Assume the string is made of alpha characters)

.data
# For testing purposes
#Test: .asciiz "ASDFGHJKLZXCVBNM"
temp: .asciiz ""

.text
# For testing purposes
#la $a0, Test

.globl toLowercase
toLowercase: 
li $t2, 0
lowercaseLoop:
lb $t0, 0($a0)
beq $t0, 0xa, lowerLoopEnd
beqz $t0, lowerLoopEnd 
# Subtract the hex value of 'a' from the current byte
subi $t1, $t0, 0x61
# If the result is greater than zero than the letter must be an uppercase letter
bgez $t1, continueLowercaseLoop
# Add 32 which the distance from the uppercase alphabet to lowercase alphabet
addi $t0, $t0, 32
# Replaces the current captial character with the lowercase characters
sb $t0, ($a0)
continueLowercaseLoop:
addi $a0, $a0, 1
addi $t2, $t2, 1
j lowercaseLoop

lowerLoopEnd:
# For testing purposes
#move $t1, $a0
#la $a0, Test
#li $v0, 4
#syscall
sub $a0, $a0, $t2
move $v0, $a0
jr $ra
