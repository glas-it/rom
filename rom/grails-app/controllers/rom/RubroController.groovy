package rom



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * RubroController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class RubroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

	//def springSecurityService

	def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        //respond Rubro.list(params), model:[rubroInstanceCount: Rubro.count()]
		redirect action: "list"
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rubro.list(params), model:[rubroInstanceCount: Rubro.count()]
    }

	@Transactional
	def subirOrden() {
		Rubro rubroInstance = Rubro.get(params.id)
		if (rubroInstance) {
			Rubro rubro = Rubro.findByOrden(rubroInstance.orden - 1)
			if (rubro) {
				rubroInstance.cambiarOrden(rubro)
				rubro.save()
				rubroInstance.save()
			}
		}
		redirect action: "list"
	}

	@Transactional
	def bajarOrden() {
		Rubro rubroInstance = Rubro.get(params.id)
		if (rubroInstance) {
			Rubro rubro = Rubro.findByOrden(rubroInstance.orden + 1)
			if (rubro) {

				rubroInstance.cambiarOrden(rubro)
				rubro.save()
				rubroInstance.save()
			}
		}
		redirect action: "list"
	}

    def show(Rubro rubroInstance) {
        respond rubroInstance
    }

    def create() {
		respond new Rubro(params)
    }

    @Transactional
    def save(Rubro rubroInstance) {
        if (rubroInstance == null) {
            notFound()
            return
        }

        if (rubroInstance.hasErrors()) {
            respond rubroInstance.errors, view:'create'
            return
        }

        rubroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rubroInstance.label', default: 'Rubro'), rubroInstance.id])
                redirect rubroInstance
            }
            '*' { respond rubroInstance, [status: CREATED] }
        }
    }

    def edit(Rubro rubroInstance) {
        respond rubroInstance
    }

    @Transactional
    def update(Rubro rubroInstance) {
        if (rubroInstance == null) {
            notFound()
            return
        }

        if (rubroInstance.hasErrors()) {
            respond rubroInstance.errors, view:'edit'
            return
        }

        rubroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Rubro.label', default: 'Rubro'), rubroInstance.id])
                redirect rubroInstance
            }
            '*'{ respond rubroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Rubro rubroInstance) {

        if (rubroInstance == null) {
            notFound()
            return
        }

        rubroInstance.delete flush:true

        redirect action: "index", method: "GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rubroInstance.label', default: 'Rubro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
