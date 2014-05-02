import rom.Exceptions.MesaConErroresException
import rom.seguridad.*
import grails.converters.JSON
import rom.*

class BootStrap {

	def duenioService
	
	def mozoService
	
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
		
		def mozo = new Mozo(nombre:"Juan", apellido:"Perez", numeroLegajo:4567, activo:true, 
			username:"fafafa")
		mozoService.crearMozo(mozo, duenio)
		
		Mesa mesa = null
		for (i in 1..5) {
			mesa = new Mesa()
			mesa.numero = i
			mesa.restaurant = duenio.restaurant
			mesa.activo = true
			mesa.capacidad = 4
			if (!mesa.validate()) {
				throw new MesaConErroresException("No se puede crear la mesa")
			}
			mesa.save()
		}
		
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
			res['precios'] = it.precio
			res['descripcion'] = it.descripcion
			res['activo'] = it.activo
			return res
		}
		
		JSON.registerObjectMarshaller(Consumicion) {
			def res = [:]
			res["class"] = "Consumicion"
			res['id'] = it.id
			res['nombre'] = it.nombre
			res['descripcion'] = it.descripcion
			res['activo'] = it.activo
			res['precios'] = it.precios
			return res
		}
		
		JSON.registerObjectMarshaller(Mozo) {
			def res = [:]
			res["class"] = "Mozo"
			res["id"] = it.id
			res["activo"] = it.activo
			res["apellido"] = it.apellido
			res["nombre"] = it.nombre
			res["numeroLegajo"] = it.numeroLegajo
			res["username"] = it.username
			return res
		}
		
		JSON.registerObjectMarshaller(Precio) {
			def res = [:]
			res["class"] = "Precio"
			res["id"] = it.id
			res["descripcion"] = it.descripcion
			res["valor"] = it.valor
			return res
		}
		
		JSON.registerObjectMarshaller(Orden) {
			def res = [:]
			res["class"] = "Orden"
			res["id"] = it.id
			res["consumible"] = it.consumible
			res["precio"] = it.precio
			res["estado"] = it.estado
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
		
		for (k in 1..40) {
			Consumicion c = new Consumicion(nombre: "Flan" + k.toString(), descripcion: "Descripcion" + k.toString(),
				subrubro: subrubroDos, activo: true)
			c.addToPrecios(new Precio(valor: 15.43, descripcion: "una cosa"))
			if (k % 2 == 0)
				c.addToPrecios(new Precio(valor: 88.62, descripcion: "sarasa magica"))
			c.save()
		}
		
		subrubroUno.save()
		subrubroDos.save()
    }
    def destroy = {
    }
}
