
.data
array: .space 240

text1: .asciiz ". "
text2: .asciiz "	Cows: "
text3: .asciiz ", Bulls: "
text4: .asciiz "\n"

#s5 is i

.text
.globl display

display:
#a1: User input
#v0: cows
#v1: bulls
#s7: numGuesses

#Store the return address
addi $sp, $sp, -4
sw $ra, 0($sp)

#first store the needed info into the array

subi $s6, $s7, 1
mul $s6, $s6, 3
sll $s6, $s6, 2
la $t8, array
add $t8, $t8, $s6
sw $a1, 0($t8)
sw $v0, 4($t8)
sw $v1, 8($t8)

#then check a counter and for each guess display the results
li $t9, 0
la $t8, array

loop:
beq $t9, $s7, fin #if i == numguesses then break

#display line
li $v0, 1
move $a0, $t9
addi $a0, $a0, 1
syscall
li $v0, 4
la $a0, text1
syscall

li $v0, 11
lb $a0, 3($t8)
syscall 
lb $a0, 2($t8)
syscall
lb $a0, 1($t8)
syscall  
lb $a0, 0($t8)
syscall 
addi $t8, $t8, 4

li $v0, 4
la $a0, text2
syscall
li $v0, 1
lw $a0, 0($t8)
syscall 
addi $t8, $t8, 4
li $v0, 4
la $a0, text3
syscall
li $v0, 1
lw $a0, 0($t8)
syscall 
addi $t8, $t8, 4
li $v0, 4
la $a0, text4
syscall
addi $t9, $t9, 1
j loop

fin:
#Restore Stuff
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra