package rom.notificaciones

/**
 * Notificacion
 * A domain class describes the data object and it's mapping to the database
 */
class Notificacion {

	public static final long ADMIN = -1;
	public static final long COCINA = -2;
	public static final long BARRA = -3;
	
	long idOrigen, idDestino
	String uuidOrden, estado
	
	boolean fueEnviada
	
	public Notificacion(long unOrigen, long unDestino, String unaOrden, String unEstado) {
		idOrigen = unOrigen
		idDestino = unDestino
		uuidOrden = unaOrden
		estado = unEstado
		fueEnviada = false
	}
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public void marcarEnviada() {
		fueEnviada = true
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
