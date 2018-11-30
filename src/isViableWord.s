#--Checks if a given string is within a list of english words--#

# ARGUEMENTS:
# $a0 holds the string to compare to the list of viable words
#
# RETURN:     
# $v0 holds a one or zero, where 1 means that the string is in the viable list while 0 means it is not in the list
# (Also assume that the string passed only has lowercase letters and has a length of four)



.data
.align 2
# Contains all the valid words
.globl viableWords
viableWords: .ascii "able", "atom", "arms", "aunt", "bank", "blue", "bowl", "burn", 
"cake", "cars", "code", "corn", "dash", "desk", "dogs", "duck", "echo", "ends", "evil", 
"exit",  "face", "file", "fort", "fund",  "game", "girl", "goat", "guys", "hack", "hero", 
"holy", "huge", "icon", "inch", "into", "item", "jade", "jets", "jobs", "jump", "keys", 
"kind", "king", "knob", "lamb", "lend", "liar", "lost", "maid", "milk", "more", "must", 
"near", "node", "next", "numb", "obey", "once", "oval", "oxen", "page", "pets", "play", 
"pork", "quit", "quiz", "quad", "raft", "ride", "risk", "rows", "same", "skip", "soap", 
"stir", "tail", "tiny", "toad", "true", "ugly", "unit", "unto", "user", "vase", "vent", 
"vine", "vote", "wage", "weak", "wild", "wrap", "yard", "year", "yeah", "yoga", "zero", 
"zest", "zone", "zits"
#testArray: .asciiz "10", "20", "30", "40", "50"

.text
# For testing purposes
#lw $a0, Test

.globl isViableWord
isViableWord:

la $t2, viableWords

move $v0, $zero
# The length of the viable words array minus 1 times 4
addi $t4, $t4, 99
# Set the count variable to zero
move $t1, $zero

#sb $t3, 0($a0)
#sb $t3, 1($a0)
#sb $t3, 2($a0)
#sb $t3, 3($a0)
lw $t3, -8($a0)  

viableLoop:
lw $t0, 0($t2)



# If we have reached maxed size of array, end
beq $t1, $t4, viableEnd
# If we have found a match in the array, exit loop
beq $t0, $t3, viableLoopEnd
addi $t1, $t1, 1
addi $t2, $t2, 4
j viableLoop

viableLoopEnd:
addi $v0, $v0, 1

viableEnd:
# For testing purposes
#move $t3, $v0
#li $v0, 1
#move $a0, $t3
#syscall
move $t0, $zero
jr $ra

