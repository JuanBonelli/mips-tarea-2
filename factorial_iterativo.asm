.data
Usuario: .asciiz "Ingrese el numero que desee: "

.text
.globl main
main:

#Le pido al usuario un numero
li $v0, 4
la $a0, Usuario
syscall
#Lo guardo en a0
li $v0, 5
syscall
move $a0, $v0

#Llamo a factorial
jal factorial

#Imprimo el resultado
move      $a0, $v0
li        $v0, 1
syscall

#Termina
li $v0, 10
syscall


factorial:
#Prologo
addi $sp, $sp, -4
sw $a0, 0($sp)

li $s0, 1

loop:
beq $a0, $zero, return
mul $s0, $s0, $a0			    #	t1 = t1 * t0
addi $a0, $a0, -1
j loop						        #itera el ciclo

return:
move $v0, $s0

#Epilogo
lw $a0, 0($sp)
addi $sp, $sp, 4

jr $ra
