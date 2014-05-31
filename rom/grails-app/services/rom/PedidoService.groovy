package rom

import grails.transaction.Transactional;
import rom.Exceptions.BusinessException;
import rom.Exceptions.ServiceException;
import rom.PedidoStates.*

import java.text.SimpleDateFormat
import java.util.Calendar.*

import grails.converters.JSON

/**
 * PedidoService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class PedidoService {

	def agregarPromocion(idPromocion, idRestaurant, idMesa) {
		def promocion = Promocion.get(idPromocion)
		def mesa = Mesa.get(idMesa)
		def restaurant = Restaurant.get(idRestaurant)
		validarEntrada(promocion, mesa, restaurant)
		def pedido = Pedido.findByMesa(mesa)
		if (!pedido)
			throw new ServiceException("No existe ningún pedido asociado a la mesa")
		try {
			pedido.addPromocion(promocion)
		} catch(BusinessException e) {
			throw new ServiceException(e.message)
		}
		return pedido
	}

	private void validarEntrada(promocion, mesa, restaurant) {
		if (!promocion || !mesa)
			throw new ServiceException("No existe o la mesa o la promocion")
		if (!promocion.esValida())
			throw new ServiceException("La promoción no es válida")
		if (!mesa.abierta)
			throw new ServiceException("La mesa se encuentra cerrada")
		if (!mesa.activo)
			throw new ServiceException("La mesa se encuentra inactiva")
		if (mesa.restaurant.id != promocion.restaurant.id)
			throw new ServiceException("La mesa y la promocion pertenecen a distinto restaurant")
	}
	
	def getPedidoByMesaId(long idMesa) {
		Mesa mesa = Mesa.findById(idMesa)
		if (mesa == null) {
			throw new Exception("Mesa inexistente")
		}
		Pedido pedido = getPedidoByMesa(mesa)
		if (pedido == null) {
			throw new Exception("Mesa No ocupada")
		}
		return pedido
	}
	
	def getPedidoByMesa(Mesa unaMesa) {
		def criteria = Pedido.createCriteria()
		def result = criteria.list{
			and {
				or {
					eq("estado", new PedidoStateAbierto())
					eq("estado", new PedidoStateCerrado())
				}
				mesa {
					eq("id", unaMesa.id)
				}
				lock true
			}
		}
		if (result.size() > 0)
			return result[0]
		return null
	}

	def getAllEstados() {
		[new PedidoStateAbierto(),
		 new PedidoStateAnulado(),
		 new PedidoStateCerrado(),
		 new PedidoStatePagado()]
	}
	
	def filter(PedidoFilter filtro, Integer max, Integer offset) {
//		Date fecha = (filtro.fecha ? new SimpleDateFormat("yyyy-MM-dd").parse(filtro.fecha): new Date())
		def criteria = Pedido.createCriteria()
		def fechaDesde = null
		def fechaHasta = null
		if (filtro.fecha) {
			def calendar = Calendar.instance
			calendar.setTime(filtro.fecha.clearTime().clone())
			calendar.add(Calendar.DATE, -1)
			calendar.set(Calendar.HOUR, 23)
			calendar.set(Calendar.MINUTE, 59)
			calendar.set(Calendar.SECOND, 59)
			fechaDesde = calendar.getTime()
			println fechaDesde
			calendar.setTime(filtro.fecha.clearTime().clone())
			fechaHasta = calendar.add(Calendar.DATE, 1)
			fechaHasta = calendar.getTime()
			println fechaHasta
		}
		def result = criteria.list{
			if (filtro.fecha) {
				between("dateCreated", fechaDesde, fechaHasta)
			}
			if (max)
				maxResults(max)
			if (offset)
				firstResult(offset)
		}
		println result
		return filtro.estado ? result.findAll {it.estado.nombre.equals(filtro.estado.nombre) } : result
	}

	def getStateByName(String nombre) {
		if (nombre == null)
			return null
		getAllEstados().find {it.nombre == nombre}
	}

	def filterCount(PedidoFilter filtro) {
		def criteria = Pedido.createCriteria()
		def fechaDesde = null
		def fechaHasta = null
		if (filtro.fecha) {
			def calendar = Calendar.instance
			calendar.setTime(filtro.fecha.clearTime())
			calendar.add(Calendar.DATE, -1)
			calendar.set(Calendar.HOUR, 23)
			calendar.set(Calendar.MINUTE, 59)
			calendar.set(Calendar.SECOND, 59)
			fechaDesde = calendar.getTime()
			calendar.setTime(filtro.fecha.clearTime())
			fechaHasta = calendar.add(Calendar.DATE, 1)
		}
		return criteria.count{
			if (filtro.estado) {
				estado {
					eq("nombre", filtro.estado.nombre)
				}
			}
			if (filtro.fecha) {
				between("dateCreated", fechaDesde, fechaHasta)
			}
		}
	}
	
	private Date getUltimoDiaDelMes(Date fecha) {
		Calendar cal = Calendar.getInstance()
		cal.setTime(fecha)
		cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE))
		cal.set(Calendar.HOUR_OF_DAY,23);
		cal.set(Calendar.MINUTE,59);
		cal.set(Calendar.SECOND,59);
		return cal.getTime()
	}
	
	def getPedidosPagadosByFechas(Date desde, Date hasta) {
		
		hasta = getUltimoDiaDelMes(hasta)
		
		println "\n\nDESDE::: " + desde.toString() + " HASTA::: " + hasta.toString()
		
		def criteria = Pedido.createCriteria()
		return criteria.list{
			and {
				between ("fechaPago", desde.clearTime(), hasta)
				eq("estado", new PedidoStatePagado())
			}
			order("fechaPago", "asc")
		}
	}
	
	def parsearRespuesta(List pedidos, Date desde, Date hasta) {
		Calendar cal = Calendar.getInstance()
		def meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre" ,"Octubre","Noviembre","Diciembre"]
		def respuesta = []
		def mesAnterior = ""

		def diffMeses = (desde..hasta).collect { [ it[ Calendar.YEAR ], it[ Calendar.MONTH ] ] }
		                     .unique()
		                     .size()
        cal.setTime(desde)
        mesAnterior = meses[cal.get(Calendar.MONTH)]
		for(int i = 0; i < diffMeses; i++) {
			respuesta.add( [meses[(cal.get(Calendar.MONTH) + i) % 12], 0] )
		}
		println respuesta
		for (pedido in pedidos) {
			cal.setTime(pedido.fechaPago)
			int mesIndex = (desde..pedido.fechaPago).collect { [ it[ Calendar.YEAR ], it[ Calendar.MONTH ] ] }
			                     .unique()
			                     .size()
			respuesta[mesIndex - 1][1] += pedido.total()
		}
		return respuesta
	}
}
