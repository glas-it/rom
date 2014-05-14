package rom.notificaciones


import grails.transaction.Transactional;

/**
 * NotificacionService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional(readOnly = false)
class NotificacionService {

    def getNotificacionByDestino(long unDestino) {
		def criteria = Notificacion.createCriteria()
		def notificaciones = criteria.list {
			and {
				eq("idDestino", unDestino)
				eq("fueEnviada", false)
			}
		}
		marcarNotificacionesEnviadas(notificaciones)
		return notificaciones
    }
		
	def marcarNotificacionesEnviadas(List notificaciones) {
		for(notificacion in notificaciones) {
			notificacion.marcarEnviada()
			notificacion.save(flush:true)
		}
	}

	def crearNotificacion(long origen, long destino, String uuid, String estado) {
		Notificacion notificacion = new Notificacion(origen, destino, uuid, 
			estado)
		notificacion.save(flush:true)
	}
	
}
