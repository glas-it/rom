package rom


import static org.springframework.http.HttpStatus.*
import rom.Exceptions.MesaConErroresException;
import grails.converters.XML;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * MesaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class MesaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

	def mesaService

	def springSecurityService

	def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        //respond Mesa.list(params), model:[mesaInstanceCount: Mesa.count()]
		redirect action: "list"
    }

	def list(Integer max) {
        // params.max = Math.min(max ?: 10, 100)
		// def duenio = Duenio.get(springSecurityService.currentUser.id)
		// def listaMesas = mesaService.getMesas(duenio.restaurant, params)
        params.max = Math.min(max ?: 10, 100)
        def listaMesas = MesaUnitaria.list(params)
		[mesaInstanceList: listaMesas, mesaInstanceCount: listaMesas?.size()]
    }

	@Secured("hasRole('DUENIO')")
    def show(Mesa mesaInstance) {
        [mesaInstance: mesaInstance]
    }

    def create() {
		def command = new MesaCreacionCommand()
		if (params.mesaDesde)
			command.mesaDesde = params.mesaDesde
		if (params.mesaHasta)
			command.mesaHasta = params.mesaHasta
		if (params.activo)
			command.activo = params.activo
		if (params.capacidad)
			command.capacidad = params.capacidad
        respond command
    }

    @Transactional
    def save(MesaCreacionCommand command) {
        if (command == null) {
            notFound()
            return
        }

        if (command.hasErrors()) {
            respond command.errors, view:'create'
            return
        }
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
        try {
			mesaService.crearSegunCommand(command, duenio.restaurant)
        } catch(MesaConErroresException) {
			flash.message = "Las mesas ${command.mesaDesde} a ${command.mesaHasta} no se han podido crear. Verifique que no existan otras mesas con dicho número"
			respond command, view:'create'
			return
		}
		request.withFormat {
            form {
                flash.message = "Las mesas ${command.mesaDesde} a ${command.mesaHasta} han sido creadas satisfactoriamente"//message(code: 'default.created.message', args: [message(code: 'mesaInstance.label', default: 'Mesa'), mesaInstance.id])
				respond command, view: "create"
            }
            '*' { respond command, [status: CREATED] }
        }
    }

    def edit(Mesa mesaInstance) {
		if (!mesaInstance) {
			flash.errorMessage("La mesa no existe")
			redirect action:'list'
			return
		}
        [mesaInstance: mesaInstance]
    }

    @Transactional
    def update(Mesa mesaInstance) {
        if (mesaInstance == null) {
            notFound()
            return
        }

        if (mesaInstance.hasErrors()) {
            render view:'edit', model:[mesaInstance: mesaInstance]
            return
        }

        mesaInstance.save flush:true, failOnError: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mesa.label', default: 'Mesa'), mesaInstance.id])
                redirect action:'show', params:[id: mesaInstance.id]
            }
            '*'{ respond mesaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mesa mesaInstance) {

        if (mesaInstance == null) {
            flash.errorMessage = "La mesa no existe"
            redirect action: 'list'
            return
        }

        if (mesaInstance.abierta) {
            flash.errorMessage = "La mesa se encuentra abierta por lo que no puede eliminarse"
            redirect action: 'list'
        }
        mesaInstance.delete flush:true

        redirect action: 'list'
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.errorMessage = message(code: 'default.not.found.message', args: [message(code: 'mesaInstance.label', default: 'Mesa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

class MesaCreacionCommand {
	int mesaDesde
	int mesaHasta
	int capacidad
	boolean activo

	static constraints = {
		mesaHasta range: 1..999
		mesaDesde min: 1, validator: {val, obj ->
			MesaCreacionCommand cmd = obj as MesaCreacionCommand
			return val <= cmd.mesaHasta
		}
		capacidad range: 1..99
	}
}
