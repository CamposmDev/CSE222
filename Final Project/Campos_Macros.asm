.macro saveAddr()	# Saves return address to stack pointer
	sub $sp $sp 4	# Make space in stack pointer
	sw $ra 0($sp)
.end_macro
.macro loadAddr()	# Loads return address from stack pointer
	lw $ra 0($sp)
	addi $sp $sp 4
.end_macro
.macro prmptInt()
	li $v0 5
	syscall	# Integer stored in v0
.end_macro
.macro prntInt(%x)
	li $v0 1
	move $a0 %x
	syscall
.end_macro
.macro prntStr(%s)
	li $v0 4
	la $a0 %s
	syscall
.end_macro
.macro prntChar(%c)
	li $v0 11
	move $a0 %c
	syscall
.end_macro

.macro print(%str)
.data 
	s: .asciiz %str
.text
	prntStr(s)
.end_macro
