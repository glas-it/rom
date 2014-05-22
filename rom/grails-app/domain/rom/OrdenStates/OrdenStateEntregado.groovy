package rom.OrdenStates

import rom.Orden;

/**
 * OrdenStateEntregado
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateEntregado extends OrdenState {
	
	public static final String ENTREGADO = "Entregado";
	
	public OrdenStateEntregado() {
		nombre = ENTREGADO;
	}
	
    static	mapping = {
    }
    
	static	constraints = {
    }

	@Override
	public void marcarRechazado(Orden orden) {
		orden.estado = new OrdenStateRechazado()
		orden.fueRechazada = true
	}

	@Override
	def entregado() {
		return true
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
