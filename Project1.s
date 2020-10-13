.data

msg:	.asciiz "Input: "
reply:	.space 10

.text

main:

	li $v0, 4
	la $a0, msg			#Print msg by storing it's address in $a0
	syscall
	
	li $v0, 8
	la $a1, reply			#Store the input
	
	li $v0, 4
	la $a0, 0($a1)			#then print the input				
	syscall 

	li $v0, 10
	syscall