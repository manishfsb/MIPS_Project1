.data

msg:	.asciiz "Manish"


.text
main:
	la $s1, msg
	li $t2, 0
	
back:	slt $t1, $t2, 6
	bne $t1, $zero, index
	
	li $v0, 10
	syscall
 
index: 
	li $v0, 11
	lb $a0, 0($s1)
	addi $s1, $s1, 1
	addi $t2, $t2, 1
	syscall
	j back
	

	

	

	