package rom


import static org.springframework.http.HttpStatus.*
import rom.Exceptions.MozoConErroresException;
import grails.converters.XML;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * MozoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class MozoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def mozoService
	
	def springSecurityService
	
	def index(Integer max) {
        redirect action:'list'
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List mozoSet = mozoService.findAllByRestaurant((springSecurityService.currentUser as Duenio).restaurant)
        [mozoInstanceList: mozoSet, mozoInstanceCount: mozoSet != null ? mozoSet.size() : 0]
		//respond Mozo.list(), model:[mozoInstanceCount: Mozo.count()]
    }

    def show(Mozo mozoInstance) {
        respond mozoInstance
    }

    def create() {
		def mozo = new Mozo(params)
		[mozoInstance: mozo, restaurantId: (springSecurityService.currentUser as Duenio).restaurant.id]
    }

    @Transactional
    def save(Mozo mozoInstance) {
        if (mozoInstance == null) {
            notFound()
            return
        }
		try {
			mozoService.crearMozo(mozo, (springSecurityService.currentUser as Duenio))
		} catch (MozoConErroresException) {
			respond mozoInstance.errors, view:'create'
			return
		}
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mozoInstance.label', default: 'Mozo'), mozoInstance.id])
                redirect mozoInstance
            }
            '*' { respond mozoInstance, [status: CREATED] }
        }
    }

    def edit(Mozo mozoInstance) {
        respond mozoInstance
    }

    @Transactional
    def update(Mozo mozoInstance) {
        if (mozoInstance == null) {
            notFound()
            return
        }

        if (mozoInstance.hasErrors()) {
            respond mozoInstance.errors, view:'edit'
            return
        }

        mozoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mozo.label', default: 'Mozo'), mozoInstance.id])
                redirect mozoInstance
            }
            '*'{ respond mozoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mozo mozoInstance) {

        if (mozoInstance == null) {
            notFound()
            return
        }

        mozoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mozo.label', default: 'Mozo'), mozoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mozoInstance.label', default: 'Mozo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
