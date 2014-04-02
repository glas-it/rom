package rom

/**
 * Consumicion
 * A domain class describes the data object and it's mapping to the database
 */
class Consumicion extends Consumible {

	String descripUno, descripDos, descripTres, descripCuatro
	int precioUno, precioDos, precioTres, precioCuatro
	Map precios
	
    static	mapping = {
    }
    
	static	constraints = {
		descripUno blank: false, maxSize: 150
		descripDos blank: true, maxSize: 150
		descripTres blank: true, maxSize: 150
		descripCuatro blank: true, maxSize: 150
		precioUno min: 0
		precios visible: false
		//precioDos min: 0 as Float
		//precioTres min: 0 as Float
		//precioCuatro min: 0 as Float
    }
	
	
	public void setPreciosList() {
		precios = [descripUno: precioUno, descripDos: precioDos, descripTres:precioTres, descripCuatro:precioCuatro]
	}
	
	
}
