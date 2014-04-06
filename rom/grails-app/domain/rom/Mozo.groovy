package rom

import com.sun.org.apache.bcel.internal.generic.RETURN;

import rom.seguridad.Usuario;

/**
 * Mozo
 * A domain class describes the data object and it's mapping to the database
 */
class Mozo extends Usuario {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
//	static	belongsTo	= [restaurant:Restaurant]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	Restaurant restaurant
	
    static	mapping = {
    }
    
	static	constraints = {
		restaurant visible: false
		username validate: {val, obj ->
			return Mozo.findByUsernameAndRestaurant(val, (obj as Mozo).restaurant)
		}
    }

	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
