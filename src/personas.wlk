import cervezas.*
import jarras.*
import paises.*

class Persona {
	var property peso = 0
	const jarrasCompradas = []
	var property musicaTradicional = false
	var property nivelDeAguante = 0
	var property nacionalidad
	const carpaQueCompro = []
	var seVaEnVicio = false
	
	method agregarCarpa(unaCarpa){ carpaQueCompro.add(unaCarpa) }
	method carpaQueCompro(){ return carpaQueCompro }
	
	method jarrasCompradas(){ return jarrasCompradas }
	
	method comprarJarras(unaJarra){
		var ultimaJarra = unaJarra
		jarrasCompradas.add(unaJarra)
			if (ultimaJarra.capacidad() <= unaJarra.capacidad() ){
				seVaEnVicio = true
			}
		ultimaJarra = unaJarra
		
	}
	
	method leGustaMarca(cerveza) = true // ALEMAN LE GUSTAN TODAS - SOBREESCRIBO OTRAS NAC.
	
	method totalAlcohol(){ return jarrasCompradas.sum({jarra => jarra.cantidadDeAlcohol() }) }
	method estaEbrio(){	return (self.totalAlcohol() * self.peso() ) > self.nivelDeAguante() }

	/* noahSI ES ALEMAN DEBE HABER CANTIDAD PAR (LO DEFINE ALEMAN) */	
	method personaQuiereEntrar(carpa){
			return carpa.tieneBanda() == musicaTradicional 
			and self.leGustaMarca(carpa.marcaQueVende())		
	}
	
	//HAY QUE PASAR LA PERSONA, EN ESTE CASO SELF
	method puedeEntrar(carpa){ return self.personaQuiereEntrar(carpa) and carpa.carpaDejaEntrar(self) }

	method esUnEbrioEmpedernido(){
 		return jarrasCompradas.all({ j => j.capacidad() >= 1})
 		and self.estaEbrio()
 	}
	
	// ES PATRIOTA SI ORIGEN CERVEZA == NACIONALIDAD
	method esPatriota(){ 
		return jarrasCompradas.all({ p => p.paisDeOrigen() == self.nacionalidad() })
	}

	// REQUERIMIENTOS AVANZADOS--------------------------------------------------------------
	method marcaQueCompro(){
		return jarrasCompradas.map({ mj => mj.marca()}).asSet()
	}

	// MARCAS QUE COMPRARON HAY MAS IGUALES QUE MENOS
	method sonCompatibles(persona, unaPersona){ 

	}
	
	method carpaQueLeSirvieron(){
		return jarrasCompradas.map({ c => c.carpaQueCompro()})
	}
	
	// JARRA QUE COMPRA >= A LA ANTERIOR 
	method estaEnVicio(){ return seVaEnVicio } 
	
	// REVISAR SI LA CARPA ME DA EL PRECIO NO LA JARRA
	method gastoTotal(){ return carpaQueCompro.sum({jc => jc.precioDeVenta()}) }
	
	method jarraMasCaraQueCompro(){ return jarrasCompradas.max({ jc => jc.precio()}).marca() }
}



class Aleman inherits Persona{ 
	// HAY QUE PASAR EL PARAMETRO "CARPA" a super() PARA QUE NO DE ERROR
	override method personaQuiereEntrar(carpa){
		return super(carpa) and carpa.personasQueEntraron().size().even()
	}
}

class Belga inherits Persona{ 
	override method leGustaMarca(cerveza){
		return cerveza.grsLupulo() > 4
	}
}

class Checo inherits Persona{
		override method leGustaMarca(cerveza){
		return cerveza.graduacionAlcoholica() > 0.08
	}
}


	






