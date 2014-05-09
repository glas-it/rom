package rom

import rom.PedidoStates.PedidoStateUserType
import rom.PedidoStates.PedidoState
import rom.PedidoStates.PedidoStateAbierto

/**
 * Pedido
 * A domain class describes the data object and it's mapping to the database
 */
class Pedido {

//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.	
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	static	hasMany		= [ordenes : Orden]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	static	hasOne		= StateTimer	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	
	Mesa mesa
	Mozo mozo
	boolean activo 	/*********  VOLAR ESTO ***********/
	int comensales
	PedidoState estado
	StateTimer timer
	
	static	mapping = {
		estado type: PedidoStateUserType
	}
	
	static	constraints = {
	}
	
	public Pedido(Mesa unaMesa, Mozo unMozo, int cantComensales) {
		mesa = unaMesa
		mozo = unMozo
		comensales = cantComensales
		timer = new StateTimer()
	}
	
	
	public void abrir() {
		if (mesa == null)
			return;
		mesa.abrir();
		activo = true
	}
	
	public void cerrar() {
		if (mesa == null)
			return;
		mesa.cerrar();
		activo = false
	}	
	
	public boolean addOrden(Orden orden) {
		if ( ! activo) return false
		orden.pedido = this;
		return ordenes.add(orden)
	}
	
	
	public void marcarAbierto() {
		estado = new PedidoStateAbierto()
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
