package rom

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import org.codehaus.groovy.grails.web.json.*

@Transactional(readOnly = true)
@Secured(["permitAll"])
class ReporteController {

	def pedidoService
	def ordenService

	@Secured(['permitAll'])
	def reporteFacturacion() {
	}

	@Secured(['permitAll'])
	def getDatosReporteFacturacion() {
		Date desde = new Date(params.fechaInicio)
		Date hasta = new Date(params.fechaFin)
		def pedidos = pedidoService.getPedidosPagadosByFechas(desde, hasta)
		def respuesta = pedidoService.parsearRespuesta(pedidos, desde, hasta)
		render respuesta as JSON
	}

	@Secured(['permitAll'])
	def reporteProductos() {
	}

	@Secured(['permitAll'])
	def getDatosReporteProductos() {
		Date desde = new Date(params.fechaInicio)
		Date hasta = new Date(params.fechaFin)
		def listaSubrubros = [Subrubro.get(1),Subrubro.get(4)] // Subrubros de prueba de subrubros
		def ordenes = ordenService.getOrdenesFacturadasBy(desde, hasta, listaSubrubros)
		def respuesta = parsearRespuestaProductos(ordenes)
		render respuesta as JSON
	}

	def parsearRespuestaProductos(List ordenes) {
		def ventas = getVentasConsumibles(ordenes)
		def respuesta = []
		for (elem in ventas)
			respuesta.add([elem.key, elem.value])
		return respuesta.sort{ it[1] }.reverse()
	}

	def getVentasConsumibles(List ordenes) {
		def res = [:]
		for (orden in ordenes) {
			if (! orden.entregado()) continue
			if (res[orden.consumible.nombre])
				res[orden.consumible.nombre] += 1
			else
				res[orden.consumible.nombre] = 1
		}
		return res
	}
}
