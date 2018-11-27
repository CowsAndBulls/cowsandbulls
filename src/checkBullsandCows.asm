#------------ This will check for number of bulls and cows -------------#
.text

# a0: secret code
# a1: userInput
#
# RETURN::
# r0: number of cows
# r1: number of Bulls

.globl count_cbulls
count_cbulls:
#Make everything zero except for a0 a1, and s7
add $t0, $zero, $zero
add $t1, $zero, $zero
add $t2, $zero, $zero
add $t3, $zero, $zero
add $t4, $zero, $zero
add $t5, $zero, $zero
add $t6, $zero, $zero
add $t7, $zero, $zero
add $s4, $zero, $zero
add $s5, $zero, $zero

#Store the return address
addi $sp, $sp, -4
sw $ra, 0($sp)

xor $t0, $a0, $a1 # We want to see if our guess is the same as our code

Bulls: 		#Using the result of xor earlier we will check is we have any bulls in out user guess
					
add $t2, $zero, $zero #resets $t2 our item counter
li	$t1, 0x000000FF  #This is our comparitive, for looping and retrieving characters

Loop1:
and $t3, $t0, $t1	#retrieve the character	
bne $t3, $zero, L1	#compare the character
addi $t2, $t2, 1    #add if equal

L1:	
beq $t1, 0xFF000000, L1end	#If we have gone through all of the characters, end the loop
sll $t1, $t1, 8				#if not we modify to retrieve the next character
j Loop1						#jump!
								
L1end:							
move $s4, $t2   	#store our result


Cows:
#Checking the number of cows 
add $t2, $zero, $zero #make $t2 zero
add $t6, $zero, $zero #$t6 (i = 0)

addi $t7, $zero, 3 #We compare to this to break our loop

add $t4, $zero, $a1 #t4, shift result, starts with the user input value

Loop:
jal Shift #call the shift
xor $t0, $a0, $t4 #xor it for our comparitive
add $t2, $zero, $zero #reset $t2, our item counter
li	$t1, 0x000000FF	#reset our register for character retrieval and looping

Loop2:
and $t3, $t0, $t1				#get the character
bne $t3, $zero, L2				#compare
addi $t2, $t2, 1				#add to counter

L2:	
beq $t1, 0xFF000000, L2end		#Break when we go through entire word
sll $t1, $t1, 8					#Edit $t1 so that we can get next character
j Loop2							#jump!
								
L2end:							
add $s5, $s5, $t2				#store our totals
addi $t6, $t6, 1 				#i++			
bne $t6, $t7, Loop				#break our larger loop when done


#Restore Stuff
lw $ra, ($sp)
addi $sp, $sp, 4
move $v0, $s5	#Set return values
move $v1, $s4
jr $ra

Shift:
andi $t5, $t4, 0xFF000000 #grab the first Character
sll $t4, $t4, 8 #Shift over by one letter
srl $t5, $t5, 24 #Shift the first character to the end
add $t4, $t4, $t5 #Add the two together
jr $ra
