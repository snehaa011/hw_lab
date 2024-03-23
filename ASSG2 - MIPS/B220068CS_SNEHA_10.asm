.data
input: .asciiz "Enter a signed binary no. : "
output: .asciiz "Sum of given no. and its 2's complement is : "
buffer: .space 35
op: .space 35

.text
main:
li $v0,4
la $a0,input
syscall

la $a0,buffer
li $a1,35
li $v0,8
syscall
move $s0,$a0

strlen:
	add $t0,$s0,$zero	#$t0 has base address of buffer
	li $t1,0	#count
	loop:
		lb $t2, 0($t0)
		beq $t2,10,sum		#count until \n (ASCII 10) - correct length of string
		addi $t0,$t0,1
		addi $t1,$t1,1
		j loop
sum:
	la $t7,0
	li $t3,48	#contains '0'
	li $t4,0	#count for no. of 0's in o/p
	loop1:
		sb $t3,op($t7)	#store '0' into o/p
		addi $t7,$t7,1
		addi $t4,$t4,1
		beq $t4,$t1,exit	#exit when count $t1 and $t4 is same (that many 0s)
		j loop1
exit:
	li $v0,4
	la $a0,output
	syscall
	
	li $v0,4
	la $a0,op
	syscall
	
	li $v0,10
	syscall
	
