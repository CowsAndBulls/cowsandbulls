#Utility functions for timing, random number generation, etc

.data
timer:	.word 0

.text
#Starts/resets the timer
.globl timer_start
timer_start:
	li $v0, 30
	syscall
	sw $a0, timer
	jr $ra

#Returns the number of seconds since the timer was started
#Return values: $v0 = Seconds since timer was started
.globl timer_elapsed
timer_elapsed:
	li $v0, 30
	syscall
	lw $a1, timer
	sub $v0, $a0, $a1
	jr $ra
	
#Seeds the random number generator using the current time
.globl srand
srand:
	li $v0, 30	#Get current time
	syscall 	
	li $v0, 40	#Set RNG to use time as the seed
	move $a1, $a0
	li $a0, 0
	syscall
	jr $ra
	
#Returns a random integer within a range
#Arguments: $a0 = Lowest value, $a1 = Range
#Return values: $v0 = Random integer in the range [$a0, $a0+$a1]
.globl rand
rand:
	move $t0, $a0 #Preserve $a0
	li $a0, 42    #Call to generate a random number
	syscall
	add $v0, $a0, $t0
	jr $ra
