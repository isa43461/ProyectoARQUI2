from sys import stdin

def alcoholimetro(sexo,peso, gramosAlcohol):
	if(sexo == 'F'):
		formula = gramosAlcohol/(peso*0.6) #mujer
	elif(sexo == 'M'):
		formula = gramosAlcohol/(peso*0.7) #hombre
	return formula

def calculos(tipo, cantidad):
	resultado = 0
	if(tipo == 1):
		resultado = (29*30*cantidad*0.8) / 100  #Aguardiente
	elif(tipo == 2):
		resultado = (13*150*cantidad*0.8)/100	#Vino
	elif(tipo == 3):
		resultado = (4*296*cantidad*0.8)/100	#Cerveza
	elif(tipo == 4):
		resultado = (39*30*cantidad*0.8)/100 	#Ron
	elif(tipo == 5):
		resultado = (38*30*cantidad*0.8)/100	#Tequila
	elif(tipo == 6):
		resultado = (40*40*cantidad*0.8)/100	#Whisky	
	return resultado
	
def eb(x):
	if(x > 0.4):
		print("No está apto para manejar")
	else:
		print("Puede manejar")

def main():
	print("Ingrese su sexo(F | M)")
	sexo = stdin.readline().strip()
	print("Ingrese su peso en KG")
	peso = float(stdin.readline())
	print("""Digite el numero que este asignado para su bebida | 
		1: Aguardiente 2: Vino 3: Cerveza 4: Ron 5: Tequila 6: Whisky""")
	tipo = int(stdin.readline())
	print("""Ingrese el numero de cantidad que desea (Si es aguardiente, ron o tequila, se sirve en shots de 30ml. Si es vino se sirve en copa de 150 ml. Si es whisky se sirve en vasos de 40 ml y si es cerveza se entrega en latas de 296 ml. ): """)
	cantidad = int(stdin.readline())
	gramos = calculos(tipo, cantidad)
	x = alcoholimetro(sexo,peso,gramos)
	ebriedad = eb(x)
	print("gramosAlcohol",gramos)
	print("ebriedad",x)
main()