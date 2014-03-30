package rom

class Item {
	
	String descripcion
		
	static hasMany = [ items: Item ]
	
    static constraints = {
		descripcion blank: false, maxSize: 200
		items blank: true
    }
	
	String toString() {
		return descripcion
	}
}
