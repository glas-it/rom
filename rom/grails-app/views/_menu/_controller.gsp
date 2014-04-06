<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Browse <b class="caret"></b></a>
	<ul class="dropdown-menu">
		<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
			<li class="controller">
				<g:link controller="${c.logicalPropertyName}">
					<g:if test="${c.fullName.contains('HomeController')}">
						<i class="glyphicon glyphicon-home"></i>
					</g:if>
					${c.fullName.substring(c.fullName.lastIndexOf('.')+1)}
				</g:link>
			</li>
		</g:each>
	</ul>
</li>
