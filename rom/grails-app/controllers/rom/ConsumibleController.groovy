package rom


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional


/**
 * ConsumibleController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured('permitAll')
class ConsumibleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Consumible.list(params), model:[consumibleInstanceCount: Consumible.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Consumible.list(params), model:[consumibleInstanceCount: Consumible.count()]
    }

    def show(Consumible consumibleInstance) {
        respond consumibleInstance
    }

    def create() {
        respond new Consumible(params)
    }

    @Transactional
    def save(Consumible consumibleInstance) {
        if (consumibleInstance == null) {
            notFound()
            return
        }

        if (consumibleInstance.hasErrors()) {
            respond consumibleInstance.errors, view:'create'
            return
        }

        consumibleInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consumibleInstance.label', default: 'Consumible'), consumibleInstance.id])
                redirect consumibleInstance
            }
            '*' { respond consumibleInstance, [status: CREATED] }
        }
    }

    def edit(Consumible consumibleInstance) {
        respond consumibleInstance
    }

    @Transactional
    def update(Consumible consumibleInstance) {
        if (consumibleInstance == null) {
            notFound()
            return
        }

        if (consumibleInstance.hasErrors()) {
            respond consumibleInstance.errors, view:'edit'
            return
        }

        consumibleInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Consumible.label', default: 'Consumible'), consumibleInstance.id])
                redirect consumibleInstance
            }
            '*'{ respond consumibleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Consumible consumibleInstance) {

        if (consumibleInstance == null) {
            notFound()
            return
        }

        consumibleInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Consumible.label', default: 'Consumible'), consumibleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consumibleInstance.label', default: 'Consumible'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
