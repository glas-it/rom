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
			ConsumicionController c = new ConsumicionController()
			c.getJSONList()
			render Rubro.list() as JSON
		} catch(Exception) {
			render "[]"
		}	
	}
	
	
	@Secured(['permitAll'])
	def getMesas() {
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
