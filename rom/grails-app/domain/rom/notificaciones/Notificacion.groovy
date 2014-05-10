package rom.notificaciones

/**
 * Notificacion
 * A domain class describes the data object and it's mapping to the database
 */
class Notificacion {

	public static final String COCINA = "Cocina";
	public static final String BARRA = "Barra";
	public static final String MOZO = "Mozo";
	
	String mensaje
	String tipoDestino
	long idMozoDestino
	
	boolean fueEnviada = false
	
	public Notificacion(String unTipoDestino, String unMensaje) {
		if (unTipoDestino != COCINA && unTipoDestino != BARRA)
			throw new Exception("Destino de notificacion invalida")
		tipoDestino = unTipoDestino
		mensaje = unMensaje
	}
	
	public Notificacion(long idMozo, String unMensaje) {
		tipoDestino = MOZO
		idMozoDestino = idMozo
		mensaje = unMensaje
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
