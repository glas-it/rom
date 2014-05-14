package rom


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import org.codehaus.groovy.grails.web.json.*

import grails.transaction.Transactional
import rom.OrdenStates.*
import rom.notificaciones.Notificacion
import groovy.time.*;


/**
 * OrdenController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class OrdenController {

	private String SUCCESS = "{'success': true}"
		
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", alta: "POST"]
	
	def pedidoService
	def ordenService
	def notificacionService

	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def alta(long idRestaurant, long idMesa, String platos) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)
		JSONArray ordenes = new JSONArray(platos)
		for(plato in ordenes) {
			Consumible consumible = Consumicion.findById(plato.idConsumicion)
			Consumible agregados = Agregado.findById(plato.idAgregado)
			Precio precio = Precio.findByConsumibleAndDescripcion(consumible, plato.precio.descripcion)
			if (consumible == null || precio == null) throw new Exception("Consumible inexistente")
			
			Orden orden = new Orden(plato.id, consumible, agregados, precio)
			orden.addObservaciones(plato.observaciones)
			pedido.addToOrdenes(orden)
		}
		
		pedido.save(flush:true)
		
		/* TODO
		 * Notificar cocina
		 */
		
		render SUCCESS
	}
	
	
	
	@Transactional(readOnly = false)
	@Secured(['permitAll'])
	def foo() {
		Orden orden = getOrden(1)
		render orden.timer.total 
	}
	
	// Para que la cocina pueda pedir el listado de las ordenes
	@Secured(['permitAll'])
	def cocina() {
		def criteria = Orden.createCriteria()
		def results = criteria.list {
			or {
				ne("estado", new OrdenStateCancelado())
				ne("estado", new OrdenStateAnulado())
			}	
		} 
		render results as JSON
	}
	
	@Secured(['permitAll'])
	def getOrden(String uuidOrden) {
		Orden orden = Orden.findByUuid(uuidOrden)
		if (! orden)
			throw new Exception("Orden inexistente")
		return orden
	}
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def preparando(String uuidOrden) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateEnPreparacion.EN_PREPARACION)
		orden.save(flush:true)
		render SUCCESS
	}
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def cancelado(String uuidOrden) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateCancelado.CANCELADO)
		orden.save(flush:true)
		render SUCCESS
	}

	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def terminado(String uuidOrden) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateTerminado.TERMINADO)
		
		long idCocina = orden.pedido.mozo.restaurant.cocina.id
		long idMozo = orden.pedido.mozo.id
		notificacionService.crearNotificacion(idCocina, idMozo, orden.uuid,
			 orden.estado.nombre)

		orden.save(flush:true)
		render SUCCESS
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def rechazado(String uuidOrden, String observaciones) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateRechazado.RECHAZADO)
		orden.addObservaciones(observaciones)
		orden.save(flush:true)
		render SUCCESS
	}


	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def entregado(String uuidOrden) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateEntregado.ENTREGADO)
		orden.save(flush:true)
		render SUCCESS
	}
	

	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def anulado(String uuidOrden) {
		if (ordenService.anularOrden(uuidOrden, true)) {
			render SUCCESS
			return
		}
		render "{'success': false}"

	}
	
	
	
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Orden.list(params), model:[ordenInstanceCount: Orden.count()]
	}

	/*
    def show(Orden ordenInstance) {
        respond ordenInstance
    }

    def create() {
        respond new Orden(params)
    }
    
    def edit(Orden ordenInstance) {
        respond ordenInstance
    }
    
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Orden.list(params), model:[ordenInstanceCount: Orden.count()]
    }
    */

	@Transactional
	def save(Orden ordenInstance) {
		if (ordenInstance == null) {
			notFound()
			return
		}

		if (ordenInstance.hasErrors()) {
			respond ordenInstance.errors, view:'create'
			return
		}

		ordenInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ordenInstance.label', default: 'Orden'), ordenInstance.id])
                redirect ordenInstance
            }
            '*' { respond ordenInstance, [status: CREATED] }
        }
    }

	@Transactional
	def update(Orden ordenInstance) {
		if (ordenInstance == null) {
			notFound()
			return
		}

		if (ordenInstance.hasErrors()) {
			respond ordenInstance.errors, view:'edit'
			return
		}

		ordenInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Orden.label', default: 'Orden'), ordenInstance.id])
				redirect ordenInstance
			}
			'*'{ respond ordenInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Orden ordenInstance) {

		if (ordenInstance == null) {
			notFound()
			return
		}

		ordenInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'Orden.label', default: 'Orden'), ordenInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenInstance.label', default: 'Orden'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
