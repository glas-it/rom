package rom

import rom.Exceptions.TransicionInvalidaOrdenException
import rom.OrdenStates.*

import grails.transaction.Transactional;

/**
 * OrdenService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class OrdenService {

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
		else
			throw new TransicionInvalidaOrdenException()
    }
}
