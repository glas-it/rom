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
	def reporteProductos() {
		def rubrosYSubrubros = []
		for(rubro in Rubro.list()) {
			rubrosYSubrubros.add([nombre: rubro.nombre, id: rubro.orden + "-" + rubro.id])
			for(subrubro in rubro.subrubros) {
				rubrosYSubrubros.add([nombre: rubro.nombre + " - " + subrubro.nombre, id: rubro.orden + "-" + rubro.id + "-" + subrubro.id])
			}
		}
		render view: "reporteProductos", model:[rubrosYSubrubros: rubrosYSubrubros]
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
	def generarPdf() {
		def data = params.svg
		def fileStore = new File("reporte.svg")
		fileStore.createNewFile()
		FileUtils.writeStringToFile(fileStore, data)
		def proc = ["inkscape", "-f reporte.svg", "-A Reporte.pdf"].execute()
		proc.waitFor()
		response.setHeader("Content-disposition", "attachment; filename=Reporte.pdf")
		render(contentType: "application/pdf", text: "Reporte")
	}

	@Secured(['permitAll'])
	def getDatosReporteProductos() {
		Date desde = new Date(params.fechaInicio)
		Date hasta = new Date(params.fechaFin)
		int cantidadPlatos = params.cant_platos.toInteger()
		List subrubros = []
		for (subrubro in new JSONArray(params.subrubros)) {
			subrubros.push(Subrubro.get(subrubro.toInteger()))
		}
		def ordenes = ordenService.getOrdenesFacturadasBy(desde, hasta, subrubros)
		def respuesta = parsearRespuestaProductos(ordenes)
		if (respuesta.size() > 20)
			respuesta = respuesta[0..19]
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
