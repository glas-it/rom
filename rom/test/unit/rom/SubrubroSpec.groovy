package rom

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Subrubro)
class SubrubroSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test creacion"() {
		when:"Se crea un subrubro"
            Rubro r = new Rubro(nombre: "Entradas", orden: 1)
			int orden = 1
			String nombreSubrubro = "Frias"
			Subrubro s = new Subrubro(nombre: nombreSubrubro, orden: orden, rubro: r)
			
        then:"funciona bien"
			s != null
    }
	
	void "Test creacion con orden repetido"() {
		when:"Se crea dos subrubro con el mismo orden"
			Rubro r = new Rubro(nombre: "Entradas", orden: 1)
			int orden = 1
			String nombreSubrubroUno = "Frias"
			String nombreSubrubroDos = "Calientes"
			Subrubro s1 = new Subrubro(nombre: nombreSubrubroUno, orden: orden, rubro: r)
			Subrubro s2 = new Subrubro(nombre: nombreSubrubroDos, orden: orden, rubro: r)
			
		then:"funciona bien"
			s1 != null
			s2 == null
	}
}
