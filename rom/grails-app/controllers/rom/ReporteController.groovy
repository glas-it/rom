package rom

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON

import org.codehaus.groovy.grails.web.json.*

import grails.plugin.springsecurity.annotation.Secured;

@Transactional(readOnly = true)
@Secured(["permitAll"])
class ReporteController {
	
	def pedidoService
	
	@Secured(['permitAll'])
	def reporteFacturacion() {
	}
	
	@Secured(['permitAll'])
	def reporteProductos() {
	}
	
	@Secured(['permitAll'])
	def getDatosReporteFacturacion() {
		Date desde = new Date(params.fechaInicio)
		Date hasta = new Date(params.fechaFin)
		
		def pedidos = pedidoService.getPedidosPagadosByFechas(desde, hasta)
		println "PEDIDOS::::::::" + pedidos
		def respuesta = pedidoService.parsearRespuesta(pedidos)
		println "RESPUESTA::::::" + respuesta
		
		//println "RESPUESTAJJJJJJOTASON::::::" + [respuesta] as JSON
		
		def foo = [["Ene",1],["Feb",2],["Mar",3]]
		
		render respuesta as JSON
	}
}
