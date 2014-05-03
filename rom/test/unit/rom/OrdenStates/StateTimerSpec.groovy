package rom.OrdenStates

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(StateTimer)
public class StateTimerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test init stateTimer"() {
		when:"inicializo un stateTimer"
		String estadoInicial = "EstadoUno"
		StateTimer st = new StateTimer()
		st.start(estadoInicial)

		then:"lo hace correctamente"
		st.total[estadoInicial] == 0 as long
    }
	
	void "test changeState stateTimer"() {
		when:"cambio estado de un stateTimer"
		String estadoInicial = "EstadoUno"
		String estadoSig = "EstadoDos"
		StateTimer st = new StateTimer()
		st.start(estadoInicial)
		st.acumTime -= 1
		st.changeState(estadoSig)

		then:"lo hace correctamente"
		st.total[estadoInicial] != 0
		st.total[estadoSig] == 0 as long
	}
}
