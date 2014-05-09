package rom

import grails.transaction.Transactional;

import rom.PedidoStates.*

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
}
