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

    def filter(ConsumicionFilter filter, Integer max, Integer offset) {
		def criteria = Consumicion.createCriteria()
		return criteria.list {
			if (filter.nombre && !filter.nombre.isAllWhitespace()) {
				ilike("nombre", filter.nombre)
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
			maxResults(max)
			firstResult(offset)
		}
    }
	
	def filterCount(ConsumicionFilter filter) {
		def criteria = Consumicion.createCriteria()
		return criteria.count {
			if (filter.nombre && !filter.nombre.isAllWhitespace()) {
				ilike("nombre", filter.nombre)
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
