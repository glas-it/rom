package rom


import static org.springframework.http.HttpStatus.*
import rom.seguridad.Rol;
import rom.seguridad.UsuarioRol;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * DuenioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('ADMIN')")
class DuenioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def duenioService
	
	def index(Integer max) {
        redirect action:'list'
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Duenio.list(params), model:[duenioInstanceCount: Duenio.count()]
    }

    def show(Duenio duenioInstance) {
        respond duenioInstance
    }

    def create() {
        respond new Duenio(params)
    }

    @Transactional
    def save(Duenio duenioInstance) {
        if (duenioInstance == null) {
            notFound()
            return
        }
		
		if (duenioInstance.hasErrors()) {
            respond duenioInstance.errors, view:'create'
            return
        }
		if (duenioService == null) {
			render "error al inyectar el service"
			return
		}
		duenioService.crearDuenio(duenioInstance)
		request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'duenioInstance.label', default: 'Duenio'), duenioInstance.id])
                redirect duenioInstance
            }
            '*' { respond duenioInstance, [status: CREATED] }
        }
    }

    def edit(Duenio duenioInstance) {
        respond duenioInstance
    }

    @Transactional
    def update(Duenio duenioInstance) {
        if (duenioInstance == null) {
            notFound()
            return
        }

        if (duenioInstance.hasErrors()) {
            respond duenioInstance.errors, view:'edit'
            return
        }

        duenioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Duenio.label', default: 'Duenio'), duenioInstance.id])
                redirect duenioInstance
            }
            '*'{ respond duenioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Duenio duenioInstance) {

        if (duenioInstance == null) {
            notFound()
            return
        }

        duenioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Duenio.label', default: 'Duenio'), duenioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'duenioInstance.label', default: 'Duenio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
