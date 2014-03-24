package rom

class Subrubro {
	
	String descripcion
	
	Rubro rubro
	
	static hasMany = [items: Item]
	
    static constraints = {
		descripcion blank: false, maxSize: 200
    }
}
