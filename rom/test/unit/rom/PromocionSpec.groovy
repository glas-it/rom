
package rom


import java.text.SimpleDateFormat;

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Promocion)
class PromocionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

	void "Test promocion ya vencida no es valida"() {
		when: "la promocion esta dentro de su fecha de validez y tiene cupones disponibles"
			def p = new Promocion()
			def hoy = Date.parse('yyyy-MM',new Date().format("yyyy-MM"))
			p.fechaFin = hoy.clone()
			p.fechaFin.year = p.fechaFin.year - 1
			p.fechaInicio = hoy.clone()
			p.fechaInicio.year = p.fechaInicio.year - 2
			p.cantidadCupones = 10
		then: "la promocion es invalida"
			!p.esValida()
	}
	
	void "Test promocion todavia no se encuentra en vigencia"() {
		when: "la promocion todavia no esta dentro de su fecha de validez y tiene cupones disponibles"
			def p = new Promocion()
			def hoy = Date.parse('yyyy-MM',new Date().format("yyyy-MM"))
			p.fechaFin = hoy.clone()
			p.fechaFin.year = p.fechaFin.year + 2
			p.fechaInicio = hoy.clone()
			p.fechaInicio.year = p.fechaInicio.year + 1
			p.cantidadCupones = 10
		then: "la promocion es invalida"
			!p.esValida()
	}
	
	void "Test promocion sin cupones no es valida"() {
		when: "la promocion esta dentro de su fecha de validez y pero no tiene cupones disponibles"
			def p = new Promocion()
			def hoy = Date.parse('yyyy-MM',new Date().format("yyyy-MM"))
			p.fechaFin = hoy.clone()
			p.fechaFin.year = p.fechaFin.year + 2
			p.fechaInicio = hoy.clone()
			p.fechaInicio.year = p.fechaInicio.year - 1
			p.cantidadCupones = 0
		then: "la promocion es invalida"
			!p.esValida()
	}
		
    void "Test promocion con fechas aun vigentes y cupones disponibles es valido"() {
		when: "la promocion esta dentro de su fecha de validez y tiene cupones disponibles"
			def p = new Promocion()
			def hoy = Date.parse('yyyy-MM',new Date().format("yyyy-MM"))
			p.fechaFin = hoy.clone()
			p.fechaFin.year = p.fechaFin.year + 1
			p.fechaInicio = hoy.clone()
			p.fechaInicio.year = p.fechaInicio.year - 1
			p.cantidadCupones = 10
		then: "la promocion es valida"
			p.esValida()
		
		when: "la promocion tiene un periodo de validez de un solo mes y cupones disponibles"
			p = new Promocion()
			hoy = Date.parse('yyyy-MM',new Date().format("yyyy-MM"))
			p.fechaFin = hoy.clone()
			p.fechaInicio = hoy.clone()
			p.cantidadCupones = 10
		then: "la promocion es valida"
			p.esValida()
		when: "la promocion tiene un solo cupon y se encuentra en su fecha de validez"
			p = new Promocion()
			hoy = Date.parse('yyyy-MM',new Date().format("yyyy-MM"))
			p.fechaFin = hoy.clone()
			p.fechaInicio = hoy.clone()
			p.cantidadCupones = 1
		then:"la promocion es valida"
			p.esValida()
    }
}
