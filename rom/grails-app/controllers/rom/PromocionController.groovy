package rom


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * PromocionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class PromocionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        redirect action:'list'
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Promocion.list(params), model:[promocionInstanceCount: Promocion.count()]
    }

    def show(Promocion promocionInstance) {
        respond promocionInstance
    }

    def create() {
        respond new Promocion(params)
    }

    @Transactional
    def save(Promocion promocionInstance) {
        if (promocionInstance == null) {
            notFound()
            return
        }

        if (promocionInstance.hasErrors()) {
            respond promocionInstance.errors, view:'create'
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

    def edit(Promocion promocionInstance) {
        respond promocionInstance
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

    @Transactional
    def delete(Promocion promocionInstance) {

        if (promocionInstance == null) {
            notFound()
            return
        }

        promocionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Promocion.label', default: 'Promocion'), promocionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
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
