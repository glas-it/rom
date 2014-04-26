package rom


import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional
import grails.converters.JSON


import grails.plugin.springsecurity.SpringSecurityService;
import grails.transaction.Transactional


/**
 * RestaurantController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured("hasRole('DUENIO')")
class RestaurantController {

	def springSecurityService
	
    static allowedMethods = [update: "PUT", imprime: "POST"]

	def index(Integer max) {
        /*params.max = Math.min(max ?: 10, 100)
        respond Restaurant.list(params), model:[restaurantInstanceCount: Restaurant.count()]*/
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
		redirect action:'show'
    }

    def show() {
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
		respond duenio.restaurant
    }
    
    def edit() {
		Duenio duenio = Duenio.findByUsername(springSecurityService.currentUser.username)
		respond duenio.restaurant
    }

	@Secured(['permitAll'])
	def getMenu() {
		try {
			/*ConsumicionController c = new ConsumicionController()
			c.getJSONList()
			render Rubro.list() as JSON*/
			render '[    {        "class": "rom.Rubro",        "id": 1,        "nombre": "Entradas",        "orden": 1,        "subrubros": [            {                "class": "rom.Subrubro",                "id": 3,                "agregados": [],                "consumiciones": [                    {                        "class": "rom.Consumicion",                        "id": 2,                        "descripCuatro": "Pollo",                        "descripDos": "Jamon y queso",                        "descripTres": "Verdura",                        "descripUno": "Carne",                        "descripcion": "pollo",                        "nombre": "Pollo",                        "precioCuatro": 9,                        "precioDos": 6,                        "precioTres": 7,                        "precioUno": 5,                        "precios": {                            "Unidad": 9,                            "null": null                        },                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    },                    {                        "class": "rom.Consumicion",                        "id": 2,                        "descripCuatro": "Pollo",                        "descripDos": "Jamon y queso",                        "descripTres": "Verdura",                        "descripUno": "Carne",                        "descripcion": "Carne",                        "nombre": "Carne",                        "precioCuatro": 9,                        "precioDos": 6,                        "precioTres": 7,                        "precioUno": 5,                        "precios": {                            "Unidad": 9,                            "null": null                        },                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    },                    {                        "class": "rom.Consumicion",                        "id": 2,                        "descripCuatro": "Pollo",                        "descripDos": "Jamon y queso",                        "descripTres": "Verdura",                        "descripUno": "Carne",                        "descripcion": "Verdura",                        "nombre": "Verdura",                        "precioCuatro": 9,                        "precioDos": 6,                        "precioTres": 7,                        "precioUno": 5,                        "precios": {                            "Unidad": 5,                            "null": null                        },                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    }                ],                "nombre": "Empanadas",                "rubro": {                    "_ref": "../..",                    "class": "rom.Rubro"                }            },            {                "class": "rom.Subrubro",                "id": 1,                "agregados": [],                "consumiciones": [                    {                        "class": "rom.Consumicion",                        "id": 7,                        "descripCuatro": null,                        "descripDos": "fsfdsfd",                        "descripTres": null,                        "descripUno": "vbnbvnbvn",                        "descripcion": "Ensalada con ...",                        "nombre": "Caesar",                        "precioCuatro": 0,                        "precioDos": 18,                        "precioTres": 0,                        "precioUno": 10,                        "precios": {                            "Para 1": 10,                            "Para 2": 18,                            "null": 0                        },                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    },                    {                        "class": "rom.Consumicion",                        "id": 8,                        "descripCuatro": null,                        "descripDos": "fsfdsfd",                        "descripTres": null,                        "descripUno": "vbnbvnbvn",                        "descripcion": "Ensalada con ...",                        "nombre": "Waldorff",                        "precioCuatro": 0,                        "precioDos": 18,                        "precioTres": 0,                        "precioUno": 10,                        "precios": {                            "Para 1": 10,                            "Para 2": 18,                            "null": 0                        },                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    }                ],                "nombre": "Ensaladas",                "rubro": {                    "_ref": "../..",                    "class": "rom.Rubro"                }            }        ]    },    {        "class": "rom.Rubro",        "id": 2,        "nombre": "Postres",        "orden": 2,        "subrubros": [            {                "class": "rom.Subrubro",                "id": 2,                "agregados": [                    {                        "class": "rom.Agregado",                        "id": 3,                        "descripcion": "Dulce de leche casero",                        "nombre": "Dulce de leche",                        "precio": 10.4,                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    }                ],                "consumiciones": [                    {                        "class": "rom.Consumicion",                        "id": 9,                        "descripCuatro": null,                        "descripDos": null,                        "descripTres": null,                        "descripUno": "qq3434 3434 34343 11wwrwr",                        "descripcion": "Torta de limon y merengue",                        "nombre": "Lemon pie",                        "precioCuatro": 0,                        "precioDos": 0,                        "precioTres": 0,                        "precioUno": 555.55,                        "precios": {                            "1 porcion": 30,                            "1/2 torta": 90,                            "1 torta": 160,                            "null": 0                        },                        "subrubro": {                            "_ref": "../..",                            "class": "rom.Subrubro"                        }                    }                ],                "nombre": "Con dulce",                "rubro": {                    "_ref": "../..",                    "class": "rom.Rubro"                }            }        ]    }]'
		} catch(Exception) {
			render "[]"
		}	
	}
	
	
	@Secured(['permitAll'])
	def mesas() {
		try {
			render Mesa.list() as JSON
		} catch(Exception) {
			render "[]"
		}
	}

	
    @Transactional
    def update(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view:'edit'
            return
        }

        restaurantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.id])
                redirect restaurantInstance
            }
            '*'{ respond restaurantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Restaurant restaurantInstance) {

        if (restaurantInstance == null) {
            notFound()
            return
        }

        restaurantInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Restaurant.label', default: 'Restaurant'), restaurantInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'restaurantInstance.label', default: 'Restaurant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
