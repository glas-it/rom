package rom.OrdenStates

import rom.Orden;

/**
 * OrdenStateRechazado
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateRechazado extends OrdenState{

	public static final String RECHAZADO = "Rechazado";
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public OrdenStateRechazado() {
		nombre = RECHAZADO
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
	
	@Override
	public void marcarEnPreparacion(Orden orden) {
		orden.estado = new OrdenStateEnPreparacion();
	}
}
