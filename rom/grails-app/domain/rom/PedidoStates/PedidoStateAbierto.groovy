package rom.PedidoStates

import rom.Pedido;

/**
 * PedidoStateAbierto
 * A domain class describes the data object and it's mapping to the database
 */
class PedidoStateAbierto extends PedidoState {

	public static final String ABIERTO = "Abierto"
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public PedidoStateAbierto() {
		nombre = ABIERTO
	}
	
	public void marcarCerrado(Pedido pedido) {
		pedido.estado = new PedidoEstadoCerrado();
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
