.data
input: .asciiz "Enter an integer : "
output1: .asciiz "The number is palindrome "
output2: .asciiz "The number is not palindrome "
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

li $t0,10
li $t2,0		#reverse no.
add $s1,$s0,$zero	#copy num to $s1

loop:
	div $s0,$t0		#num/10
	mfhi $t1		#one's digit
	add $t2,$t2,$t1		#add to rev no.
	mflo $s0		#rest of the num
	beq $s0,$zero,exit	#exit when num is 0
	mul $t2,$t2,$t0		#rev no. x 10
	j loop
	
exit:		
beq $t2,$s1,pal		#if rev = org num, then palindrome
li $v0,4		#else, not palindrome
la $a0,output2
syscall
j end

pal:
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
