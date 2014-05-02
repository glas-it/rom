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
		def mozo = new Mozo(username: "asd", nombre: "Juan", apellido: "Perez", numeroLegajo: 123456)
		mozo.accountExpired = false
		mozo.accountLocked = false
		mozo.passwordExpired = false
		mozo.activo = true
		mozo.restaurant = duenio.restaurant
		mozo.password = duenio.restaurant.id
		mozo.save()

		UsuarioRol.create(usuarioAdmin, rolAdmin)
		UsuarioRol.create(mozo, rolMozo)
		
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

		JSON.registerObjectMarshaller(Agregado) {
			def res = [:]
			res["class"] = "Agregado"
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
		// ENTRADA
		def entrada = new Rubro(orden: 1, nombre: "Entradas").save()
//		{
			def frias = new Subrubro(orden: 1, nombre: "Frias", rubro: entrada).save()
//			{
				Consumicion langostinos = new Consumicion(nombre: "Langostinos", descripcion: "Plato de langostinos", subrubro: frias, activo: true)
				langostinos.addToPrecios(new Precio(valor: 30.0, descripcion: "-"))
				langostinos.save()
				Consumicion tomates = new Consumicion(nombre: "Tomates Rellenos", descripcion: "Plato de tomates rellenos", subrubro: frias, activo: true)
				tomates.addToPrecios(new Precio(valor: 22.0, descripcion: "-"))
				tomates.save()
				Consumicion mayonesa = new Consumicion(nombre: "Mayonesa de ave o atún", descripcion: "Ensalada", subrubro: frias, activo: true)
				mayonesa.addToPrecios(new Precio(valor: 20.0, descripcion: "-"))
				mayonesa.save()
//			}
			def calientes = new Subrubro(orden: 2, nombre: "Calientes", rubro: entrada).save()
//			{
				Consumicion empanadas = new Consumicion(nombre: "Empanadas", descripcion: "Empanadas fritas", subrubro: calientes, activo: true)
				empanadas.addToPrecios(new Precio(valor: 10.0, descripcion: "Carne"))
				empanadas.addToPrecios(new Precio(valor: 10.0, descripcion: "Pollo"))
				empanadas.addToPrecios(new Precio(valor: 10.0, descripcion: "Jamón y Queso"))
				empanadas.save()
				Consumicion rabas = new Consumicion(nombre: "Rabas", descripcion: "Porcion de rabas", subrubro: calientes, activo: true)
				rabas.addToPrecios(new Precio(valor: 22.0, descripcion: "-"))
				rabas.save()
				Consumicion provoletas = new Consumicion(nombre: "Provoleta", descripcion: "Provoletas", subrubro: calientes, activo: true)
				provoletas.addToPrecios(new Precio(valor: 20.0, descripcion: "-"))
				provoletas.save()
//			}
//		}
		//PARRILLA
		def principal = new Rubro(orden: 2, nombre: "Principal").save()
//		{
			def parilla = new Subrubro(orden: 1, nombre: "Parrilla", rubro: principal).save()
//			{
				Consumicion tiraDeAsado = new Consumicion(nombre: "Tira de asado", descripcion: "Tira de asado a la parrilla", subrubro: parilla, activo: true)
				tiraDeAsado.addToPrecios(new Precio(valor: 55.0, descripcion: "-"))
				tiraDeAsado.save()
				Consumicion bifeCostilla = new Consumicion(nombre: "Bife de costilla", descripcion: "Bife de costilla a la parrilla", subrubro: parilla, activo: true)
				bifeCostilla.addToPrecios(new Precio(valor: 45.0, descripcion: "-"))
				bifeCostilla.save()
				Consumicion chorizo = new Consumicion(nombre: "Chorizo", descripcion: "Chorizo a la parrilla", subrubro: parilla, activo: true)
				chorizo.addToPrecios(new Precio(valor: 17.0, descripcion: "-"))
				chorizo.save()
				Consumicion morcilla = new Consumicion(nombre: "Mocilla", descripcion: "Morcilla a la parrilla", subrubro: parilla, activo: true)
				morcilla.addToPrecios(new Precio(valor: 17.0, descripcion: "-"))
				morcilla.save()
				Consumicion pollo = new Consumicion(nombre: "Pollo", descripcion: "Pollo a la parrilla", subrubro: parilla, activo: true)
				pollo.addToPrecios(new Precio(valor: 40.0, descripcion: "1/4"))
				pollo.addToPrecios(new Precio(valor: 70.0, descripcion: "1/2"))
				pollo.save()
//			}
			def pastas = new Subrubro(orden: 2, nombre: "Pastas", rubro: principal).save()
//			{
				Consumicion tallarines = new Consumicion(nombre: "Tallarines", descripcion: "Fideos caseros", subrubro: pastas, activo: true)
				tallarines.addToPrecios(new Precio(valor: 29.0, descripcion: "-"))
				tallarines.save()
				Consumicion ravioles = new Consumicion(nombre: "Ravioles", descripcion: "Ravioles de ricota y verdura", subrubro: pastas, activo: true)
				ravioles.addToPrecios(new Precio(valor: 32.0, descripcion: "-"))
				ravioles.save()
				Consumicion sorrentinos = new Consumicion(nombre: "Sorrentinos", descripcion: "Sorrentinos de jamón y queso", subrubro: pastas, activo: true)
				sorrentinos.addToPrecios(new Precio(valor: 40.0, descripcion: "-"))
				sorrentinos.save()
				Agregado bolognesa = new Agregado(nombre: "Salsa Bolognesa", descripcion: "Salsa de tomate y carne", subrubro: pastas, activo: true)
				bolognesa.addToPrecios(new Precio(valor: 15.0, descripcion: "-"))
				bolognesa.save()
				Agregado cuatroQuesos = new Agregado(nombre: "Salsa cuatro quesos", descripcion: "Salsa con 4 quesos", subrubro: pastas, activo: true)
				cuatroQuesos.addToPrecios(new Precio(valor: 15.0, descripcion: "-"))
				cuatroQuesos.save()
				Agregado granCarusso = new Agregado(nombre: "Gran Carusso", descripcion: "Salsa con crema", subrubro: pastas, activo: true)
				granCarusso.addToPrecios(new Precio(valor: 15.0, descripcion: "-"))
				granCarusso.save()
//			}
//		}
		//BEBIDAS
		def bebidas = new Rubro(orden: 3, nombre: "Bebidas").save()
//		{
			def sinAlcohol = new Subrubro(orden: 1, nombre: "Sin Alcohol", rubro: bebidas).save()
//			{
				Consumicion gaseosa = new Consumicion(nombre: "Gaseosa", descripcion: "Línea Coca", subrubro: sinAlcohol, activo: true)
				gaseosa.addToPrecios(new Precio(valor: 15.0, descripcion: "Jarra (750 cc.)"))
				gaseosa.addToPrecios(new Precio(valor: 10.0, descripcion: "Vaso (250 cc.)"))
				gaseosa.save()
				Consumicion aguaMineral = new Consumicion(nombre: "Agua Mineral", descripcion: "Villa del Sur", subrubro: sinAlcohol, activo: true)
				aguaMineral.addToPrecios(new Precio(valor: 8.0, descripcion: "Sin Gas"))
				aguaMineral.addToPrecios(new Precio(valor: 8.0, descripcion: "Con Gas"))
				aguaMineral.save()
//			}
			def vinos = new Subrubro(orden: 2, nombre: "Vinos", rubro: bebidas).save()
//			{
				Consumicion vino1 = new Consumicion(nombre: "Don Valentín Lacrado", descripcion: "Botella", subrubro: vinos, activo: true)
				vino1.addToPrecios(new Precio(valor: 55.0, descripcion: "-"))
				vino1.save()
				Consumicion vino2 = new Consumicion(nombre: "Valmont", descripcion: "Botella", subrubro: vinos, activo: true)
				vino2.addToPrecios(new Precio(valor: 45.0, descripcion: "-"))
				vino2.save()
				Consumicion vino3 = new Consumicion(nombre: "Latitud 33", descripcion: "Botella", subrubro: vinos, activo: true)
				vino3.addToPrecios(new Precio(valor: 47.0, descripcion: "-"))
				vino3.save()
//			}
//		}
		//POSTRES
		def postres = new Rubro(orden: 4, nombre: "Postres").save()
//		{
			def tortas = new Subrubro(orden: 1, nombre: "Tortas", rubro: postres).save()
//			{
				Consumicion lemonPie = new Consumicion(nombre: "Lemon pie", descripcion: "Torta de limón y merengue", subrubro: tortas, activo: true)
				lemonPie.addToPrecios(new Precio(valor: 15.0, descripcion: "1 Porcion"))
				lemonPie.addToPrecios(new Precio(valor: 45.0, descripcion: "Entera"))
				lemonPie.save()
				Consumicion selvaNegra = new Consumicion(nombre: "Selva Negra", descripcion: "Torta de chocolate", subrubro: tortas, activo: true)
				selvaNegra.addToPrecios(new Precio(valor: 15.0, descripcion: "Porcion"))
				selvaNegra.addToPrecios(new Precio(valor: 45.0, descripcion: "Entera"))
				selvaNegra.save()
//			}
			def helados = new Subrubro(orden: 2, nombre: "Helados", rubro: postres).save()
//			{
				Consumicion bochas = new Consumicion(nombre: "Bochas", descripcion: "Helado a gusto", subrubro: helados, activo: true)
				bochas.addToPrecios(new Precio(valor: 10.0, descripcion: "1"))
				bochas.addToPrecios(new Precio(valor: 17.0, descripcion: "2"))
				bochas.addToPrecios(new Precio(valor: 25.0, descripcion: "3"))
				bochas.save()
				Consumicion almendrado = new Consumicion(nombre: "Almendrado", descripcion: "Helado de americana cubierto por almendras", subrubro: helados, activo: true)
				almendrado.addToPrecios(new Precio(valor: 15.0, descripcion: "1 Porcion"))
				almendrado.save()
//			}
//		}
    }
    def destroy = {
    }
}
