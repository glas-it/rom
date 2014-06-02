package rom


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON;
import grails.plugin.springsecurity.SpringSecurityService;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * PromocionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional
@Secured("hasRole('DUENIO')")
class PromocionController {

	private static String SUCCESS_TRUE = "{'success':true}"
	private static String SUCCESS_FALSE = "{'success':false}"
	
	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        redirect action:'list'
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		params.activo = true
		def lista = Promocion.findAllWhere(activo: true)
        respond lista, model:[promocionInstanceCount: lista ? lista.size() : 0]
    }

    def show(Promocion promocionInstance) {
        respond promocionInstance
    }

    def create() {
		def restaurant = Duenio.get(springSecurityService.currentUser?.id).restaurant
        [promocionInstance: new Promocion(params), restaurantInstance: restaurant]
    }

    @Transactional
    def save(Promocion promocionInstance) {
        if (promocionInstance == null) {
            notFound()
            return
        }

        if (promocionInstance.hasErrors()) {
			def restaurant = Duenio.get(springSecurityService.currentUser?.id).restaurant
			render view: 'create', model: [promocionInstance: promocionInstance, restaurantInstance: restaurant]
            return
        }
		def restaurant = Duenio.get(springSecurityService.currentUser.id)?.restaurant
        if (!restaurant) {
			flash.message = "Debe encontrarse logueado para realizar esta accion"
			notFound()
			return
		}
		promocionInstance.restaurant = restaurant
		promocionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'promocionInstance.label', default: 'Promocion'), promocionInstance.id])
                redirect promocionInstance
            }
            '*' { respond promocionInstance, [status: CREATED] }
        }
    }

	@Transactional
	@Secured("hasRole('DUENIO')")
	def delete(Promocion promocionInstance) {
		if (!promocionInstance) {
			flash.message = "no existe tal promocion"
			redirect action: 'list'
			return
		}
		if (!promocionInstance.esEditable()) {
			flash.message = "la promoción no puede ser borrada"
			redirect action: 'list'
			return
		}
		promocionInstance.activo = false
		promocionInstance.save()
		flash.message = "la promoción fue borrada con éxito"
		redirect action: 'list'
	}
	
    def edit(Promocion promocionInstance) {
		if (!promocionInstance.esEditable()) {
			flash.message = "La promoción no puede ser editada"
			redirect action:'list'
			return
		}
		respond promocionInstance
    }
	
	@Secured(['permitAll'])
	def validar(Long idPromocion, Long idRestaurant) {
		def promocion = Promocion.get(idPromocion)
		if (!promocion) {
			render SUCCESS_FALSE
			return
		}
		render promocion.esValida() ? SUCCESS_TRUE : SUCCESS_FALSE
	}
	
    @Transactional
    def update(Promocion promocionInstance) {	
        if (promocionInstance == null) {
            notFound()
            return
        }
				
        if (promocionInstance.hasErrors()) {
            respond promocionInstance.errors, view:'edit'
            return
        }

        promocionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Promocion.label', default: 'Promocion'), promocionInstance.id])
                redirect promocionInstance
            }
            '*'{ respond promocionInstance, [status: OK] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocionInstance.label', default: 'Promocion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
