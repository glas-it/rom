package rom

/**
 * Subrubro
 * A domain class describes the data object and it's mapping to the database
 */
class Subrubro {
	
	Rubro rubro
	
	static	belongsTo	= Rubro	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static	hasMany		= [ consumiciones: Consumicion, agregados: Agregado ]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	String nombre
	int orden
	
    static	mapping = {
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 100, validator: { val, obj ->
			return Subrubro.list().find{ it.rubro.nombre == obj.rubro.nombre && it.nombre == val && it.id != obj.id } == null
		}
		orden validator: { val, obj ->
			return (val >= 1 && Subrubro.list().find{ it.rubro.nombre == obj.rubro.nombre && it.orden == val && it.id != obj.id } == null) 
		}
		consumiciones nullable: true, blank: true
		agregados nullable: true, blank: true
    }
	
	@Override
	public String toString() {
		return "${nombre}";
	}
}
