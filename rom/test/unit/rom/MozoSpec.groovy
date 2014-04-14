package rom

import grails.test.mixin.TestFor
import groovy.mock.interceptor.MockFor;
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Mozo)
@Mock(Restaurant)
class MozoSpec extends Specification {

	Mozo mozo
	
	Mozo replica
	
	Restaurant restaurant
	
    def setup() {
		restaurant = new Restaurant()
		mockDomain(Restaurant, [restaurant.save()])
    }

    def cleanup() {
    }

	void "test that a blank entity fails"() {
		given: "the entity has no attributes set"
			mozo = new Mozo()
		when: "the validations are triggered"
			mozo.validate()
		then: "the entity has errors"
			mozo.hasErrors()
	}
	
    void "test correctness of validators"() {
		given: "the entity was properly set"
			mozo = crearMozo()
		when: "the validations are triggered"
			mozo.validate()
		then: "there should be no errors"
			!mozo.hasErrors()
    }
	
	void "test does not allow duplicate numbers"() {
		given: "we create two duplicate entities"
			mozo = crearMozo()
			replica = crearMozo()
			mockDomain(Mozo, [replica.save()])			
		when: "the validations are triggered"
			mozo.validate()
		then: "it should have errors"
			mozo.hasErrors()
	}
	
	private Mozo crearMozo() {
		Mozo unMozo = new Mozo()
		unMozo.restaurant = restaurant
		unMozo.password = restaurant.id.toString()
		unMozo.username = "mozotest"
		unMozo.accountExpired = false
		unMozo.accountLocked = false
		unMozo.enabled = true
		unMozo.passwordExpired = false
		unMozo.apellido = "mozotest"
		unMozo.nombre = "mozotest"
		unMozo.activo = true
		unMozo.numeroLegajo = 1234
		return unMozo
	}
}
