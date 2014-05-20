package rom


import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional
import grails.converters.JSON


import grails.plugin.springsecurity.SpringSecurityService;
import grails.transaction.Transactional

import rom.notificaciones.Notificacion
import rom.seguridad.Usuario

/**
 * RestaurantController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class RestaurantController {

	def springSecurityService
	
	def notificacionService
	
    def mesaService
	
    def pedidoService
	
    static allowedMethods = [update: "PUT"]

	def index(Integer max) {
        /*params.max = Math.min(max ?: 10, 100)
        respond Restaurant.list(params), model:[restaurantInstanceCount: Restaurant.count()]*/
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
		redirect action:'show'
    }

    def show() {
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
		respond duenio.restaurant
    }
    
    def edit() {
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
		respond duenio.restaurant
    }

	@Secured(['permitAll'])
	def menu() {
		try {
			render Rubro.list() as JSON
		} catch(Exception) {
			render "[]"
		}	
	}
	
	@Secured(['permitAll'])
	def mesasOcupadas(long idRestaurant) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		render mesaService.getMesasOcupadas(resto) as JSON
	}
	
	@Secured(['permitAll'])
	def mesasDisponibles(long idRestaurant) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		render mesaService.getMesasDisponibles(resto) as JSON
	}
	
	@Secured(['permitAll'])
	def mesas(long idRestaurant) {
		Restaurant resto = Restaurant.findById(idRestaurant)
		List total = mesaService.getMesasDisponibles(resto)
		total += mesaService.getMesasOcupadas(resto)
		render total as JSON
	}

    @Secured(['permitAll'])
    def mesasByMozo(long idRestaurant, String username) {
        Restaurant resto = Restaurant.findById(idRestaurant)
        List total = []
        for (Mesa mesa : mesaService.getMesasOcupadas(resto)) {
            Pedido pedido = pedidoService.getPedidoByMesaId(mesa.id)
            if (pedido.mozo.username == username) {
                total += mesa
            }
        }
        render total as JSON
    }

	@Secured(['permitAll'])
    @Transactional(readOnly = false)
	def notificacion(long idRestaurant, String username) {
        Restaurant restaurant = Restaurant.findById(idRestaurant)
        Usuario usuario;
        if (username != "cocina" && username != "barra") {
            usuario = Mozo.findByUsernameAndRestaurant(username, restaurant)
        } else {
            usuario = Cocina.findByUsernameAndRestaurant(username, restaurant)
        }
		def notificaciones = notificacionService.getNotificacionByDestino(usuario.id)
		render notificaciones as JSON
	}
	
	
    @Transactional
    def update(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view:'edit'
            return
        }

        restaurantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.id])
                redirect restaurantInstance
            }
            '*'{ respond restaurantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Restaurant restaurantInstance) {

        if (restaurantInstance == null) {
            notFound()
            return
        }

        restaurantInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurantInstance.label', default: 'Restaurant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
