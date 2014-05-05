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
		mozo.enabled = true
		mozo.restaurant = duenio.restaurant
		mozo.password = mozo.restaurant.id.toString()
		if (!mozo.save()) {
			throw new MozoConErroresException()
		}
		UsuarioRol.create mozo as Usuario, Rol.findByAuthority('MOZO')
    }
	
	def findAllByRestaurant(Restaurant restaurant) {
		return Mozo.findAllByRestaurant(restaurant)
	}
}
