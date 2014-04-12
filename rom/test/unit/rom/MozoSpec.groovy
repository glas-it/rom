package rom

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Mozo)
@Mock(Restaurant)
class MozoSpec extends Specification {

	Mozo mozo
	
	Restaurant restaurant
	
    def setup() {
		restaurant = new Restaurant()
    }

    def cleanup() {
    }

    void "test correctness of validators"() {
		given: "the entity was properly set"
			mozo = new Mozo()
			mozo.restaurant = restaurant
			mozo.password = restaurant.id.toString()
			mozo.username = "mozotest"
			mozo.accountExpired = false
			mozo.accountLocked = false
			mozo.enabled = true
			mozo.passwordExpired = false
			mozo.apellido = "mozotest"
			mozo.nombre = "mozotest"
			mozo.activo = true
			mozo.numeroLegajo = 1234
		when: "the validations are triggered"
			mozo.validate()
		then: "there should be no errors"
			!mozo.hasErrors()
    }
}
