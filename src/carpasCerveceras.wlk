import personas.*
import cervezas.*
import jarras.*
import paises.*

class Carpa {
	var property limAdmitido = 10
	var property tieneBanda = false
	var marcaQueVende
	const personasQueEntraron = []
	var property recargo = 1.3
	
	method personasQueEntraron(){ return personasQueEntraron }
	method ingresarPersona(unaPersona){ personasQueEntraron.add(unaPersona) }
	
	method marcaDeLaCarpa(unaMarca){ marcaQueVende = unaMarca }
	method marcaQueVende(){ return marcaQueVende }

	method carpaDejaEntrar(unaPersona){ 
		return personasQueEntraron.size() < limAdmitido
			and not unaPersona.estaEbrio()	
		}	
	method ingresar(unaPersona){ 
		if ( unaPersona.puedeEntrar(self) ){
			self.ingresarPersona(unaPersona)
		} else { self.error("NO PUEDE INGRESAR") }
	}
	method servirJarra(persona, unaCapacidad){
		const jarra = new Jarras(marca = marcaQueVende, capacidad = unaCapacidad )
		if(personasQueEntraron.contains(persona)){
			persona.comprarJarras(jarra)
			persona.agregarCarpa(self)
		} else { self.error("LA PERSONA NO HA INGRESADO A ESTA CARPA") }
	}
	
	method ebriosEmpedernidos(){
		return personasQueEntraron.count({c => c.esUnEbrioEmpedernido()})
	}
		
// REQUERIMIENTOS AVANZADOS--------------------------------------------
	
	// SI LAS PERSONAS QUE ENTRAN SON DE = NACIONALIDAD
	method esHomogenea(){ 
		return personasQueEntraron.map( {p => p.nacionalidad() }).size() == 1
	}
	
	
// BONUS PRECIO DE VENTA-------------------------------------------------------	
	
	method maxCapacidad(){ return personasQueEntraron.size() >= ( limAdmitido / 2 ) }

	method maxEbriedad(){ 
	 	return (personasQueEntraron.count({p => p.estaEbrio()})) 
					> (personasQueEntraron.size() * 0.75) }	
	
	method recargoNormal(){	recargo = 1.30 	}	
	
	method recargoCapacidad(){
		 if (self.maxCapacidad()){ recargo = 1.4 } else { recargo = 1.25 } 
	}
	
	method recargoEbriedad(){
		 if (self.maxEbriedad()){ recargo = 1.4 } else { recargo = 1.25 } 
	}
	
	method precioDeVenta(){ return marcaQueVende.precioPorLitro() * recargo	}
}	


	

