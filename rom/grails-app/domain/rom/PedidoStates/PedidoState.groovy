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
	
	def anulado() {
		return false
	}
	
	def pagado() {
		return false
	}
	
	public void marcarCerrado(Pedido pedido) {
		throw new TransicionInvalidaPedidoException();
	}
	
	public void marcarPagado(Pedido pedido) {
		throw new TransicionInvalidaPedidoException();
	}
	
	public void marcarAnulado(Pedido pedido) {
		throw new TransicionInvalidaPedidoException();
	}
	
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
