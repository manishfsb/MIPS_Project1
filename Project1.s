.data

msg:	.asciiz "Manish"


.text
main:

	li $v0, 11
	la $s0, msg
	lb $a0, 5($s0)			
	syscall
	

	li $v0, 10
	syscall