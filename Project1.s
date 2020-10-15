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
	
	
	li $t1, -87
	la $s1, reply
	lb $a0, 0($s1)
	
	li $v0, 1	
	li $t0, 0
	add $t0, $a0, $t1
	add $a0, $t0, $zero
	syscall 


	li $v0, 10
	syscall	
	
	

	

	

	

	