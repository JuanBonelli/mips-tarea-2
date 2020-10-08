.data
Usuario: .asciiz "Ingrese un numero: "

.text
.globl main
main:

#Le pido al usuario un numero
li $v0, 4
la $a0, Usuario
syscall
#Guardo el numero en a0
li $v0, 5
syscall
move $a0, $v0

jal factorial	#El factorial de $a0

#Imprimo resultado
move $a0, $v0
li $v0, 1
syscall

#Termina
li $v0, 10
syscall

factorial:

#Prologo
addi $sp, $sp, -12	# Creo 12 espacios utilizando 3 registros
sw $a0, 0($sp)		  # Guardo $a0
sw $t2, 4($sp)		  # Guardo $t2
sw $ra, 8($sp)		  # Guardo $ra


#Casos base
li $t0, 1
beq $a0, $t0, exit	  #if($a0==1) console.log ("1");
beq $a0, $zero, exit	#if($a0==0) console.log ("1");



move $t2, $a0         # t2 = a0
addi $a0, $a0, -1	    # Resto 1 a a0
jal factorial		      # factorial(a0)
move $t1, $v0		      # t1 = factorial(a0)
mul $v0, $t1, $t2   	# t1*t2
j return


exit:
li $v0, 1 #v0 = 1
j return  #Termina


return:

# epilogo
lw $a0, 0($sp)
lw $t2, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12
jr $ra
