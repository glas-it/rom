package rom

import grails.transaction.Transactional;
import rom.Exceptions.BusinessException;
import rom.Exceptions.ServiceException;
import rom.PedidoStates.*

import java.text.SimpleDateFormat

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
		pedido.save(failOnError:true)
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
			}
		}
		if (result.size() > 0)
			return result[0]
		return null
	}

	def filter(PedidoFilter filtro, Integer max, Integer offset) {
		//println filtro.fecha
//		Date fecha = (filtro.fecha ? new SimpleDateFormat("yyyy-MM-dd").parse(filtro.fecha): new Date())
		Date fecha = new Date()
		Date diaAntes = fecha.clearTime() - 1
		Date diaDespues = fecha.clearTime() + 1

		def criteria = Pedido.createCriteria()
		def result = criteria.list{
			if (filtro.estadoNombre && ! filtro.estadoNombre.isAllWhitespace()) {
				eq("estado", filtro.estadoNombre)
			}
			//if (filtro.fecha) {
				between("dateCreated", diaAntes, diaDespues)
			//}

			maxResults(max)
			firstResult(offset)
		}
	}


	def filterCount(PedidoFilter filtro) {
		def criteria = Pedido.createCriteria()
		return criteria.count{
			if (filtro.estadoNombre && ! filtro.estadoNombre.isAllWhitespace()) {
				estado {
					eq("nombre", filtro.estadoNombre)
				}
			}
			if (filtro.fecha) {
				eq("dateCreated", filtro.fecha)
			}
		}
	}
}
