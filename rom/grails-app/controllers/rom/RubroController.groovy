package rom



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RubroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rubro.list(params), model:[rubroInstanceCount: Rubro.count()]
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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Rubro.label', default: 'Rubro'), rubroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
