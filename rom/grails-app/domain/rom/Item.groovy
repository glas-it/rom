package rom

class Item {
	String descripcion
	
	Subrubro subrubro
	
    static constraints = {
		descripcion blank: false, maxSize: 200
    }
}
