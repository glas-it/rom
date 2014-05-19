package rom.notificaciones

/**
 * Notificacion
 * A domain class describes the data object and it's mapping to the database
 */
class Notificacion {
	
	long idOrigen, idDestino
	String titulo
	String mensaje
	
	boolean fueEnviada
	
	public Notificacion(long unOrigen, long unDestino, String unTitulo, String unMensaje) {
		idOrigen = unOrigen
		idDestino = unDestino
		mensaje = unMensaje
		titulo = unTitulo
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
