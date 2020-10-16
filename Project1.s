.data

msg:	.asciiz "Input: "
reply:	.space 11
line:	.asciiz "\n"


.text
main:	
	li $s0, 0
	
	li $v0, 4
	la $a0, msg
	syscall 
	
	li $v0, 8						
	la $a0, reply
	li $a1, 11
	syscall
 	
	la $s1, reply
	addi $s4, $s1, 10 

First:	lb $a0, 0($s1)
	j Filter

After:	beq $s4, $s1, End 
	addi $s1, 1
	j First
	
Filter:	li $t1, 48 
	li $t2, 57
	li $t3, 64
	li $t4, 90
	li $t5, 97
	li $t6, 122
	
	
	blt $a0, $t1, invalid
	bgt $a0,$t6, invalid 
	ble $a0, $t6, more

more:	
	bge $a0, $t5, Lower
	bgt $a0, $t4, invalid
	bgt $a0, $t3, Upper
	bgt $a0, $t2, invalid
	bge $a0, $t1, numeric

numeric:
	li $s2, -48	
	add $s3, $a0, $s2
	add $s0, $s0, $s3	
	j After
	

Lower:	li $s2, -87	
	add $s3, $a0, $s2
	add $s0, $s0, $s3
	j After	

Upper:	li $s2, -55	
	add $s3, $a0, $s2
	add $s0, $s0, $s3
	j After
	

invalid:
	add $s0, $s0, $zero
	j After

End:	li $v0, 4
	la $a0, line
	syscall	

	li $v0, 1
	add $a0, $s0, $zero
	syscall	

	li $v0, 10
	syscall

	
	

	

	

	

	