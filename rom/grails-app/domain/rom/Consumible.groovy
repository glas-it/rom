package rom

/**
 * Consumible
 * A domain class describes the data object and it's mapping to the database
 */
class Consumible {
	
	static	belongsTo	= [subrubro:Subrubro]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	
	String nombre, descripcion
	
    static	mapping = {
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 100
		descripcion blank: false, maxSize: 200
    }
	
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${nombre}";
	}
}
