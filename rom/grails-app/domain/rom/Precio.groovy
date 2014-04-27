package rom

/**
 * Precio
 * A domain class describes the data object and it's mapping to the database
 */
class Precio {

	
	float valor
	String descripcion
	Consumible consumible
	
	static	belongsTo	= Consumible
	
    static	mapping = {
    }
    
	static	constraints = {
		valor min: 0 as float
		descripcion nullable:true, maxSize: 150
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${descripcion}: $ ${valor}";
//	}
	
	public String getPrecioFormateado() {
		def formatter = java.text.NumberFormat.currencyInstance
		return formatter.format(valor);
    }
}
