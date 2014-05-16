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
	//static	hasOne		= StateTimer	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	Date dateCreated
	
	Mesa mesa
	Mozo mozo
	int comensales
	PedidoState estado
	StateTimer timer
	String motivoAnulacion
	
	static	hasMany		= [ordenes : Orden]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
	
	static	mapping = {
		estado type: PedidoStateUserType
		timer cascade: 'all-delete-orphan'
	}
	
	static	constraints = {
		motivoAnulacion nullable: true
	}
	
	public Pedido(Mesa unaMesa, Mozo unMozo, int cantComensales) {
		mesa = unaMesa
		mozo = unMozo
		comensales = cantComensales
		timer = new StateTimer()
	}
	
	public void setNuevoMozo(Mozo nuevoMozo) {
		mozo = nuevoMozo
	}
	
	public void marcarAbierto() {
		if (mesa == null)
			return
		mesa.abrir()
		estado = new PedidoStateAbierto()
		timer.start(estado.nombre)
	}
	
	public void marcarCerrado() {
		this.estado.marcarCerrado(this);
		timer.changeState(estado.nombre)
	}
	
	public void marcarPagado() {
		this.estado.marcarPagado(this);
		timer.finalState()
		cerrarMesa()
	}
	
	public void marcarAnulado(String motivo) {
		this.estado.marcarAnulado(this);
		timer.finalState()
		cerrarMesa()
		motivoAnulacion = motivo
	}
	
	private void cerrarMesa() {
		mesa?.cerrar()
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
