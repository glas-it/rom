package rom

import org.codehaus.groovy.grails.commons.GrailsClass;

/**
 * IfActionExistsTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class AuxTagLib {
    //static defaultEncodeAs = 'html'
	
	def ifActionExists = {attrs, body ->
		GrailsClass artefact = grailsApplication.getArtefactByLogicalPropertyName("Controller", controllerName)
		//out << artefact.clazz.methods.any{met -> met.name.endsWith(attrs.target)} 
		if (artefact.clazz.methods.any{met -> met.name.endsWith(attrs.target)}) {
			out << body()
		}
	}
}
