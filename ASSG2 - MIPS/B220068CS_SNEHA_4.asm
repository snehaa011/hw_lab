.data
input: .asciiz "Enter a 32-bit binary no. : "
output: .asciiz "The decimal equivalent is: "
buffer: .space 35
newline: .asciiz "\n"

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
	add $t0,$s0,$zero	#store $s0 in $t0
	li $t1,0		#length
	loop:
		lb $t2, 0($t0)		#load each byte
		beq $t2,10,find		#until the byte has '\n' ( '0' is not $zero )
		addi $t0,$t0,1		#go to address of next byte
		addi $t1,$t1,1		#length++
		j loop

find:
	li $s1,0	#decimal
	li $t6,1	#exit when it is 2^0(1)
	addi $t3,$t3,1	#multiplicand
	sllv $t3,$t3,$t1	#shift left by length 
	loop1:
		lb $t4,0($s0)		#load byte
		addi $t4,$t4,-48	#convert to integer
		srl $t3,$t3,1		# divide multiplicand by 2
		mult $t4,$t3		# byte * multiplicand
		mflo $t5
		add $s1,$s1,$t5		#add to decimal
		beq $t3,$t6,print	#exit when multiplicand is 1
		addi $s0,$s0,1		#go to next byte
		j loop1
		
print:
	li $v0,4
	la $a0,output
	syscall
	li $v0,1
	move $a0,$s1
	syscall
end:
li $v0,10
syscall
