package rom

import com.sun.org.apache.bcel.internal.generic.RETURN;

/**
 * Promocion
 * A domain class describes the data object and it's mapping to the database
 */
class Promocion {	
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	Restaurant restaurant
	
	Date fechaInicio
	Date fechaFin
	Integer cantidadCupones
	
	Double porcentajeDescuento
	
    static	mapping = {
    }
    
	static	constraints = {
		fechaInicio nullable: false, blank: false, validator: {val, obj ->
			return val.after(new Date()) && val.before(obj.fechaFin)
		}
		fechaFin nullable: false, blank: false, validator: {val->
			return val.after(new Date())
		}
		cantidadCupones nullable: false, blank: false, min: 1, max: 999999	
		
		porcentajeDescuento nullable: false, blank: false, min: 0.0D, max: 1.0D
    }
	
	/*
	 * Methods of the Domain Class
	 */
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${fechaDesde.format('dd-MM-yyyy') - fechaHasta.format('dd-MM-yyyy')}"
	}
}
