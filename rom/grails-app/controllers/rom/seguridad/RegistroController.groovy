package rom.seguridad

import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional;

/**
 * RegistroUsuarioController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured('permitAll')
class RegistroController {
	
	static allowedMethods = [registrar: ["POST","PUT", "GET"]]
	
	@Transactional
	def registrar() {
		def user = new Usuario()
		user.username = params.username
		user.password = params.password
		user.email = params.email
		user.accountExpired = false
		user.accountLocked = false
		user.enabled = true
		if (user.save(flush: true)) {
			UsuarioRol.create(user, Rol.getByAuthority('ADMIN'), true)
			flash.message('you have successfully registered, proceed to log in')
			log.info "por redireccionar a login"
			redirect controller: "login", action: "auth"
		} else {
			render "todo mal wacho"
		}
	}
}
