package rom.OrdenStates

import rom.Orden;

/**
 * OrdenStateCancelado
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateCancelado extends OrdenState {
	
	public static final String CANCELADO = "Cancelado";
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public OrdenStateCancelado(){
		nombre = CANCELADO
	}
	
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
