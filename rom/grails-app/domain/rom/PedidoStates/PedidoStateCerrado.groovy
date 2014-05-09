package rom.PedidoStates

import rom.Pedido;

/**
 * PedidoStateCerrado
 * A domain class describes the data object and it's mapping to the database
 */
class PedidoStateCerrado extends PedidoState {

	public static final String CERRADO = "Cerrado"
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public PedidoStateCerrado() {
		nombre = CERRADO
	}
	
	public void marcarPagado(Pedido pedido) {
		pedido.estado = new PedidoStatePagado();
	}
	
	public void marcarAnulado(Pedido pedido) {
		pedido.estado = new PedidoStateAnulado();
	}
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
