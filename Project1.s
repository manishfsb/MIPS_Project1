.data

msg:	.asciiz "Input: "
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
	
	la $s1, reply
	lb $a0, 1($s1)

	li $s2, 58
	li $s3, 122
	li $s4, 97
	li $s5, 90
	li $s6, 64	

	blt $a0, $s2, invalid
	bgt $a0,$s3, invalid 

	blt $a0, $s4, more

more:	bgt $a0, $s5, invalid
	bgt $a0, $s6, Upper

Upper:
	li $v0, 11
	syscall

invalid:li $v0, 10
	syscall
	

	

	

	

	