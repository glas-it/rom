package rom


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import org.codehaus.groovy.grails.web.json.*

import grails.transaction.Transactional
import rom.OrdenStates.*
import rom.notificaciones.Notificacion
import rom.seguridad.Usuario
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
	
	
	// Para que la cocina pueda pedir el listado de las ordenes
	@Secured(['permitAll'])
	def all(String username) {
		def criteria = Orden.createCriteria()
		def results = criteria.list {
			and {
				or {
					ne("estado", new OrdenStateCancelado())
					ne("estado", new OrdenStateAnulado())
				}
				consumible {
					eq("aCocina", username == "cocina")
				}
			}
		} 
		render results as JSON
	}
	
	@Secured(['permitAll'])
	def byEstado(String username, String estado) {
		def orden
		if (estado == "Pendiente") {
			orden = new OrdenStatePendiente()
		} else if (estado == "En Preparacion") {
			orden = new OrdenStateEnPreparacion()
		} else if (estado == "Terminado") {
			orden = new OrdenStateTerminado()
		} else {
			return "[]"
		}
		def criteria = Orden.createCriteria()
		def results = criteria.list {
			and {
				eq("estado", orden)
				consumible {
					eq("aCocina", username == "cocina")
				}
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
	def terminado(String username, String uuidOrden) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateTerminado.TERMINADO)
		
		Usuario usuario = Usuario.findByUsername(username)
		long idMozo = orden.pedido.mozo.id
		notificacionService.crearNotificacion(usuario.id, idMozo, "Mesa " + orden.pedido.mesa.numero, 
			"Retirar: " + orden.consumible.toString())

		orden.save(flush:true)
		render SUCCESS
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def rechazado(String uuidOrden, boolean reordenar, String observaciones) {
		Orden orden = getOrden(uuidOrden)
		ordenService.marcarOrden(orden, OrdenStateRechazado.RECHAZADO)
		if (reordenar) {
			ordenService.marcarOrden(orden, OrdenStatePendiente.PENDIENTE)
		}
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
	def anular() {
		def orden = Orden.get(params.id)
		if (!orden) {
			flash.message = "No existe tal orden"
			redirect action: 'list'
		}
		orden.motivoAnulacion = params.motivo
		if (ordenService.anularOrden(orden.uuid, true, params.motivo)) {
			orden = Orden.get(params.id)
			orden.save()
			flash.message = "La orden ha sido anulada correctamente"
			redirect action: 'list'
		} else {
			flash.message = "Hubo un error al anular la orden"
			redirect action: 'list'
		}

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
