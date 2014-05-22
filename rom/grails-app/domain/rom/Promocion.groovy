package rom

import org.grails.databinding.BindingFormat;

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
	
	@BindingFormat('yyyy-MM')
	Date fechaInicio
	@BindingFormat('yyyy-MM')
	Date fechaFin
	Integer cantidadCupones
	
	Integer porcentajeDescuento
	
	String nombre, descripcion
	
    static	mapping = {
    }
    
	static	constraints = {
		
		nombre nullable: false, blank: false, size: 1..50
		
		descripcion nullable: false, blank: false, size: 1..250
		
		fechaInicio nullable: false, blank: false, validator: {val->
			return val.format('yyyy-MM').compareTo(new Date().format('yyyy-MM')) <= 0 
		}
		fechaFin nullable: false, blank: false, validator: {val, obj->
			return val.format('yyyy-MM').compareTo(obj.fechaInicio.format('yyyy-MM')) <= 0
		}
		cantidadCupones nullable: false, blank: false, min: 1, max: 999999	
		
		porcentajeDescuento nullable: false, blank: false, min: 0, max: 100
    }
	
	/*
	 * Methods of the Domain Class
	 */
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${fechaDesde.format('dd-MM-yyyy') - fechaHasta.format('dd-MM-yyyy')}"
	}
}
