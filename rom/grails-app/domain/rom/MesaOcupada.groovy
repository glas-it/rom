package rom

/**
 * MesaOcupada
 * A domain class describes the data object and it's mapping to the database
 */
class MesaOcupada {
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	Mesa mesa
	Mozo mozo
	boolean activo
	int comensales
	
	public void ocupar() {
		if (mesa == null)
			return;
		mesa.abrir();
		activo = true
	}
	
	public void desocupar() {
		if (mesa == null)
			return;
		mesa.cerrar();
		activo = false
	}
	
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
