package rom


import spock.lang.*

/**
 *
 */
class PedidoControllerTests extends Specification {
	def consumicionService
	def mozoService
	def duenioService	
	def pedidoService
	def mesaService
	def ordenService
	def notificacionService
	
    def setup() {
	}

    def cleanup() {
    }

	private PedidoController getController() {
		def pc = new PedidoController()
		pc.pedidoService = pedidoService
		pc.mesaService = mesaService
		pc.ordenService = ordenService
		pc.notificacionService = notificacionService
		return pc
	}
	
    void testNewController() {
		when:"inicio un controller"
		def pedidoController = getController()
		then:"anda"
		pedidoController != null
    }
}
