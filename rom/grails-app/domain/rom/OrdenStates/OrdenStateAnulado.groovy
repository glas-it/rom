package rom.OrdenStates

import rom.Orden;

/**
 * OrdenStateAnulado
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStateAnulado extends OrdenState {

	public static final String ANULADO = "Anulado";
		
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public OrdenStateAnulado(){
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
