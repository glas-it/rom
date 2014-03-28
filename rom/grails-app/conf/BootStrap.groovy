import rom.seguridad.*

class BootStrap {

    def init = { servletContext ->
		def rolDuenio = new Rol(authority: 'DUENIO').save()
		def rolAdmin = new Rol(authority: 'ADMIN').save()
		def usuarioAdmin = new Usuario(username: 'admin', password: '12345678').save()
		def usuarioDuenio = new Usuario(username: 'dueniotest', password: 'dueniotest').save()
		UsuarioRol.create(usuarioDuenio, rolDuenio, true)
		UsuarioRol.create(usuarioAdmin, rolAdmin, true)
		
		assert Rol.count() == 2
		assert Usuario.count() == 2
		assert UsuarioRol.count() == 2
    }
    def destroy = {
    }
}
