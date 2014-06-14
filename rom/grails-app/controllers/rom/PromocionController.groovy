package rom


import static org.springframework.http.HttpStatus.*

import org.grails.databinding.BindUsing;
import org.grails.databinding.BindingFormat;

import grails.converters.JSON;
import grails.converters.XML;
import grails.plugin.springsecurity.SpringSecurityService;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

/**
 * PromocionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional
@Secured("hasRole('DUENIO')")
class PromocionController {

	private static String SUCCESS_TRUE = "{'success':true}"
	private static String SUCCESS_FALSE = "{'success':false}"

	def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

	def index(Integer max) {
        redirect action:'list'
    }

	def list(PromocionFilter promocionFilter) {
//		render promocionFilter as XML
//		return
		promocionFilter.fechaDesde = params.fechaDesde ? params.fechaDesde instanceof String ? Date.parse("yyyy-MM-dd", params.fechaDesde): params.fechaDesde : null
		promocionFilter.fechaHasta = params.fechaHasta ? params.fechaHasta instanceof String ? Date.parse("yyyy-MM-dd", params.fechaHasta): params.fechaHasta : null
		if (promocionFilter.fechaDesde && !promocionFilter.fechaHasta) {
			params.errorMessages = ["Debe ingresar una fecha de fin si ingresa una fecha de inicio"]
			return [promocionFilter: promocionFilter,
					 promocionInstanceCount: 0,
					 promocionInstanceList: [],
					 promocionInstanceParams: [fechaDesde: promocionFilter.fechaDesde,
						 fechaHasta: promocionFilter.fechaHasta,
						 nombre: promocionFilter.nombre,
						 sort : params.sort,
						 order: params.order],
				 ]
		}
		if (promocionFilter.fechaHasta && !promocionFilter.fechaDesde) {
			params.errorMessages = ["Debe ingresar una fecha de inicio si ingresa una fecha de fin"]
			return [promocionFilter: promocionFilter,
					 promocionInstanceCount: 0,
					 promocionInstanceList: [],
					 promocionInstanceParams: [fechaDesde: promocionFilter.fechaDesde,
						 fechaHasta: promocionFilter.fechaHasta,
						 nombre: promocionFilter.nombre,
						 sort : params.sort,
						 order: params.order],
				 ]
		}
		if (promocionFilter.fechaDesde && promocionFilter.fechaHasta) {
			if (promocionFilter.fechaDesde.clearTime().compareTo(promocionFilter.fechaHasta.clearTime()) > 0) {
				params.errorMessages = ["La fecha de inicio del filtro de búsqueda es mayor a la fecha de fin"]
				return [promocionFilter: promocionFilter,
					 promocionInstanceCount: 0,
					 promocionInstanceList: [],
					 promocionInstanceParams: [fechaDesde: promocionFilter.fechaDesde,
						 fechaHasta: promocionFilter.fechaHasta,
						 nombre: promocionFilter.nombre,
						 sort : params.sort,
						 order: params.order],
				 ]
			}
		}
        params.max = Math.min(params.max ?: 10, 100)
        params.offset = params.offset ? params.int(offset) : 0
        params.sort = params.sort ? params.sort : "id"
        params.order = params.order ? params.order : "asc"
		params.activo = true
		def criteria = Promocion.createCriteria()
		def paramMap = [:]
		def query = "from Promocion p where p.activo = :activo "
		paramMap["activo"] = true
		if (promocionFilter.fechaDesde && promocionFilter.fechaHasta) {
			paramMap["fechaDesde"] = promocionFilter.fechaDesde
			paramMap["fechaHasta"] = promocionFilter.fechaHasta
			query += " and ((:fechaDesde between p.fechaInicio and p.fechaFin "
			query += " or :fechaHasta between p.fechaInicio and p.fechaFin) "	
			query += " or (p.fechaInicio between :fechaDesde and :fechaHasta "
			query += " or p.fechaFin between :fechaDesde and :fechaHasta)) "
		}
		if (promocionFilter.nombre) {
			query += " and p.nombre like :nombre "
			paramMap["nombre"] = "%" + promocionFilter.nombre + "%"
		}
		query += " order by " + params.sort + " " + params.order
		def paramCount = Promocion.executeQuery("select count(p) " + query, paramMap).get(0)
		paramMap["max"] = params.max
		paramMap["offset"] = params.offset
		def lista = Promocion.executeQuery(query, paramMap)	
//        def lista = criteria.list {
//            and {
//				eq("activo", true)
//				if (promocionFilter.fechaDesde && promocionFilter.fechaHasta) {
//					or {
//					
//						between("fechaInicio", promocionFilter.fechaDesde, promocionFilter.fechaHasta)
//						between("fechaFin", promocionFilter.fechaDesde, promocionFilter.fechaHasta)
//					}
//            	}
//				if (promocionFilter.nombre)
//					ilike("nombre", "%" + promocionFilter.nombre + "%")
//            }
//            if (params.sort && params.order)
//				order(params.sort, params.order)
//			if (params.max)	
//				maxResults(params.max)
//            if (params.offset)
//				firstResult(params.offset.toInteger())
//        }
//        def criteria2 = Promocion.createCriteria()
//        def count = criteria2.count {
//            eq("activo", true)
//        }
		respond lista, model:[
            promocionInstanceCount: paramCount,
            promocionInstanceParams: [fechaDesde: promocionFilter.fechaDesde, fechaHasta: promocionFilter.fechaHasta, nombre: promocionFilter.nombre, sort : params.sort, order: params.order],
			promocionFilter: promocionFilter
        ]
    }

    def show(Promocion promocionInstance) {
        respond promocionInstance
    }

    def create() {
		def restaurant = Duenio.get(springSecurityService.currentUser?.id).restaurant
        [promocionInstance: new Promocion(params), restaurantInstance: restaurant]
    }

    @Transactional
    def save(Promocion promocionInstance) {
        if (promocionInstance == null) {
            notFound()
            return
        }

        if (promocionInstance.hasErrors()) {
			def restaurant = Duenio.get(springSecurityService.currentUser?.id).restaurant
			render view: 'create', model: [promocionInstance: promocionInstance, restaurantInstance: restaurant]
            return
        }
		def restaurant = Duenio.get(springSecurityService.currentUser.id)?.restaurant
        if (!restaurant) {
			flash.errorMessage = "Debe encontrarse logueado para realizar esta accion"
			notFound()
			return
		}
		promocionInstance.restaurant = restaurant
		promocionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'promocionInstance.label', default: 'Promocion'), promocionInstance.id])
                redirect promocionInstance
            }
            '*' { respond promocionInstance, [status: CREATED] }
        }
    }

    @Secured("hasRole('DUENIO')")
	@Transactional(readOnly = false)
	def delete(Promocion promocionInstance) {
		if (!promocionInstance) {
			flash.errorMessage = "La promocion no existe"
			redirect action: 'list'
			return
		}
		if (!promocionInstance.esEditable()) {
			flash.errorMessage = "La promoción se encuentra vigente por lo que no puede ser eliminada"
			redirect action: 'list'
			return
		}
		promocionInstance.activo = false
		promocionInstance.save()
		flash.message = "La promoción fue borrada con éxito"
		redirect action: 'list'
	}

    def edit(Promocion promocionInstance) {
		if (!promocionInstance.esEditable()) {
			flash.errorMessage = "La promoción no puede ser editada"
			redirect action:'list'
			return
		}
		respond promocionInstance
    }

	@Secured(['permitAll'])
	def validar(Long idPromocion, Long idRestaurant) {
		def promocion = Promocion.get(idPromocion)
		if (!promocion) {
			render SUCCESS_FALSE
			return
		}
		render promocion.esValida() ? SUCCESS_TRUE : SUCCESS_FALSE
	}

    @Transactional
    def update(Promocion promocionInstance) {
        if (promocionInstance == null) {
            notFound()
            return
        }

        if (promocionInstance.hasErrors()) {
            respond promocionInstance.errors, view:'edit'
            return
        }

        promocionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Promocion.label', default: 'Promocion'), promocionInstance.id])
                redirect promocionInstance
            }
            '*'{ respond promocionInstance, [status: OK] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'promocionInstance.label', default: 'Promocion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}



class PromocionFilter {
	String nombre
	Date fechaDesde
	Date fechaHasta
	
	static constraints = {
		fechaDesde nullable: true, blank: true
		
		fechaHasta nullable: true, blank: true, validator: {val, obj->
			if (!val && !obj.fechaHasta)
				return true
			if (!(val && obj.fechaDesde && val.clearTime().compareTo(obj.fechaDesde.clearTime()) >= 0))
				return false	
		}
	}
}