package rom

/**
 * Subrubro
 * A domain class describes the data object and it's mapping to the database
 */
class Subrubro {

	static	belongsTo	= [ rubro:Rubro ]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static	hasMany		= [ consumiciones: Consumicion, agregados: Agregado ]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	String nombre
	
    static	mapping = {
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 200
		consumiciones nullable: true, blank: true
		agregados nullable: true, blank: true
    }
	
	@Override
	public String toString() {
		return "${nombre}";
	}
}
