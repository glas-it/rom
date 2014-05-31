package rom

import java.util.Date;
import java.util.Calendar.*

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


    public boolean anularOrden(String uuidOrden, boolean anulaIndividual, String motivo) {
    	try {
	    	Orden orden = Orden.findByUuid(uuidOrden)
	    	if (! orden) return false
	    	if (orden.estado.nombre == OrdenStateAnulado.ANULADO)
				return true;
				
			marcarOrden(orden, OrdenStateAnulado.ANULADO)
			orden.motivoAnulacion = motivo

			notificar(orden, anulaIndividual)

			orden.save(flush:true)
			return true
		} catch (Exception e) {
			return false
		}
		
	}
	
	public void notificar(Orden orden, boolean anulaIndividual) {
		Mozo mozo = orden.pedido.mozo
		Restaurant resto = mozo.restaurant
		Duenio duenio = resto.duenio
		Cocina cocina = Cocina.findByUsername((orden.consumible.aCocina) ? "cocina" : "barra")
		
		if (anulaIndividual) {
			notificacionService.crearNotificacion(duenio.id, mozo.id, "Mesa " + orden.pedido.mesa.numero, 
				"Se anuló: " + orden.consumible.toString())
		}
		notificacionService.crearNotificacion(duenio.id, cocina.id,  "Mesa " + orden.pedido.mesa.numero, 
				"Se anuló: " + orden.consumible.toString())
	}
	
	private Date getUltimaHoraDelDia(Date fecha) {
		Calendar cal = Calendar.getInstance()
		cal.setTime(fecha)
		cal.set(Calendar.HOUR_OF_DAY,23);
		cal.set(Calendar.MINUTE,59);
		cal.set(Calendar.SECOND,59);
		return cal.getTime()
	}
	
	def getOrdenesFacturadasBy(Date desde, Date hasta, List subrubros) {
		hasta = getUltimaHoraDelDia(hasta)
		return Orden.executeQuery("select o from Orden o " +
			"inner join o.consumible as c " +
			"inner join o.pedido as p " +
			"where p.fechaPago between :fDesde and :fHasta " +
			"and c.subrubro in :lSubrubros", [fDesde: desde, fHasta: hasta, lSubrubros: subrubros])
	}

}
