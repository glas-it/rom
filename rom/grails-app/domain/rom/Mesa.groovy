package rom

/**
 * Mesa
 * A domain class describes the data object and it's mapping to the database
 */
class Mesa {
	
    static	mapping = {
    }
    
	static	constraints = {
		capacidad blank: false
    }
	
	Restaurant restaurant
	
	int numero
	int capacidad
	boolean activo, abierta
	
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return numero.toString();
	}
	
	public void abrir() {
		abierta = true
	}
	
	public void cerrar() {
		abierta = false
	}

	public String getUsername() {
		Pedido pedido = Pedido.findByMesa(this)
		return pedido.mozo.username
	}
}
