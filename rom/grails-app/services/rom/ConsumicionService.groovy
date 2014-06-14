package rom

import org.apache.jasper.compiler.Node.ParamsAction;
import org.grails.datastore.mapping.query.Restrictions;

import grails.transaction.Transactional;

/**
 * ConsumicionService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class ConsumicionService {

    def filter(ConsumicionFilter filter, params) {
		def criteria = Consumicion.createCriteria()
		return criteria.list {
			if (filter.nombre && !filter.nombre.isAllWhitespace()) {
				ilike("nombre", "%" + filter.nombre + "%")
			}
			if (filter.rubro) {
				subrubro {
					rubro {
						eq("id", filter.rubro.id)
					}
				}
			}
			if (filter.subrubro) {
				subrubro {
					eq("id", filter.subrubro.id)
				}
			}
			if(params.max)
				maxResults(params.max)
			if (params.offset)
				firstResult(Integer.parseInt(params.offset))
			if (params.sort && params.order)
				order(params.sort, params.order)
		}
    }

	def filterCount(ConsumicionFilter filter) {
		def criteria = Consumicion.createCriteria()
		return criteria.count {
			if (filter.nombre && !filter.nombre.isAllWhitespace()) {
				ilike("nombre", "%" + filter.nombre + "%")
			}
			if (filter.rubro) {
				subrubro {
					rubro {
						eq("id", filter.rubro.id)
					}
				}
			}
			if (filter.subrubro) {
				subrubro {
					eq("id", filter.subrubro.id)
				}
			}
		}
	}
}
