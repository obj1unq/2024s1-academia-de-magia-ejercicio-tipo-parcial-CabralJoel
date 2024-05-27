

class Academia{
	
	const muebles = #{}
	
	method tiene(cosa){
		return muebles.any({mueble=>mueble.tiene(cosa)})
	}
	method dondeGuarda(cosa){
		return muebles.find({mueble => mueble.tiene(cosa)})
	}
	method puedeGuardar(cosa){
		return not self.tiene(cosa) and self.existeMuebleLibre(cosa)
	}
	method dondeGuardar(cosa){
		return muebles.filter({mueble => mueble.puedeGuardar(cosa)})
	}
	
	method existeMuebleLibre(cosa){
		return muebles.any({mueble => mueble.puedeGuardar(cosa)})
	}
	
	method validarGuardar(cosa){
		if(not self.puedeGuardar(cosa)){
			self.error("no se puede guardar" + cosa)
		}
	}
	method guardar(cosa){
		self.validarGuardar(cosa)
		const mueble = self.dondeGuardar(cosa).anyOne()
		mueble.guardar(cosa)
	}
}

class Cosa {
	
	var property volumen 
	var property marca
	var property esMagico
	var property reliquia
}


