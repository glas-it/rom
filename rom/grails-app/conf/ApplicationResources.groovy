modules = {
    application {
        resource url:'js/application.js'
    }
	
	overrides {
		'bootstrap-css' {
			resource id: 'bootstrap-css', url:'/css/bootstrap.css'
		}
	}

}