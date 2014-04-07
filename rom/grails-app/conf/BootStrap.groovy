import rom.seguridad.*
import rom.*

class BootStrap {

	def duenioService
	
    def init = { servletContext ->
		def rolDuenio = new Rol(authority: 'DUENIO').save()
		def rolAdmin = new Rol(authority: 'ADMIN').save()
		def rolCocina = new Rol(authority: 'COCINA').save()
		def rolMozo = new Rol(authority: 'MOZO').save()
		def usuarioAdmin = new Usuario(username: 'admin', password: '12345678').save()
		def duenio = new Duenio(username: 'dueniotest', password:'asdfasdf', email:'test@test.com')
		duenioService.crearDuenio(duenio)
		def mozo = new Mozo(username: "mozotest")
		mozo.restaurant = duenio.restaurant
		mozo.password = duenio.password
		mozo.accountExpired = false
		mozo.accountLocked = false
		mozo.passwordExpired = false
		mozo.enabled = true
		mozo.save()
		UsuarioRol.create(usuarioAdmin, rolAdmin)
		UsuarioRol.create(mozo, rolMozo)
    }
    def destroy = {
    }
}
