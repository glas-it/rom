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
		Rubro rubro = new Rubro()
		rubro.nombre = "Entradas"
		rubro.orden = 1
		rubro.save()
		Subrubro subrubro = new Subrubro()
		subrubro.nombre = "Empanadas"
		subrubro.orden = 1
		subrubro.rubro = rubro
		subrubro.save()
		Consumicion consumicion = new Consumicion()
		consumicion.nombre = "Pollo"
		consumicion.descripcion = "Unidad"
		consumicion.precio = 9
		consumicion.subrubro = subrubro
		consumicion.save()
		Consumicion consumicion2 = new Consumicion()
		consumicion2.nombre = "Jamon y queso"
		consumicion2.descripcion = "Unidad"
		consumicion2.precio = 8
		consumicion2.subrubro = subrubro
		consumicion2.save()		
		Consumicion consumicion3 = new Consumicion()
		consumicion3.nombre = "Carne bien picante"
		consumicion3.descripcion = "Unidad"
		consumicion3.precio = 10
		consumicion3.subrubro = subrubro
		consumicion3.save()
		
    }
    def destroy = {
    }
}
