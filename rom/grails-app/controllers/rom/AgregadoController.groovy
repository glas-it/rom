package rom


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured;

/**
 * AgregadoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured('permitAll')
class AgregadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
       /* params.max = Math.min(max ?: 10, 100)
        respond Agregado.list(params), model:[agregadoInstanceCount: Agregado.count()]*/
		redirect action:'list'
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Agregado.list(params), model:[agregadoInstanceCount: Agregado.count()]
    }

    def show(Agregado agregadoInstance) {
        respond agregadoInstance
    }

    def create() {
        respond new Agregado(params)
    }

    @Transactional
    def save(Agregado agregadoInstance) {
        if (agregadoInstance == null) {
            notFound()
            return
        }
		agregadoInstance.precios = agregadoInstance.precios.findAll{it}
        agregadoInstance.validate()
		if (agregadoInstance.hasErrors()) {
            respond agregadoInstance.errors, view:'create'
            return
        }

        agregadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'agregadoInstance.label', default: 'Agregado'), agregadoInstance.id])
                redirect agregadoInstance
            }
            '*' { respond agregadoInstance, [status: CREATED] }
        }
    }

    def edit(Agregado agregadoInstance) {
        respond agregadoInstance
    }

    @Transactional
    def update(Agregado agregadoInstance) {
        if (agregadoInstance == null) {
            notFound()
            return
        }

        if (agregadoInstance.hasErrors()) {
            respond agregadoInstance.errors, view:'edit'
            return
        }

        agregadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Agregado.label', default: 'Agregado'), agregadoInstance.id])
                redirect agregadoInstance
            }
            '*'{ respond agregadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Agregado agregadoInstance) {

        if (agregadoInstance == null) {
            notFound()
            return
        }

        agregadoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Agregado.label', default: 'Agregado'), agregadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'agregadoInstance.label', default: 'Agregado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
