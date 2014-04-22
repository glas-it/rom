package rom.seguridad

import rom.Mozo;
import rom.Restaurant;
import grails.converters.JSON;
import grails.plugin.springsecurity.annotation.Secured;

/**
 * AutenticacionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['permitAll'])
class AutenticacionController {

	static allowedMethods = [index: "GET"]
	
	def index() {
		try {
		def username = params.username
		def restaurant = Restaurant.get(params.idRestaurant)
		def mozo = Mozo.findByUsernameAndRestaurant(username, restaurant)
		def output = "{\"success\": " +
			( mozo != null && mozo.activo? "true" : "false") + ", "
		output += "\"nombre\": " + (mozo != null && mozo.activo)? mozo.nombre : "" + "}"
		render output
		} catch(Exception) {
		render "{\"success\": true}"		
		}
	}
}
