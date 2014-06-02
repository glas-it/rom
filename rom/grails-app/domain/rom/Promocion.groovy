package rom

import java.text.DateFormat;

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
	
	@BindingFormat('yyyy-MM-dd')
	Date fechaInicio
	@BindingFormat('yyyy-MM-dd')
	Date fechaFin
	//Integer cantidadCupones
	
	boolean activo = true
	
	Integer porcentajeDescuento
	
	String nombre, descripcion
	
	static	hasMany		= [pedidos : Pedido]	// tells GORM to associate other domain objects for a 1-n or n-m mapping


    static	mapping = {
    }
    
	static	constraints = {
		
		activo blank: true, nullable: false
		
		nombre nullable: false, blank: false, size: 1..50, unique:["restaurant", "fechaInicio", "fechaFin"]
		
		descripcion nullable: false, blank: false, size: 1..250
		
		fechaInicio nullable: false, blank: false, validator: {val->
			return val.clearTime().compareTo(new Date().clearTime()) >= 0 ?: "promocion.fechaInicio.invalida"
		}
		fechaFin nullable: false, blank: false, validator: {val, obj->
			return val.clearTime().compareTo(obj.fechaInicio.clearTime()) >= 0 ?: "promocion.fechaFin.invalida" 
		}
		//cantidadCupones nullable: false, blank: false, min: 1, max: 999999	
		
		porcentajeDescuento nullable: false, blank: false, min: 0, max: 100
    }
	
	/*
	 * Methods of the Domain Class
	 */
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${fechaDesde.format('dd-MM-yyyy')}" + " - " +  "${fechaHasta.format('dd-MM-yyyy')}"
	}
	
	def esValida() {
		return enFecha() //&& cantidadCupones > 0
	}
	
	def getDescuento() {
		return (100 - porcentajeDescuento) / 100.0d
	}
	
	def esEditable() {
		return fechaInicio.compareTo(new Date().clearTime()) > 0 && activo
	}
	
	private boolean enFecha() {
		def hoy = new Date().clearTime()
		return (fechaInicio.compareTo(hoy) <= 0) && (fechaFin.compareTo(hoy) >= 0)
	}
}
