package rom

import rom.Exceptions.MesaConErroresException;
import grails.transaction.Transactional;
import org.grails.datastore.mapping.query.Restrictions;


/**
 * MesaService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional(readOnly = false)
class MesaService {

    def crearSegunCommand(MesaCreacionCommand command, Restaurant restaurant) {
		Mesa mesa = null
		for (i in command.mesaDesde..command.mesaHasta) {
			mesa = new MesaUnitaria()
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
	
	public Mesa crearMesaComposite(List idMesasList, Restaurant restaurant) {
		MesaComposite mesaComposite = new MesaComposite()
		for (idMesa in idMesasList)
			mesaComposite.addToMesas(getMesaUnitaria(idMesa, restaurant))
		mesaComposite.numero = getMesaUnitaria(idMesasList[0], restaurant).numero
		mesaComposite.restaurant = mesaComposite.mesas[0].restaurant
		mesaComposite.save(flush:true)
		return mesaComposite
	}
	
	public Mesa getMesa(long idMesa, Restaurant restaurant){
		return Mesa.findByIdAndRestaurant(idMesa, Restaurant.findById(idRestaurant))
	}

	public MesaUnitaria getMesaUnitaria(long idMesa, Restaurant restaurant) {
		MesaUnitaria mesa = MesaUnitaria.findByIdAndRestaurant(idMesa, restaurant)
		if (mesa == null || ! mesa.activo || mesa.abierta) {
			throw new Exception ("No se puede procesar la mesa " + idMesa.toString())
		}
		return mesa
	}
	
	public MesaComposite getMesaComposite(long idMesa, Restaurant restaurant) {
		MesaComposite mesa = MesaComposite.findByIdAndRestaurant(idMesa, restaurant)
		if (mesa == null || ! mesa.activo || ! mesa.abierta) {
			throw new Exception ("No se puede procesar la mesa compuesta " + idMesa.toString())
		}
		return mesa
	}
	
	public void agregarMesa(long idMesaComposite, long idMesa, Restaurant restaurant) {
		MesaComposite mesaComposite = getMesaComposite(idMesaComposite, restaurant)
		MesaUnitaria mesaUnitaria = getMesaUnitaria(idMesa, restaurant)
		mesaComposite.addMesa(mesaUnitaria)
		mesaComposite.save(flush:true)
	}
	
	public void quitarMesa(long idMesaComposite,long idMesa, Restaurant restaurant) {
		MesaComposite mesaComposite = getMesaComposite(idMesaComposite, restaurant)
		MesaUnitaria mesaUnitaria = MesaUnitaria.findByIdAndRestaurant(idMesa, restaurant)
		mesaComposite.removeMesa(mesaUnitaria)
		mesaComposite.save(flush:true)
	}
	
	def getMesasDisponibles(Restaurant restaurant) {
		def criteria = Mesa.createCriteria()
		return criteria.list {
			and {
				eq("restaurant", restaurant)
				eq("activo", true)
				eq("abierta", false)
			}
		}
	}
	
	def getMesasOcupadas(Restaurant restaurant) {
		def mesasAbiertas = Mesa.createCriteria().list {
			and {
				eq("restaurant", restaurant)
				eq("activo", true)
				eq("abierta", true)
			}
		}
		def inComposite = getUnitariasEnCompuestas(restaurant)
		
		return mesasAbiertas.minus(inComposite)
	}
	
	//private method
	def getUnitariasEnCompuestas(Restaurant restaurant) {
		def mesasAbiertas = MesaComposite.createCriteria().list {
			and {
				eq("restaurant", restaurant)
				eq("activo", true)
				eq("abierta", true)
			}
		}
		def result = []
		mesasAbiertas.each{ result += it.mesas }
		return result
	}
}
