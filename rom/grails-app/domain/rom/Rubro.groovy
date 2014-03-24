package rom

class Rubro {

	String descripcion
	
	static hasMany = [subrubros: Subrubro]
	
    static constraints = {
		descripcion blank: false, maxSize: 200
    }
}
