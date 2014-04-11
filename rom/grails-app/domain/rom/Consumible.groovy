package rom

/**
 * Consumible
 * A domain class describes the data object and it's mapping to the database
 */
class Consumible {
	
	Subrubro subrubro
	
	static	belongsTo	= Subrubro	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	
	String nombre, descripcion
	float precio
	boolean activo
	
    static	mapping = {
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 100, validator: { val, obj ->
			return Consumible.list().find{ it.subrubro.nombre == obj.subrubro.nombre && it.nombre == val && it.id != obj.id } == null
		}
		descripcion nullable:true, maxSize: 150
		precio min: 0 as float
    }
	
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${nombre}";
	}
	
	public String getPrecioFormateado() {
		def formatter = java.text.NumberFormat.currencyInstance
		return formatter.format(precio);
		//return String.format('\$%1', precio)
	}
}
