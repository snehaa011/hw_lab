.data
input: .asciiz "Enter an integer : "
output1: .asciiz "The number is perfect. "
output2: .asciiz "The number is not perfect. "
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

li $t0,0	#divisors
li $t1,0	#sum

loop:
	addi $t0,$t0,1		#increment divisors
	beq $t0,$s0,exit	#till the number
	divu $s0,$t0		#num/divisor
	mfhi $t2		#rem is $t2
	bne $t2,$zero,loop	#if rem!=0, go to loop
	add $t1,$t1,$t0		#else add divisor to sum
	j loop
	
exit:		
beq $t1,$s0,perfect
li $v0,4
la $a0,output2
syscall
j end

perfect:
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
