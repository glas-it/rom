package rom


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

import org.codehaus.groovy.grails.web.json.*

import grails.plugin.springsecurity.annotation.Secured;
import rom.PedidoStates.*
import rom.notificaciones.Notificacion

/**
 * PedidoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('MOZO')")
class PedidoController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", apertura: "POST", cierre: "POST"]

	private String SUCCESS = "{'success': true}"
	
	def pedidoService
	def mesaService
	def ordenService
	def notificacionService
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def apertura(long idRestaurant, String usernameMozo, String idMesas, int comensales) {
		Restaurant restaurant = Restaurant.findById(idRestaurant)

		JSONArray idMesasList = new JSONArray(idMesas)
		Mesa mesa = getMesaParaApertura(idMesasList, restaurant)
		String rta = (mesa as JSON).toString()
		
		Mozo mozo = Mozo.findByUsernameAndRestaurant(usernameMozo, restaurant);
		if (mozo == null)
			throw new Exception("Mozo " + usernameMozo + " inexistente")
		
		Pedido pedido = new Pedido(mesa, mozo, comensales)
		pedido.marcarAbierto()
		pedido.save()
		
		/* Por el amor del dios en el que creas, no descomentes esta línea!!! */
		//String rta = (mesa as JSON).toString()
		render "{'success':true, 'mesa': " + rta + "}"
	}
	
	private Mesa getMesaParaApertura(List idMesas, Restaurant restaurant) {
		if (idMesas.size() <= 0)
			throw new Exception("Parametro idMesas invalido")
		Mesa mesa = null
		mesa = mesaService.crearMesaComposite(idMesas, restaurant)
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
		render pedido as JSON
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def cierre(long idRestaurant, long idMesa) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)
		if (pedido.ordenes.size() > 0) {
			pedido.marcarCerrado()
			pedido.save()
		} else {
			pedido.marcarAnulado("Pedido sin órdenes")
		}
		render SUCCESS
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
		render SUCCESS
	}


	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def anular() {
		try {
			def pedido = Pedido.get(params.id)
			if (!pedido) {
				flash.message = "El pedido no existe"
				redirect action: 'list'
			}
			pedido.ordenes.each{ ordenService.anularOrden(it.uuid, false) }
			pedido.marcarAnulado(params.motivo)
			pedido.save()
			long idDuenio = pedido.mozo.restaurant.duenio.id
			notificacionService.crearNotificacion(idDuenio, pedido.mozo.id, pedido.id.toString(), pedido.estado.nombre)
			flash.message = "El pedido ha sido anulado exitosamente"
			redirect action: 'list'
		} catch(Exception) {
			flash.message = "Hubo un error al anular el pedido"
		}
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def byMesa(long idRestaurant, long idMesa) {
		Mesa mesa = Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
		if (! mesa) {
			render "{'success': false}"
			return
		}
			
		try {
			render pedidoService.getPedidoByMesaId(mesa.id) as JSON
		} catch (Exception e){
			render "{'success': false, 'mesa':"+(mesa as JSON)+"}"
		}
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def agregarMesa(long idRestaurant, long idMesaCompuesta, long idMesa) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		mesaService.agregarMesa(idMesaCompuesta, idMesa, resto)

		render SUCCESS
	}
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def quitarMesa(long idRestaurant, long idMesaCompuesta, long idMesa) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		
		mesaService.quitarMesa(idMesaCompuesta, idMesa, resto)
		
		render SUCCESS
	}
	
	
	def index(Integer max) {
		redirect action:'list'
	} 

	@Secured(['permitAll'])
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Pedido.list(params), model:[pedidoInstanceCount: Pedido.count()]
	}

	@Secured(['permitAll'])
	def filter(Integer max) {
		println "ESTADO " + params.estadoNombre
		println "FECHA " + params.fecha
		Integer offset = params.offset ? params.int("offset") : 0
		params.max = Math.min(max ?: 10, 100)
		PedidoFilter filtro = new PedidoFilter(estadoNombre: params.estadoNombre, fecha: params.fecha)
		
		def pedidos = pedidoService.filter(filtro, params.max, offset)
		respond pedidos, model:[pedidoInstanceCount: pedidos.size()], view:'list'
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

class PedidoFilter {
	String estadoNombre
	String fecha
}
