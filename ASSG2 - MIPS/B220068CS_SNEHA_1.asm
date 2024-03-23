.data
odd: .asciiz "The number is odd."
even: .asciiz "The number is even."
.text
main:
li $v0 5
syscall
move $s0,$v0

li $t0,2
div $s0,$t0	# num /2
mfhi $s1	# rem is in $s1

li $s2,1
beq $s1,$s2,oddprint	#if rem=1, odd
li $v0,4
la $a0,even
syscall
j end

oddprint:
li $v0, 4
la $a0,odd
syscall

end:
li $v0,10
syscall
