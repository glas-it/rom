package rom

import rom.Exceptions.TransicionInvalidaOrdenException
import rom.OrdenStates.*
import rom.notificaciones.Notificacion
import grails.transaction.Transactional;

/**
 * OrdenService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class OrdenService {

	def notificacionService

    def marcarOrden(Orden orden, String transicion) {
		println "TRANSICION: " + transicion
		if (transicion == OrdenStateEnPreparacion.EN_PREPARACION)
			orden.marcarEnPreparacion()
		else if (transicion == OrdenStateTerminado.TERMINADO)
			orden.marcarTerminado()
		else if (transicion == OrdenStateEntregado.ENTREGADO)
			orden.marcarEntregado()
		else if (transicion == OrdenStateCancelado.CANCELADO)
			orden.marcarCancelado()
		else if (transicion == OrdenStateRechazado.RECHAZADO)
			orden.marcarRechazado()
		else if (transicion == OrdenStateAnulado.ANULADO)
			orden.marcarAnulado()
		else
			throw new TransicionInvalidaOrdenException()
    }


    public boolean anularOrden(String uuidOrden, boolean anulaIndividual) {
    	try {
	    	Orden orden = Orden.findByUuid(uuidOrden)
	    	if (! orden) return false
	    	if (orden.estado.nombre == OrdenStateAnulado.ANULADO)
				return true;
				
			marcarOrden(orden, OrdenStateAnulado.ANULADO)

			
			long idDuenio = orden.pedido.mozo.restaurant.duenio.id
			long idCocina = orden.pedido.mozo.restaurant.cocina.id
			if (anulaIndividual) {
				long idMozo = orden.pedido.mozo.id	
				notificacionService.crearNotificacion(idDuenio, idMozo, orden.uuid,
				 orden.estado.nombre)
			}
			notificacionService.crearNotificacion(idDuenio, idCocina, orden.uuid, orden.estado.nombre)

			orden.save(flush:true)
			return true
		} catch (Exception e) {
			return false
		}
		
	}



}
