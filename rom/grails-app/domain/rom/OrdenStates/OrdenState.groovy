package rom.OrdenStates

import rom.Orden;
import rom.Exceptions.TransicionInvalidaOrdenException

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
		throw new TransicionInvalidaOrdenException()	
	}
	
	public void marcarTerminado(Orden orden) {
		throw new TransicionInvalidaOrdenException()
	}
	
	public void marcarEntregado(Orden orden) {
		throw new TransicionInvalidaOrdenException()
	}
	
	public void marcarCancelado(Orden orden) {
		throw new TransicionInvalidaOrdenException()
	}
}
