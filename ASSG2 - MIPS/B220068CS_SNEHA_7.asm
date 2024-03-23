.data
num1: .asciiz "Enter number1: "
num2: .asciiz "Enter number2: "
count: .asciiz "Number of prime no.s: "
newline: .asciiz "\n"
output:. asciiz "The prime numbers are: "
space: .asciiz " "

.text
main:
li $v0,4
la $a0,num1
syscall

li $v0,5
syscall
move $s0,$v0

li $v0,4
la $a0,num2

syscall

li $v0,5
syscall
move $s1,$v0

li $t2,0	#count
li $v0,4
la $a0,output
syscall
loop:
	bgt $s0,$s1,exit	#if num1>num2, exit
	li $t0,0	#divisors
	prime:
		addi $t0,$t0,1
		beq $t0,$s0,next	#if num1 = 1 , go to next
		addi $t0,$t0,1
		beq $t0,$s0,primecount	#if num1 = 2, prime
		loop1:
			divu $s0,$t0	#num1/divisor (starting with divisor 2)
			mfhi $t3 	#rem
			beq $t3,$zero,next	#if any rem is 0, then its not prime, so go to next
			addi $t0,$t0,1
			beq $t0,$s0,primecount	#if there were no divisors btw 1 and num1, go to prime
			j loop1
		primecount:
			addi $t2,$t2,1	#add to count of prime no.s
			li $v0,1
			move $a0,$s0	#print the prime no.
			syscall
			li $v0,4
			la $a0,space
			syscall
	next:
		addi $s0,$s0,1	#go to next number (num1++)
		j loop

exit:			
	li $v0,4
	la $a0,newline
	syscall	
	li $v0,4
	la $a0,count
	syscall	
	li $v0,1
	move $a0,$t2
	syscall	
	
	end:
	li $v0,10
	syscall

			

	
