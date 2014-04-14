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
		def duenio = new Duenio(username: 'duenio', password:'duenio', email:'test@test.com')
		duenioService.crearDuenio(duenio)
		def mozo = new Mozo(username: "mozotest")
		mozo.restaurant = duenio.restaurant
		mozo.password = duenio.password
		mozo.accountExpired = false
		mozo.accountLocked = false
		mozo.passwordExpired = false
		mozo.enabled = true
		mozo.nombre = "mozotest"
		mozo.apellido = "mozotest"
		mozo.numeroLegajo = 123456
		mozo.activo = true;
		mozo.save()
		UsuarioRol.create(usuarioAdmin, rolAdmin)
		UsuarioRol.create(mozo, rolMozo)
		
		def lista = [];
		def rubroUno = new Rubro(orden: 1, nombre: "Entradas").save()
		lista.add(rubroUno)
		def rubroDos = new Rubro(orden: 2, nombre: "Postres").save()
		lista.add(rubroDos)
		def subrubroUno = new Subrubro(orden: 1, nombre: "Frias", rubro: rubroUno).save()
		lista.add(subrubroUno)
		def subrubroDos = new Subrubro(orden: 2, nombre: "Calientes", rubro: rubroUno).save()
		lista.add(subrubroDos)
		def subrubroTres = new Subrubro(orden: 1, nombre: "Con dulce", rubro: rubroDos).save()
		
		int i = 3;
		for (a in 'a'..'z') {
			lista.add(new Subrubro(orden: i, nombre: a, rubro: rubroDos).save())
			i++
		}
		
		def consuUno = new Consumicion(nombre: "Ensalada", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		lista.add(consuUno)
		def consuUnoD = new Consumicion(nombre: "Ensalada tomate", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		lista.add(consuUnoD)
		def consudos = new Consumicion(nombre: "Ensalada lechuga", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: false).save()
		lista.add(consudos)
		def consufaa = new Consumicion(nombre: "Ensalada huevo", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		lista.add(consufaa)
		def consuDos = new Consumicion(nombre: "Empanadas Carne", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroDos, activo: true).save()
		lista.add(consuDos)
		def consuTres = new Consumicion(nombre: "Empanadas Verdura", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		lista.add(consuTres)
		def consuTresa = new Consumicion(nombre: "Flan", descripcion: "Descripcion", precio: 14.5,
			subrubro: subrubroDos, activo: true).save()
		lista.add(consuTresa)
    }
    def destroy = {
    }
}
