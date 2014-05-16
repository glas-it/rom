package rom

import grails.transaction.Transactional;

import rom.PedidoStates.*
import java.text.SimpleDateFormat

/**
 * PedidoService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class PedidoService {

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
