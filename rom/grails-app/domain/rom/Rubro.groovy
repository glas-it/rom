package rom

/**
 * Rubro
 * A domain class describes the data object and it's mapping to the database
 */
class Rubro {

	//Restaurant restaurant
	
	//static	belongsTo	= Restaurant
	
	static	hasMany		= [subrubros:Subrubro]
	
	int orden
	
	String nombre
	
    static	mapping = {
		sort "orden"
    }
    
	static	constraints = {
		nombre blank: false, maxSize: 100, validator: { val, obj ->
			return Rubro.list().find{ it.nombre == val && it.id != obj.id } == null 
		}
		orden validator: { val, obj ->
			return (val >= 1 && Rubro.list().find{ it.orden == val && it.id != obj.id } == null) 
		}
		subrubros nullable: true, blank: true
    }
	
	def cambiarOrden(Rubro otro) {
		int ordenAux = otro.orden
		otro.orden = this.orden
		this.orden = ordenAux
	}	
	
	@Override
	public String toString() {
		return "${nombre}";
	}

}
