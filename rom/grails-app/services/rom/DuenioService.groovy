package rom

import rom.seguridad.Rol;
import rom.seguridad.Usuario;
import rom.seguridad.UsuarioRol;

/**
 * DuenioService
 * A service class encapsulates the core business logic of a Grails application
 */
class DuenioService {

	def crearDuenio(Duenio duenio) {
		duenio.accountExpired = false
		duenio.accountLocked = false 
		duenio.passwordExpired = false 
		duenio.restaurant = new Restaurant()
		duenio.save()
		Cocina cocina = new Cocina(
			username: "cocina",
			password: duenio.id.toString(),
			email: duenio.email,
			restaurant: duenio.restaurant,
			enabled: true,
			accountExpired: false,
			accountLocked: false,
			passwordExpired: false
		)
		cocina.save()
		UsuarioRol.create duenio as Usuario, Rol.findByAuthority('DUENIO')
		UsuarioRol.create cocina as Usuario, Rol.findByAuthority('COCINA')
	}
}