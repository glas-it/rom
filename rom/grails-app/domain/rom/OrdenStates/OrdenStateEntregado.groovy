package rom.OrdenStates

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
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
