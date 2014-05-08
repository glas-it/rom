package rom


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;


/**
 * PedidoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('MOZO')")
class PedidoController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", apertura: "POST", cierre: "POST"]

	def pedidoService
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def apertura(long idRestaurant, String usernameMozo, long nroMesa, int comensales) {
		Restaurant restaurant = Restaurant.findById(idRestaurant)
		Mesa mesa = Mesa.findByNumeroAndRestaurant(nroMesa, restaurant)
		if (mesa == null || ! mesa.activo || mesa.abierta) {
			render "ERROR: No se puede procesa mesa"
			return
		}	
		
		Mozo mozo = Mozo.findByUsernameAndRestaurant(usernameMozo, restaurant);
		if (mozo == null) {
			render "ERROR: mozo inexistente"
			return
		}
		
		Pedido pedido = new Pedido(mesa, mozo, comensales)
		pedido.abrir()
		pedido.save()
		
		render "SUCCESS: idPedido: " + pedido.id.toString() + " Mesa:" + mesa.toString() + " Mozo:" + mozo.toString()
	}
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def mozo(String username) {
		def criteria = Pedido.createCriteria()
		def result = criteria.list {
			and {
				eq("activo", true)
				mozo {
					eq("username", username)
				}
			}
		}
		render result as JSON
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def cierre(long idRestaurant, long nroMesa) {
		Mesa mesa = Mesa.findByNumeroAndRestaurant(nroMesa, Restaurant.findById(idRestaurant))
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)

		pedido.cerrar()
		pedido.save()
		render "SUCCESS: pedido de mesa " + nroMesa + " cerrado"
	}
	
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def byMesa(long idRestaurant, long nroMesa) {
		Mesa mesa = Mesa.findByNumeroAndRestaurant(nroMesa, Restaurant.findById(idRestaurant))
		if (! mesa)
			throw new Exception("Mesa inexistente en Restaurant")
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)
		render pedido as JSON
	}
	
	
	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Pedido.list(params), model:[pedidoInstanceCount: Pedido.count()]
	} 

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Pedido.list(params), model:[pedidoInstanceCount: Pedido.count()]
	}

	def show(Pedido pedidoInstance) {
		respond pedidoInstance
	}

	def create() {
		respond new Pedido(params)
	}

	@Transactional
	def save(Pedido pedidoInstance) {
		if (pedidoInstance == null) {
			notFound()
			return
		}

		if (pedidoInstance.hasErrors()) {
			respond pedidoInstance.errors, view:'create'
			return
		}

		pedidoInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [message(code: 'pedidoInstance.label', default: 'Pedido'), pedidoInstance.id])
				redirect pedidoInstance
			}
			'*' { respond pedidoInstance, [status: CREATED] }
		}
	}

	def edit(Pedido pedidoInstance) {
		respond pedidoInstance
	}

	@Transactional
	def update(Pedido pedidoInstance) {
		if (pedidoInstance == null) {
			notFound()
			return
		}

		if (pedidoInstance.hasErrors()) {
			respond pedidoInstance.errors, view:'edit'
			return
		}

		pedidoInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Pedido.label', default: 'Pedido'), pedidoInstance.id])
				redirect pedidoInstance
			}
			'*'{ respond pedidoInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Pedido pedidoInstance) {

		if (pedidoInstance == null) {
			notFound()
			return
		}

		pedidoInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pedido.label', default: 'Pedido'), pedidoInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedidoInstance.label', default: 'Pedido'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
