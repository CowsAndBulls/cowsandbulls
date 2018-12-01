#Cows and bulls word game in MIPS

.data
intro_msg:	.asciiz	"Welcome to the Cows and Bulls game\n"
gprompt:	.asciiz "If you would like to give up enter \"yes\", otherwise enter your guess: "
cows_msg:	.asciiz "Cows: "
bulls_msg:	.asciiz ", Bulls: "
correct_msg:	.asciiz "You guessed the word!\n"
time_msg:	.asciiz "Elapsed time: "
sec_msg:	.asciiz " seconds\n"
repeat_msg:	.asciiz "Do you want to play again? (y/n): "
end_msg:	.asciiz "Thanks for playing!\n"
fail_msg:	.asciiz "The correct word is "
word_print: .asciiz "test"


.text
#Main function
.globl main
main:	jal srand		#Seed the random number generator
	li $v0, 4		#Print the introduction
	la $a0, intro_msg
	la $a2, fail_msg
	syscall
mloop:	li $a0, 0		#Generate a number 0-99 for selecting a word
	li $a1, 100		
	jal rand
	sll $v0, $v0, 2
	la $t0, viableWords	#Get address of randomly selected word
	add $t0, $t0, $v0
	lw $s2, ($t0)		#Gets the hidden string address and loads it into $s2
	la $s3, ($t0)

	jal timer_start		#Restart timer
gloop:	li $v0, 4		#Print the guess prompt
	la $a0, gprompt
	syscall
	jal get_usrword		#Get the user's input ($v0 = error, $v1 = input)
	beq $v0, 1, playerFail	#Check if the user gave up
	beq $v0, 0, valid	#Check if the input was valid
	move $a0, $v0		#If not, print the error and loop
	li $v0, 4
	syscall
	j gloop
valid:
	move $a0, $s2		#Count cows and bulls ($v0 = cows $v1 = bulls)
	move $a1, $s1
	jal count_cbulls	
	beq $v1, 4, glend	#If the bull count is 4, the user has guessed correctly, so end the loop
	move $t1, $v0		#Store the number of cows
	li $v0, 4		#Otherwise, print the number of cows
	la $a0, cows_msg
	syscall
	li $v0, 1
	move $a0, $t1		
	syscall
	li $v0, 4		#Print the number of bulls
	la $a0, bulls_msg
	syscall
	li $v0, 1
	move $a0, $v1
	syscall
	li $v0, 11		#Print a newline
	li $a0, '\n'
	syscall
	j gloop			#Loop again until the user guesses correctly
glend:	jal timer_elapsed	#Get elapsed time (in milliseconds)
	div $s2, $v0, 1000	#Divide elapsed ms by 1000 and store it in $s2
	li $v0, 4		#Print the completion message
	la $a0, correct_msg
	syscall
	la $a0, time_msg	#Print time message
	syscall
	li $v0, 1		#Print the elapsed time
	move $a0, $s2
	syscall
	li $v0, 4		#Print "seconds"
	la $a0, sec_msg
	syscall
	la $a0, repeat_msg	#Ask the user if they want to play again
	syscall
	li $v0, 12		#Read the user's response
	syscall
	move $t0, $v0
	li $v0, 11		#Print a newline
	li $a0, '\n'
	syscall
	beq $t0, 'y', mloop	#Loop if the user chooses to continue
mlend:	li $v0, 4		#Print the end message
	la $a0, end_msg
	syscall
	li $v0, 10		#End of program
	syscall
playerFail:
	li $v0, 4
	la $a0, fail_msg
	syscall
	li $v0, 4
	move $t1, $s3
	la $a0, word_print
	lb $t0, ($t1)
	sb $t0, ($a0)
	lb $t0, 1($t1)
	sb $t0, 1($a0)
	lb $t0, 2($t1)
	sb $t0, 2($a0)
	lb $t0, 3($t1)
	sb $t0, 3($a0)
	move $t0, $zero
	sb $t0, 4($a0)
	#sb $t0, 4($zero)
	#la $a0, ($t0)
	syscall
	li $v0 11
	li $a0, 0xa
	syscall
	li $t0 0
	j glend	
	
