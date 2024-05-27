object cuchuflito{
	
	method utilidad(cosa){
		return 0
	}
}

object acme{
	
	method utilidad(cosa){
		return cosa.volumen()/2
	}
}
object fenix{
	
	method utilidad(cosa){
		return	if (cosa.reliquia()) 3 else 0
	}
}