package rom


import static org.springframework.http.HttpStatus.*

import grails.transaction.Transactional
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.*
import grails.plugin.springsecurity.annotation.Secured;
import rom.PedidoStates.*


/**
 * PedidoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('MOZO')")
class PedidoController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", apertura: "POST", cierre: "POST"]

	def pedidoService
	
	def mesaService
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def apertura(long idRestaurant, String usernameMozo, String nroMesas, int comensales) {
		Restaurant restaurant = Restaurant.findById(idRestaurant)

		JSONArray idMesas = new JSONArray(nroMesas)
		Mesa mesa = getMesaParaApertura(idMesas, restaurant)
		
		Mozo mozo = Mozo.findByUsernameAndRestaurant(usernameMozo, restaurant);
		if (mozo == null)
			throw new Exception("Mozo " + usernameMozo + " inexistente")
		
		Pedido pedido = new Pedido(mesa, mozo, comensales)
		pedido.marcarAbierto()
		pedido.save()
		
		render "SUCCESS: idPedido: " + pedido.id.toString() + " Mesa:" + mesa.toString() + " Mozo:" + mozo.toString()
	}
	
	private Mesa getMesaParaApertura(List nroMesas, Restaurant restaurant) {
		if (nroMesas.size() <= 0)
			throw new Exception("Parametro nroMesas invalido")
		Mesa mesa = null
		if (nroMesas.size() == 1) {
			mesa = mesaService.getMesaUnitaria(nroMesas[0], restaurant)
		} else {
			mesa = mesaService.crearMesaComposite(nroMesas, restaurant)
		}			
		return mesa
	}
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def mozo(String username) {
		def criteria = Pedido.createCriteria()
		def result = criteria.list {
			and {
				or{
					eq("estado", new PedidoStateAbierto())
					eq("estado", new PedidoStateCerrado())
				}
				mozo {
					eq("username", username)
				}
			}
		}
		render result as JSON
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def cambioMozo(long idRestaurant, String username, long idMesa) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		Mozo nuevoMozo = Mozo.findByUsername(username)
		if ( ! nuevoMozo )
			throw new Exception("Mozo inexistente");
		
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)
		
		pedido.setNuevoMozo(nuevoMozo)
		
		pedido.save()
		render "SUCCESS: nuevo mozoId " + nuevoMozo.id 
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def cierre(long idRestaurant, long idMesa) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)

		pedido.marcarCerrado()
		pedido.save()
		render "SUCCESS: pedido de mesa " + mesa.id + " cerrado"
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def pago(long idRestaurant, long idMesa) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)

		/*
		 * TODO
		 * Cuestiones de metodo de pago y demas!
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 */
		
		pedido.marcarPagado()
		pedido.save()
		render "SUCCESS: pedido de mesa " + mesa.id + " pagado"
	}
	
	

	
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def byMesa(long idRestaurant, long idMesa) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		if (! mesa)
			throw new Exception("Mesa inexistente en Restaurant")
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)
		render pedido as JSON
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def agregarMesa(long idRestaurant, long idMesaCompuesta, long idMesa) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		
		mesaService.agregarMesa(idMesaCompuesta, idMesa, resto)
		
		render "SUCCESS"
	}
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def quitarMesa(long idRestaurant, long idMesaCompuesta, long idMesa) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		
		mesaService.quitarMesa(idMesaCompuesta, idMesa, resto)
		
		render "SUCCESS"
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
