.data

msg:	.asciiz "Input: "
reply:	.space 11


.text
main:	
	li $s0, 0
	
	li $v0, 4
	la $a0, msg
	syscall 
	
	li $v0, 8						
	la $a0, reply
	li $a1, 10
	syscall
 	
	la $s1, reply

First:
	lb $a0, 0($s1)
	j Filter

After:	addi $s1, 1
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

Lower:	
	
	li $s2, -87	
	add $s3, $a0, $s2
	add $s0, $s0, $s3
	add $a0, $s0, $zero
	j After
	

Upper:
	li $v0, 1
	li $s2, -55	
	add $s3, $a0, $s2
	add $s0, $s0, $s3
	add $a0, $s0, $zero
	syscall
	j After
	
	

invalid:j After
	

	

	

	

	