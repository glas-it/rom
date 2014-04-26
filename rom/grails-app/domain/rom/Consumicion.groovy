package rom

import groovy.json.*;

/**
 * Consumicion
 * A domain class describes the data object and it's mapping to the database
 */
class Consumicion extends Consumible {
	
    static	mapping = {
    }
    
	static	constraints = {
		descripcion nullable: false, blank: false
    }
	
}
