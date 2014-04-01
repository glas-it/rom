package rom


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * RestaurantController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured('permitAll')
class RestaurantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Restaurant.list(params), model:[restaurantInstanceCount: Restaurant.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Restaurant.list(params), model:[restaurantInstanceCount: Restaurant.count()]
    }

    def show(Restaurant restaurantInstance) {
        respond restaurantInstance
    }

    def create() {
        respond new Restaurant(params)
    }

    @Transactional
    def save(Restaurant restaurantInstance) {
        if (restaurantInstance == null) {
            notFound()
            return
        }

        if (restaurantInstance.hasErrors()) {
            respond restaurantInstance.errors, view:'create'
            return
        }

        restaurantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'restaurantInstance.label', default: 'Restaurant'), restaurantInstance.id])
                redirect restaurantInstance
            }
            '*' { respond restaurantInstance, [status: CREATED] }
        }
    }

    def edit(Restaurant restaurantInstance) {
        respond restaurantInstance
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
