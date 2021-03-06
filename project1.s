.data
												
reply:	.space 10							#Taking 10 characters as input

.text
main:	
	li $s0, 0							#Register to store sum of the values of the characters in our base system
	li $v0, 8						
	la $a0, reply							#Reading input string
	li $a1, 11
	syscall
 	
	la $s1, reply							#Loading the address of reply in $s1 so that we can add 1 to access each character
	addi $s4, $s1, 10 						#Adding 10 to $s4 so that we no longer add 1 after we've successfully scanned the 10 characters.

First:	lb $a0, 0($s1)							
	j Filter							#Load the character to $a0 and go to filter to check if it's invalid or a lowercase, uppercase or a number

After:	beq $s4, $s1, End 
	addi $s1, 1
	j First								#increment address of reply by 1 until we've reached the end of the string
	
Filter:	li $t1, 48 
	li $t2, 57
	li $t3, 64							#My Howard Id: 02898734, so base is 29 and the last valid lowercase character is 's' , last valid uppercase = 'S'  
	li $t4, 83
	li $t5, 97
	li $t6, 115							#loading different values to registers to compare ASCII characters and filter if the character is a number, lowercase or uppercase
	
	
	blt $a0, $t1, invalid						
	bgt $a0,$t6, invalid 
	ble $a0, $t6, more						

more:	
	bge $a0, $t5, Lower						#checking if characters are valid in our base system, if they are, they will go to the respective branches	
	bgt $a0, $t4, invalid
	bgt $a0, $t3, Upper
	bgt $a0, $t2, invalid
	bge $a0, $t1, numeric
									
numeric:
	li $s2, -48	
	add $s3, $a0, $s2						#if character is a numeric character
	add $s0, $s0, $s3						#storing the sum in $s0 after each character so that we can have the total value
	j After
	

Lower:	li $s2, -87	
	add $s3, $a0, $s2						#if character is lowercase
	add $s0, $s0, $s3						#$a0 % 87 could also have been done, instead of subtracting in all three cases
	j After	

Upper:	li $s2, -55	
	add $s3, $a0, $s2						#if character is uppercase
	add $s0, $s0, $s3
	j After
									#all three branches will eventually lead back to the next character

invalid:
	add $s0, $s0, $zero
	j After								#if invalid, we add zero to the total value, then repeat the validation process for the next character

End:	li $v0, 1
	add $a0, $s0, $zero						#print the total value stored in $s0 across all three cases
	syscall	

	li $v0, 10							#terminate once the output is printed
	syscall

	
	

	

	

	

	
