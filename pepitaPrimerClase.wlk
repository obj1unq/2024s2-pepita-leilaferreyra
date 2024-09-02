object pepita {

	var energia = 100
	
	method comer(comida){
		energia += comida.energiaQueAporta()
	}
	
	method volar(distancia){
		energia = energia - 10 - distancia
	}
	
	method energia(){
		return energia
	}
}

object alpiste {

	method energiaQueAporta(){
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	//Getter: devuelve un atributo
	//Si es getter NO PUEDE modificar nada
	method madurez(){
		return madurez
	}
	
	//Setter: pisa el valor existente, por convencion se pone el par con _ adelante
	//Si es setter NO PUEDE devolver informacion
	method madurez(_madurez){
		madurez = _madurez
	}
	
	method madurar(){
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta(){
		return base * madurez
	}
}