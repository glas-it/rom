package rom

/**
 * Agregado
 * A domain class describes the data object and it's mapping to the database
 */
class Agregado extends Consumible {
	
	def getPrecio() {
		return precios[0]
	}
	
    static	mapping = {
    }
    
	static	constraints = {
    }

}
