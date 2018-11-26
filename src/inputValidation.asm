#---------Checks if the input is valid--------#
.data

# Contains all the valid words
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

# Possible error messages for wrong length length, alphabetical characters, repeating letters, etc.
# General error message, appears for any possible error
errorMsg1: .asciiz "This string is not valid"
# Error message that appears if the user input is 4 characters long
errorMsg2: .asciiz "This string must be four letters long"
# Error message that appears if non-alphabetical letters are in the string
errorMsg3: .asciiz "This string must only contain alphabetical letters"
# Error message that appears if there any repeating letters
errorMsg4: .asciiz "This string cannot contain any repeating letters"
# Error message that appears if the word was not found in viable words
errorMsg5: .asciiz "This string is not in our dictionary, must be a valid elngish word"
#test
test: .ascii "test"
.text

# a0:  User input to be checked
#
# RETURN:
# v0: 0 if the input wasn't valid, 1 is the input was valid

main:
add $t0, $zero, $zero
add $t1, $zero, $zero
add $t2, $zero, $zero
add $t3, $zero, $zero
add $t4, $zero, $zero
add $t5, $zero, $zero
add $t6, $zero, $zero
#add $t7, $zero, $zero

la $a0, test

# Check if the given word is four letters long
strLen:
lb $t0, 0($a0)
beq $t0, $zero, lenEnd
addi $a0, $a0, 1
addi $t1, $t1, 1
j strLen

lenEnd:
move $t5, $t1
beq $t1, 4, alphaStart # If length is four skip printing out the message about character length

# Print out error message 1
li $v0, 4	# Need to store $v0 and $a0 into temporary registers 
la $a0, errorMsg2	
syscall

alphaStart:
move $t0, $zero
move $t1, $zero
#addi $t5, $t5, 4  Actually $t4 is already the length of the string


alpha: # This loop checks if each letter is an alphabeteical character, still need to implement looping through each letter
beq $t4, $t5, end1
lb $t0, ($a0) # gets the first letter of user Input
# translate this to mips ((arr[k] < 'a' || arr[k] > 'z')) # This logic needs to be changed as it does not work in the HLL.
sgt $t1, $t0, 'a'
slti $t2, $t0, 'z'
or $t3, $t1, $t2
bnez $t3, notAlpha
addi $t4,$t4, 1
j alpha
end1:
j repeatStart # Skip over print the error message

notAlpha: # Print out error message for non alphabetical characters
li $v0, 4 # Need to store $v0 and $a0 into temporary registers
la $a0, errorMsg3
syscall

repeatStart: # Here goes the code for checking repeating letters


# $t0 holds the loop iterations 
# $t1 hold the length of the array times the bytes per word (100 * 4)
move $t0, $zero
move $t1, $zero
addi $t1, $t1, 400

# This assumes that the string has been converted to lowercase
validationLoop:
# if loop iterations is equal to the size of array, end the loop
beq $t0, $t1, end
# Load a string from viableWords at index $t0 into $t2
lw $t2, viableWords($t0)
# Compare the user input ($a0) to the string in the array ($t2)
xor $t3, $t2, $a0
beq $t3, $zero, valid
# Increment $t0
addi $t0, $t0, 1
sll $t0, $t0, 2
j validationLoop
end:
# If we have reached the end of the loop and found no matches, then it can't be in viableWords


valid:

