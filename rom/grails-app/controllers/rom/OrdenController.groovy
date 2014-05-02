package rom


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional
import rom.OrdenStates.*;


import groovy.time.*;


/**
 * OrdenController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class OrdenController {

	private String SUCCESS = "SUCCESS"
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", alta: "POST"]
	
	def pedidoService
	def ordenService
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def alta() {
		def args = request.JSON
		long idMesa = args["mesa"] as Long
		long idConsumible = args["consumible"] as Long
		long idPrecio = args["precio"] as Long
		long codigo = args["codigo"] as Long
		
		Pedido pedido = pedidoService.getPedidoByMesaId(idMesa)
		
		Consumible consumible = Consumicion.findById(idConsumible)
		Precio precio = Precio.findById(idPrecio)
		if (! consumible || ! precio) throw new Exception("Consumible inexistente")
		
		Orden orden = new Orden(codigo, consumible, precio)
		
		println "CON" + consumible.nombre
		println "PRECIO" + precio.valor
		println "PEDIDO" + pedido.id
		println "CODI" + orden.codigo
		
		pedido.addOrden(orden)
		pedido.save(flush:true)
		
		/* TODO
		 * Notificar cocina
		 */
		println "ORDENES:" + pedido.ordenes
		
		render SUCCESS + " " + orden.id
	}
	
	
	
	@Transactional(readOnly = false)
	@Secured(['permitAll'])
	def foo() {
		StateTimer st = new StateTimer()
		st.start("EstadoUno")
		println st.total
		//st.changeState("EstadoDOS")
		//println st.total
		TimeDuration dUno = TimeCategory.minus(new Date() + 1, new Date())
		println "DiffUno:" + dUno
		println "en milisegundo:" + dUno.toMilliseconds()
		render SUCCESS
	}
	
	
		
	// Para que la cocina pueda pedir el listado de las ordenes
	@Secured(['permitAll'])
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
	
	def getOrden(long idOrden) {
		Orden orden = Orden.findById(idOrden)
		if (! orden)
			throw new Exception("Orden inexistente")
		return orden
	}
	
	@Transactional(readOnly = false)
	@Secured(['permitAll'])
	def preparacion(long idOrden) {
		Orden orden = getOrden(idOrden)
		ordenService.marcarOrden(orden, OrdenStateEnPreparacion.EN_PREPARACION)
	
		/* TODO
		 * Notificar mozo
		 */
		
		orden.save(flush:true)
		render SUCCESS
	}
	
	
	@Transactional(readOnly = false)
	@Secured(['permitAll'])
	def terminado(long idOrden) {
		Orden orden = getOrden(idOrden)
		ordenService.marcarOrden(orden, OrdenStateTerminado.TERMINADO)
	
		/* TODO
		 * Notificar mozo
		 */
		
		orden.save(flush:true)
		render SUCCESS
	}
	
	
	@Transactional(readOnly = false)
	@Secured(['permitAll'])
	def entregado(long idOrden) {
		Orden orden = getOrden(idOrden)
		ordenService.marcarOrden(orden, OrdenStateEntregado.ENTREGADO)
	
		/* TODO
		 * Notificar cocina
		 */
		
		orden.save(flush:true)
		render SUCCESS
	}
	
	
	@Transactional(readOnly = false)
	@Secured(['permitAll'])
	def cancelado(long idOrden) {
		Orden orden = getOrden(idOrden)
		ordenService.marcarOrden(orden, OrdenStateCancelado.CANCELADO)
	
		/* TODO
		 * Notificar cocina
		 */
		
		orden.save(flush:true)
		render SUCCESS
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
