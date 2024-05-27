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
	 method utilidad() {
	 	 return self.utilidadDeLasCosas() / self.precio()	
	 }
	 
	 method utilidadDeLasCosas() {
	 	return cosas.sum({cosa => cosa.utilidad()})
	 }
	 
	 method precio() 
	
}

class Baul inherits Mueble{
	
	const property volumenMax
	
	override method puedeGuardar(cosa){
		return super(cosa) and volumenMax >= self.volumenActual() + cosa.volumen()
		}
	override method precio(){
		return volumenMax + 2
	}
	override method utilidad(){
		return super() + self.extra()
	}
	method extra(){
		return if(self.todasReliquias()) 2 else 0
	}
	method todasReliquias() {
		return cosas.all({cosa => cosa.reliquia()})
	}
}

class GabineteMagico inherits Mueble{
	
	const property precio
	
	override method puedeGuardar(cosa){
		return super(cosa) and cosa.esMagico()
	}
}

class Armario inherits Mueble{
	var property cantMax

	override method puedeGuardar(cosa) {
		return super(cosa) and self.hayLugar() 
	}
	
	method hayLugar() {
		return cantMax > cosas.size() 
	}

	override method precio() {
		return 5 * cantMax
	}
}

class BaulMagico inherits Baul{
	
	override method utilidad(){
		return super() +self.extraMagicos()
	}
	
	method extraMagicos(){
		return cosas.count({cosa => cosa.esMagico()})
	}
}