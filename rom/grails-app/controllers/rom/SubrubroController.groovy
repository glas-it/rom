package rom


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured


/**
 * SubrubroController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class SubrubroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        //respond Subrubro.list(params), model:[subrubroInstanceCount: Subrubro.count()]
		redirect action: "list"
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subrubro.list(params), model:[subrubroInstanceCount: Subrubro.count()]
    }

    def show(Subrubro subrubroInstance) {
        respond subrubroInstance
    }

	@Transactional
	def subirOrden() {
		Subrubro subrubroInstance = Subrubro.get(params.id)
		if (subrubroInstance) {
			Subrubro subrubro = Subrubro.findByOrden(subrubroInstance.orden - 1)
			if (subrubro) {
				subrubroInstance.cambiarOrden(subrubro)
				subrubro.save()
				subrubroInstance.save()
			}
		}
		redirect action: "list"
	}
		
	@Transactional
	def bajarOrden() {
		Subrubro subrubroInstance = Subrubro.get(params.id)
		if (subrubroInstance) {
			Subrubro subrubro = Subrubro.findByOrden(subrubroInstance.orden + 1)
			if (subrubro) {
				subrubroInstance.cambiarOrden(subrubro)
				subrubro.save()
				subrubroInstance.save()
			}
		}
		redirect action: "list"
	}
	
    def create() {
        respond new Subrubro(params)
    }

    @Transactional
    def save(Subrubro subrubroInstance) {
        if (subrubroInstance == null) {
            notFound()
            return
        }

        if (subrubroInstance.hasErrors()) {
            respond subrubroInstance.errors, view:'create'
            return
        }

        subrubroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subrubroInstance.label', default: 'Subrubro'), subrubroInstance.id])
                redirect subrubroInstance
            }
            '*' { respond subrubroInstance, [status: CREATED] }
        }
    }

    def edit(Subrubro subrubroInstance) {
        respond subrubroInstance
    }

    @Transactional
    def update(Subrubro subrubroInstance) {
        if (subrubroInstance == null) {
            notFound()
            return
        }

        if (subrubroInstance.hasErrors()) {
            respond subrubroInstance.errors, view:'edit'
            return
        }

        subrubroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Subrubro.label', default: 'Subrubro'), subrubroInstance.id])
                redirect subrubroInstance
            }
            '*'{ respond subrubroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subrubro subrubroInstance) {

        if (subrubroInstance == null) {
            notFound()
            return
        }

        subrubroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subrubro.label', default: 'Subrubro'), subrubroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subrubroInstance.label', default: 'Subrubro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
