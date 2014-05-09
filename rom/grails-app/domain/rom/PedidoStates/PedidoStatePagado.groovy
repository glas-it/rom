package rom.PedidoStates

import rom.Pedido;

/**
 * PedidoStatePagado
 * A domain class describes the data object and it's mapping to the database
 */
class PedidoStatePagado extends PedidoState {

	public static final String PAGADO = "Pagado"
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public PedidoStatePagado() {
		nombre = PAGADO
	}
	
	public void marcarAnulado(Pedido pedido) {
		pedido.estado = new PedidoEstadoAnulado();
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
