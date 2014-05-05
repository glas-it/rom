modules = {
    application {
        resource url:'js/application.js'
    }
	
	overrides {
		'bootstrap' {
			resource url: [dir: 'css', file:'estilos.css']
		}
	}
}