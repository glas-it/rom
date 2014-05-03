package rom.OrdenStates

import rom.Orden;

/**
 * OrdenStateTerminado
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateTerminado extends OrdenState {
	
	public static final String TERMINADO = "Terminado";
	
	public OrdenStateTerminado() {
		nombre = TERMINADO;
	}
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	@Override
	public void marcarEntregado(Orden orden) {
		orden.estado = new OrdenStateEntregado()
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
