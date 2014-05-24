package rom

import rom.Exceptions.BusinessException;
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
	Date fechaPago

	Promocion promocion
		
	int tipoPago
	
	//static embedded = ['timer']
	static	hasMany		= [ordenes : Orden]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
	
	static	mapping = {
		estado type: PedidoStateUserType
		timer cascade: 'all-delete-orphan'
	}
	
	static	constraints = {
		promocion blank: true, nullable: true
		motivoAnulacion blank: true, nullable: true
		fechaPago blank:true, nullable: true
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
		fechaPago = new Date()
		cerrarMesa()
	}

	public float total() {
		float suma = 0.0
		def ordenesAFacturar = ordenes.findAll{ it.entregado() }
		for (orden in ordenesAFacturar) {
			suma += orden.precio.valor
		}
		return suma
	}
	
	public String totalFormateado() {
		return java.text.NumberFormat.currencyInstance.format(total())
	}		

	public void marcarAnulado(String motivo) {
		this.estado.marcarAnulado(this);
		motivoAnulacion = motivo
		timer.finalState()
		cerrarMesa()
		motivoAnulacion = motivo
	}
	
	private void cerrarMesa() {
		mesa?.cerrar()
	}
	
	def anulado() {
		return estado.anulado()
	}
	
	def pagado() {
		return estado.pagado()
	}
	
	def cerrado() {
		return estado.cerrado()
	}
	
	def addPromocion(Promocion promo) {
		if (promocion) {
			throw new BusinessException("El pedido ya posee una promoción asociada")
		}
		if (anulado() || pagado()) {
			throw new BusinessException("El pedido ya no puede recibir descuentos")
		}
		promocion = promo
	}
	
	def ordenesFacturables() {
		def lista = []
		for (Orden orden in ordenes) {
			if (!orden.anulado() && !orden.cancelado()) {
				lista.add(orden)
			}
		}
		return lista
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
