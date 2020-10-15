.data

msg:	.asciiz "Input: "
string:	.asciiz "Valid"
reply:	.space 11


.text
main:	
	li $v0, 4
	la $a0, msg
	syscall 
	
	li $v0, 8						
	la $a0, reply
	li $a1, 10
	syscall

	
	blt $a0, 58, invalid
	bgt $a0,122, invalid 

	blt $a0, 97, more

more:	bgt $a0, 90, invalid
	bgt $a0, 64, small

small:
	li $v0, 11
	la $a1, $a0
	syscall

invalid:li $v0, 10
	syscall
	

	

	

	

	