package rom

/**
 * Rubro
 * A domain class describes the data object and it's mapping to the database
 */
class Rubro {

	int orden
	
	String nombre
	
    static	mapping = {
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 200
		orden min: 1
    }
	
	@Override
	public String toString() {
		return "${nombre}";
	}
}
