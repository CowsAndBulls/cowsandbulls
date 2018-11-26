#Functions for getting and validating user input

.text

#Reads a 4-character word from the user and validates it
#Return values: $v0 = NULL if valid, address of error message if invalid
#		$v1 = user string as integer if valid or NULL if invalid
.globl get_usrword
get_usrword:

	jr $ra
