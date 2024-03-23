.data
input: .asciiz "Enter an integer : "
output: .asciiz "The Fibonacci number is : "
negative: .asciiz "The number is invalid."

.text
main:
li $v0,4
la $a0,input
syscall

li $v0,5
syscall
move $s0,$v0

ble $s0,$zero,neg

li $t0,0	#number 1
li $t1,1	#number 2
li $t2,0	#number 3
beq $s0,$t1,print	#if integer is 1, print $t0

li $s1,3	#chk condition for integer

loop:
	add $t2,$t1,$t0		#num3= num1+ num2
	move $t0,$t1		#$t0=$t1
	move $t1,$t2		#$t1=$t2
	addi $s1,$s1,1		#next integer
	ble $s1,$s0,loop	#if next integer< user integer, go to loop, else exit
	
print:
	move $t2,$t0
	
li $v0,4
la $a0,output
syscall

li $v0,1
move $a0,$t2
syscall
j end

neg:
li $v0,4
la $a0,negative
syscall

end:
li $v0,10
syscall
