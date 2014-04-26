package rom.OrdenStates

import rom.Orden;

/**
 * ConsumicionStatePendiente
 * A domain class describes the data object and it's mapping to the database
 */
class OrdenStatePendiente extends OrdenState {

	public static final String PENDIENTE = "Pendiente";
		
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public OrdenStatePendiente() {
		nombre = PENDIENTE
	}
	
	@Override
	public void marcarEnPreparacion(Orden orden) {
		orden.estado = new OrdenStateEnPreparacion();
	}
	
	@Override
	public void marcarCancelado(Orden orden) {
		orden.estado = new OrdenStateCancelado();
	}
	
}
