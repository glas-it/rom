package rom

import rom.OrdenStates.OrdenState;
import rom.OrdenStates.OrdenStatePendiente;
import rom.OrdenStates.OrdenStateUserType;


/**
 * Orden
 * A domain class describes the data object and it's mapping to the database
 */
class Orden {
	static	hasOne		= StateTimer	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
	String uuid
	Pedido pedido
	Consumible consumible
	Agregado agregado
	Precio precio
	OrdenState estado
	StateTimer timer
	boolean fueRechazada = false
	String observaciones, motivoAnulacion
	
	static	belongsTo	= Pedido	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	
	public Orden(String unUUID, Consumible unConsumible, Agregado unAgregado, Precio unPrecio) {
		uuid = unUUID
		consumible = unConsumible
		agregado = unAgregado
		precio = unPrecio
		timer = new StateTimer()
		marcarPendiente()
		observaciones = ""
	}
	
		
    static	mapping = {
		estado type: OrdenStateUserType
		timer cascade: 'all-delete-orphan'
    }
    
	static	constraints = {
		id column: 'uuid', generator: 'assigned', type: 'string' 
		agregado blank: true, nullable: true
		observaciones nullable: true
		motivoAnulacion nullable: true, blank: true
    }
	
	def anulado() {
		return estado.anulado()
	}
	
	def cancelado() {
		return estado.cancelado()
	}
	
	public void addObservaciones(String unaObservacion) {
		if ( unaObservacion && ! unaObservacion.isAllWhitespace())
			this.observaciones = unaObservacion + "-" + this.observaciones
	}
	
	private void marcarPendiente() {
		estado = new OrdenStatePendiente();
		timer.start(estado.nombre)
	}
	
	public void marcarEnPreparacion() {
		this.estado.marcarEnPreparacion(this);
		timer.changeState(estado.nombre)
	}
	
	public void marcarTerminado() {
		this.estado.marcarTerminado(this);
		timer.changeState(estado.nombre)
	}
	
	public void marcarEntregado() {
		this.estado.marcarEntregado(this);
		timer.finalState()
	}
	
	public void marcarCancelado() {
		this.estado.marcarCancelado(this);
		timer.finalState()
	}
	
	public void marcarRechazado() {
		this.estado.marcarRechazado(this);
		timer.changeState(estado.nombre)
	}
	
	public void marcarAnulado() {
		this.estado.marcarAnulado(this);
		timer.finalState()
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
