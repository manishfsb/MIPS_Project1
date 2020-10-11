.data

msg:	.asciiz "ManishBasnet"

.text
main:

	li $v0, 4
	la $a0, msg
	lb $s0, 4($a0)  
	syscall

	li $v0, 10
	syscall