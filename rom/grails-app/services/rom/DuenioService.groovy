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
		duenio.restaurant.nombre = "FIUBA"
		duenio.restaurant.direccion = "Paséo Colón 850"
		duenio.restaurant.telefono = "4444-5555"
		duenio.restaurant.precioCubierto = 0
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
		Cocina barra = new Cocina(
			username: "barra",
			password: duenio.id.toString(),
			email: duenio.email,
			restaurant: duenio.restaurant,
			enabled: true,
			accountExpired: false,
			accountLocked: false,
			passwordExpired: false
		)
		barra.save()
		UsuarioRol.create duenio as Usuario, Rol.findByAuthority('DUENIO')
		UsuarioRol.create cocina as Usuario, Rol.findByAuthority('COCINA')
		UsuarioRol.create barra as Usuario, Rol.findByAuthority('COCINA')
	}
}