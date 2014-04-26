package rom

import rom.OrdenStates.OrdenState;
import rom.OrdenStates.OrdenStateUserType;

/**
 * Orden
 * A domain class describes the data object and it's mapping to the database
 */
class Orden {
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	OrdenState estado;
	
    static	mapping = {
		estado type: OrdenStateUserType
    }
    
	static	constraints = {
    }
	
	public void marcarEnPreparacion() {
		this.estado.marcarEnPreparacion(this);
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
