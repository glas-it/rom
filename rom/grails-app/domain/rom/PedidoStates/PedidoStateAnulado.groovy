package rom.PedidoStates

/**
 * PedidoStateAnulado
 * A domain class describes the data object and it's mapping to the database
 */
class PedidoStateAnulado extends PedidoState {

	public static final String ANULADO = "Anulado"
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public PedidoStateAnulado() {
		nombre = ANULADO
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
