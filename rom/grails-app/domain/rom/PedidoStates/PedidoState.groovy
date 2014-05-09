package rom.PedidoStates

import rom.Pedido
import rom.Exceptions.TransicionInvalidaPedidoException;

/**
 * PedidoState
 * A domain class describes the data object and it's mapping to the database
 */
class PedidoState {

	String nombre
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public void marcarCerrado(Pedido pedido) {
		throw new TransicionInvalidaPedidoException("Transicion de pedido inválida");
	}
	
	public void marcarPagado(Pedido pedido) {
		throw new TransicionInvalidaPedidoException("Transicion de pedido inválida");
	}
	
	public void marcarAnulado(Pedido pedido) {
		throw new TransicionInvalidaPedidoException("Transicion de pedido inválida");
	}
	
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
