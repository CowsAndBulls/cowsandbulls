#Functions for getting and validating user input

.data
.align 2	#Align the buffer to 4 bytes
buf:		.space 16	#Buffer for user input
err_length:	.asciiz	"The string must be four letters long"
err_alpha:	.asciiz "The string must contain only alphabetical letters"
err_viable:	.asciiz "The string must be a valid english word"
err_dup:	.asciiz "The string must contain no duplicate letters"

.text
#Reads a 4-character word from the user and validates it
#Return values: $v0 = NULL if valid, address of error message if invalid
#		$v1 = user string as integer if valid or 0 if invalid
.globl get_usrword
get_usrword:
	move $s0, $ra
	
	li $v0, 8	#Read up to 16 bytes from the user into buf
	la $a0, buf
	li $a1, 15
	syscall
	li $t0, 0	#Initialize return value temporaries
	li $t1, 0
	nop		#TODO: Validate length & contents
	la $a0, buf
	jal isAlpha
	bnez $v0, alphaTrue
	la $t0, err_alpha
	j end
alphaTrue:
	la $a0, buf
	jal toLowercase
	
	move $a0, $v0
	jal strLen
	bnez $v0, lengthTrue
	la $t0, err_length
	j end
lengthTrue:
	move $a0, $v0
	jal checkDuplicates
	bnez $v0, dupTrue
	la $t0, err_dup
	j end	
dupTrue:
	move $a0, $v0
	jal isViableWord	
	bnez $v0, end
	la $t0, err_viable
	j end
	
	lw $t1, buf	#Load 4 bytes of the string as an integer to $s1
end:	move $v0, $t0	#Set return values and return
	move $v1, $t1
	move $ra, $s0
	jr $ra

#To add new validation:
#If incorrect, set $v0 to address of the error message and jump to end
