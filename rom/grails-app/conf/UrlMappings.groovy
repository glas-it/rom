class UrlMappings {

	static mappings = {
		
		/*
		 * Invoke http://localhost:8080/rom/rubro/getRubros or /anyControllerMethod
		 * It works guacho!
		 */
		
		"/rubro/wsRubro"(resources:'rubro'){
			action = [GET:"show", POST:"save", PUT:"update", DELETE:"remove"]
		  }
		
		
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
        "/"(view:"/index")
        "500"(view:'/error')
	}
}
