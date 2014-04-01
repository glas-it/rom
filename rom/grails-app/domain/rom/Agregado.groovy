package rom

/**
 * Agregado
 * A domain class describes the data object and it's mapping to the database
 */
class Agregado extends Consumible {

	Double precio
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
