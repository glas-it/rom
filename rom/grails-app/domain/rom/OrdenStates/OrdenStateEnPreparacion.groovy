package rom.OrdenStates

import rom.Orden;

/**
 * OrdenStateEnPreparacion
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateEnPreparacion extends OrdenState {

	public static final String EN_PREPARACION = "EnPreparacion";
	
	public OrdenStateEnPreparacion() {
		nombre = EN_PREPARACION;
	}
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	@Override
	public void marcarTerminado(Orden orden) {
		orden.estado = new OrdenStateTerminado()
	}

	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
