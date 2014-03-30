import rom.seguridad.*

class BootStrap {

    def init = { servletContext ->
		def rolDuenio = new Rol(authority: 'DUENIO').save()
		def rolAdmin = new Rol(authority: 'ADMIN').save()
		def usuarioAdmin = new Usuario(username: 'admin', password: '12345678', email: 'email@email.com').save()
		def usuarioDuenio = new Usuario(username: 'dueniotest', password: 'dueniotest', email: 'email@email.com').save()
		UsuarioRol.create(usuarioDuenio, rolDuenio, true)
		UsuarioRol.create(usuarioAdmin, rolAdmin, true)
		
    }
    def destroy = {
    }
}
