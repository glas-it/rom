package rom

import org.apache.commons.collections.ListUtils;

/**
 * Consumible
 * A domain class describes the data object and it's mapping to the database
 */
class Consumible {
	
	Subrubro subrubro
	
	List precios = [].withDefault { new Precio() }
	
	static	belongsTo	= Subrubro	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.	
	static	hasMany		= [ precios: Precio ]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	String nombre, detalle
	
	boolean activo
	
    static	mapping = {
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 100, validator: { val, obj ->
			if (Consumible.list().find{
					it.class == obj.class &&
					it.subrubro.nombre == obj.subrubro.nombre &&
					it.nombre == val &&
					it.id != obj.id
				} != null)
			return ['estaRepetido']
		}
		precios validator: {val ->
			if (!(val && val.size() > 0 && !val.any{it && !it.validate()}))
				return ['sinPrecio']
		}
		
		detalle nullable: true, blank: true
    }
	
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${nombre}";
	}
	
	public String getPrecioFormateado() {
		def formatter = java.text.NumberFormat.currencyInstance
		return formatter.format(precios[0].valor);
		//return String.format('\$%1', precios[0])
	}
}
