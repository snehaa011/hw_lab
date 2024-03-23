.data
input: .asciiz "Enter an integer : "
output: .asciiz "The factorial is : "
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

li $t1,1
li $t0,1

loop:
mul $t1,$t1,$t0
addi $t0,$t0,1
ble $t0,$s0,loop

li $v0,4
la $a0,output
syscall

li $v0,1
move $a0,$t1
syscall
j end

neg:
li $v0,4
la $a0,negative
syscall

end:
li $v0,10
syscall
