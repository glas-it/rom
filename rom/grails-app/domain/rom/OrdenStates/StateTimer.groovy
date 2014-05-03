package rom.OrdenStates

import rom.Orden;

import groovy.time.*;
/**
 * StateTimer
 * A domain class describes the data object and it's mapping to the database
 */
class StateTimer {

	Orden orden
	
	Map total;
	String actualState
	Date acumTime
	
	static	belongsTo	= Orden	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static	hasMany		= [total:long]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	public void start(String estadoInicial) {
		actualState = estadoInicial
		total = [:]
		total[actualState] = 0 as long
		acumTime = new Date()
	}
	
	public void changeState(String nextState) {
		println "ACTUAL:" + actualState
		println "SIGUIENTE:" + nextState
		println "EstadoActual:" + total[actualState]
		total[actualState] += TimeCategory.minus(new Date(), acumTime).toMilliseconds()
		if (total[nextState] == null)
			total[nextState] = 0 as long
		actualState = nextState
		acumTime = new Date()
	}
	
	def getTime(String state) {
		return total[state]
	}
	
	public void finalState() {
		total[actualState] += TimeCategory.minus(new Date(), acumTime).toMilliseconds()
	}
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
