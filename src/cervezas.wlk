import paises.*

class Cerveza {
	var property grsLupulo = 0
	var property paisDeOrigen
	var property precioPorLitro = 180

	method graduacionAlcoholica()

}

// GRADUACION ALCOHOLICA 8 % = 8/100 = 0,008
class CervezaRubia inherits Cerveza{ 
	var property graduacionAlcoholica
}

/*GRADUACION REGLAMENTARIA NO DEBE CAMBIAR EN CADA INSTANCIA */
object gradReglamentaria{ var property gradMundial = 0.06 }

class CervezaNegra inherits Cerveza{
	
	override method graduacionAlcoholica() 
			= gradReglamentaria.gradMundial().min(self.grsLupulo() * 2 / 100)
}

class CervezaRoja inherits CervezaNegra{
	
	override method graduacionAlcoholica(){	return super() * 1.25 }
}




