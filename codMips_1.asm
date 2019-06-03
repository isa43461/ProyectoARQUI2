addi $s0, $0, 1 #sexo
addi $s1, $0, 70 #peso
addi $s2, $0, 1 #tipo bebida
addi $s3, $0, 2  #cantidad
addi $t4, $0, 1	 #Comprueban que lo que ingresó el usuario es aguardiente
beq $t4, $s2, 10
addi $t4, $0, 2	#Comprueban que lo que ingresó el usuario es vino
beq $t4, $s2, 13
addi $t4, $0, 3	#Comprueban que lo que ingresó el usuario es cerveza
beq $t4, $s2, 16
addi $t4, $0, 4	#Comprueban que lo que ingresó el usuario es ron
beq $t4, $s2, 19
addi $t4, $0, 5	#Comprueban que lo que ingresó el usuario es tequila
beq $t4, $s2, 22
addi $t4, $0, 6	#Comprueban que lo que ingresó el usuario es whisky
beq $t4, $s2, 25	
addi $t4, $0, 870
mul $t5, $t4, $s3 #870 * cantidad -> 870 = 29 * 30
addi $t4, $0, 8
mul $t5, $t5, $t4 # 870 * cantidad * 8
j 46
addi $t4, $0, 1950
mul $t5, $t4, $s3 #1950 * cantidad -> 1950 = 13 * 150
addi $t4, $0, 8
mul $t5, $t5, $t4 # 1950 * cantidad * 8
j 46
addi $t4, $0, 1184
mul $t5, $t4, $s3 #1184 * cantidad -> 1184 = 4 * 296
addi $t4, $0, 8
mul $t5, $t5, $t4 # 1184 * cantidad * 8
j 46
addi $t4, $0, 1170
mul $t5, $t4, $s3 #1170 * cantidad -> 1184 = 39 * 30
addi $t4, $0, 8
mul $t5, $t5, $t4 # 1170 * cantidad * 8
j 46
addi $t4, $0, 1140
mul $t5, $t4, $s3 #1140 * cantidad -> 1140 = 38 * 30
addi $t4, $0, 8
mul $t5, $t5, $t4 # 1184 * cantidad * 8
j 46
addi $t4, $0, 1600
mul $t5, $t4, $s3 #1600 * cantidad -> 1600 = 40 * 40
addi $t4, $0, 8
mul $t5, $t5, $t4 # 1600 * cantidad * 8
j 46
addi $t6, $0, 1
beq $t6, $s0, 12 #Si t6 = 1 se va ala etiqueta de alcoholimetroHombre donde se ingresan los datos a la formula especial para los hombres
j 49 #En caso contrario se utiliza la formula de la mujer
addi $t8,$0,6
mul $t7,$s1,$t8 #Peso * 6
div $t5, $t7 #gramosAlcohol / (peso * 6)
addi $t8,$0,100
div $t5,$t8
addi $t8, $0, 40
slt $v1, $t8, $t5 # v1 = 1 si t8 < t9
beq $v1, $0, 14 #va a la comprobación si v1 = 0
addi $v0, $0, 1
j 69
addi $t8,$0,7
mul $t7,$s1,$t8 #peso * 7
div $t5, $t7 #gramosAlcohol / (peso * 7)
addi $t8,$0,100
div $t5,$t8
addi $t8, $0, 40
slt $v1, $t5, $t8 # v1 = 1 si t9 < t8
beq $v1, $0, 4 #va a la comprobación si v1 = 0
addi $v0, $0, 1
j 69
addi $v0, $0, 0 