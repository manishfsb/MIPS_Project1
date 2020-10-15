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
	
	li $v0, 11
	la $s1, reply
	lb $a0, 0($s1) 
	syscall

	li $v0, 10
	syscall
	

	

	

	

	