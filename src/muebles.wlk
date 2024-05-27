class Mueble{
	const cosas = #{}
	
	method tiene(cosa){
		return cosas.contains(cosa)
	}
	
	method puedeGuardar(cosa){
		return not self.tiene(cosa)
	}
	
	method volumenActual(){
		return cosas.sum({cosa_ => cosa_.volumen()})
	}
	method guardar(cosa){
		self.validarGuardar(cosa)
		cosas.add(cosa)
	}
	method validarGuardar(cosa){
		if(not self.puedeGuardar(cosa)){
			self.error("no se puede cuardar" + cosa)
		}
	}
}

class Baul inherits Mueble{
	
	const property volumenMax
	
	override method puedeGuardar(cosa){
		return super(cosa) and volumenMax >= self.volumenActual() + cosa.volumen()
		}
	
}

class GabineteMagico inherits Mueble{
	
	override method puedeGuardar(cosa){
		return super(cosa) and cosa.esMagico()
	}
}

class Armario inherits Mueble{
	
	var property cantMax
	
	override method puedeGuardar(cosa){
		return super(cosa) and self.hayEspacio()
	}
	method hayEspacio(){
		return cantMax > cosas.size()
	}
}