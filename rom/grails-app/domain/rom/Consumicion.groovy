package rom

/**
 * Consumicion
 * A domain class describes the data object and it's mapping to the database
 */
class Consumicion extends Consumible {

	Map precios = [:]
	
    static	mapping = {
    }
    
	static	constraints = {
		precios size: 1..4
    }
	
	
}
