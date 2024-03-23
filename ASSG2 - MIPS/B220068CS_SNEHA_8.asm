.data
input: .asciiz "Enter 10 elements: "
elem: .asciiz "Enter element to search: "
f: .asciiz "Element found."
nf: .asciiz "Element not found."
arr: .space 40

.text
main:
	li $v0,4
	la $a0,input
	syscall
	
	la $s0,arr	#contains base address of array
	li $t0,0
enter:
	li $v0,5
	syscall
	sw $v0,0($s0)	#$v0 contains each integer
	addi $s0,$s0,4
	addi $t0,$t0,1
	beq $t0,10,next
	j enter
next:
	li $v0,4
	la $a0,elem
	syscall
	li $v0,5
	syscall
	move $s1,$v0	#$s1 is element to search
	la $s0,arr
	li $t0,0	#count of elements traversed
search:
	lw $t1,0($s0)
	beq $t1,$s1,found
	addi $s0,$s0,4
	addi $t0,$t0,1
	beq $t0,10,notfound
	j search
found:
	li $v0,4
	la $a0,f
	syscall
	j end
notfound:
	li $v0,4
	la $a0,nf
	syscall
end:
	li $v0,10
	syscall
	
	
	
