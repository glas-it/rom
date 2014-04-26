package rom.OrdenStates

import rom.Orden;

/**
 * ConsumicionState
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenState {

	String nombre
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public void marcarEnPreparacion(Orden orden) {	
	}
	
	public void marcarTerminado(Orden orden) {
	}
	
	public void marcarEntregado(Orden orden) {
	}
	
	public void marcarCancelado(Orden orden) {
	}
}
