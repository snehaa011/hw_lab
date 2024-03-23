.data
input: .asciiz "Input: "
output: .asciiz "Output: "
arr: .space 100
arr1: .space 100

.text
main:
	li $v0,4
	la $a0,input
	syscall
	
	la $a0,arr
	li $a1,100
	li $v0,8
	syscall
	
	la $t0,arr	#store base address of arr in $t0
	la $t1,arr1	#store base address of arr1 in $t1
	
change:
	lb $t2,0($t0)	#load each byte of i/p string
	beq $t2,$zero,exit	#exit when u reach \0
	upper:
		li $t3,65	# A= ascii 65
		li $t4,90	# Z= ascii 90
		bgt $t2,$t4,lower	#if $t2 >90, go to lowercase
		blt $t2,$t3,next	#if $t2 <65, go to next char
		addi $t2,$t2,32		#else, make it lowercase by adding 32
		j next			#go to next char
	lower:
		li $t3,97	# a= ascii 97
		li $t4,122	# z= ascii 122
		bgt $t2,$t4,next	#if $t2> 122, go to next
		blt $t2,$t3,next	#if $t2< 97, go to next
		addi $t2,$t2,-32	#else, make it upper by subtracting 32
		j next			#go to next char
	next:
		sb $t2,0($t1)	#store $t2 into o/p string
		addi $t0,$t0,1	#go to next char in i/p string
		addi $t1,$t1,1	#go to next address of o/p string
		j change	#repeat
exit:
	li $v0,4
	la $a0,output
	syscall
	li $v0,4
	la $a0,arr1
	syscall
	li $v0,10
	syscall
	
		
