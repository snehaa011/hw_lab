.data
input: .asciiz "Enter an integer : "
output1: .asciiz "The number is armstrong. "
output2: .asciiz "The number is not armstrong. "
negative: .asciiz "The number is negative."

.text
main:
li $v0,4
la $a0,input
syscall

li $v0,5
syscall
move $s0,$v0

blt $s0,$zero,neg

li $t7,0 	#count of digits
li $t0,10
add $s1,$s0,$zero	#$s1=$s0
digit: 
	div $s0,$t0
	mflo $s0
	addi $t7,$t7,1
	beq $s0,$zero,calc	#exit when $s0 = 0
	j digit

calc:
li $t2,0		#sum
add $s0,$s1,$zero	#$s0=$s1

loop:
	div $s0,$t0		#$s0/10
	mflo $s0		#store quotient is $s0
	mfhi $a0		#rem is ones digit
	jal multiply
	move $t3,$v0
	add $t2,$t2,$t3		#add to sum
	beq $s0,$zero,exit	#exit when $s0 = 0
	j loop

multiply:
	li $t4,1		#no. of mult
	move $t1,$a0
	loop1:
	#beq $t4,$t7,back
	mult $t1,$a0
	mflo $t1
	addi $t4,$t4,1
	blt $t4,$t7,loop1
	#j loop1
	back: 
		move $v0,$t1
		jr $ra
	
		
exit:		
beq $t2,$s1,arm
li $v0,4
la $a0,output2
syscall
j end

arm:
li $v0,4
la $a0,output1
syscall
j end

neg:
li $v0,4
la $a0,negative
syscall

end:
li $v0,10
syscall
