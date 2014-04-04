package rom

import groovy.json.*;

/**
 * Consumicion
 * A domain class describes the data object and it's mapping to the database
 */
class Consumicion extends Consumible {

	String descripUno, descripDos, descripTres, descripCuatro
	float precioUno, precioDos, precioTres, precioCuatro
	Map precios
	
    static	mapping = {
    }
    
	static	constraints = {
		descripUno blank: false, maxSize: 150
		descripDos nullable: true, blank: true, maxSize: 150, validator: {val, obj->
			if ( ! val || val.isAllWhitespace()) return true
			if (val == obj.descripUno || val == obj.descripTres || val == obj.descripCuatro)
				return false
			}
		descripTres nullable: true, blank: true, maxSize: 150, validator: {val, obj->
			if ( ! val || val.isAllWhitespace()) return true
			if (val == obj.descripUno || val == obj.descripDos || val == obj.descripCuatro)
				return false
			}
		descripCuatro nullable: true, blank: true, maxSize: 150, validator: {val, obj->
			if ( ! val || val.isAllWhitespace()) return true
			if (val == obj.descripUno || val == obj.descripDos || val == obj.descripTres)
				return false
			}
		precioUno min: 0 as float
		precioDos min: 0 as float, nullable: true, blank:true
		precioTres min: 0 as float, blank:true, nullable: true
		precioCuatro min: 0 as float, blank:true, nullable: true
    }
	
	
	public void setPreciosList() {
		String cad = String.format('{"%1s": %2s, "%3s": %4s, "%5s": %6s, "%7s": %8s}',
			 descripUno, precioUno, descripDos, precioDos, descripTres, precioTres, descripCuatro, precioCuatro)
		JsonSlurper js = new JsonSlurper()
		precios = js.parseText(cad) as Map
		//precios = [descripUno: precioUno, descripDos: precioDos, descripTres:precioTres, descripCuatro:precioCuatro]
	}
	
	
}
