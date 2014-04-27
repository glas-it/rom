package rom


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional
import rom.OrdenStates.OrdenStateCancelado;
import rom.OrdenStates.OrdenStateEntregado;

/**
 * OrdenController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class OrdenController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", alta: "POST"]
	
	def pedidoService
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def alta(long idMesa, long idConsumible, long idPrecio) {
		Pedido pedido = pedidoService.getPedidoByMesaId(idMesa)
		
		Consumible consumible = Consumicion.findById(idConsumible)
		Precio precio = Precio.findById(idPrecio)
		if (! consumible || ! precio) throw new Exception("Consumible inexistente")
		
		Orden orden = new Orden(consumible, precio)
		
		pedido.addOrden(orden)
		pedido.save()
		render "SUCCESS"
	}
	
	def cocina() {
		def criteria = Orden.createCriteria()
		def results = criteria.list {
			and {
				ne("estado", new OrdenStateCancelado())
				ne("estado", new OrdenStateEntregado())
			}	
		} 
		render results as JSON
	}
	
	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Orden.list(params), model:[ordenInstanceCount: Orden.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Orden.list(params), model:[ordenInstanceCount: Orden.count()]
    }

    def show(Orden ordenInstance) {
        respond ordenInstance
    }

    def create() {
        respond new Orden(params)
    }

    @Transactional
    def save(Orden ordenInstance) {
        if (ordenInstance == null) {
            notFound()
            return
        }

        if (ordenInstance.hasErrors()) {
            respond ordenInstance.errors, view:'create'
            return
        }

        ordenInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ordenInstance.label', default: 'Orden'), ordenInstance.id])
                redirect ordenInstance
            }
            '*' { respond ordenInstance, [status: CREATED] }
        }
    }

    def edit(Orden ordenInstance) {
        respond ordenInstance
    }

    @Transactional
    def update(Orden ordenInstance) {
        if (ordenInstance == null) {
            notFound()
            return
        }

        if (ordenInstance.hasErrors()) {
            respond ordenInstance.errors, view:'edit'
            return
        }

        ordenInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Orden.label', default: 'Orden'), ordenInstance.id])
                redirect ordenInstance
            }
            '*'{ respond ordenInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Orden ordenInstance) {

        if (ordenInstance == null) {
            notFound()
            return
        }

        ordenInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Orden.label', default: 'Orden'), ordenInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordenInstance.label', default: 'Orden'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
