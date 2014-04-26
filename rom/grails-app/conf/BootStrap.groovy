import rom.seguridad.*
import grails.converters.JSON
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
		/*def mozo = new Mozo(username: "test", numeroLegajo: 123456)
		mozo.restaurant = duenio.restaurant
		mozo.password = duenio.restaurant.id
		mozo.accountExpired = false
		mozo.accountLocked = false
		mozo.passwordExpired = false
		mozo.enabled = true
		mozo.username = "mozotest"
		mozo.nombre = "mozotest"
		mozo.apellido = "mozotest"
		mozo.activo = true;
		mozo.save()*/
		UsuarioRol.create(usuarioAdmin, rolAdmin)
		//UsuarioRol.create(mozo, rolMozo)
		
		JSON.registerObjectMarshaller(Mesa) {
			def res = [:]
			res["class"] = "Mesa"
			res['id'] = it.id
			res['abierta'] = it.abierta
			res['activo'] = it.activo
			res['capacidad'] = it.capacidad
			res['numero'] = it.numero
			return res
		}
		
		
		JSON.registerObjectMarshaller(Rubro) {
			def res = [:]
			res["class"] = "Rubro"
			res['id'] = it.id
			res['nombre'] = it.nombre
			res['orden'] = it.orden
			res['subrubros'] = it.subrubros
			return res
		}
		
		JSON.registerObjectMarshaller(Subrubro) {
			def res = [:]
			res["class"] = "Subrubro"
			res['id'] = it.id
			res['nombre'] = it.nombre
			res['orden'] = it.orden
			res['agregados'] = it.agregados
			res['consumiciones'] = it.consumiciones
			return res
		}
		
		JSON.registerObjectMarshaller(Agregado) {
			def res = [:]
			res["class"] = "Agregado"
			res['id'] = it.id
			res['nombre'] = it.nombre
			res['precio'] = it.precio
			res['descripcion'] = it.descripcion
			res['activo'] = it.activo
			return res
		}
		
		JSON.registerObjectMarshaller(Consumicion) {
			def res = [:]
			res["class"] = "Consumicion"
			res['id'] = it.id
			res['nombre'] = it.nombre
			//res['precio'] = it.precio
			//res['descripcion'] = it.descripcion
			res['activo'] = it.activo
			def precios = [:]
			precios[it.descripcion.toString()] = it.precio
			if (it.descripDos != null && ! it.descripDos.isAllWhitespace())
				precios[it.descripDos.toString()] = it.precioDos
			if (it.descripTres != null && ! it.descripTres.isAllWhitespace())
				precios[it.descripTres.toString()] = it.precioTres
			if (it.descripCuatro != null && ! it.descripCuatro.isAllWhitespace())
				precios[it.descripCuatro.toString()] = it.precioCuatro
			res['precios'] = precios
			return res
		}
		
		
		
		def rubroUno = new Rubro(orden: 1, nombre: "Entradas").save()
		def rubroDos = new Rubro(orden: 2, nombre: "Postres").save()
		def subrubroUno = new Subrubro(orden: 1, nombre: "Frias", rubro: rubroUno).save()
		def subrubroDos = new Subrubro(orden: 2, nombre: "Calientes", rubro: rubroUno).save()
		def subrubroTres = new Subrubro(orden: 1, nombre: "Con dulce", rubro: rubroDos).save()
		
		int i = 3;
		for (a in 'a'..'f') {
			new Subrubro(orden: i, nombre: a, rubro: rubroDos).save()
			i++
		}
		new Agregado(nombre: "Ensalada", descripcion: "UNa Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		
		new Consumicion(nombre: "Ensaladadsasda", descripcion: "Una Descripcion", precio: 14.5,
			descripDos: "sarasa", precioDos: 55.4, subrubro: subrubroUno, activo: true).save()
		
		new Consumicion(nombre: "Ensaladaadsd", descripcion: "Una Descripcion", precio: 14.5,
				descripDos: "sarasa", precioDos: 55.4, descripTres: "sadasdrasa", precioTres: 5.4,
				subrubro: subrubroUno, activo: true).save()
		
		new Consumicion(nombre: "Ensaaaaaaladaadsd", descripcion: "Una Descripcion", precio: 14.5,
			descripDos: "saradasa", precioDos: 55.4, descripTres: "sadasdcdcrasa", precioTres: 5.4,
			descripCuatro: "saradaaaaadsdsdssa", precioCuatro: 55.44, subrubro: subrubroUno, activo: true).save()
			
		def consuUno = new Consumicion(nombre: "Ensalada", descripcion: "Una Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		def consuUnoD = new Consumicion(nombre: "Ensalada tomate", descripcion: "asd Descripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		def consudos = new Consumicion(nombre: "Ensalada lechuga", descripcion: "fsdfdsDescripcion", precio: 14.5,
			subrubro: subrubroUno, activo: false).save()
		def consufaa = new Consumicion(nombre: "Ensalada huevo", descripcion: "Deqqqqqscripcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		def consuDos = new Consumicion(nombre: "Empanadas Carne", descripcion: "Descreeeeipcion", precio: 14.5,
			subrubro: subrubroDos, activo: true).save()
		def consuTres = new Consumicion(nombre: "Empanadas Verdura", descripcion: "Descrirrrrrpcion", precio: 14.5,
			subrubro: subrubroUno, activo: true).save()
		def consuTresa = new Consumicion(nombre: "Flan", descripcion: "Descripcqqqion", precio: 14.5,
			subrubro: subrubroDos, activo: true).save()
		new Consumicion(nombre: "afafa", descripcion: "Descripcggggion", precio: 14.5,
			subrubro: subrubroDos, activo: true).save()
		for (k in 1..40) {
			new Consumicion(nombre: "Flan" + k.toString(), descripcion: "Descripcion" + k.toString(), precio: 14.5,
				subrubro: subrubroDos, activo: true).save()
		}
		subrubroUno.save()
		subrubroDos.save()
    }
    def destroy = {
    }
}
