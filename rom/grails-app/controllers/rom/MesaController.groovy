package rom


import static org.springframework.http.HttpStatus.*
import rom.Exceptions.MesaConErroresException;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * MesaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class MesaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", abrirMesa: "POST",
		cerrarMesa: "POST"]

	def mesaService
	
	def springSecurityService
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def abrirMesa(long idMesa, long idMozo) {
		Mesa mesa = Mesa.findById(idMesa)
		if (mesa == null || ! mesa.activo || mesa.abierta) {
			render "ERROR: No se puede procesa mesa"
			return
		}
		
		
		Mozo mozo = Mozo.findById(idMozo);
		if (mozo == null) {
			render "ERROR: mozo inexistente"
			return
		}
		
		MesaOcupada mesaOcupada = new MesaOcupada()
		mesaOcupada.setMesa(mesa)
		mesaOcupada.setMozo(mozo)
		mesaOcupada.ocupar()
		mesaOcupada.save()
		
		render "Mesa:" + mesa.toString() + " mozo:" + mozo.toString()
	}
	
	
	@Secured(['permitAll'])
	@Transactional(readOnly = false)
	def cerrarMesa(long idMesa) {
		Mesa mesa = Mesa.findById(idMesa)
		if (mesa == null) {
			render "ERROR: mesa inexistente"
			return
		}
		MesaOcupada mesaOcupada = mesaService.getMesaOcupada(mesa)
		if (mesaOcupada == null) {
			render "ERROR: mesa no ocupada"
			return
		}
		mesaOcupada.desocupar()
		mesaOcupada.save()
		render idMesa.toString();
	}
	
	def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        //respond Mesa.list(params), model:[mesaInstanceCount: Mesa.count()]
		redirect action: "list"
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Mesa.list(params), model:[mesaInstanceCount: Mesa.count()]
    }
	
    def show(Mesa mesaInstance) {
        respond mesaInstance
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
				respond view: "create", command
            }
            '*' { respond command, [status: CREATED] }
        }
    }

    def edit(Mesa mesaInstance) {
        respond mesaInstance
    }

    @Transactional
    def update(Mesa mesaInstance) {
        if (mesaInstance == null) {
            notFound()
            return
        }

        if (mesaInstance.hasErrors()) {
            respond mesaInstance.errors, view:'edit'
            return
        }

        mesaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mesa.label', default: 'Mesa'), mesaInstance.id])
                redirect mesaInstance
            }
            '*'{ respond mesaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mesa mesaInstance) {

        if (mesaInstance == null) {
            notFound()
            return
        }

        mesaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mesa.label', default: 'Mesa'), mesaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mesaInstance.label', default: 'Mesa'), params.id])
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
		mesaHasta range: 0..999
		mesaDesde min: 0, validator: {val, obj ->
			MesaCreacionCommand cmd = obj as MesaCreacionCommand
			return val <= cmd.mesaHasta
		}
		capacidad range: 1..99 
	}
}
