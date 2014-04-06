package rom

import grails.test.mixin.TestFor
import spock.lang.Specification
import sun.security.krb5.internal.ccache.CCacheInputStream;
import grails.converters.JSON

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Consumicion)
class ConsumicionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test metodo de conversion de cadena"() {
		when: "Creo una consumicion"
			Consumicion c = new Consumicion();
			c.descripUno = "Uno"
			c.precioUno = 10.0
			c.descripDos = "Dos"
			c.precioDos = 20.0
			c.descripTres = "Tres"
			c.precioTres = 30.0
			c.descripCuatro = "Cuatro"
			c.precioCuatro = 40.0
			c.setPreciosList()
		then: "Precio matchea"
			(c.precios as JSON) == ('{"Uno": 10.0, "Dos": 20.0, "Tres": 30.0, "Cuatro": 40.0}')
    }
}
