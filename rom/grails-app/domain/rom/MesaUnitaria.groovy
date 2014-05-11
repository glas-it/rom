package rom

/**
 * MesaUnitaria
 * A domain class describes the data object and it's mapping to the database
 */
class MesaUnitaria extends Mesa{

    static	mapping = {
    }
    
	static	constraints = {
		numero blank: false, unique: 'restaurant'
    }

}
