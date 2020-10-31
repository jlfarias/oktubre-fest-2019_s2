import cervezas.*

class Jarras{
	var property capacidad
	var property marca
	
	method cantidadDeAlcohol(){	return marca.graduacionAlcoholica() * capacidad }
	method paisDeOrigen(){ return marca.paisDeOrigen() }
	
	/*method precio(){
		return marca.precioPorLitro() * capacidad
	}*/
	
}

