package rom

//import com.nanlabs.grails.plugin.logicaldelete.LogicalDelete;

/**
 * MesaComposite
 * A domain class describes the data object and it's mapping to the database
 */
class MesaComposite extends Mesa {

	static	hasMany		= [mesas: Mesa]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public MesaComposite() {
		activo = true
	}
	
	@Override
	public void abrir() {
		mesas.each{ it.abrir() }
		abierta = true
	}
	
	@Override
	public void cerrar() {
		/*def mesasCopia = copiarListaMesas()
		for (mesa in mesasCopia) {
			removeMesa(mesa)
			mesa.save()
		}*/
		mesas.each{ it.cerrar() }
		abierta = false
		activo = false
	}
	
	private List copiarListaMesas() {
		List res = []
		mesas.each{ res.add(it) }
		return res
	}
	
	public void addMesa(Mesa mesa) {
		mesa.abrir()
		this.addToMesas(mesa)
	}
	
	public void removeMesa(Mesa mesa) {
		mesa.cerrar()
		this.removeFromMesas(mesa)
	}
	
	/* Simplificacion de modelado */
	@Override
	public int getCapacidad() {
		int acum = 0
		mesas.each{ acum += it.capacidad }
		return acum
	}
		
	@Override
	public String toString() {
		return "MesaCompuesta" + numero.toString()
	}
}
