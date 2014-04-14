package rom


import static org.springframework.http.HttpStatus.*

import org.apache.jasper.compiler.Node.ParamsAction;

import grails.transaction.Transactional
import grails.converters.JSON;
import grails.converters.XML;
import grails.plugin.springsecurity.annotation.Secured;

/**
 * ConsumicionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class ConsumicionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", filter:"GET"]
	
	def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        //respond Consumicion.list(params), model:[consumicionInstanceCount: Consumicion.count()]
		redirect action: "list"
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
        respond Consumicion.list(params), model:[consumicionInstanceCount: Consumicion.count()]
    }

    def show(Consumicion consumicionInstance) {
        respond consumicionInstance
    }

    def create() {
        respond new Consumicion(params)
    }
	
	def getJSONList() {
		List<Consumicion> lista = Consumicion.list()
		for(consu in lista) {
			consu.setPreciosList();
		}
		return lista;
	}

	def filter(ConsumicionFilter filter) {
		if (!params.max)
			params.max = 10
		
		List consumiciones = Consumicion.list()
		if (filter.nombre && !filter.nombre.isAllWhitespace()) {
			consumiciones = consumiciones.findAll { it.nombre.contains(filter.nombre) }
		}
		if (filter.subrubro) {
			consumiciones = consumiciones.findAll { it.subrubro.id == filter.subrubro.id }
		}
		if (filter.rubro) {
			consumiciones = consumiciones.findAll { it.subrubro.rubro.id == filter.rubro.id }
		}
		//List consumiciones = consumisionService.filter(params)
		respond view:'list', consumiciones
	}
	
    @Transactional
    def save(Consumicion consumicionInstance) {
        if (consumicionInstance == null) {
            notFound()
            return
        }

        if (consumicionInstance.hasErrors()) {
            respond consumicionInstance.errors, view:'create'
            return
        }

        consumicionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'consumicionInstance.label', default: 'Consumicion'), consumicionInstance.id])
                redirect consumicionInstance
            }
            '*' { respond consumicionInstance, [status: CREATED] }
        }
    }

    def edit(Consumicion consumicionInstance) {
        respond consumicionInstance
    }

    @Transactional
    def update(Consumicion consumicionInstance) {
        if (consumicionInstance == null) {
            notFound()
            return
        }

        if (consumicionInstance.hasErrors()) {
            respond consumicionInstance.errors, view:'edit'
            return
        }

        consumicionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Consumicion.label', default: 'Consumicion'), consumicionInstance.id])
                redirect consumicionInstance
            }
            '*'{ respond consumicionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Consumicion consumicionInstance) {

        if (consumicionInstance == null) {
            notFound()
            return
        }

        consumicionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Consumicion.label', default: 'Consumicion'), consumicionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'consumicionInstance.label', default: 'Consumicion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

class ConsumicionFilter {
	String nombre
	Subrubro subrubro
	Rubro rubro
}
