package rom

import grails.converters.XML;
import rom.Exceptions.MozoConErroresException;
import rom.seguridad.Rol;
import rom.seguridad.Usuario;
import rom.seguridad.UsuarioRol;

/**
 * MozoService
 * A service class encapsulates the core business logic of a Grails application
 */
class MozoService {

    def crearMozo(Mozo mozo, Duenio duenio) {
		mozo.accountExpired = false
		mozo.accountLocked = false
		mozo.passwordExpired = false
		mozo.restaurant = duenio.restaurant //Restaurant.find()
		mozo.password = mozo.restaurant.id.toString()
		if (mozo.hasErrors()) {
			throw new MozoConErroresException()
		}
		mozo.save()
		UsuarioRol.create mozo as Usuario, Rol.findByAuthority('COCINA')
    }
	
	def findAllByRestaurant(Restaurant restaurant) {
		return Mozo.findAllByRestaurant(restaurant)
	}
}
