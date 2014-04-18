package rom

import rom.Exceptions.MesaConErroresException;
import grails.transaction.Transactional;
import org.grails.datastore.mapping.query.Restrictions;


/**
 * MesaService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class MesaService {

    def crearSegunCommand(MesaCreacionCommand command, Restaurant restaurant) {
		Mesa mesa = null
		for (i in command.mesaDesde..command.mesaHasta) {
			mesa = new Mesa()
			mesa.numero = i
			mesa.restaurant = restaurant
			mesa.activo = command.activo
			mesa.capacidad = command.capacidad
			if (!mesa.validate()) {
				throw new MesaConErroresException("No se puede crear la mesa")
			}
			mesa.save()
		}
    }
	
	
	def getMesaOcupada(Mesa unaMesa) {
		def criteria = MesaOcupada.createCriteria()
		def result = criteria.list{
			eq("activo", true)
			and {
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
